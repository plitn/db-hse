CREATE DATABASE train;

CREATE TABLE City
(
    city_name VARCHAR(200) UNIQUE,
    region    VARCHAR(200) UNIQUE,
    PRIMARY KEY (city_name, region)
);

CREATE TABLE Station
(
    name         VARCHAR(200) PRIMARY KEY,
    track_number BIGINT,
    city_name    VARCHAR(200) REFERENCES City (city_name),
    region       VARCHAR(200) REFERENCES City (region)
);

CREATE TABLE Train
(
    train_number       BIGSERIAL PRIMARY KEY,
    length             INTEGER,
    start_station_name VARCHAR(200) REFERENCES Station (name),
    end_station_name   VARCHAR(200) REFERENCES Station (name)
);

CREATE TABLE Connection
(
    from_station VARCHAR(200) REFERENCES Station (name),
    to_station   VARCHAR(200) REFERENCES Station (name),
    train_number BIGINT REFERENCES Train (train_number),
    departure    TIMESTAMP,
    arrival      TIMESTAMP
);