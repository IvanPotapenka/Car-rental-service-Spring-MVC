package by.potapenko.database.entity;

import by.potapenko.database.entity.enam.RequestStatus;
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
@Table(name = "request")
public class RequestEntity extends CreatableEntity<Long> {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", length = 50, nullable = false)
    private String username;

    @Column(name = "phone", nullable = false, length = 30, unique = true)
    private String phone;

    @Column(name = "massage", length = 100)
    private String massage;

    @Builder.Default
    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 10, nullable = false)
    private RequestStatus status = RequestStatus.OPEN;
}
