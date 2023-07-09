DELETE
FROM users
WHERE TRUE;

INSERT INTO users (id, logins, email, phone, passwords, roles, date_of_creation)
values (2, 'Bob', 'bob@mail.ru', '+375447676655', 'password', 'USER', '2023-05-22');

INSERT INTO users (id, logins, email, phone, passwords, roles, date_of_creation)
values (3, 'Tom', 'tom@mail.ru', '+375447836655', 'password', 'USER', '2023-05-26');

INSERT INTO users (id, logins, email, phone, passwords, roles, date_of_creation)
values (4, 'Rick', 'rick@mail.ru', '+375447806655', 'password', 'USER', '2023-05-29');