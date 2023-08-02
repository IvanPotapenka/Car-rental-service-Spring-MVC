package by.potapenko.database.repository;

import by.potapenko.database.config.DataBaseConfig;
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

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = DataBaseConfig.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@Sql("classpath:insert-data-car.sql")
@Sql("classpath:insert-data-user.sql")
@Sql(value = "classpath:insert-data-rental.sql")
class RentalRepositoryTest {
    @Autowired
    private RentalRepository rentalRepository;

    @Test
    @Order(1)
    void whenFindAllInvoked_ThenAllTheRentalsAreReturned() {
        String[] actual = rentalRepository.findAll()
                .stream()
                .map(rental -> rental.getStatus().name())
                .toArray(String[]::new);
        String[] expected = List.of("REFUSED", "CHECK", "APPROVE")
                .toArray(String[]::new);
        assertArrayEquals(expected, actual);
    }

    @Test
    @Sql(value = "classpath:insert-data-rental.sql")
    @Order(2)
    void whenFindAllOrdersByCarInvoked_ThenAllTheOrdersOfCarAreReturned() {
        Long id = 1L;
        String[] actual = rentalRepository.findAllByCarId(id)
                .stream()
                .map(rental -> rental.getCar().getBrand())
                .toArray(String[]::new);
        String[] expected = List.of("Audy")
                .toArray(String[]::new);
        assertArrayEquals(expected, actual);
    }

    @Test
    @Sql(value = "classpath:insert-data-rental.sql")
    @Order(3)
    void whenFindAllOrdersByClientInvoked_ThenAllTheOrdersOfClientAreReturned() {
        Long id = 2L;
        String[] actual = rentalRepository.findAllByUserId(id)
                .stream()
                .map(rental -> rental.getUser().getFullName())
                .toArray(String[]::new);
        String[] expected = List.of("Bob", "Bob", "Bob")
                .toArray(String[]::new);
        assertArrayEquals(expected, actual);
    }
}