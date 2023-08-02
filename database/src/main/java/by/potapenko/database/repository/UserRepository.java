package by.potapenko.database.repository;

import by.potapenko.database.entity.UserEntity;
import by.potapenko.database.entity.enam.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
    List<UserEntity> findByRole(UserRole role);

    Optional<UserEntity> findByContactEmail(String email);
    List<UserEntity> findByResetPasswordToken(String token);
}
