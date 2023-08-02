DELETE
FROM car
WHERE TRUE;

INSERT INTO car
(id, color, quantity_doors, numbers, quantity_places, image, status, state_check, type_car, trunk_volume, vin_code, brand, engine_capacity,
 fuel_consumption, fuel, horse_power, transmission, model, price, year_of_release)
VALUES (1, 'WHITE', 5, '1092873', 5, 'img', 'FREE', 'READY', 'ECONOMIC',587, '123-0948098j802d', 'Audy', 1.5, 6.0, 'DIESEL', 125, 'AUTOMATIC',
        'A8', 102, 2020);

INSERT INTO car
(id, color, quantity_doors, numbers, quantity_places,image, status, state_check,type_car,   trunk_volume, vin_code, brand, engine_capacity,
 fuel_consumption, fuel, horse_power, transmission, model, price, year_of_release)
VALUES (2, 'BLACK', 5, '1092871', 5, 'img', 'FREE', 'READY','ECONOMIC', 587,'113-0948098j865d', 'BMW', 1.5, 6.0, 'DIESEL', 125, 'AUTOMATIC',
        'X6', 102, 2023);

INSERT INTO car
(id, color, quantity_doors, numbers, quantity_places,image, status, state_check,type_car,  trunk_volume, vin_code, brand, engine_capacity,
 fuel_consumption, fuel, horse_power, transmission, model, price, year_of_release)
VALUES (3, 'GREEN', 5, '1092872', 5, 'img', 'FREE', 'READY','ECONOMIC',587, '133-0948095j802d', 'Mercedes', 1.5, 6.0, 'DIESEL', 125, 'AUTOMATIC',
        'F1', 102, 2021);
