package by.potapenko.database.entity;

import by.potapenko.database.entity.enam.DocumentStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString(exclude = "user")
@EqualsAndHashCode(of = "id", callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "documents")
public class DocumentEntity implements BaseIdEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "passport_No", nullable = false, unique = true)
    private String passport;

    @Column(name = "driver_license_No", nullable = false)
    private String driverLicense;

    @Builder.Default
    @Column(name = "status_check", nullable = false)
    @Enumerated(EnumType.STRING)
    private DocumentStatus statusCheck = DocumentStatus.CONFIRMED;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private UserEntity user;
}
