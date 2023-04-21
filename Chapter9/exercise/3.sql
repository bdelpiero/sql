-- i misunderstood the assignment but the query did what i intended. it counts the total actors for each actor_level
SELECT actor_level.level,
    count(*) total_actors
FROM (
        SELECT count(*) total
        FROM film_actor fa
        GROUP BY fa.actor_id
    ) roles
    INNER JOIN (
        SELECT 'Hollywood Star' level,
            30 min_roles,
            99999 max_roles
        UNION ALL
        SELECT 'Prolific Actor' level,
            20 min_roles,
            29 max_roles
        UNION ALL
        SELECT 'Newcomer' level,
            1 min_roles,
            19 max_roles
    ) actor_level ON roles.total BETWEEN actor_level.min_roles AND actor_level.max_roles
GROUP BY actor_level.level;
-- this is the correct query, which returns the corresponding level for each actor_id
SELECT actr.actor_id,
    grps.level
FROM (
        SELECT actor_id,
            count(*) num_roles
        FROM film_actor
        GROUP BY actor_id
    ) actr
    INNER JOIN (
        SELECT 'Hollywood Star' level,
            30 min_roles,
            99999 max_roles
        UNION ALL
        SELECT 'Prolific Actor' level,
            20 min_roles,
            29 max_roles
        UNION ALL
        SELECT 'Newcomer' level,
            1 min_roles,
            19 max_roles
    ) grps ON actr.num_roles BETWEEN grps.min_roles AND grps.max_roles;