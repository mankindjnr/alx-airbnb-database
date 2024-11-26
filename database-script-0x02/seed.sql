-- sample data for user
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
('b110c2e1-4175-4b80-bd0a-78c2e209b5a7', 'John', 'Doe', 'john@example.com', 'hashedpassword123', '1234567890', 'guest', CURRENT_TIMESTAMP),
('a220c2e1-4175-4b80-bd0a-78c2e209b5a7', 'Jane', 'Smith', 'jane@example.com', 'hashedpassword456', '0987654321', 'host', CURRENT_TIMESTAMP),
('c330c2e1-4175-4b80-bd0a-78c2e209b5a7', 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword789', '1122334455', 'guest', CURRENT_TIMESTAMP);


-- sample data for property
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('d440c2e1-4175-4b80-bd0a-78c2e209b5a7', 'a220c2e1-4175-4b80-bd0a-78c2e209b5a7', 'Cozy Apartment', 'A beautiful place to stay', 'Nairobi', 50.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e550c2e1-4175-4b80-bd0a-78c2e209b5a7', 'a220c2e1-4175-4b80-bd0a-78c2e209b5a7', 'Luxury Villa', 'A luxurious villa with all amenities', 'Mombasa', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- sample data for booking
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('f660c2e1-4175-4b80-bd0a-78c2e209b5a7', 'd440c2e1-4175-4b80-bd0a-78c2e209b5a7', 'b110c2e1-4175-4b80-bd0a-78c2e209b5a7', '2024-12-01', '2024-12-05', 200.00, 'confirmed', CURRENT_TIMESTAMP),
('f770c2e1-4175-4b80-bd0a-78c2e209b5a7', 'e550c2e1-4175-4b80-bd0a-78c2e209b5a7', 'c330c2e1-4175-4b80-bd0a-78c2e209b5a7', '2024-12-10', '2024-12-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- sample data for payment
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('a880c2e1-4175-4b80-bd0a-78c2e209b5a7', 'f660c2e1-4175-4b80-bd0a-78c2e209b5a7', 200.00, CURRENT_TIMESTAMP, 'credit_card'),
('b990c2e1-4175-4b80-bd0a-78c2e209b5a7', 'f770c2e1-4175-4b80-bd0a-78c2e209b5a7', 1000.00, CURRENT_TIMESTAMP, 'paypal');

-- sample data for review
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('f101c2e1-4175-4b80-bd0a-78c2e209b5a7', 'd440c2e1-4175-4b80-bd0a-78c2e209b5a7', 'b110c2e1-4175-4b80-bd0a-78c2e209b5a7', 5, 'Amazing stay!', CURRENT_TIMESTAMP),
('e202c2e1-4175-4b80-bd0a-78c2e209b5a7', 'e550c2e1-4175-4b80-bd0a-78c2e209b5a7', 'c330c2e1-4175-4b80-bd0a-78c2e209b5a7', 4, 'Very comfortable and luxurious.', CURRENT_TIMESTAMP);

-- sample data for message
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('d303c2e1-4175-4b80-bd0a-78c2e209b5a7', 'b110c2e1-4175-4b80-bd0a-78c2e209b5a7', 'a220c2e1-4175-4b80-bd0a-78c2e209b5a7', 'Hello, is the apartment available for next week?', CURRENT_TIMESTAMP),
('c404c2e1-4175-4b80-bd0a-78c2e209b5a7', 'a220c2e1-4175-4b80-bd0a-78c2e209b5a7', 'b110c2e1-4175-4b80-bd0a-78c2e209b5a7', 'Yes, it is available for the dates you requested.', CURRENT_TIMESTAMP);
