package by.potapenko.database.entity;

import by.potapenko.database.entity.enam.UserRole;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@EqualsAndHashCode(of = "id", callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class UserEntity extends CreatableEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name = "logins", length = 50, nullable = false)
    private String login;

    @Column(name = "email", length = 20, nullable = false, unique = true)
    private String email;

    @Column(name = "phone", length = 30, nullable = false, unique = true)
    private String phone;

    @Column(name = "passwords", length = 20, nullable = false)
    private String password;

    @Builder.Default
    @Column(name = "roles", length = 7, nullable = false)
    @Enumerated(EnumType.STRING)
    private UserRole role = UserRole.USER;

}
