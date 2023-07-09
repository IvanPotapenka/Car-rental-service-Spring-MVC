package by.potapenko.database.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ClientCreationDto {

    private String firstNalme;
    private String lastName;
    private LocalDate dateOfBirthday;
    private String phone;
    private String address;

}
