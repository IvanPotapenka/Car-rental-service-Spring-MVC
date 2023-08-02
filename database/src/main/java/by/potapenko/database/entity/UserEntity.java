package by.potapenko.database.entity;

import by.potapenko.database.entity.enam.UserRole;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.AttributeOverrides;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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

    @Column(name = "full_name", length = 50, nullable = false)
    private String fullName;

    @Column(name = "passwords", length = 256, nullable = false)
    private String password;

    @Column(name = "reset_password_token", length = 256)
    private String resetPasswordToken;

    @Column(name = "agreement", length = 5, nullable = false)
    private boolean agreement;

    @Column(name = "date_of_birthday")
    private LocalDate dateOfBirthday;

    @Builder.Default
    @Column(name = "roles", length = 7, nullable = false)
    @Enumerated(EnumType.STRING)
    private UserRole role = UserRole.USER;

    @Embedded
    @AttributeOverrides(
            {@AttributeOverride(name = "phone", column = @Column(name = "phone", nullable = false, length = 30, unique = true)),
                    @AttributeOverride(name = "address", column = @Column(name = "address", length = 100)),
                    @AttributeOverride(name = "email", column = @Column(name = "email", length = 50, nullable = false, unique = true))
            })
    private ContactClient contact;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private DocumentEntity document;

    @Builder.Default
    @OneToMany(mappedBy = "user")
    private List<RentalEntity> orders = new ArrayList<>();

    public void setDocument(DocumentEntity document) {
        this.document = document;
        document.setUser(this);
    }

    public void addOrder(RentalEntity rental) {
        this.getOrders().add(rental);
        rental.setUser(this);
    }
}
