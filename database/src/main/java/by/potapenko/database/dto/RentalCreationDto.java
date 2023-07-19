package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.Status;
import lombok.Data;

import java.time.LocalDate;

@Data
public class RentalCreationDto {

    private LocalDate rentalDate;
    private LocalDate returnDate;
    private Integer rentalDays;
    private double price;
    private CarDto carDto;
    private UserDto userDto;
    private Status status;
    private String creator;
}
