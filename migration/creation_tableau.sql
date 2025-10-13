-- Drop tables if they exist (drop in reverse dependency order)
DROP TABLE IF EXISTS items_commander;
DROP TABLE IF EXISTS commands;
DROP TABLE IF EXISTS item;

-- Create table for items
CREATE TABLE item (
    item_id VARCHAR(20) PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),
    location VARCHAR(50),
    prix DECIMAL(10,2) NOT NULL CHECK (prix >= 0)
);

-- Create table for commands (orders)
CREATE TABLE commands (
    command_id VARCHAR(30) PRIMARY KEY,
    prix_total DECIMAL(10,2) NOT NULL CHECK (prix_total >= 0),
    order_date DATE DEFAULT (CURRENT_DATE)
);

-- Create table for items_commander (junction table)
CREATE TABLE items_commander (
    items_commander_id VARCHAR(30) NOT NULL,
    item_id VARCHAR(20) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (items_commander_id, item_id)
);

-- Add foreign keys AFTER table creation
ALTER TABLE items_commander
    ADD CONSTRAINT fk_item
        FOREIGN KEY (item_id) REFERENCES item(item_id),
    ADD CONSTRAINT fk_command
        FOREIGN KEY (items_commander_id) REFERENCES commands(command_id);

-- Create a role 
CREATE ROLE IF NOT EXISTS chef;

-- Grant privileges on all tables to the role
GRANT SELECT, INSERT, UPDATE, DELETE ON item TO chef;
GRANT SELECT, INSERT, UPDATE, DELETE ON commands TO chef;
GRANT SELECT, INSERT, UPDATE, DELETE ON items_commander TO chef;


-- GRANT chef TO 'username'@'localhost';
