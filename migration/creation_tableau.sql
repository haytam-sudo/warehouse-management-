-- Drop tables if they exist
DROP TABLE IF EXISTS items_commander;
DROP TABLE IF EXISTS commands;
DROP TABLE IF EXISTS item;

-- Create table for items
CREATE TABLE item (
    item_id VARCHAR(20) PRIMARY KEY,
    item_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),
    location VARCHAR(10),
    prix FLOAT NOT NULL CHECK (prix >= 0)
);

-- Create table for commands (orders)
CREATE TABLE commands (
    command_id VARCHAR(30) PRIMARY KEY,
    prix_total FLOAT NOT NULL CHECK (prix_total >= 0),
    order_date DATE DEFAULT CURRENT_DATE
);

-- Create table for items_commander (junction table for items in orders)
CREATE TABLE items_commander (
    items_commander_id VARCHAR(30) NOT NULL,
    item_id VARCHAR(20) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (items_commander_id, item_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (items_commander_id) REFERENCES commands(command_id)
);

-- Create role and grant privileges
CREATE ROLE chef;
GRANT ALL PRIVILEGES ON item, commands, items_commander TO chef;