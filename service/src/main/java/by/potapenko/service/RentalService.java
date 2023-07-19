package by.potapenko.service;

import by.potapenko.database.dto.RentalDto;
import by.potapenko.database.entity.RentalEntity;
import by.potapenko.database.repository.RentalRepository;
import by.potapenko.database.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
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
    public List<RentalDto> getAll() {
        return rentalRepository.findAll()
                .stream()
                .map(this::convertToRentalDto)
                .toList();
    }


    public void deleteById(Long id) {
        rentalRepository.findById(id)
                .ifPresent(rentalRepository::delete);
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
            return Optional.of(convertToRentalDto(rentalRepository.save(rental)));
        }
        return Optional.empty();
    }

    public RentalDto getCountDaysAndPriceRental(LocalDate rentalDate, LocalDate returnDate, Double price) {
        RentalDto rentalDto = new RentalDto();
        int days = returnDate.getDayOfMonth()
                - rentalDate.getDayOfMonth();
        if (days <= 3) {
            price *= 1;
        } else if (days <= 7) {
            price *= 0.9;
        } else if (days <= 15) {
            price *= 0.75;
        } else if (days > 16) {
            price *= 0.65;
        }
        rentalDto.setRentalDate(rentalDate);
        rentalDto.setReturnDate(returnDate);
        rentalDto.setRentalDays(days);
        rentalDto.setPrice(price * days);
        return rentalDto;
    }

    private RentalDto convertToRentalDto(RentalEntity rental) {
        return modelMapper.map(rental, RentalDto.class);
    }

}

