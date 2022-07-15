DROP DATABASE IF EXISTS "s.abidueva";

CREATE DATABASE "s.abidueva" WITH ENCODING = 'UTF8';

\c "s.abidueva";

CREATE TABLE sender
(
id serial primary key,
surname varchar(20),
name varchar(20),
patronymic varchar(20),
telephone varchar(12),
city varchar(20),
address varchar(60)
);

CREATE TABLE recipient
(
id serial primary key,
surname varchar(20),
name varchar(20),
patronymic varchar(20),
telephone varchar(12),
city varchar(20),
address varchar(60)
);

CREATE TABLE courier
(
id serial primary key,
full_name varchar(60),
city varchar(20),
telephone varchar(12),
salary real CHECK (salary>=0)
);

CREATE TABLE transport
(
id serial primary key,
number_of_car varchar(8) UNIQUE,
model varchar(30),
color varchar(15),
city varchar(20)
);

CREATE TABLE pickup_points
(
id serial primary key,
city varchar(20),
address varchar(60),
start_time time,
end_time time
);

CREATE TABLE orders
(
id serial primary key,
sender int REFERENCES sender,
recipient int REFERENCES recipient,
date_order date,
date_delivery date,
pickup_point smallint REFERENCES pickup_points,
courier smallint REFERENCES courier,
transport smallint REFERENCES transport,
delivery_price real CHECK (delivery_price>=0),  
status varchar(30)
);

INSERT INTO sender (surname, name, patronymic, telephone, city, address)
VALUES
	('Ivanov','Petr','Nikolaevich','89027564527','Moscow', 'Lenina st, 28-7'),
	('Vershinin','Vladislav','Georgievich','89977478923','Saint-Petersburg', 'Rubinstein st, 33-221'),
	('Kondratyeva','Vasilisa','Igorevna','89953674582','Saint-Petersburg', 'Fontanka river embankment, 129-33'),
	('Rusakova','Antonina','Yurevna','89325687548','Moscow', 'Petrovka st, 34-99'),
	('Ozerov','Stepan','Grigorievich','89456789253','Moscow', 'Bolshaya Lubyanka st, 74-58'),
	('Voronov','Leonid','Vyacheslavovich','89756315484','Saint-Petersburg', 'Nekrasov st, 46-13'),
	('Volkov','Andrey','Mikhailovich','89354798456','Moscow', 'Nikolskaya st, 78-456'),
	('Korableva','Anna','Alekseevna','89326478595','Moscow', 'Mokhovaya st, 76-59'),
	('Sharapova','Kseniya','Zakharovna','89642157895','Saint-Petersburg', 'Pushkina st, 45-78'),
	('Kovalev','Nikolay','Andreevich','89326457812','Saint-Petersburg', 'Liteyniy prospekt, 12-2'),
	('Popova','Elizaveta','Romanovna','89012345682','Saint-Petesburg', 'Zhukovskogo, 135-87');
INSERT INTO recipient (surname, name, patronymic, telephone, city, address)
VALUES
	('Kalenova','Yulia','Andreevna','89635748965','Saint-Petersburg', 'Tverskaya st, 7-46'),
	('Peskov','Viktor','Daniilovich','89765214865','Saint-Petersburg', 'Botanicheskaya st, 65-78'),
	('Timofeev','Daniil','Maksimovich','89632541654','Moscow', 'Bolshaya Lubyanka st, 23-46'),
	('Semenov','Maxim','Leonidovich','89365598257','Moscow', 'Bolshaya Sadovaya st, 45-32'),
	('Kupriyanov','Vasiliy','Lvovich','89235476214','Saint-Petersburg', 'Karavannaya st, 46-94'),
	('Gribov','Aleksey','Egorovich','89235417685','Saint-Petersburg', 'Socialisticheskaya st, 78-45'),
	('Petrukhina','Anastasiya','Petrovna','89203123574','Saint-Petersburg', 'Marata st, 78-32'),
	('Moskvitina','Alina','Vitalevna','89032568954','Moscow', 'Vozdvizhenka st, 34-85'),
	('Kalashnikov','Anton','Vasilyevich','89657423564','Moscow', 'Pokrovka st, 74-65'),
	('Suvorova','Mariya','Glebovna','89320265412','Saint-Petersburg', 'Noviy Arbat, 47-52');
INSERT INTO courier (full_name, city, telephone, salary)
VALUES
	('Kudryavcev Vadim Semenovich', 'Saint-Petersburg', '89456472133', 25800),
	('Novikov Vyacheslav Eduardovich','Moscow', '89302547856', 12900),
	('Davidov Artur Karlovich','Saint-Petersburg', '89235467858', 25800),
	('Starostin Sergey Antonovich','Moscow', '89365478526', 12900);
INSERT INTO transport (number_of_car, model, color, city)
VALUES 
	('h506at', 'Hyundai Genesis', 'white', 'Moscow'),
	('e225ka', 'Toyota Prius', 'white', 'Saint-Petersburg'),
	('a768ds', 'Scoda Octavia', 'grey', 'Moscow'),
	('o798ko', 'Kia Rio', 'black', 'Moscow'),
	('k698od', 'Audi A5', 'red', 'Saint-Petersburg');
INSERT INTO pickup_points (city, address, start_time, end_time)
VALUES 
	('Moscow', 'Lenina st, 48', '08:00:00','20:00:00'),
	('Moscow', 'prospekt Pobedi, 12', '10:00:00', '19:00:00'),
	('Saint-Petersburg', 'ploshad Revolutsii, 74', '09:00:00', '22:00:00'),
	('Saint-Petersburg', 'Zhukovskogo, 120', '09:00:00', '20:00:00');
INSERT INTO orders (sender, recipient, date_order, date_delivery, pickup_point, courier, transport, delivery_price, status)
VALUES 
	(1, 1, '12-10-2020', '15-10-2020', 3, NULL, 3, 512.5, 'delivered'),
	(2, 3, '12-10-2020', '14-10-2020', 2, 2, 2, 225, 'delivered'),
	(3, 8, '20-10-2020', '21-10-2020', 1, NULL, 1, 695, 'delivered'),
	(4, 2, '21-10-2020', '23-10-2020', 3, 3, 3, 2015, 'cancelled'),
	(5, 6, '29-10-2020', '01-11-2020', 4, 1, 1, 1880, 'delivered'),
	(6, 3, '02-11-2020', '06-11-2020', 1, 2, 2, 623.55, 'delivered'),
	(7, 5, '02-11-2020', '04-06-2020', 3, NULL, 2, 128, 'delivered'),
	(8, 7, '03-11-2020', '03-11-2020', 2, 2, 4, 446, 'cancelled'),
	(9, 2, '04-11-2020', '06-11-2020', 3, 3, 3, 546, 'delivered'),
	(1, 5, '04-11-2020', '07-11-2020', 4, NULL, 2, 875.75, 'delivered'),
	(10, 4, '04-11-2020', '10-11-2020', 1, 2, 4, 229.13, 'expected'),
	(3, 9, '05-11-2020', '08-11-2020', 2, NULL, 2, 859.21, 'delivered'),
	(5, 10, '05-11-2020', '15-11-2020', 3, 3, 4, 645.32, 'expected'),
	(6, 4, '06-11-2020', '07-11-2020', 1, 4, 1, 1205.8, 'delivered'),
	(4, 7, '06-11-2020', '10-11-2020', 4, 1, 3, 655.3, 'expected');
