package by.potapenko.database.dto;

import lombok.Data;

@Data

public class UserUpdateDto {
    private String login;
    private String email;
    private String phone;
}
