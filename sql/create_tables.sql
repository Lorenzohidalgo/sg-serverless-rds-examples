CREATE TABLE IF NOT EXISTS AnimalPictures (
    pictureId INT NOT NULL AUTO_INCREMENT,
    animalType VARCHAR(250) NOT NULL,
    s3Path VARCHAR(250) NOT NULL,
    s3ARN VARCHAR(250) NOT NULL,
    RecordCreatedAt datetime NOT NULL DEFAULT current_timestamp,
    RecordModifiedAt datetime NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (pictureId),
    KEY byAnimalType (animalType)
);