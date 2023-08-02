package by.potapenko.database.repository;

import by.potapenko.database.dto.RentalFilter;
import by.potapenko.database.entity.RentalEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RentalRepositoryExtension {
    List<RentalEntity> findByFilter(RentalFilter filter);
}
