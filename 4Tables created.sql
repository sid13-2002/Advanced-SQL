CREATE DATABASE art_studio_data;
USE art_studio_data;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
art_style VARCHAR(50),
city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Siddhi', 'Watercolor', 'Pune'),
(2, 'Riya', 'Digital Sketch', 'Mumbai'),
(3, 'Aryan', 'Acrylic', 'Nashik'),
(4, 'Meera', 'Calligraphy', 'Nagpur');
INSERT INTO customers VALUES
(5, 'Shashwat','Sketchpens','Pune'),
(6, 'Shiv','Crayons','Pune'),
(7,'Raj','Watercolor','Mumbai'),
(8, 'Ira','Calligraphy','Mumbai'),
(9, 'Om','Sketchpens','Kokan'),
(10, 'Aary','Acrylic','Kokan');

select * from customers ;
UPDATE customers SET art_style = 'Sketch' WHERE customer_id = 5;
UPDATE customers SET art_style = 'Crayon Art' WHERE customer_id = 6;
UPDATE customers SET art_style = 'Watercolor' WHERE customer_id = 7;
UPDATE customers SET art_style = 'Calligraphy' WHERE customer_id = 8;
UPDATE customers SET art_style = 'Sketch' WHERE customer_id = 9;
UPDATE customers SET art_style = 'Acrylic' WHERE customer_id = 10;

CREATE TABLE art_orders (
order_id INT PRIMARY KEY,
customer_id INT,
item_ordered VARCHAR(50),
quantity INT,
price_per_unit DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

insert into art_orders values
(201, 1, 'Watercolor Set', 2, 300.00),
(202, 2, 'Digital Pen', 1, 2500.00),
(203, 3, 'Acrylic Paints', 3, 350.00),
(204, 5, 'Sketchbook', 5, 200.00),
(205, 7, 'Watercolor Paper', 2, 150.00),
(206, 9, 'Sketch Pens', 4, 100.00);
select*from art_orders;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    location VARCHAR(50)
);


INSERT INTO suppliers VALUES
(1, 'Art World', 'Mumbai'),
(2, 'SketchZone', 'Pune'),
(3, 'Color Castle', 'Nashik'),
(4, 'Kokan Art Hub', 'Kokan'),
(5, 'Nagpur Creative Supply', 'Nagpur');
select * from suppliers;

CREATE TABLE inventory (
    item_name VARCHAR(50),
    supplier_id INT,
    stock_available INT,
    reorder_level INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
INSERT INTO inventory VALUES
('Watercolor Set', 1, 15, 5),
('Digital Pen', 2, 5, 2),
('Acrylic Paints', 3, 8, 4),
('Sketchbook', 1, 12, 6),
('Watercolor Paper', 2, 10, 4),
('Sketch Pens', 2, 7, 3);
select * from inventory;

delete from inventory
limit 3;


