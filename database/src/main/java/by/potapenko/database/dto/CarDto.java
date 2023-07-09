package by.potapenko.database.dto;

import by.potapenko.database.entity.enam.ColorCar;
import by.potapenko.database.entity.enam.FuelType;
import by.potapenko.database.entity.enam.TransmissionType;
import lombok.Data;

@Data
public class CarDto {
    private Long id;
    private String brand;
    private String model;
    private int year;
    private double price;
    private int placeQuantity;
    private int doorQuantity;
    private int trunkVolume;
    private ColorCar color;
    private double engineCapacity;
    private TransmissionType transmission;
    private int horsePower;
    private FuelType fuelType;
    private String vinCode;
    private String number;
    public double fuelConsumption;
}
