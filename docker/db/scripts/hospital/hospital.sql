CREATE DATABASE hospital;

CREATE TABLE Patient
(
    patient_nr BIGSERIAL PRIMARY KEY,
    name       VARCHAR(200),
    disease    VARCHAR(200)
);

CREATE TABLE Station
(
    stat_nr BIGSERIAL PRIMARY KEY,
    name    VARCHAR(200)
);

CREATE TABLE StationPersonnel
(
    pers_nr  BIGSERIAL PRIMARY KEY,
    name_num BIGINT,
    stat_nr  BIGINT REFERENCES Station (stat_nr)
);

CREATE TABLE Doctor
(
    doc_id  BIGSERIAL PRIMARY KEY,
    pers_id BIGINT REFERENCES StationPersonnel (pers_nr),
    area    VARCHAR(200),
    rank    VARCHAR(200)
);

CREATE TABLE Caregiver
(
    caregiver_id  BIGSERIAL PRIMARY KEY,
    id            BIGINT REFERENCES StationPersonnel (pers_nr),
    qualification VARCHAR(200)
);

CREATE TABLE Treatment
(
    entry_id   BIGSERIAL PRIMARY KEY,
    doc_id     BIGINT REFERENCES StationPersonnel (pers_nr),
    patient_id BIGINT REFERENCES Patient (patient_nr)
);

CREATE TABLE Room
(
    room_nr    BIGINT PRIMARY KEY,
    bed_number BIGINT,
    station_nr BIGINT REFERENCES Station (stat_nr)
);

CREATE TABLE Admission
(
    entry_id   BIGSERIAL PRIMARY KEY,
    room_nr    BIGINT REFERENCES Room (room_nr),
    station_nr BIGINT REFERENCES Station (stat_nr),
    patient_id BIGINT REFERENCES Patient (patient_nr),
    from_t     TIME,
    to_t       TIME
);