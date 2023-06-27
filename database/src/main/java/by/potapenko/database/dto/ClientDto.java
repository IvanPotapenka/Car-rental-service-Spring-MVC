package by.potapenko.database.dto;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data

public class ClientDto {

    private Long id;
    private String firstName;
    private String lastName;
    private LocalDate dateOfBirthday;
    private String phone;
    private String address;
    private LocalDateTime dateOfCreation;
}
