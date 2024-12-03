-- Use the 'project' database
USE project;

-- 1. Create FBI Table
CREATE TABLE FBI (
    fbi_code VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(fbi_code)
);

-- 2. Create Geo_Coordinates Table
CREATE TABLE Geo_Coordinates (
    geo_id INT NOT NULL,
    latitude VARCHAR(255),
    longitude VARCHAR(255),
    PRIMARY KEY(geo_id)
);

-- 3. Create District Table
CREATE TABLE DISTRICT (
    district_id VARCHAR(255) NOT NULL,
    PRIMARY KEY(district_id)
);

-- 4. Create Division Table
CREATE TABLE Division (
    division_id INT NOT NULL,
    ward VARCHAR(255),
    beat VARCHAR(255),
    district VARCHAR(255) NOT NULL,
    PRIMARY KEY(division_id),
    FOREIGN KEY(district) REFERENCES District(district_id)
);

-- 5. Create IUCR Table
CREATE TABLE IUCR (
    iucr_code VARCHAR(255) NOT NULL,
    primary_description VARCHAR(255) NOT NULL,
    secondary_description VARCHAR(255) NOT NULL,
    severity VARCHAR(255),
    fbi_code VARCHAR(255) NOT NULL,
    PRIMARY KEY(iucr_code),
    FOREIGN KEY(fbi_code) REFERENCES FBI(fbi_code)
);

-- 6. Create Location Table
CREATE TABLE Location (
    loc_id INT NOT NULL,
    loc_description VARCHAR(255),
    division_id INT NOT NULL,
    geo_id INT NOT NULL,
    PRIMARY KEY(loc_id),
    FOREIGN KEY(division_id) REFERENCES Division(division_id),
    FOREIGN KEY(geo_id) REFERENCES Geo_Coordinates(geo_id)
);

-- 7. Create Crime_Incident Table
CREATE TABLE Crime_Incident (
    crime_id INT NOT NULL,
    case_number INT NOT NULL,
    time_stamp DATE,
    block VARCHAR(255) NOT NULL,
    iucr_code VARCHAR(255) NOT NULL,
    loc_id INT NOT NULL,
    PRIMARY KEY(crime_id),
    FOREIGN KEY(loc_id) REFERENCES Location(loc_id),
    FOREIGN KEY(iucr_code) REFERENCES IUCR(iucr_code)
);

-- 8. Create Season Table
CREATE TABLE Season (
    month INT NOT NULL,
    season_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(month)
);

-- 9. Create Police_Sentiment_Score Table
CREATE TABLE Police_Sentiment_Score (
    score_id INT NOT NULL,
    district VARCHAR(255) NOT NULL,
    demographic_type VARCHAR(255),
    demographic_score VARCHAR(255),
    PRIMARY KEY(score_id),
    FOREIGN KEY(district) REFERENCES District(district_id)
);
