DELETE
FROM users
WHERE TRUE;

INSERT INTO users (id, full_name, email, phone, address, date_of_birthday, passwords, roles, date_of_creation)
values (2, 'Bob', 'bob@mail.ru', '+375447676655', 'Mazurova 23','2001-05-26','password', 'USER', '2023-05-22');

INSERT INTO users (id, full_name, email, phone,address, date_of_birthday,  passwords, roles, date_of_creation)
values (3, 'Tom', 'tom@mail.ru', '+375447836655', 'Mazurova 21','2000-02-20','password', 'USER', '2023-05-26');

INSERT INTO users (id, full_name, email, phone, address, date_of_birthday, passwords, roles, date_of_creation)
values (4, 'Rick', 'rick@mail.ru', '+375447806655', 'Mazurova 3','2005-01-16','password', 'USER', '2023-05-29');