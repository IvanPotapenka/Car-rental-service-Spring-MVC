package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.OrderState;
import by.potapenko.database.entity.enam.OrderStatus;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class RentalFilter {

    private OrderStatus status;
    private String creator;
    private OrderState state;
    private LocalDateTime dateOfCreation;

    private Integer limit;
    private Integer page;

    public Integer getLimit() {
        return limit == null ? 3 : limit;
    }

    public Integer getPage() {
        return page == null ? 0 : limit * (page) - 1;
    }
}
