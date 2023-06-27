package by.potapenko.database.repository;

import by.potapenko.database.config.DataBaseConfig;
import by.potapenko.database.dto.CarFilter;
import by.potapenko.database.entity.BodyCar;
import by.potapenko.database.entity.CarEntity;
import by.potapenko.database.entity.EngineCar;
import by.potapenko.database.entity.enam.ColorCar;
import by.potapenko.database.entity.enam.FuelType;
import by.potapenko.database.entity.enam.TransmissionType;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = DataBaseConfig.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@Sql(value = "classpath:insert-data-car.sql")
class CarRepositoryTest {
    @Autowired
    private CarRepository carRepository;

    @Test
    @Order(1)
    void whenFindAllInvoked_ThenAllTheCarsAreReturned() {
        String[] actual = carRepository.findAll()
                .stream()
                .map(CarEntity::getBrand)
                .toArray(String[]::new);
        String[] expected = List.of("Audy", "BMW", "Mercedes")
                .toArray(String[]::new);
        assertArrayEquals(expected, actual);
    }

    @Test
    @Order(2)
    void whenFindById_ThenAllTheFilteredReturnsValidCar() {
        Long id = 1L;
        Optional<CarEntity> actual = carRepository.findById(id);
        assertTrue(actual.isPresent());
        assertEquals("Audy", actual.get().getBrand());
    }

    @Test
    @Order(3)
    void whenCreatedInvokedWithCar_ThenCarIsSaved() {
        CarEntity carTest = CarEntity.builder()
                .id(1L)
                .brand("Citroen")
                .model("C5")
                .year(2022)
                .price(105)
                .body(BodyCar.builder()
                        .color(ColorCar.WHITE)
                        .doorQuantity(2)
                        .placeQuantity(4)
                        .trunkVolume(235)
                        .vinCode("12090")
                        .number("54098")
                        .build())
                .engine(EngineCar.builder()
                        .engineCapacity(2.0)
                        .horsePower(140)
                        .fuelType(FuelType.DIESEL)
                        .transmission(TransmissionType.MANUAL)
                        .build())
                .fuelConsumption(6.0)
                .build();
        carRepository.save(carTest);
        List<String> allBrand = carRepository.findAll()
                .stream()
                .map(CarEntity::getBrand)
                .toList();
        assertTrue(allBrand.contains(carTest.getBrand()));
    }

    @Test
    @Order(4)
    void whenDeleteById_ThenNotFindById() {
        Long id = 1L;
        Optional<CarEntity> car = carRepository.findById(id);
        carRepository.deleteById(car.get().getId());
        Optional<CarEntity> carDeleted = carRepository.findById(car.get().getId());
        assertTrue(carDeleted.isEmpty());
    }

    @Test
    @Order(5)
    void whenUpdateById_ThenSavedCarUpdate() {
        Long id = 1L;
        Optional<CarEntity> car = carRepository.findById(id);
        car.get().setBrand("Volvo");
        carRepository.save(car.get());
        assertEquals("Volvo", car.get().getBrand());
    }

    @Test
    @Order(6)
    void whenFindAllByFilterContainsOnlyBrandsAndModelCarsInvoked_ThenAllTheFilteredByBrandsCarsAreReturned() {
        CarFilter filter = CarFilter.builder()
                .brand("Audy")
                .mark("A8")
                .build();
        String[] actual = carRepository.findByFilter(filter)
                .stream()
                .map(CarEntity::getBrand)
                .toArray(String[]::new);
        String[] expected = List.of("Audy")
                .toArray(String[]::new);
        assertArrayEquals(expected, actual);
    }
}