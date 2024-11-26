# Objective:
- Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Instructions:

- Use SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries.
- Identify any bottlenecks and suggest changes (e.g., new indexes, schema adjustments).
- Implement the changes and report the improvements.

 ### BottleNecks
 EXPLAIN ANALYZE highlights the following areas:
 1. nested loop joins with many iterations
 2. sequential scans (Seq Scan) on large tables.

 ### Changes
 Added indexes for filtering and join conditions.
 Partitioning for relevant data access

### Improvements
Reduced execution time
Use indexes instead on sequential scas
improved join performance