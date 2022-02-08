CREATE OR REPLACE VIEW most_rental_cars AS
SELECT 
    available_cars.car_id,
    COUNT(rented.rented_id) AS reservations,
    ROUND(CAST(AVG(EXTRACT(EPOCH FROM rented.return_date - rented.pickup_date) / 3600) AS NUMERIC), 2) as avg_rental_time
FROM 
    rented 
LEFT JOIN 
    available_cars
    ON rented.car_id = available_cars.car_id
GROUP BY 
    available_cars.car_id
ORDER BY
    reservations DESC;