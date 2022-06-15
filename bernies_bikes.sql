CREATE DATABASE bike_orders;

CREATE TABLE bikes (
    model_id SERIAL PRIMARY KEY,
    model_code VARCHAR(10) NOT NULL,
    model_name VARCHAR(100) NOT NULL
);

CREATE TABLE prices (
    id SERIAL PRIMARY KEY,
    model_id INT NOT NULL REFERENCES bikes,
    price NUMERIC NOT NULL,
    date_from TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_to TIMESTAMP WITH TIME ZONE CHECK (date_to > date_from)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT  NOT NULL REFERENCES orders,
    model_id INT NOT NULL REFERENCES bikes,
    note TEXT NOT NULL DEFAULT ''
);
