
SELECT 
    c.name as city_name,
    p.category,
    COUNT(*) as provider_count
FROM providers p
JOIN cities c ON p.city_id = c.id
GROUP BY c.name, p.category
ORDER BY c.name, p.category;
