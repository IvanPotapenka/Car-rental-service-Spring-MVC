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
    private DocumentDto documentDto;
    private LocalDate dateOfBirthday;
    private String address;
    private UserRole role;
    private LocalDate dateOfCreation;
}
