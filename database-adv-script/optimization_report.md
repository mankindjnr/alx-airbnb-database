## Optimize Complex Queries
***
### Initial Query
```sql
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
```
<!-- inital performance -->

```bash
                                        QUERY PLAN                                        
------------------------------------------------------------------------------------------
 Hash Join  (cost=3.22..25.97 rows=920 width=1058)
   Hash Cond: (payments.booking_id = bookings.booking_id)
   ->  Seq Scan on payments  (cost=0.00..19.20 rows=920 width=60)
   ->  Hash  (cost=3.20..3.20 rows=2 width=1014)
         ->  Nested Loop  (cost=0.00..3.20 rows=2 width=1014)
               Join Filter: (bookings.user_id = users.user_id)
               ->  Nested Loop  (cost=0.00..2.09 rows=2 width=560)
                     Join Filter: (bookings.property_id = properties.property_id)
                     ->  Seq Scan on bookings  (cost=0.00..1.02 rows=2 width=76)
                     ->  Materialize  (cost=0.00..1.03 rows=2 width=500)
                           ->  Seq Scan on properties  (cost=0.00..1.02 rows=2 width=500)
               ->  Materialize  (cost=0.00..1.04 rows=3 width=470)
                     ->  Seq Scan on users  (cost=0.00..1.03 rows=3 width=470)
```
***
### Refactored Query
```sql
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
    Booking
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;
```

```bash
                                        QUERY PLAN                                        
------------------------------------------------------------------------------------------
 Hash Join  (cost=3.22..25.97 rows=920 width=1058)
   Hash Cond: (payments.booking_id = bookings.booking_id)
   ->  Seq Scan on payments  (cost=0.00..19.20 rows=920 width=60)
   ->  Hash  (cost=3.20..3.20 rows=2 width=1014)
         ->  Nested Loop  (cost=0.00..3.20 rows=2 width=1014)
               Join Filter: (bookings.user_id = users.user_id)
               ->  Nested Loop  (cost=0.00..2.09 rows=2 width=560)
                     Join Filter: (bookings.property_id = properties.property_id)
                     ->  Seq Scan on bookings  (cost=0.00..1.02 rows=2 width=76)
                     ->  Materialize  (cost=0.00..1.03 rows=2 width=500)
                           ->  Seq Scan on properties  (cost=0.00..1.02 rows=2 width=500)
               ->  Materialize  (cost=0.00..1.04 rows=3 width=470)
                     ->  Seq Scan on users  (cost=0.00..1.03 rows=3 width=470)
```