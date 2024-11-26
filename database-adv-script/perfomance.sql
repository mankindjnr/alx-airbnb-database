-- initial query
SELECT
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price AS booking_total_price,
    bookings.status,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    properties.property_id,
    properties.name AS property_name,
    properties.description AS property_description,
    properties.location,
    properties.pricepernight,
    payments.payment_id,
    payments.amount AS payment_amount,
    payments.payment_date,
    payments.payment_method
FROM
    bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;

-- Refactored query
SELECT
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price AS booking_total_price,
    bookings.status,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    properties.property_id,
    properties.name AS property_name,
    properties.description AS property_description,
    properties.location,
    properties.pricepernight,
    payments.payment_id,
    payments.amount AS payment_amount,
    payments.payment_date,
    payments.payment_method
FROM
    bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;