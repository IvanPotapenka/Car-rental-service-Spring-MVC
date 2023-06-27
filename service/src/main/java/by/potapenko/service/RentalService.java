package by.potapenko.service;

import by.potapenko.database.dto.CarDto;
import by.potapenko.database.dto.RentalDto;
import by.potapenko.database.entity.RentalEntity;
import by.potapenko.database.entity.enam.Status;
import by.potapenko.database.repository.RentalRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class RentalService {
    private final RentalRepository rentalRepository;
    private final ModelMapper modelMapper;

    @Transactional
    public RentalDto create(RentalDto rentalDto) {
        RentalEntity newRental = modelMapper.map(rentalDto, RentalEntity.class);
        newRental.setStatus(Status.CHECK);
        newRental.setDateOfCreation(LocalDateTime.now());
        return convertToRentalDto(rentalRepository.save(newRental));
    }

    public List<RentalDto> getAll() {
        return rentalRepository.findAll()
                .stream()
                .map(this::convertToRentalDto)
                .toList();
    }

    @Transactional
    public void deleteById(Long id) {
        rentalRepository.findById(id)
                .ifPresent(rentalRepository::delete);
    }

    public Optional<RentalDto> getById(Long id) {
        return rentalRepository.findById(id)
                .map(this::convertToRentalDto);
    }

    public Integer getCount(Double limit) {
        return (Integer) (int) Math.ceil(rentalRepository.count() / limit);
    }

    public List<RentalDto> findAllOrdersOfClient(Long id) {
        return rentalRepository.findAllByClientId(id)
                .stream().map(this::convertToRentalDto)
                .toList();
    }

    public List<RentalDto> getAllOrdersOfCar(Long id) {
        return rentalRepository.findAllByCar_Id(id)
                .stream().map(this::convertToRentalDto)
                .toList();
    }

    @Transactional
    public Optional<RentalDto> update(Long id, RentalDto update) {
        Optional<RentalEntity> existedRental = rentalRepository.findById(id);
        if (existedRental.isPresent()) {
            RentalEntity rental = existedRental.get();
            modelMapper.map(update, rental);
            return Optional.of(convertToRentalDto(rentalRepository.save(rental)));
        }
        return Optional.empty();
    }

    public RentalDto getCountDaysAndPriceRental(RentalDto rentalDto, CarDto carDto) {
        int days = rentalDto.getReturnDate().getDayOfMonth()
                - rentalDto.getRentalDate().getDayOfMonth();
        rentalDto.setRentalDays(days);
        double price = carDto.getPrice();
        if (days <= 3) {
            price *= 1;
        } else if (days <= 7) {
            price *= 0.9;
        } else if (days <= 15) {
            price *= 0.75;
        } else if (days > 16) {
            price *= 0.65;
        }
        rentalDto.setPrice(price * days);
        return rentalDto;
    }

    private RentalDto convertToRentalDto(RentalEntity rental) {
        return modelMapper.map(rental, RentalDto.class);
    }

}

