DELETE
FROM rental
WHERE TRUE;

INSERT INTO rental (car_id, user_id, rental_date, return_date, price, rental_days, status, creator, state, date_of_creation)
VALUES (1, 2, '2023-05-21', '2023-05-24', 105, 3, 'REFUSED','USER','ACTIVE', '2023-05-21');


INSERT INTO rental (car_id, user_id, rental_date, return_date, price, rental_days, status, creator,state, date_of_creation)
VALUES (2, 2, '2023-05-22', '2023-05-25', 123, 3, 'CHECK', 'USER','ACTIVE','2023-05-22');

INSERT INTO rental (car_id, user_id, rental_date, return_date, price, rental_days, status, creator, state,date_of_creation)
VALUES (3, 2, '2023-05-23', '2023-05-26', 133, 3, 'APPROVE', 'USER','ACTIVE','2023-05-23');

