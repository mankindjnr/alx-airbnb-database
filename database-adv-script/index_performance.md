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
## Using EXPLAIN ANALYZE
It provides a high-level overview of how the database engine plans to execute a query. It shows the steps involved, the order of operations, and the indexes used.

<!-- Before indexing  bookings table-->
```bash
                                                  QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=11.57..30.71 rows=720 width=530) (actual time=0.096..0.106 rows=2 loops=1)
   Hash Cond: (bookings.user_id = users.user_id)
   ->  Seq Scan on bookings  (cost=0.00..17.20 rows=720 width=76) (actual time=0.026..0.028 rows=2 loops=1)
   ->  Hash  (cost=10.70..10.70 rows=70 width=470) (actual time=0.049..0.051 rows=3 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on users  (cost=0.00..10.70 rows=70 width=470) (actual time=0.012..0.016 rows=3 loops=1)
 Planning Time: 0.441 ms
 Execution Time: 0.162 ms

```

<!-- After Indexing -->
```bash
                                                  QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=1.04..2.11 rows=2 width=530) (actual time=0.042..0.046 rows=2 loops=1)
   Hash Cond: (users.user_id = bookings.user_id)
   ->  Seq Scan on users  (cost=0.00..1.03 rows=3 width=470) (actual time=0.008..0.009 rows=3 loops=1)
   ->  Hash  (cost=1.02..1.02 rows=2 width=76) (actual time=0.021..0.021 rows=2 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on bookings  (cost=0.00..1.02 rows=2 width=76) (actual time=0.006..0.007 rows=2 loops=1)
 Planning Time: 0.713 ms
 Execution Time: 0.072 ms

```