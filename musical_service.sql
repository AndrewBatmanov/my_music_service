create table if not exists Genre (
    GenreID SERIAL primary key,
    name VARCHAR(100) not null unique
);

create table if not exists artist (
    ArtistID serial primary key,  -- ← ДОБАВЛЕНА ЗАПЯТАЯ ЗДЕСЬ!
    name VARCHAR(100) not null,
    GenreID int references Genre(GenreID)
);

create table if not exists Album (
    AlbumID SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    year INT,
    ArtistID INT NOT NULL REFERENCES Artist(ArtistID) 
);

create table if not exists Track (
    TrackID SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    length INT,
    AlbumID INT NOT NULL REFERENCES Album(AlbumID) 
);

create table if not exists Collection (
    CollectionID SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    year INT
);

create table if not exists CollectionTrack (
    CollectionID INT REFERENCES Collection(CollectionID),
    TrackID INT REFERENCES Track(TrackID),
    PRIMARY KEY (CollectionID, TrackID)
);