package by.potapenko.database.repository;

import by.potapenko.database.entity.RequestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RequestRepository extends JpaRepository<RequestEntity, Long> {
    Optional<RequestEntity> findByPhone(String phone);
}
