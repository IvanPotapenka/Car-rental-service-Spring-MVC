package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.FuelType;
import by.potapenko.database.entity.enam.TransmissionType;
import by.potapenko.database.entity.enam.CarType;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CarFilter {
    private String brand;
    private CarType type;
    private FuelType fuelType;
    private TransmissionType transmission;
    private Integer limit;
    private Integer page;

    public Integer getLimit() {
        return limit == null ? 3 : limit;
    }

    public Integer getPage() {
        return page == null ? 0 : limit * (page) - 1;
    }
}

