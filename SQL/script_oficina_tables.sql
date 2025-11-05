CREATE DATABASE oficina;
USE oficina;

-- ============================================================
-- ✅ CLIENT (CLIENTE)
-- ============================================================
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,      -- primeiro nome
    middle_name VARCHAR(50),              -- nome do meio
    last_name VARCHAR(50) NOT NULL,       -- sobrenome
    street VARCHAR(100),                  -- rua
    district VARCHAR(100),                -- bairro
    city VARCHAR(100),                    -- cidade
    state VARCHAR(50),                    -- estado
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- ============================================================
-- ✅ VEHICLE (VEÍCULO)
-- ============================================================
CREATE TABLE vehicle (
    id_vehicle INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,               -- FK para cliente
    brand VARCHAR(50),
    model VARCHAR(50),
    year INT,
    plate VARCHAR(10),
    FOREIGN KEY (id_client) REFERENCES client(id_client)
);

-- ============================================================
-- ✅ EMPLOYEE (FUNCIONÁRIO)
-- ============================================================
CREATE TABLE employee (
    id_employee INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,      -- primeiro nome
    middle_name VARCHAR(50),              -- nome do meio
    last_name VARCHAR(50) NOT NULL,       -- sobrenome
    role VARCHAR(50),                     -- cargo
    salary DECIMAL(10,2)
);

-- ============================================================
-- ✅ APPOINTMENT (AGENDAMENTO)
-- ============================================================
CREATE TABLE appointment (
    id_appointment INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,               -- fk cliente
    id_vehicle INT NOT NULL,              -- fk veículo
    appointment_date DATE,
    problem_description TEXT,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_vehicle) REFERENCES vehicle(id_vehicle)
);

-- ============================================================
-- ✅ SERVICE ORDER (ORDEM DE SERVIÇO)
-- ============================================================
CREATE TABLE service_order (
    id_service_order INT AUTO_INCREMENT PRIMARY KEY,
    id_appointment INT NOT NULL,          -- fk agendamento
    id_employee INT NOT NULL,             -- fk funcionário
    issue_date DATE,
    status VARCHAR(20),
    total_value DECIMAL(10,2),
    FOREIGN KEY (id_appointment) REFERENCES appointment(id_appointment),
    FOREIGN KEY (id_employee) REFERENCES employee(id_employee)
);

-- ============================================================
-- ✅ SERVICE (SERVIÇO)
-- ============================================================
CREATE TABLE service (
    id_service INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(200),
    price DECIMAL(10,2)
);

-- ============================================================
-- ✅ SERVICE_ORDER_SERVICE (SERVIÇOS NA OS)
-- ============================================================
CREATE TABLE service_order_service (
    id_service_order INT,
    id_service INT,
    quantity INT,
    FOREIGN KEY (id_service_order) REFERENCES service_order(id_service_order),
    FOREIGN KEY (id_service) REFERENCES service(id_service)
);

-- ============================================================
-- ✅ PART (PEÇA)
-- ============================================================
CREATE TABLE part (
    id_part INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    unit_price DECIMAL(10,2)
);

-- ============================================================
-- ✅ SERVICE_ORDER_PART (PEÇAS NA OS)
-- ============================================================
CREATE TABLE service_order_part (
    id_service_order INT,
    id_part INT,
    quantity INT,
    FOREIGN KEY (id_service_order) REFERENCES service_order(id_service_order),
    FOREIGN KEY (id_part) REFERENCES part(id_part)
);

-- ============================================================
-- ✅ SUPPLIER (FORNECEDOR)
-- ============================================================
CREATE TABLE supplier (
    id_supplier INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    cnpj VARCHAR(20),
    phone VARCHAR(20)
);

-- ============================================================
-- ✅ STOCK (ESTOQUE)
-- ============================================================
CREATE TABLE stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_part INT NOT NULL,
    quantity INT,
    id_supplier INT,
    FOREIGN KEY (id_part) REFERENCES part(id_part),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);

-- ============================================================
-- ✅ PAYMENT (PAGAMENTO)
-- ============================================================
CREATE TABLE payment (
    id_payment INT AUTO_INCREMENT PRIMARY KEY,
    id_service_order INT NOT NULL,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (id_service_order) REFERENCES service_order(id_service_order)
);

SHOW TABLES;