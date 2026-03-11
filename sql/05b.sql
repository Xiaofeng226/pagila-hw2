/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select a.last_name, a.first_name from actor as a
left join customer as c on a.first_name = c.first_name and
a.last_name = c.last_name
where c.customer_id is null order by last_name, first_name;
