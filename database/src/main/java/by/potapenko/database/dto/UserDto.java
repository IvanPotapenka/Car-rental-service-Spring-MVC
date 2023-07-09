package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.UserRole;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserDto {
    private Long id;
    private String login;
    private String email;
    private String phone;
    private UserRole role;
    private LocalDateTime dateOfCreation;
}
