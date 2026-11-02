-- Subqueries
-- A subquery is a query nested inside another SQL statement. The outer statement can be SELECT, INSERT, UPDATE,
-- or DELETE. The inner query runs first, produces a result, and the outer query uses that result.

-- Subqueries can be used in various clauses:
-- - WHERE: with IN, NOT IN, EXISTS, NOT EXISTS operators
-- - FROM: as derived tables (inline views)
-- - SELECT: to compute a single value for each row

-- Examples:
-- WHERE clause with subquery
-- SELECT * FROM table WHERE column IN (SELECT column FROM other_table)

-- FROM clause subquery (derived table)
-- SELECT derived_col FROM (SELECT col FROM table) AS alias

-- SELECT clause subquery (scalar subquery)
-- SELECT (SELECT COUNT(*) FROM other_table) AS count_col FROM table