package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.OrderState;
import by.potapenko.database.entity.enam.OrderStatus;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class RentalDto {

    private Long id;
    private LocalDate rentalDate;
    private LocalDate returnDate;
    private Integer rentalDays;
    private double price;
    private CarDto carDto;
    private UserDto userDto;
    private OrderStatus status;
    private String creator;
    private OrderState state;
    private LocalDateTime dateOfCreation;
}
