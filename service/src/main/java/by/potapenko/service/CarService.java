package by.potapenko.service;

import by.potapenko.database.dto.CarDto;
import by.potapenko.database.dto.CarFilter;
import by.potapenko.database.entity.CarEntity;
import by.potapenko.database.repository.CarRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class CarService {

    private final CarRepository carRepository;
    private final ModelMapper modelMapper;

    @Transactional
    public Long create(CarDto car) {
        return carRepository.save(convertToCarEntity(car)).getId();
    }

    @Transactional
    public Optional<CarDto> update(Long id, CarDto update) {
        Optional<CarEntity> existedCar = carRepository.findById(id);
        if (existedCar.isPresent()) {
            CarEntity car = existedCar.get();
            modelMapper.map(update, car);
            return Optional.of(convertToCarDto(carRepository.save(car)));
        }
        return Optional.empty();
    }

    public List<CarDto> getAll() {
        return carRepository.findAll()
                .stream()
                .map(this::convertToCarDto)
                .toList();
    }

    @Transactional
    public void deleteById(Long id) {
        carRepository.findById(id)
                .ifPresent(carRepository::delete);
    }

    public List<CarDto> getByFilter(CarFilter filter) {
        return carRepository.findByFilter(filter)
                .stream()
                .map(this::convertToCarDto)
                .toList();
    }

    public Optional<CarDto> getById(Long id) {
        return carRepository.findById(id)
                .map(this::convertToCarDto);
    }

    public Integer getCount(Double limit) {
        return (Integer) (int) Math.ceil(carRepository.count() / limit);
    }

    private CarDto convertToCarDto(CarEntity car) {
        return modelMapper.map(car, CarDto.class);
    }

    private CarEntity convertToCarEntity(CarDto car) {
        return modelMapper.map(car, CarEntity.class);
    }
}


