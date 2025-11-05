-- 	EXEMPLOS DE QUERIES
USE oficina;

-- ==========================================================
-- Recupera todos os clientes
-- ==========================================================
SELECT * FROM client;

--  Recupera nome e email dos clientes
SELECT first_name, last_name, email FROM client;

-- Recupera todos os veículos
SELECT * FROM vehicle;

-- Recupera descrição e preço de todos os serviços
SELECT description, price FROM service;

-- Recupera todos os funcionários
SELECT * FROM employee;

-- ==========================================================
-- Recupera clientes de uma cidade específica
-- ==========================================================
SELECT * FROM client WHERE city = 'São Luís';

-- Recupera veículos fabricados a partir de 2020
SELECT * FROM vehicle WHERE year >= 2020;

-- Recupera todos os mecânicos
SELECT * FROM employee WHERE role = 'Mechanic';

-- Recupera ordens de serviço com status 'Open'
SELECT * FROM service_order WHERE status = 'Open';

-- Recupera peças com preço unitário acima de 100
SELECT * FROM part WHERE unit_price > 100;

-- ==========================================================
-- Recupera veículos e nomes dos clientes
-- ==========================================================
SELECT v.id_vehicle, v.brand, v.model, c.first_name, c.last_name
FROM vehicle v
INNER JOIN client c ON v.id_client = c.id_client;

-- Recupera ordens de serviço com dados do agendamento e do cliente
SELECT so.id_service_order, c.first_name, c.last_name, a.appointment_date, so.status
FROM service_order so
INNER JOIN appointment a ON so.id_appointment = a.id_appointment
INNER JOIN client c ON a.id_client = c.id_client;

-- Recupera serviços de uma ordem de serviço
SELECT so.id_service_order, s.description, sos.quantity
FROM service_order_service sos
INNER JOIN service s ON sos.id_service = s.id_service
INNER JOIN service_order so ON sos.id_service_order = so.id_service_order;

-- Recupera peças de uma ordem de serviço
SELECT so.id_service_order, p.name, sop.quantity
FROM service_order_part sop
INNER JOIN part p ON sop.id_part = p.id_part
INNER JOIN service_order so ON sop.id_service_order = so.id_service_order;

-- ==========================================================
--  Recupera informações completas de OS (cliente, veículo, funcionário)
-- ==========================================================
SELECT so.id_service_order, c.first_name AS client_first_name, c.last_name AS client_last_name,
       v.brand, v.model, e.first_name AS employee_first_name, e.last_name AS employee_last_name,
       so.issue_date, so.status, so.total_value
FROM service_order so
INNER JOIN appointment a ON so.id_appointment = a.id_appointment
INNER JOIN client c ON a.id_client = c.id_client
INNER JOIN vehicle v ON a.id_vehicle = v.id_vehicle
INNER JOIN employee e ON so.id_employee = e.id_employee;

-- ==========================================================
--  Ordena clientes por cidade e sobrenome
-- ==========================================================
SELECT first_name, last_name, city FROM client ORDER BY city ASC, last_name ASC;

--  Ordena ordens de serviço pelo valor total (maior primeiro)
SELECT id_service_order, total_value FROM service_order ORDER BY total_value DESC;

--  Ordena veículos por ano (mais novos primeiro)
SELECT brand, model FROM vehicle ORDER BY year DESC;

-- ==========================================================
--  Contagem de veículos por cliente
-- ==========================================================
SELECT c.first_name, c.last_name, COUNT(v.id_vehicle) AS vehicle_count
FROM client c
LEFT JOIN vehicle v ON c.id_client = v.id_client
GROUP BY c.id_client;

-- Valor total de ordens de serviço por funcionário
SELECT e.first_name, e.last_name, SUM(so.total_value) AS total_services
FROM employee e
LEFT JOIN service_order so ON e.id_employee = so.id_employee
GROUP BY e.id_employee;

-- Quantidade de vezes que cada serviço foi usado
SELECT s.description, COUNT(sos.id_service_order) AS times_used
FROM service s
LEFT JOIN service_order_service sos ON s.id_service = sos.id_service
GROUP BY s.id_service;

-- ==========================================================
-- Funcionários com mais de 2 ordens de serviço
-- ==========================================================
SELECT e.first_name, e.last_name, COUNT(so.id_service_order) AS total_orders
FROM employee e
LEFT JOIN service_order so ON e.id_employee = so.id_employee
GROUP BY e.id_employee
HAVING total_orders > 2;

-- Serviços usados em mais de 3 ordens
SELECT s.description, COUNT(sos.id_service_order) AS times_used
FROM service s
LEFT JOIN service_order_service sos ON s.id_service = sos.id_service
GROUP BY s.id_service
HAVING times_used > 3;

-- ==========================================================
--  Valor médio por ordem de serviço (atributo derivado)
-- ==========================================================
SELECT id_service_order, total_value, total_value/2 AS average_per_item
FROM service_order;

-- Valor total de peças por OS (atributo derivado)
SELECT so.id_service_order, SUM(p.unit_price * sop.quantity) AS total_parts_value
FROM service_order_part sop
INNER JOIN part p ON sop.id_part = p.id_part
INNER JOIN service_order so ON sop.id_service_order = so.id_service_order
GROUP BY so.id_service_order;

-- ==========================================================
-- Clientes com mais de 1 veículo (subquery)
-- ==========================================================
SELECT first_name, last_name
FROM client
WHERE id_client IN (
    SELECT id_client
    FROM vehicle
    GROUP BY id_client
    HAVING COUNT(id_vehicle) > 1
);

-- Ordens com valor maior que a média (subquery)
SELECT id_service_order, total_value
FROM service_order
WHERE total_value > (
    SELECT AVG(total_value) FROM service_order
);

--  Serviços nunca usados (subquery)
SELECT description
FROM service
WHERE id_service NOT IN (
    SELECT id_service FROM service_order_service
);

-- ==========================================================
-- Total gasto por cliente
-- ==========================================================
SELECT c.first_name, c.last_name, SUM(so.total_value) AS total_spent
FROM client c
LEFT JOIN appointment a ON c.id_client = a.id_client
LEFT JOIN service_order so ON a.id_appointment = so.id_appointment
GROUP BY c.id_client
HAVING total_spent > 500;

-- Total de peças fornecidas por fornecedor
SELECT s.first_name, s.last_name, SUM(st.quantity) AS total_supplied
FROM supplier s
LEFT JOIN stock st ON s.id_supplier = st.id_supplier
GROUP BY s.id_supplier
HAVING total_supplied > 10;

-- ==========================================================
-- Pagamentos agrupados por método
-- ==========================================================
SELECT payment_method, SUM(amount) AS total_amount
FROM payment
GROUP BY payment_method;

-- Pagamentos recentes
SELECT id_payment, id_service_order, amount, payment_date
FROM payment
WHERE payment_date > '2025-11-15'
ORDER BY payment_date DESC;

-- ==========================================================
-- Valor total de uma OS (serviços + peças)
-- ==========================================================
SELECT so.id_service_order,
       SUM(s.price * sos.quantity) + SUM(p.unit_price * sop.quantity) AS total_os_value
FROM service_order so
LEFT JOIN service_order_service sos ON so.id_service_order = sos.id_service_order
LEFT JOIN service s ON sos.id_service = s.id_service
LEFT JOIN service_order_part sop ON so.id_service_order = sop.id_service_order
LEFT JOIN part p ON sop.id_part = p.id_part
GROUP BY so.id_service_order;

-- ==========================================================
-- Clientes sem veículos
-- ==========================================================
SELECT first_name, last_name
FROM client
WHERE id_client NOT IN (
    SELECT DISTINCT id_client FROM vehicle
);

-- ==========================================================
-- Veículos com agendamento em data específica
-- ==========================================================
SELECT v.brand, v.model, c.first_name, c.last_name, a.appointment_date
FROM vehicle v
INNER JOIN appointment a ON v.id_vehicle = a.id_vehicle
INNER JOIN client c ON v.id_client = c.id_client
WHERE a.appointment_date = '2025-11-18';

-- ==========================================================
-- Top 5 clientes que mais gastaram
-- ==========================================================
SELECT c.first_name, c.last_name, SUM(so.total_value) AS total_spent
FROM client c
INNER JOIN appointment a ON c.id_client = a.id_client
INNER JOIN service_order so ON a.id_appointment = so.id_appointment
GROUP BY c.id_client
ORDER BY total_spent DESC
LIMIT 5;

-- ==========================================================
-- Serviços mais utilizados
-- ==========================================================
SELECT s.description, COUNT(sos.id_service_order) AS usage_count
FROM service s
LEFT JOIN service_order_service sos ON s.id_service = sos.id_service
GROUP BY s.id_service
ORDER BY usage_count DESC;

-- ==========================================================
--  Peças mais vendidas
-- ==========================================================
SELECT p.name, SUM(sop.quantity) AS total_quantity
FROM part p
LEFT JOIN service_order_part sop ON p.id_part = sop.id_part
GROUP BY p.id_part
ORDER BY total_quantity DESC;

-- ==========================================================
--  Funcionários com salário acima de 2500
-- ==========================================================
SELECT first_name, last_name, salary
FROM employee
WHERE salary > 2500
ORDER BY salary DESC;

-- ==========================================================
--  Ordens abertas com valor acima de 300
-- ==========================================================
SELECT id_service_order, status, total_value
FROM service_order
WHERE status = 'Open' AND total_value > 300;

-- ==========================================================
--  Veículo mais antigo
-- ==========================================================
SELECT brand, model, year
FROM vehicle
WHERE year = (
    SELECT MIN(year) FROM vehicle
);

-- ==========================================================
--  Estoque baixo (menos de 10 unidades)
-- ==========================================================
SELECT p.name, SUM(st.quantity) AS total_stock
FROM part p
LEFT JOIN stock st ON p.id_part = st.id_part
GROUP BY p.id_part
HAVING total_stock < 10;
