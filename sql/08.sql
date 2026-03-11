/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

select title from
(select title, unnest(special_features) as features, rating
from film) as tl
where rating = 'G'
and
features = 'Trailers'
order by title;
