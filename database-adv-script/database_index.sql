-- CREATE INDEX COMMANDS
-- user table
-- Index for email
CREATE INDEX idx_user_email ON users(email);

-- Index for user_id
CREATE INDEX idx_user_user_id ON users(user_id);


-- Booking table
-- Index for user_id
CREATE INDEX idx_booking_user_id ON bookings(user_id);

-- Index for property_id
CREATE INDEX idx_booking_property_id ON bookings(property_id);

-- Index for start_date
CREATE INDEX idx_booking_start_date ON bookings(start_date);

-- Index for end_date
CREATE INDEX idx_booking_end_date ON bookings(end_date);

-- Index for status
CREATE INDEX idx_booking_status ON bookings(status);


-- property table
-- Index for location
CREATE INDEX idx_property_location ON properties(location);

-- Index for host_id
CREATE INDEX idx_property_host_id ON properties(host_id);

-- Index for property_id
CREATE INDEX idx_property_property_id ON properties(property_id);
