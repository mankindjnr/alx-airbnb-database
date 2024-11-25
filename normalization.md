# Step 1: Ensure Your Tables are in First Normal Form (1NF)
Eliminate Repeating Groups: Make sure that each table contains only atomic (indivisible) values.

Ensure Primary Keys: Every table must have a primary key to uniquely identify each record.

Example:
```bash
User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
Payment(payment_id, booking_id, amount, payment_date, payment_method)
Review(review_id, property_id, user_id, rating, comment, created_at)
Message(message_id, sender_id, recipient_id, message_body, sent_at)
```
# Step 2: Ensure Your Tables are in Second Normal Form (2NF)
Remove Partial Dependencies: Ensure that all non-key attributes are fully functionally dependent on the entire primary key (applies to tables with composite primary keys).

For tables with a single primary key, 2NF is automatically achieved if they are in 1NF.

Example:
Booking table:
```bash
Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
```
# Step 3: Ensure Your Tables are in Third Normal Form (3NF)
Remove Transitive Dependencies: Ensure that non-key attributes are not dependent on other non-key attributes.
i.e ensure that all non-key attributes are functionally dependent only on the primary key.

Example:
Consider a scenario where a Property table has an additional attribute city which can be derived from location. If location and city are dependent on each other, this creates a transitive dependency.

To resolve this, you would:

Identify Transitive Dependency: Check if non-key attributes depend on other non-key attributes.

Eliminate Transitive Dependency: Separate the attributes into different tables if necessary.

Updated Tables:
Property Table:
```bash
Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
Location Table:
```
```bash
Location(location_id, city, other_location_attributes)
Summary of Normal Forms:
1NF (First Normal Form): Eliminate repeating groups; ensure atomic values.

2NF (Second Normal Form): Remove partial dependencies; ensure full functional dependency on the primary key.

3NF (Third Normal Form): Remove transitive dependencies; ensure non-key attributes depend only on the primary key.

Applying to Your Tables:
User Table:
Already in 3NF:

```bash
User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)

Property Table:
Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)

Booking Table:
Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)

Payment Table:
Already in 3NF:
Payment(payment_id, booking_id, amount, payment_date, payment_method)

Review Table:
Already in 3NF:
Review(review_id, property_id, user_id, rating, comment, created_at)

Message Table:
Already in 3NF:
Message(message_id, sender_id, recipient_id, message_body, sent_at)
```