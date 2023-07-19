package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.UserRole;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserDto {

    private Long id;
    private String fullName;
    private String email;
    private String phone;
    private String passport;
    private String driverLicense;
    private LocalDate dateOfBirthday;
    private UserRole role;
    private LocalDate dateOfCreation;
}
