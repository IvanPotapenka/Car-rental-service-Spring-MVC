package by.potapenko.database.entity;

import by.potapenko.database.entity.enam.OrderState;
import by.potapenko.database.entity.enam.OrderStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@EqualsAndHashCode(of = "id", callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "rental")
public class RentalEntity extends CreatableEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "rental_date", nullable = false)
    private LocalDate rentalDate;

    @Column(name = "return_date", nullable = false)
    private LocalDate returnDate;

    @Column(name = "rental_days", nullable = false)
    private int rentalDays;

    @Column(name = "price", nullable = false)
    private double price;

    @Builder.Default
    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 10, nullable = false)
    private OrderStatus status = OrderStatus.CHECK;

    @Builder.Default
    @Enumerated(EnumType.STRING)
    @Column(name = "state", length = 10, nullable = false)
    private OrderState state = OrderState.PASSIVE;

    @Column(name = "creator", length = 30, nullable = false)
    private String creator;

    @ManyToOne(optional = false)
    @JoinColumn(name = "car_id", referencedColumnName = "id")
    private CarEntity car;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private UserEntity user;
}
