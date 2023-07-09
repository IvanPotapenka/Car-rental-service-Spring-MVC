package by.potapenko.database.entity;

import by.potapenko.database.entity.enam.ColorCar;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Embeddable
public class BodyCar {

    private int placeQuantity;
    private int doorQuantity;
    private int trunkVolume;
    private String vinCode;
    private String number;
    @Enumerated(EnumType.STRING)
    private ColorCar color;
}
