create database pradb;

use pradb;

CREATE TABLE Orders (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO Orders (order_id, product_id, quantity) VALUES (1, 101, 2);
INSERT INTO Orders (order_id, product_id, quantity) VALUES (1, 102, 1);  

INSERT INTO Orders (order_id, product_id, quantity) VALUES (1, 101, 5);




