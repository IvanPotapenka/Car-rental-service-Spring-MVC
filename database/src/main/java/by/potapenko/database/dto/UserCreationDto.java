package by.potapenko.database.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class UserCreationDto {

    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String passport;
    private String driverLicense;
    private LocalDate dateOfBirthday;
    private String password;
}
