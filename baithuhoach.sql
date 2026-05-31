-- Tạo CSDL và các bảng
CREATE DATABASE Hackathon;
USE Hackathon;

CREATE TABLE Creator (
    creator_id VARCHAR(5) PRIMARY KEY,
    creator_name VARCHAR(100) NOT NULL,
    creator_email VARCHAR(100) UNIQUE NOT NULL,
    creator_phone VARCHAR(15) UNIQUE,
    creator_platform VARCHAR(20) NOT NULL
);

CREATE TABLE Studio (
    studio_id VARCHAR(5) PRIMARY KEY,
    studio_name VARCHAR(100) NOT NULL,
    studio_location VARCHAR(100),
    hourly_price DECIMAL(10,2) CHECK (hourly_price > 0),
    studio_status VARCHAR(20) CHECK (studio_status IN ('Available','Booked','Maintenance'))
);

CREATE TABLE LiveSession (
    session_id INT PRIMARY KEY,
    creator_id VARCHAR(5) NOT NULL,
    studio_id VARCHAR(5) NOT NULL,
    session_date DATE NOT NULL,
    duration_hours INT CHECK (duration_hours > 0),
    FOREIGN KEY (creator_id) REFERENCES Creator(creator_id),
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    session_id INT NOT NULL,
    payment_method VARCHAR(50) CHECK (payment_method IN ('Cash','Credit Card','Bank Transfer')),
    payment_amount DECIMAL(10,2) CHECK (payment_amount >= 0),
    payment_date DATE NOT NULL,
    FOREIGN KEY (session_id) REFERENCES LiveSession(session_id)
);

INSERT INTO Creator VALUES
('CR01','Nguyen Van A','a@live.com','0901111111','Tiktok'),
('CR02','Tran Thi B','b@live.com','0902222222','Youtube'),
('CR03','Le Minh C','c@live.com','0903333333','Facebook'),
('CR04','Pham Thi D','d@live.com','0904444444','Tiktok'),
('CR05','Vu Hoang E','e@live.com','0905555555','Shopee live');

INSERT INTO Studio VALUES
('ST01','Studio A','Ha Noi',20.00,'Available'),
('ST02','Studio B','HCM',25.00,'Available'),
('ST03','Studio C','Danang',30.00,'Booked'),
('ST04','Studio D','Ha Noi',22.00,'Available'),
('ST05','Studio E','Can Tho',18.00,'Maintenance');

INSERT INTO LiveSession VALUES
(1,'CR01','ST01','2025-05-01',3),
(2,'CR02','ST02','2025-05-02',4),
(3,'CR03','ST03','2025-05-03',2),
(4,'CR01','ST04','2025-05-04',5),
(5,'CR05','ST02','2025-05-05',1);

INSERT INTO Payment VALUES
(1,1,'Cash',60.00,'2025-05-01'),
(2,2,'Credit Card',100.00,'2025-05-02'),
(3,3,'Bank Transfer',60.00,'2025-05-03'),
(4,4,'Credit Card',110.00,'2025-05-04'),
(5,5,'Cash',25.00,'2025-05-05');

-- 3
UPDATE Creator SET creator_platform='YouTube' 
WHERE creator_id='CR03';

-- 4
UPDATE Studio
SET studio_status='Available',
    hourly_price = hourly_price * 0.9
WHERE studio_id='ST05';

SET SQL_SAFE_UPDATES = 0;

-- 5
DELETE FROM Payment
WHERE payment_method='Cash' AND payment_date<'2025-05-03';

SET SQL_SAFE_UPDATES = 1;

-- Truy vấn dữ liệu cơ bản
-- 6
SELECT * FROM Studio
WHERE studio_status='Available' AND hourly_price>20;

-- 7
SELECT creator_name, creator_phone
FROM Creator
WHERE creator_platform='Tiktok';

-- 8
SELECT studio_id, studio_name, hourly_price
FROM Studio
ORDER BY hourly_price DESC;

-- 9
SELECT *
FROM Payment
WHERE payment_method = 'Credit Card'
ORDER BY payment_id
LIMIT 3;

-- 10
SELECT creator_id, creator_name
FROM Creator
ORDER BY creator_id
LIMIT 2 OFFSET 2;

-- Truy vấn dữ liệu nâng cao
-- 1
SELECT L.session_id, C.creator_name, S.studio_name, L.duration_hours, P.payment_amount
FROM LiveSession L
JOIN Creator C ON L.creator_id=C.creator_id
JOIN Studio S ON L.studio_id=S.studio_id
JOIN Payment P ON L.session_id=P.session_id;

-- 2. Studio và số lần sử dụng
SELECT S.studio_id, S.studio_name, COUNT(L.session_id) AS so_lan_su_dung
FROM Studio S
LEFT JOIN LiveSession L ON S.studio_id=L.studio_id
GROUP BY S.studio_id, S.studio_name;

-- 3
SELECT payment_method, SUM(payment_amount) AS tong_doanh_thu
FROM Payment
GROUP BY payment_method;

-- 4
SELECT C.creator_id, C.creator_name, COUNT(L.session_id) AS so_session
FROM Creator C
JOIN LiveSession L ON C.creator_id=L.creator_id
GROUP BY C.creator_id, C.creator_name
HAVING COUNT(L.session_id)>=2;

-- 5
SELECT * FROM Studio
WHERE hourly_price > (
	SELECT AVG(hourly_price) FROM Studio
);

-- 6
SELECT DISTINCT C.creator_name, C.creator_email
FROM Creator C
JOIN LiveSession L 
ON C.creator_id = L.creator_id
JOIN Studio S ON L.studio_id = S.studio_id
WHERE S.studio_name='Studio B';

-- 7
SELECT L.session_id, C.creator_name, S.studio_name, P.payment_method, P.payment_amount
FROM LiveSession L
JOIN Creator C 
ON L.creator_id = C.creator_id
JOIN Studio S 
ON L.studio_id=  S.studio_id
JOIN Payment P 
ON L.session_id = P.session_id;

