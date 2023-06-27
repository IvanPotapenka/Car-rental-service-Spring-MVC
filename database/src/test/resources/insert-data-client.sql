DELETE
FROM client
WHERE TRUE;

INSERT INTO client (id, first_name, last_name, phone, address, date_of_birthday,
                    date_of_creation)
VALUES (2, 'Ivan', 'Potapenko', '+375447399840', 'Gomel,Mazurova,21', '1986-05-04',
        '2023-05-04');
INSERT INTO client (id, first_name, last_name, phone, address, date_of_birthday,
                    date_of_creation)
VALUES (3, 'Anna', 'Potapenkov', '+375442899840', 'Gomel,Mazurova,23', '1986-05-03',
        '2023-05-03');
INSERT INTO client (id, first_name, last_name, phone, address, date_of_birthday,
                    date_of_creation)
VALUES (4, 'Egor', 'Potap', '+375447899340', 'Gomel,Mazurova,25', '1986-05-01',
        '2023-05-01');