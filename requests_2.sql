-- Количество исполнителей в каждом жанре
SELECT 
    g.name as genre_name,
    COUNT(ga.artistid) as artist_count
FROM genre g
LEFT JOIN genreartist ga ON g.genreid = ga.genreid
GROUP BY g.genreid, g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.trackid) as track_count
FROM track t
JOIN album a ON t.albumid = a.albumid
WHERE a.year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT 
    a.name as album_name,
    ar.name as artist_name,
    a.year,
    ROUND(AVG(t.length), 2) as avg_duration_seconds,
    COUNT(t.trackid) as track_count
FROM album a
JOIN artist ar ON a.artistid = ar.artistid
JOIN track t ON a.albumid = t.albumid
GROUP BY a.albumid, a.name, ar.name, a.year
ORDER BY avg_duration_seconds DESC;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name as artist_name
FROM artist ar
WHERE NOT EXISTS (
    SELECT 1 
    FROM album a 
    WHERE a.artistid = ar.artistid 
    AND a.year = 2020
)
ORDER BY ar.name;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT
    c.name as collection_name,
    c.year as collection_year
FROM collection c
JOIN collectiontrack ct ON c.collectionid = ct.collectionid
JOIN track t ON ct.trackid = t.trackid
JOIN album a ON t.albumid = a.albumid
JOIN artist ar ON a.artistid = ar.artistid
WHERE ar.name = 'Metallica'
ORDER BY c.year, c.name;