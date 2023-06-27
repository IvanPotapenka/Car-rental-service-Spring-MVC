package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.ColorCar;
import by.potapenko.database.entity.enam.FuelType;
import by.potapenko.database.entity.enam.TransmissionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class CarFilter {
    private String brand;
    private String mark;
    private ColorCar color;
    private FuelType fuelType;
    private TransmissionType transmission;
    private Double fuelConsumption;
    private Integer limit;
    private Integer page;

    public Integer getLimit() {
        return limit == null ? 3 : limit;
    }

    public Integer getPage() {
        return page == null ? 0 : limit * (page) - 1;
    }
}

