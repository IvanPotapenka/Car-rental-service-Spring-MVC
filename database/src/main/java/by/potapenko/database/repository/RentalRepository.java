package by.potapenko.database.repository;

import by.potapenko.database.entity.RentalEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RentalRepository extends JpaRepository<RentalEntity, Long> {

    List<RentalEntity> findAllByClientId(Long id);

    List<RentalEntity> findAllByCar_Id(Long id);
}
