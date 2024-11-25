## High-Usage Columns
- User Table
email: Frequently used in WHERE clauses for login and user searches.

user_id: Used in JOIN clauses and WHERE clauses to identify users.

- Booking Table
user_id: Used in JOIN clauses to link bookings with users.

property_id: Used in JOIN clauses to link bookings with properties.

start_date and end_date: Often used in WHERE clauses to filter bookings by date.

status: Used in WHERE clauses to filter bookings by status.

- Property Table
location: Used in WHERE clauses to filter properties by location.

host_id: Used in JOIN clauses to link properties with hosts.

property_id: Used in JOIN clauses and WHERE clauses to identify properties.

# Measuring Performance
***
## Using EXPLAIN
It provides a high-level overview of how the database engine plans to execte a query. It shows the steps involved, the order of operations, and the indexes used.

<!-- Before indexing -->
```bash
Seq Scan on Booking  (cost=0.00..58.25 rows=3225 width=112)
Seq Scan on User  (cost=0.00..35.50 rows=2550 width=96)
```

<!-- After Indexing -->
```bash
Index Scan using idx_booking_user_id on Booking  (cost=0.42..15.32 rows=3225 width=112)
Index Scan using idx_user_user_id on User  (cost=0.29..8.42 rows=2550 width=96)
```