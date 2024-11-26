-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings.
SELECT
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.status,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM
    bookings
INNER JOIN
    User ON bookings.user_id = users.user_id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    properties.property_id,
    properties.name,
    properties.description,
    properties.location,
    properties.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment
FROM
    properties
LEFT JOIN
    Review ON properties.property_id = Review.property_id
ORDER BY
    properties.property_id;

-- FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a users.
-- Using FULL OUTER JOIN (if supported by your database)
SELECT
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.status
FROM
    users
FULL OUTER JOIN
    Booking ON User.user_id = bookings.user_id;
