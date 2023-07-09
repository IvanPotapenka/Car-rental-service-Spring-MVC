package by.potapenko.database.repository;

import by.potapenko.database.entity.UserEntity;
import by.potapenko.database.entity.enam.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
    Optional<UserEntity> findByContactEmailAndPassword(String email, String password);

    Optional<UserEntity> findByRole(UserRole role);

    Optional<UserEntity> findByContactEmail(String email);
}
