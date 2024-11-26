-- User Table
-- PostgreSQL does not support the ENUM type directly. Instead, we need to create a custom type for the enum:
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');

CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON users(email);

-- Property Table
CREATE TABLE properties (
    property_id UUID PRIMARY KEY,
    host_id UUID,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
);

-- Booking Table
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Payment Table
CREATE TYPE payment_type AS ENUM ('credit_card', 'paypal', 'stripe');
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_type NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


-- Review Table
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Message Table
CREATE TABLE messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID,
    recipient_id UUID,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);
