package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.DocumentStatus;
import lombok.Data;

@Data
public class DocumentDto {

    private String passport;
    private String driverLicense;
    private DocumentStatus statusCheck;
}
