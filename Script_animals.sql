/*
7. В MySQL создать базу данных “Друзья человека”
8. Создать таблицы домашних (кошки, собаки, хомяки) и вьючных животных (лашди, верблюды, ослы). Таблицы 
должны иметь поля имя животного, команды которые они выполняют, дата рождения
9. Заполнить эти таблицы данными
10. Удалив из таблицы верблюдов. Объединить таблицы лошади, и ослы в одну таблицу.
11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
*/

DROP DATABASE IF EXISTS human_friends;
CREATE DATABASE human_friends;

USE human_friends;

DROP TABLE IF EXISTS cats;
CREATE TABLE  cats 
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);
    
DROP TABLE IF EXISTS dogs;
CREATE TABLE  dogs 
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);

DROP TABLE IF EXISTS homaks;
CREATE TABLE  homaks 
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);


DROP TABLE IF EXISTS verbluds;
CREATE TABLE  verbluds 
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);


DROP TABLE IF EXISTS horses;
CREATE TABLE  horses 
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);

DROP TABLE IF EXISTS donkeys;
CREATE TABLE  donkeys 
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);


INSERT INTO `cats` (`id`, `name`, `birthday`, `commands`) VALUES ('1', 'Vasja', '2001-01-01', 'есть');
INSERT INTO `cats` (`id`, `name`, `birthday`, `commands`) VALUES ('2', 'Murka', '2022-02-02', 'спать, есть');
INSERT INTO `cats` (`id`, `name`, `birthday`, `commands`) VALUES ('3', 'Kisa', '2021-12-20', 'есть');
INSERT INTO `cats` (`id`, `name`, `birthday`, `commands`) VALUES ('4', 'Serg', '2019-11-04', 'есть');

INSERT INTO `dogs` (`id`, `name`, `birthday`, `commands`) VALUES ('1', 'Vasja', '2001-01-01', 'есть');
INSERT INTO `dogs` (`id`, `name`, `birthday`, `commands`) VALUES ('2', 'Sharic', '2022-02-02', 'спать, есть');
INSERT INTO `dogs` (`id`, `name`, `birthday`, `commands`) VALUES ('3', 'Bob', '2021-12-20', 'есть');
INSERT INTO `dogs` (`id`, `name`, `birthday`, `commands`) VALUES ('4', 'Dog', '2019-11-04', 'есть');

INSERT INTO `homaks` (`id`, `name`, `birthday`, `commands`) VALUES ('1', 'Vasja', '2001-01-01', 'есть');
INSERT INTO `homaks` (`id`, `name`, `birthday`, `commands`) VALUES ('2', 'Sharic', '2022-02-02', 'спать, есть');

INSERT INTO `verbluds` (`id`, `name`, `birthday`, `commands`) VALUES ('1', 'Vasja', '2001-01-01', 'есть');
INSERT INTO `verbluds` (`id`, `name`, `birthday`, `commands`) VALUES ('2', 'Sharic','2022-02-02', 'спать, есть');
INSERT INTO `verbluds` (`id`, `name`, `birthday`, `commands`) VALUES ('3', 'Petya', '2021-12-20', 'есть');

INSERT INTO `horses` (`id`, `name`, `birthday`, `commands`) VALUES ('1', 'Vasja', '2001-01-01', 'есть');
INSERT INTO `horses` (`id`, `name`, `birthday`, `commands`) VALUES ('2', 'Sharic', '2022-02-02', 'спать, есть');
INSERT INTO `horses` (`id`, `name`, `birthday`, `commands`) VALUES ('3', 'Pet', '2021-12-20', 'есть');

INSERT INTO `donkeys` (`id`, `name`, `birthday`, `commands`) VALUES ('1', 'Vasja', '2001-01-01', 'есть');
INSERT INTO `donkeys` (`id`, `name`, `birthday`, `commands`) VALUES ('2', 'Sharic', '2022-02-02', 'спать, есть');
INSERT INTO `donkeys` (`id`, `name`, `birthday`, `commands`) VALUES ('3', 'Don', '2021-12-20', 'есть');


DROP TABLE IF EXISTS verbluds;

DROP TABLE IF EXISTS v_animals;
CREATE TABLE  v_animals
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);


INSERT INTO v_animals(`id`, `name`, `birthday`, `commands`)
SELECT `id`, `name`, `birthday`, `commands`
FROM horses;

INSERT INTO v_animals(`name`, `birthday`, `commands`)
SELECT `name`, `birthday`, `commands`
FROM donkeys;

DROP TABLE horses;
DROP TABLE donkeys;


DROP TABLE IF EXISTS young_animals;
CREATE TABLE  young_animals
(
    id 			INT PRIMARY KEY AUTO_INCREMENT,
    name 		VARCHAR(50) NOT NULL,
    birthday 	DATE,
    commands 	VARCHAR(500)
);

INSERT INTO young_animals(`id`, `name`, `birthday`, `commands`)
SELECT `id`, `name`, `birthday`, `commands`
FROM cats where (year(now()) - year(birthday) < 4) and (year(now()) - year(birthday) > 1); 

INSERT INTO young_animals(`name`, `birthday`, `commands`)
SELECT `name`, `birthday`, `commands`
FROM dogs where (year(now()) - year(birthday) < 4) and (year(now()) - year(birthday) > 1); 

INSERT INTO young_animals(`name`, `birthday`, `commands`)
SELECT `name`, `birthday`, `commands`
FROM homaks where (year(now()) - year(birthday) < 4) and (year(now()) - year(birthday) > 1); 


INSERT INTO young_animals(`name`, `birthday`, `commands`)
SELECT `name`, `birthday`, `commands`
FROM v_animals where (year(now()) - year(birthday) < 4) and (year(now()) - year(birthday) > 1); 

select * from young_animals;

SELECT `name`, `birthday`, `commands`, "cats" AS source_table FROM `cats`
UNION ALL
SELECT `name`, `birthday`, `commands`, "dogs" AS source_table FROM `dogs`
UNION ALL
SELECT `name`, `birthday`, `commands`, "homaks" AS source_table FROM `homaks`
UNION ALL
SELECT `name`, `birthday`, `commands`, "v_animals" AS source_table FROM `v_animals`
UNION ALL
SELECT `name`, `birthday`, `commands`, "young_animals" AS source_table FROM `young_animals`;



