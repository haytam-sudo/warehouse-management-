-- Drop tables if they exist (drop in reverse dependency order)
DROP TABLE IF EXISTS items_commander;
DROP TABLE IF EXISTS commands;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS warehouse ;


-- Create table for items

CREATE TABLE warehouse (
    warehouse_name VARCHAR(40) PRIMARY KEY,
    location VARCHAR(40),
    phone VARCHAR(20),
    email VARCHAR(50)
);
CREATE TABLE item (
    item_name VARCHAR(50) PRIMARY KEY,
    quantity INT NOT NULL CHECK (quantity >= 0),
    warehouse_name VARCHAR(40),
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
    item_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (items_commander_id, item_name)
);

-- Add foreign keys AFTER table creation
ALTER TABLE items_commander
    ADD CONSTRAINT fk_item
        FOREIGN KEY (item_name) REFERENCES item(item_name),
    ADD CONSTRAINT fk_command
        FOREIGN KEY (items_commander_id) REFERENCES commands(command_id);
ALTER TABLE item 
    ADD CONSTRAINT fk_warehouse_name 
        FOREIGN KEY (warehouse_name) REFERENCES warehouse(warehouse_name) ;

-- Create a role 
CREATE ROLE IF NOT EXISTS chef;

-- Grant privileges on all tables to the role
GRANT SELECT, INSERT, UPDATE, DELETE ON item TO chef;
GRANT SELECT, INSERT, UPDATE, DELETE ON commands TO chef;
GRANT SELECT, INSERT, UPDATE, DELETE ON items_commander TO chef;
GRANT SELECT, INSERT, UPDATE, DELETE ON warehouse TO chef;


