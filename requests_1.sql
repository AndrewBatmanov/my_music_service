-- Название и продолжительность самого длительного трека
SELECT name, length 
FROM track 
ORDER BY length DESC 
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name
FROM track 
WHERE track.length >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name, year
FROM collection 
WHERE year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name 
FROM Artist 
WHERE name !~ '[ -]';

-- Название треков, которые содержат слово «мой» или «my»
SELECT name 
FROM Track 
WHERE name ILIKE '%my%' OR name ILIKE '%мой%';


