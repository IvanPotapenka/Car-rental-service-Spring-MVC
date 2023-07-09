package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.Status;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class RentalDto {

    private Long id;
    private LocalDate rentalDate;
    private LocalDate returnDate;
    private int rentalDays;
    private double price;
    private Status status;
    private CarDto carDto;
    private ClientDto clientDto;
    private LocalDateTime dateOfCreation;
}
