create table if not exists Genre (
    GenreID SERIAL primary key,
    name VARCHAR(100) not null unique
);

create table if not exists artist (
    ArtistID serial primary key,
    name VARCHAR(100) not null,
    GenreID int references Genre(GenreID)
);

create table if not exists Album (
    AlbumID SERIAL primary key,
    name VARCHAR(200) NOT NULL,
    year INT,
    ArtistID INT NOT NULL references Artist(ArtistID) 
);

create table if not exists Track (
    TrackID SERIAL primary key,
    name VARCHAR(200) not null,
    length INT,
    AlbumID INT not null references Album(AlbumID) 
);

create table if not exists Collection (
    CollectionID SERIAL primary key,
    name VARCHAR(200) not null,
    year INT
);

create table if not exists CollectionTrack (
    CollectionID INT references Collection(CollectionID),
    TrackID INT references Track(TrackID),
    primary key (CollectionID, TrackID)
);