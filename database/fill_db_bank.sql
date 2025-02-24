-- ==================================================
-- Вставка данных в таблицу branches
-- ==================================================
INSERT INTO branches (name, address, phone_number) VALUES
('Main Branch', '123 Main St, New York', '+1 555-0101'),
('West Branch', '456 West St, Los Angeles', '+1 555-0202'),
('East Branch', '789 East St, Chicago', '+1 555-0303'),
('South Branch', '101 South St, Miami', '+1 555-0404'),
('North Branch', '202 North St, Boston', '+1 555-0505');

-- ==================================================
-- Вставка данных в таблицу clients 
-- ==================================================
INSERT INTO clients (last_name, first_name, middle_name, residential_address, email, phone_number, client_type) VALUES
('Smith', 'John', 'A.', '12 Park Ave, NY', 'john.smith@email.com', '+1 555-1111', 'individual'),
('Johnson', 'Emma', 'B.', '34 Green St, LA', 'emma.johnson@email.com', '+1 555-2222', 'individual'),
('Brown', 'Michael', 'C.', '56 Oak St, Chicago', 'michael.brown@email.com', '+1 555-3333', 'individual'),
('Williams', 'Sophia', 'D.', '78 Maple St, Miami', 'sophia.williams@email.com', '+1 555-4444', 'individual'),
('Miller', 'Liam', 'E.', '90 Pine St, Boston', 'liam.miller@email.com', '+1 555-5555', 'individual'),
('Davis Corp.', NULL, NULL, '112 Wall St, NY', 'contact@daviscorp.com', '+1 555-6666', 'legal_entity'),
('Wilson LLC', NULL, NULL, '134 Bay St, LA', 'info@wilsonllc.com', '+1 555-7777', 'legal_entity'),
('Taylor Inc.', NULL, NULL, '156 Hill St, Chicago', 'support@taylorinc.com', '+1 555-8888', 'legal_entity'),
('Anderson Ltd.', NULL, NULL, '178 River St, Miami', 'sales@andersonltd.com', '+1 555-9999', 'legal_entity'),
('Thomas Group', NULL, NULL, '190 Lake St, Boston', 'info@thomasgroup.com', '+1 555-0000', 'legal_entity');

-- ==================================================
-- Вставка данных в таблицу account_types
-- ==================================================
INSERT INTO account_types (type_name, name, can_deposit, can_withdraw, debit_amount_limit, credit_amount_limit, maximum_credit, interest_rate, interest_payout_interval, interest_payout_method) 
VALUES
('savings', 'Сберегательный "Стандарт"', true, true, 5000.00, NULL, NULL, 3.5, 'monthly', 'same_account'),
('credit', 'Кредитный "Базовый"', false, true, NULL, 10000.00, 5000.00, 7.0, 'yearly', 'other_account'),
('checking', 'Расчетный счет', true, true, 10000.00, NULL, NULL, 0.0, NULL, NULL),
('savings', 'Сберегательный "Премиум"', true, true, 2000.00, NULL, NULL, 4.0, 'quarterly', 'same_account'),
('credit', 'Кредитная линия "Премиум"', true, false, NULL, 15000.00, 7000.00, 6.5, 'daily', 'other_account');

-- ==================================================
-- Вставка данных в таблицу accounts
-- ==================================================
INSERT INTO accounts (account_number, balance, status, open_date, close_date, client_id, account_type_id, branch_id, interest_payout_date) VALUES
('ACC1001', 1500.00, 'open', '2023-01-15', NULL, 1, 1, 1, '2025-01-01'),
('ACC1002', 7000.00, 'open', '2023-03-10', NULL, 1, 3, 2, NULL),
('ACC2001', 2500.00, 'open', '2023-02-20', NULL, 2, 2, 3, '2025-01-01'),
('ACC3001', 3200.00, 'open', '2023-04-05', NULL, 3, 1, 1, '2025-01-01'),
('ACC4001', 4000.00, 'open', '2023-05-25', NULL, 4, 4, 4, '2025-01-01'),
('ACC5001', 500.00, 'open', '2023-06-15', NULL, 5, 5, 5, '2025-01-01'),
('ACC6001', 9000.00, 'open', '2023-07-10', NULL, 6, 1, 1, '2025-01-01'),
('ACC7001', 12000.00, 'open', '2023-08-20', NULL, 7, 2, 2, '2025-01-01'),
('ACC8001', 1500.00, 'open', '2023-09-10', NULL, 8, 3, 3, NULL),
('ACC9001', 8500.00, 'open', '2023-10-30', NULL, 9, 4, 4, '2025-01-01'),
('ACC10001', 6200.00, 'open', '2023-11-15', NULL, 10, 5, 5, '2025-01-01');

-- ==================================================
-- Вставка данных в таблицу account_operations
-- ==================================================
INSERT INTO account_operations (operation_type, operation_amount, operation_date, comment, executed_by, sender_account_id, receiver_account_id) VALUES
('deposit', 1000.00, '2024-01-01 09:00:00', 'Cash deposit', 'employee', NULL, 1),
('withdrawal', 500.00, '2024-01-02 14:30:00', 'ATM withdrawal', 'system', 1, NULL),
('transfer', 200.00, '2024-01-03 11:15:00', 'Payment to friend', 'employee', 1, 2),
('deposit', 3000.00, '2024-01-05 16:45:00', 'Online transfer', 'system', NULL, 3),
('withdrawal', 1200.00, '2024-01-06 10:10:00', 'Bill payment', 'employee', 3, NULL),
('transfer', 5000.00, '2024-01-07 13:20:00', 'Loan repayment', 'system', 4, 6),
('deposit', 2500.00, '2024-01-08 15:40:00', 'Salary credit', 'employee', NULL, 7),
('withdrawal', 700.00, '2024-01-09 18:55:00', 'Grocery shopping', 'system', 8, NULL),
('transfer', 950.00, '2024-01-10 21:30:00', 'Utility bill', 'employee', 9, 10),
('deposit', 800.00, '2024-01-11 08:05:00', 'Bonus payment', 'system', NULL, 5);