package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.UserRole;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserCreationDto {

    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String passport;
    private UserRole role;
    private String driverLicense;
    private LocalDate dateOfBirthday;
    private String password;
    private boolean agreement;
    private LocalDate dateOfCreation;

}
