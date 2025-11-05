-- ALGUNS DOS INSERTS — BANCO DE DADOS OFICINA

USE oficina;

-- ==========================================================
-- 1. CLIENT
-- ==========================================================
INSERT INTO client (first_name, middle_name, last_name, street, district, city, state, phone, email)
VALUES
('John', 'Carlos', 'Silva', 'Street A', 'Downtown', 'São Luís', 'MA', '99999-1111', 'john.silva@gmail.com'),
('Mary', 'Fernanda', 'Souza', 'Street B', 'Cohab', 'Imperatriz', 'MA', '99999-2222', 'mary.souza@gmail.com'),
('Peter', 'Henrique', 'Alves', 'Street C', 'Vila Nova', 'Timon', 'MA', '99999-3333', 'peter.alves@gmail.com'),
('Anna', 'Clara', 'Lima', 'Street D', 'Renascença', 'São Luís', 'MA', '99999-4444', 'anna.lima@gmail.com'),
('Lucas', 'Gustavo', 'Pereira', 'Street E', 'Cohama', 'São Luís', 'MA', '99999-5555', 'lucas.pereira@gmail.com'),
('Carla', 'Beatriz', 'Rodrigues', 'Street F', 'São Cristóvão', 'Imperatriz', 'MA', '99999-6666', 'carla.rodrigues@gmail.com'),
('Rafael', 'Santos', 'Costa', 'Street G', 'Downtown', 'Timon', 'MA', '99999-7777', 'rafael.costa@gmail.com'),
('Juliana', 'Paula', 'Martins', 'Street H', 'Vila Nova', 'São Luís', 'MA', '99999-8888', 'juliana.martins@gmail.com');

-- ==========================================================
-- 2. EMPLOYEE
-- ==========================================================
INSERT INTO employee (first_name, middle_name, last_name, role, salary)
VALUES
('Carlos', 'Eduardo', 'Mendes', 'Attendant', 1800.00),
('Fernanda', 'Oliveira', 'Santos', 'Mechanic', 2500.00),
('Roberto', 'José', 'Lima', 'Manager', 4000.00),
('Patricia', 'Maria', 'Costa', 'Assistant', 1500.00),
('Thiago', 'Henrique', 'Pereira', 'Mechanic', 2600.00),
('Caroline', 'Beatriz', 'Alves', 'Attendant', 1800.00),
('Rafael', 'Gustavo', 'Souza', 'Mechanic', 2700.00),
('Juliana', 'Clara', 'Rodrigues', 'Assistant', 1500.00);

-- ==========================================================
-- 3. VEHICLE
-- ==========================================================
INSERT INTO vehicle (id_client, brand, model, year, plate)
VALUES
(1, 'Toyota', 'Corolla', 2018, 'ABC1234'),
(2, 'Honda', 'Civic', 2020, 'DEF5678'),
(3, 'Ford', 'Fiesta', 2017, 'GHI9012'),
(4, 'Chevrolet', 'Onix', 2019, 'JKL3456'),
(5, 'Volkswagen', 'Gol', 2015, 'MNO7890'),
(6, 'Hyundai', 'HB20', 2021, 'PQR1234'),
(7, 'Nissan', 'Versa', 2018, 'STU5678'),
(8, 'Fiat', 'Palio', 2016, 'VWX9012');

-- ==========================================================
-- 4. APPOINTMENT
-- ==========================================================
INSERT INTO appointment (id_client, id_vehicle, appointment_date, problem_description)
VALUES
(1, 1, '2025-11-06', 'Oil change'),
(2, 2, '2025-11-07', 'Brake replacement'),
(3, 3, '2025-11-08', 'Tire alignment'),
(4, 4, '2025-11-09', 'Engine check'),
(5, 5, '2025-11-10', 'Battery replacement'),
(6, 6, '2025-11-11', 'Air conditioning repair'),
(7, 7, '2025-11-12', 'Suspension check'),
(8, 8, '2025-11-13', 'Oil and filter change');

-- ==========================================================
-- 5. SERVICE_ORDER
-- ==========================================================
INSERT INTO service_order (id_appointment, id_employee, issue_date, status, total_value)
VALUES
(1, 1, '2025-11-06', 'Open', 300.00),
(2, 2, '2025-11-07', 'Open', 500.00),
(3, 3, '2025-11-08', 'Open', 200.00),
(4, 4, '2025-11-09', 'Open', 450.00),
(5, 5, '2025-11-10', 'Open', 350.00),
(6, 6, '2025-11-11', 'Open', 400.00),
(7, 7, '2025-11-12', 'Open', 250.00),
(8, 8, '2025-11-13', 'Open', 600.00);

-- ==========================================================
-- 6. SERVICE
-- ==========================================================
INSERT INTO service (description, price)
VALUES
('Oil change', 100.00),
('Brake replacement', 250.00),
('Tire alignment', 80.00),
('Engine check', 150.00),
('Battery replacement', 200.00),
('Air conditioning repair', 300.00),
('Suspension check', 180.00),
('Oil and filter change', 120.00);

-- ==========================================================
-- 7. SERVICE_ORDER_SERVICE
-- ==========================================================
INSERT INTO service_order_service (id_service_order, id_service, quantity)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1);

-- ==========================================================
-- 8. PART
-- ==========================================================
INSERT INTO part (name, unit_price)
VALUES
('Oil filter', 50.00),
('Brake pads', 150.00),
('Tire', 200.00),
('Battery', 300.00),
('Spark plug', 40.00),
('Air filter', 60.00),
('Suspension spring', 100.00),
('Engine belt', 80.00);

-- ==========================================================
-- 9. SERVICE_ORDER_PART
-- ==========================================================
INSERT INTO service_order_part (id_service_order, id_part, quantity)
VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 2),
(4, 8, 1),
(5, 4, 1),
(6, 6, 1),
(7, 7, 2),
(8, 1, 1);

-- ==========================================================
-- 10. SUPPLIER
-- ==========================================================
INSERT INTO supplier (first_name, middle_name, last_name, cnpj, phone)
VALUES
('Carlos', 'Eduardo', 'Mendes', '12345678000199', '99999-1111'),
('Fernanda', 'Oliveira', 'Santos', '98765432000188', '99999-2222'),
('Roberto', 'José', 'Lima', '11122233000177', '99999-3333'),
('Patricia', 'Maria', 'Costa', '44455566000166', '99999-4444');

-- ==========================================================
-- 11. STOCK
-- ==========================================================
INSERT INTO stock (id_part, quantity, id_supplier)
VALUES
(1, 10, 1),
(2, 20, 2),
(3, 15, 3),
(4, 8, 4),
(5, 12, 1),
(6, 14, 2),
(7, 7, 3),
(8, 5, 4);

-- ==========================================================
-- 12. PAYMENT
-- ==========================================================
INSERT INTO payment (id_service_order, payment_method, amount, payment_date)
VALUES
(1, 'Cash', 300.00, '2025-11-06'),
(2, 'Credit Card', 500.00, '2025-11-07'),
(3, 'Pix', 200.00, '2025-11-08'),
(4, 'Debit Card', 450.00, '2025-11-09'),
(5, 'Cash', 350.00, '2025-11-10'),
(6, 'Credit Card', 400.00, '2025-11-11'),
(7, 'Pix', 250.00, '2025-11-12'),
(8, 'Debit Card', 600.00, '2025-11-13');
