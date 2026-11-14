DROP DATABASE IF EXISTS pet_search;
CREATE DATABASE pet_search;
USE pet_search;

# создание таблиц и связей

CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL DEFAULT 'user'
);

CREATE TABLE city (
    id_city INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL
);

CREATE TABLE statuses (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

CREATE TABLE pets (
    id_pets INT PRIMARY KEY AUTO_INCREMENT,
    species VARCHAR(50) NOT NULL,
    pet_name VARCHAR(100),
    breed VARCHAR(100),
    gender VARCHAR(30) DEFAULT 'неизвестно',
    age VARCHAR(50),
    color VARCHAR(100) NOT NULL,
    special_features TEXT,
    description TEXT
);

CREATE TABLE places (
    id_places INT PRIMARY KEY AUTO_INCREMENT,
    id_city INT NOT NULL,
    district VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_city) REFERENCES city(id_city)
);

CREATE TABLE announcements (
    id_announcement INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_pets INT NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    event_date DATE NOT NULL,
    id_places INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    closed_at DATETIME,
    description TEXT,
    id_status INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_pets) REFERENCES pets(id_pets),
    FOREIGN KEY (id_places) REFERENCES places(id_places),
    FOREIGN KEY (id_status) REFERENCES statuses(id_status)
);

CREATE TABLE photos (
    id_photo INT PRIMARY KEY AUTO_INCREMENT,
    id_announcement INT NOT NULL,
    photo BLOB,
    FOREIGN KEY (id_announcement) REFERENCES announcements(id_announcement)
);

# изменение структуры таблицы

ALTER TABLE pets ADD COLUMN health_info VARCHAR(255);
ALTER TABLE pets DROP COLUMN health_info;

SHOW TABLES;
DESCRIBE pets;

# вставка записей

INSERT INTO users (name, phone, email, password, role)
VALUES
('Елена', '+79000000001', 'helen@example.com', 'pass1', 'user'),
('Алена', '+79000000002', 'alen@example.com', 'pass2', 'user'),
('Администратор', '+79000000003', 'admin@example.com', 'pass3', 'admin'),
('Мария', '+79000000005', 'maria@example.com', 'pass5', 'user'),
('Анна', '+79000000006', 'anna@example.com', 'pass6', 'user'),
('Иван', '+79000000007', 'ivan@example.com', 'pass7', 'user'),
('Ольга', '+79000000008', 'olga@example.com', 'pass8', 'user'),
('Дмитрий', '+79000000009', 'dmitry@example.com', 'pass9', 'user'),
('Екатерина', '+79000000010', 'kate@example.com', 'pass10', 'user'),
('Сергей', '+79000000011', 'sergey@example.com', 'pass11', 'user');

INSERT INTO city (city_name)
VALUES
('Пермь'),
('Березники'),
('Краснокамск');

INSERT INTO statuses (status_name)
VALUES
('Опубликовано'),
('Закрыто'),
('На модерации'),
('Отклонено');

INSERT INTO pets (species, pet_name, breed, gender, age, color, special_features, description)
VALUES
('Кошка', 'Гавчик', 'Британская', 'Мужской', '3 года', 'Коричневый', 'Пятно на носу', 'Домашний ласковый кот'),
('Собака', 'Бим', 'Метис', 'Мужской', 'Около 6 лет', 'Рыжий', 'Короткий хвост','Немного пугливая собака'),
('Кошка', 'Мурка', 'Шотландская', 'Женский', '5 лет', 'Серый', 'Белые лапы', 'Домашняя кошка'),
('Собака', 'Неизвестно', 'Неизвестно', 'Неизвестно', 'Около года', 'Белый', 'Пятно на ухе', 'Найдена возле магазина'),
('Кошка', 'Барсик', 'Метис', 'Мужской', '2 года', 'Серый', 'Белое пятно на груди', 'Спокойный домашний кот'),
('Собака', 'Рекс', 'Овчарка', 'Мужской', '4 года', 'Черный', 'Красный ошейник', 'Крупная дружелюбная собака'),
('Кошка', 'Луна', 'Сиамская', 'Женский', '1 год', 'Светлый', 'Темные уши и хвост', 'Молодая активная кошка'),
('Собака', 'Тайсон', 'Метис', 'Мужской','3 года', 'Коричневый', 'Белая передняя лапа', 'Среднего размера'),
('Кошка', 'Персик', 'Метис', 'Мужской', 'Около 2 лет', 'Рыжий', 'Пушистый хвост', 'Найден во дворе'),
('Собака', 'Лайма', 'Лабрадор', 'Женский', '5 лет', 'Черный', 'Синий ошейник', 'Очень дружелюбная'),
('Кошка', 'Соня', 'Британская', 'Женский', '4 года', 'Серый', 'Зеленые глаза', 'Домашняя кошка'),
('Собака', 'Неизвестно', 'Метис', 'Неизвестно', 'Около 3 лет', 'Черно-белый', 'Белая грудь', 'Найдена возле остановки');

INSERT INTO places (id_city, district, address)
VALUES
(1, 'Индустриальный', 'ул. Баумана, 23'),
(2, 'Абрамово', 'ул. Тургенева, 25'),
(3, 'Звездный', 'ул. Энтузиастов, 17'),
(1, 'Мотовилиха', 'бульвар Гагарина, 83А'),
(1, 'Свердловский', 'ул. Куйбышева, 95'),
(1, 'Ленинский', 'ул. Ленина, 45'),
(1, 'Кировский', 'ул. Маршала Рыбалко, 32'),
(2, 'Центральный', 'ул. Пятилетки, 41'),
(3, 'Центральный', 'ул. Калинина, 12'),
(1, 'Орджоникидзевский', 'ул. Карбышева, 17'),
(1, 'Дзержинский', 'ул. Подлесная, 21'),
(2, 'Абрамово', 'ул. Юбилейная, 8');

INSERT INTO announcements
(id_user, id_pets, event_type, event_date, id_places, created_at, closed_at, description, id_status)
VALUES
(1, 1, 'Потерялся', '2026-10-10', 1, '2026-10-11 14:30:00', NULL, 'Кот убежал во время прогулки', 1),
(2, 2, 'Найден', '2025-12-15', 2, '2025-12-16 09:10:00', '2026-01-10 12:00:00', 'Собака найдена во дворе', 2),
(2, 3, 'Потерялся', '2026-08-07', 4, '2026-08-07 20:08:00', NULL, 'Кошка пропала возле дома', 3),
(1, 4, 'Найден', '2026-05-29', 3, '2026-05-30 18:00:00', NULL, 'Животное замечено возле магазина', 4),
(5, 5, 'Потерялся', '2026-10-01', 5, '2026-10-01 10:15:00', NULL, 'Кот пропал возле дома', 1),
(6, 6, 'Найден', '2026-10-01', 6, '2026-10-01 12:40:00', '2026-10-03 15:00:00', 'Собака найдена возле парка', 2),
(7, 7, 'Потерялся', '2026-09-30', 7, '2026-10-01 18:20:00', NULL, 'Кошка выбежала из дома', 1),
(8, 8, 'Найден', '2026-10-02', 8, '2026-10-02 09:30:00', NULL, 'Собака найдена во дворе', 1),
(9, 9, 'Найден', '2026-10-02', 9, '2026-10-02 13:10:00', '2026-10-05 11:30:00', 'Рыжий кот найден возле подъезда', 2),
(10, 10, 'Потерялся', '2026-10-01', 10, '2026-10-02 17:45:00', NULL, 'Собака потерялась во время прогулки', 1),
(4, 11, 'Потерялся', '2026-10-03', 11, '2026-10-03 08:20:00', NULL, 'Кошка пропала утром', 3),
(5, 12, 'Найден', '2026-10-03', 12, '2026-10-03 14:35:00', '2026-10-04 16:00:00', 'Собака найдена возле остановки', 2);

INSERT INTO photos (id_announcement, photo)
VALUES
(1, '/photos/gavchik_1.jpg'),
(1, '/photos/gavchik_2.jpg'),
(2, '/photos/bim_1.jpg'),
(3, '/photos/murka_1.jpg'),
(4, '/photos/dog_1.jpg'),
(5, '/photos/barsik_1.jpg'),
(6, '/photos/rex_1.jpg'),
(7, '/photos/luna_1.jpg'),
(8, '/photos/tyson_1.jpg'),
(9, '/photos/persik_1.jpg'),
(10, '/photos/laima_1.jpg'),
(11, '/photos/sonya_1.jpg'),
(12, '/photos/dog_found_1.jpg');

# обновление записей
UPDATE announcements
SET description = 'Кот убежал во время прогулки около дома'
WHERE id_announcement = 1;

# удаление записей
INSERT INTO users (name, phone, email, password, role)
VALUES ('Тестовый пользователь', '+79000000099', 'test@example.com', 'test123', 'user');

DELETE FROM users WHERE email = 'test@example.com';

# создание пользователя и наделение его правами
CREATE USER 'registered_user'@'localhost'
IDENTIFIED BY 'user12345';
GRANT SELECT, INSERT, UPDATE ON pet_search.* TO 'registered_user'@'localhost';

CREATE USER 'guest_user'@'localhost'
IDENTIFIED BY 'guest12345';
GRANT SELECT ON pet_search.* TO 'guest_user'@'localhost';


CREATE USER 'administrator'@'localhost'
IDENTIFIED BY 'admin12345';
GRANT SELECT, INSERT, UPDATE, DELETE ON pet_search.* TO 'administrator'@'localhost';

# выгрузка метаданных
DESCRIBE users;
DESCRIBE pets;
DESCRIBE city;
DESCRIBE statuses;
DESCRIBE places;
DESCRIBE announcements;
DESCRIBE photos;

# ЧАСТЬ 2
# неявное соединение с where и order by
SELECT
    users.name AS "Имя пользователя",
    announcements.event_type AS "Тип объявления",
    announcements.event_date AS "Дата события",
    announcements.description AS "Описание"
FROM users , announcements 
WHERE users.id_user = announcements.id_user
ORDER BY announcements.event_date DESC;

# явное соединение join
SELECT
    announcements.id_announcement AS "Номер объявления",
    pets.pet_name AS "Кличка животного",
    pets.species AS "Вид животного",
    announcements.event_type AS "Тип объявления"
FROM announcements
JOIN pets 
ON announcements.id_pets = pets.id_pets;


# агрегирующие операции (SUM, AVG, COUNT, MAX, MIN)
SELECT 
       COUNT(*) AS "Всего объявлений",
       SUM(announcements.event_type = 'Потерялся') AS "Потерянные животные",
       SUM(announcements.event_type = 'Найден') AS "Найденные животные",
       AVG(pets.age) AS "Средний возраст животных",
       MAX(event_date) AS "Последняя дата события",
       MIN(event_date) AS "Первая дата события"
FROM announcements
JOIN pets ON announcements.id_pets = pets.id_pets;

#  группировка GROUP BY и фильтрация HAVING
SELECT
    event_type AS "Тип объявления",
    COUNT(*) AS "Количество объявлений"
FROM announcements
GROUP BY event_type
HAVING COUNT(*) > 2;

# вложенные подзапросы
SELECT * FROM pets
WHERE age > (SELECT AVG(age) FROM pets);

# вложенный подзапрос с IN
SELECT * FROM pets
WHERE id_pets IN (SELECT id_pets FROM announcements WHERE id_status IN (SELECT id_status FROM statuses WHERE status_name = 'Закрыто'));

# вложенный подзапрос с ALL
SELECT * FROM announcements 
WHERE event_date > ALL (SELECT event_date FROM announcements WHERE event_date < "2026-10-01");

# использование «функций управления потоком» (IF, CASE)
SELECT
    pets.pet_name AS "Кличка животного",
    pets.species AS "Вид животного",
    announcements.id_announcement AS "Номер объявления",
    CASE
        WHEN announcements.event_type = 'Потерялся'
            THEN 'Поиск потерянного питомца'
        WHEN announcements.event_type = 'Найден'
            THEN 'Поиск хозяина найденного питомца'
        ELSE 'Неизвестный тип объявления'
    END AS "Назначение объявления",
    IF(
        announcements.closed_at IS NULL,
        'Актуально',
        'Закрыто'
    ) AS "Состояние объявления"
FROM pets
JOIN announcements
    ON pets.id_pets = announcements.id_pets;

# представления на наиболее популярный запрос (CREATE VIEW) и временное представление – оператор WITH
CREATE VIEW daily_statistics AS
SELECT
    DATE(announcements.created_at) AS "Дата",
    COUNT(*) AS "Всего объявлений",
    SUM(announcements.event_type = 'Потерялся') AS "Потерянные животные",
    SUM(announcements.event_type = 'Найден') AS "Найденные животные",
    SUM(pets.species = 'Кошка') AS "Объявления о кошках",
    SUM(pets.species = 'Собака') AS "Объявления о собаках",
    SUM(announcements.id_status = 2) AS "Закрытые объявления"
FROM announcements
JOIN pets
    ON announcements.id_pets = pets.id_pets
GROUP BY DATE(announcements.created_at);
SELECT * FROM daily_statistics;

WITH daily_report AS (
    SELECT
        DATE(announcements.created_at) AS report_date,
        COUNT(*) AS total_announcements,
        SUM(announcements.event_type = 'Потерялся') AS lost_pets,
        SUM(announcements.event_type = 'Найден') AS found_pets,
        SUM(pets.species = 'Кошка') AS cats,
        SUM(pets.species = 'Собака') AS dogs,
        SUM(announcements.id_status = 2) AS closed_announcements
    FROM announcements
    JOIN pets
        ON announcements.id_pets = pets.id_pets
    WHERE announcements.created_at >= '2026-10-01'
      AND announcements.created_at < '2026-11-01'
    GROUP BY DATE(announcements.created_at)
)
SELECT
    report_date AS "Дата",
    total_announcements AS "Всего объявлений",
    lost_pets AS "Потерянные животные",
    found_pets AS "Найденные животные",
    cats AS "Объявления о кошках",
    dogs AS "Объявления о собаках",
    closed_announcements AS "Закрытые объявления"
FROM daily_report;

#  анализ и оптимизация запросов средствами EXPLAIN и созданием индексов (CREATE INDEX)
EXPLAIN
SELECT
    announcements.id_announcement AS "Номер объявления",
    announcements.event_type AS "Тип объявления",
    announcements.event_date AS "Дата события"
FROM announcements WHERE announcements.event_type = 'Потерялся';

DROP INDEX index_event_type ON announcements;
CREATE INDEX index_event_type ON announcements(event_type);
SHOW INDEX FROM announcements;


# механизм транзакций (START TRANSACTION)
START TRANSACTION;
UPDATE announcements
SET
    id_status = 2,
    closed_at = NOW()
WHERE id_announcement = 1;
SELECT
    announcements.id_announcement AS "Номер объявления",
    announcements.closed_at AS "Дата закрытия",
    statuses.status_name AS "Статус объявления"
FROM announcements
JOIN statuses
    ON announcements.id_status = statuses.id_status
WHERE announcements.id_announcement = 1;

COMMIT;

# операторы PREPARE, EXECUTE, DEALLOCATE
SET @event_type = 'Потерялся';
PREPARE search_announcements FROM
'SELECT
    announcements.id_announcement AS "Номер объявления",
    pets.pet_name AS "Кличка животного",
    pets.species AS "Вид животного",
    announcements.event_type AS "Тип объявления",
    announcements.event_date AS "Дата события"
FROM announcements
JOIN pets ON announcements.id_pets = pets.id_pets
WHERE announcements.event_type = ?';

EXECUTE search_announcements USING @event_type;
DEALLOCATE PREPARE search_announcements;
