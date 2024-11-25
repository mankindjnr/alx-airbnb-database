-- CREATE INDEX COMMANDS
-- user table
-- Index for email
CREATE INDEX idx_user_email ON User(email);

-- Index for user_id
CREATE INDEX idx_user_user_id ON User(user_id);


-- Booking table
-- Index for user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index for start_date
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Index for end_date
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Index for status
CREATE INDEX idx_booking_status ON Booking(status);


-- property table
-- Index for location
CREATE INDEX idx_property_location ON Property(location);

-- Index for host_id
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index for property_id
CREATE INDEX idx_property_property_id ON Property(property_id);
