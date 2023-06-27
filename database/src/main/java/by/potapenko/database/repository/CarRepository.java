package by.potapenko.database.repository;

import by.potapenko.database.entity.CarEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarRepository extends JpaRepository<CarEntity, Long>, CarRepositoryExtension {
}
