CREATE TABLE IF NOT EXISTS rental_office (
    office_id           BIGINT PRIMARY KEY,
    city                VARCHAR(32),
    state_name          VARCHAR(32),
    zip_code            BIGINT
);

CREATE TABLE IF NOT EXISTS available_cars (
    car_id              BIGINT PRIMARY KEY,
    current_office_id   BIGINT REFERENCES rental_office(office_id),
    car_name            VARCHAR(32),
    car_type            VARCHAR(32),
    fuel_type           VARCHAR(32),
    model               VARCHAR(32),
    model_year          INT
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id         BIGINT PRIMARY KEY,
    first_name          VARCHAR(32),
    last_name           VARCHAR(32),
    city                VARCHAR(32),
    state_name          VARCHAR(32),    
    phone_number        INT,
    email               VARCHAR(32),
    registration_date   DATE
);

CREATE TABLE IF NOT EXISTS rented (
    rented_id           BIGINT PRIMARY KEY,
    customer_id         BIGINT REFERENCES customers(customer_id),
    car_id              BIGINT REFERENCES available_cars(car_id),
    booked_date         TIMESTAMP,
    pickup_office_id    BIGINT REFERENCES rental_office(office_id),
    pickup_date         TIMESTAMP,
    return_office_id    BIGINT REFERENCES rental_office(office_id),
    return_date         TIMESTAMP
);