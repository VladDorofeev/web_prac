-- ==================================================
-- Создаем ENUM-типы
-- ==================================================
CREATE TYPE client_type_enum AS ENUM ('individual', 'legal_entity');
CREATE TYPE account_type_enum AS ENUM ('savings', 'credit', 'checking');
CREATE TYPE interest_payout_interval_enum AS ENUM ('daily', 'monthly', 'quarterly', 'yearly');
CREATE TYPE interest_payout_method_enum AS ENUM ('same_account', 'other_account');
CREATE TYPE account_status_enum AS ENUM ('open', 'closed');
CREATE TYPE operation_type_enum AS ENUM ('deposit', 'withdrawal', 'transfer');
CREATE TYPE executed_by_enum AS ENUM ('system', 'employee');

-- ==================================================
-- Создаем таблицу branches
-- ==================================================
CREATE TABLE branches (
    branch_id      SERIAL PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    address        VARCHAR(200) NOT NULL,
    phone_number   VARCHAR(20)
);

-- ==================================================
-- Создаем таблицу clients
-- ==================================================
CREATE TABLE clients (
    client_id           SERIAL PRIMARY KEY,
    last_name           VARCHAR(50),
    first_name          VARCHAR(50),
    middle_name         VARCHAR(50),
    residential_address VARCHAR(200),
    email              VARCHAR(100),
    phone_number       VARCHAR(20),
    client_type        client_type_enum NOT NULL
);

-- ==================================================
-- Создаем таблицу account_types
-- ==================================================
CREATE TABLE account_types (
    account_type_id            SERIAL PRIMARY KEY,
    type_name                  account_type_enum NOT NULL,
    name                       VARCHAR(50) NOT NULL,
    can_deposit                BOOLEAN NOT NULL DEFAULT TRUE,
    can_withdraw               BOOLEAN NOT NULL DEFAULT TRUE,
    debit_amount_limit         DECIMAL(15,2),
    credit_amount_limit        DECIMAL(15,2),
    maximum_credit             DECIMAL(15,2),
    interest_rate              DECIMAL(5,2),
    interest_payout_interval   interest_payout_interval_enum,
    interest_payout_method     interest_payout_method_enum
);

-- ==================================================
-- Создаем таблицу accounts
-- ==================================================
CREATE TABLE accounts (
    account_id             SERIAL PRIMARY KEY,
    account_number         VARCHAR(50) NOT NULL UNIQUE,
    balance                DECIMAL(15,2) NOT NULL DEFAULT 0,
    status                account_status_enum NOT NULL,
    open_date              DATE NOT NULL,
    close_date             DATE,
	interest_payout_date   DATE,
    client_id              INTEGER NOT NULL REFERENCES clients(client_id),
    account_type_id        INTEGER NOT NULL REFERENCES account_types(account_type_id),
    branch_id              INTEGER NOT NULL REFERENCES branches(branch_id)
);

-- ==================================================
-- Создаем таблицу account_operations
-- ==================================================
CREATE TABLE account_operations (
    operation_id         SERIAL PRIMARY KEY,
    operation_type       operation_type_enum NOT NULL,
    operation_amount     DECIMAL(15,2) NOT NULL,
    operation_date       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment             TEXT,
    executed_by         executed_by_enum NOT NULL,
    sender_account_id   INTEGER NULL REFERENCES accounts(account_id),
    receiver_account_id INTEGER NULL REFERENCES accounts(account_id),
    CHECK (sender_account_id IS NOT NULL OR receiver_account_id IS NOT NULL)
);