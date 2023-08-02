package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.RequestStatus;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class RequestDto {
    private Long id;
    private String username;
    private String phone;
    private RequestStatus status;
    private String massage;
    private LocalDateTime dateOfCreation;
}
