package by.potapenko.database.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Data
@Builder
@EqualsAndHashCode(of = "id", callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "client")
public class ClientEntity extends CreatableEntity<Long>  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name", length = 20, nullable = false)
    private String firstName;

    @Column(name = "last_name", length = 20, nullable = false)
    private String lastName;

    @Column(name = "date_of_birthday")
    private LocalDate dateOfBirthday;

    @Embedded
    @AttributeOverrides(
            {@AttributeOverride(name = "phone", column = @Column(name = "phone", length = 30, nullable = false, unique = true)),
                    @AttributeOverride(name = "address", column = @Column(name = "address", length = 100)),
            })
    private ContactClient contact;
    @OneToOne(mappedBy = "client", cascade = CascadeType.ALL)
    private DocumentEntity document;

    @Builder.Default
    @OneToMany(mappedBy = "client")
    private List<RentalEntity> orders = new ArrayList<>();

    public void setDocument(DocumentEntity document) {
        this.document = document;
        document.setClient(this);
    }

    public void addOrder(RentalEntity rental) {
        this.getOrders().add(rental);
        rental.setClient(this);
    }
}
