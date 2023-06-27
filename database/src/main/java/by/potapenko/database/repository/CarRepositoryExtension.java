package by.potapenko.database.repository;

import by.potapenko.database.dto.CarFilter;
import by.potapenko.database.entity.CarEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarRepositoryExtension {
    List<CarEntity> findByFilter(CarFilter filter);
}
