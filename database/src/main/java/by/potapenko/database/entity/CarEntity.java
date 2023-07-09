package by.potapenko.database.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Data
@ToString
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "car")
public class CarEntity implements BaseIdEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "brand", length = 20, nullable = false)
    private String brand;

    @Column(name = "model", length = 20, nullable = false)
    private String model;

    @Column(name = "year_of_release", nullable = false)
    private int year;

    @Column(name = "price", nullable = false)
    private double price;

    @Column(name = "fuel_consumption")
    public double fuelConsumption;

    @Builder.Default
    @OneToMany(mappedBy = "car")
    private List<RentalEntity> orders = new ArrayList<>();

    @Embedded
    @AttributeOverrides(
            {@AttributeOverride(name = "placeQuantity", column = @Column(name = "quantity_places", nullable = false)),
                    @AttributeOverride(name = "doorQuantity", column = @Column(name = "quantity_doors", nullable = false)),
                    @AttributeOverride(name = "trunkVolume", column = @Column(name = "trunk_volume", nullable = false)),
                    @AttributeOverride(name = "vinCode", column = @Column(name = "vin_code", length = 20, nullable = false, unique = true)),
                    @AttributeOverride(name = "number", column = @Column(name = "numbers", length = 20, nullable = false, unique = true)),
                    @AttributeOverride(name = "color", column = @Column(name = "color", length = 20, nullable = false))
            })
    private BodyCar body;

    @Embedded
    @AttributeOverrides(
            {@AttributeOverride(name = "engineCapacity", column = @Column(name = "engine_capacity", nullable = false)),
                    @AttributeOverride(name = "horsePower", column = @Column(name = "horse_power", nullable = false)),
                    @AttributeOverride(name = "fuelType", column = @Column(name = "fuel", length = 20, nullable = false)),
                    @AttributeOverride(name = "transmission", column = @Column(name = "transmission", length = 20, nullable = false)),
            })
    private EngineCar engine;

}

