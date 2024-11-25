-- Query to Find the Total Number of Bookings Made by Each User
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    Booking
GROUP BY
    user_id;

-- Use a Window Function to Rank Properties Based on the Total Number of Bookings
-- Using ROW_NUMBER() to rank properties based on the total number of bookings
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM
    Booking
GROUP BY
    property_id;

-- using RANK() to rank properties based on the total number of bookings
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM
    Booking
GROUP BY
    property_id;
