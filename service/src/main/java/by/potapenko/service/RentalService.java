package by.potapenko.service;

import by.potapenko.database.dto.RentalDto;
import by.potapenko.database.dto.RentalFilter;
import by.potapenko.database.entity.RentalEntity;
import by.potapenko.database.entity.enam.CarStatus;
import by.potapenko.database.entity.enam.OrderState;
import by.potapenko.database.entity.enam.OrderStatus;
import by.potapenko.database.repository.RentalRepository;
import by.potapenko.database.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class RentalService {
    private final RentalRepository rentalRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;


    public Long create(RentalDto rentalDto) {
        RentalEntity newRental = modelMapper.map(rentalDto, RentalEntity.class);
        userRepository.findById(rentalDto.getUserDto().getId()).get().addOrder(newRental);
        return rentalRepository.save(newRental).getId();
    }
    @Transactional(readOnly = true)
    public List<RentalDto> getByFilter(RentalFilter filter) {
        return rentalRepository.findByFilter(filter)
                .stream()
                .map(this::convertToRentalDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<RentalDto> getAllSortById() {
        return rentalRepository.findAll(Sort.by(Sort.Direction.ASC, "id"))
                .stream()
                .map(this::convertToRentalDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<RentalDto> getAllSortByDate() {
        return rentalRepository.findAll(Sort.by(Sort.Direction.ASC, "dateOfCreation"))
                .stream()
                .map(this::convertToRentalDto)
                .toList();
    }


    public void deleteById(Long id) {
        rentalRepository.findById(id).ifPresent(rental -> {
            if (rental.getCar().getStatus().equals(CarStatus.BOOKED) || rental.getCar().getStatus().equals(CarStatus.BUSY)) {
                rental.getCar().setStatus(CarStatus.FREE);
                rentalRepository.save(rental);
            }
            rentalRepository.delete(rental);
        });
    }

    @Transactional(readOnly = true)
    public Optional<RentalDto> getById(Long id) {
        return rentalRepository.findById(id)
                .map(this::convertToRentalDto);
    }

    public Integer getCount(Double limit) {
        return (Integer) (int) Math.ceil(rentalRepository.count() / limit);
    }

    @Transactional(readOnly = true)
    public List<RentalDto> findAllOrdersOfUser(Long id) {
        return rentalRepository.findAllByUserId(id)
                .stream().map(this::convertToRentalDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<RentalDto> getAllOrdersOfCar(Long id) {
        return rentalRepository.findAllByCarId(id)
                .stream().map(this::convertToRentalDto)
                .toList();
    }


    public Optional<RentalDto> update(Long id, RentalDto update) {
        Optional<RentalEntity> existedRental = rentalRepository.findById(id);
        if (existedRental.isPresent()) {
            RentalEntity rental = existedRental.get();
            modelMapper.map(update, rental);
            return Optional.of(convertToRentalDto(rentalRepository.
                    save(convertToRentalEntity(getCountDaysAndPriceRental(convertToRentalDto(rental))))));
        }
        return Optional.empty();
    }

    public Optional<RentalDto> cancelOrderUser(Long id) {
        Optional<RentalEntity> existedRental = rentalRepository.findById(id);
        if (existedRental.isPresent()) {
            RentalEntity rental = existedRental.get();
            rental.setState(OrderState.REFUSED);
            rental.setStatus(OrderStatus.REFUSED);
            rental.getCar().setStatus(CarStatus.FREE);
            return Optional.of(convertToRentalDto(rentalRepository.
                    save(rental)));
        }
        return Optional.empty();
    }

    public Optional<RentalDto> update(RentalDto update) {
        return Optional.of(convertToRentalDto(rentalRepository
                .save(modelMapper.map(update, RentalEntity.class))));
    }


    public RentalDto getCountDaysAndPriceRental(RentalDto rentalDto) {
        int days = rentalDto.getReturnDate().getDayOfMonth()
                - rentalDto.getRentalDate().getDayOfMonth();
        double price = rentalDto.getCarDto().getPrice();
        if (days <= 3) {
            price *= 1;
        } else if (days <= 7) {
            price *= 0.9;
        } else if (days <= 15) {
            price *= 0.75;
        } else if (days > 16) {
            price *= 0.65;
        }
        rentalDto.setRentalDays(days);
        rentalDto.setPrice(price * days);
        return rentalDto;
    }

    private RentalDto convertToRentalDto(RentalEntity rental) {
        return modelMapper.map(rental, RentalDto.class);
    }

    private RentalEntity convertToRentalEntity(RentalDto rentalDto) {
        return modelMapper.map(rentalDto, RentalEntity.class);
    }
}

