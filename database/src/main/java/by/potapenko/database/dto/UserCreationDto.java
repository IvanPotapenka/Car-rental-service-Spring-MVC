package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.UserRole;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserCreationDto {

    private String login;
    private String email;
    private String phone;
    private String password;
    private UserRole role;
    private LocalDateTime dateOfCreation;
}
