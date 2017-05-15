
/*
Mohammad Laknahour
Date: 05/15/2017
*/


    CREATE TABLE people(
      id INT IDENTITY PRIMARY KEY,
      first_Name VARCHAR(65),
      last_Name VARCHAR(65),
      Name VARCHAR(65),
      street VARCHAR(255),
      city VARCHAR(65),
      postalCode  VARCHAR(65),
      state VARCHAR(65),
      email VARCHAR(255)
    );



    CREATE TABLE roles(
      id_roles INT IDENTITY PRIMARY KEY,
      titleOfRoles VARCHAR(65) NOT NULL UNIQUE
    );



    CREATE TABLE cross_roleAndPeople(
      idPeopleRoles INT IDENTITY PRIMARY KEY,
      idRole INT FOREIGN KEY REFERENCES roles(id_roles),
      idPeople INT NOT NULL FOREIGN KEY REFERENCES people(id),
      UNIQUE (idPeople, idRole)
    );



    CREATE TABLE event(
      eventID INT IDENTITY PRIMARY KEY,
      date VARCHAR(65) NOT NULL,
      nameOfTheEvent VARCHAR(255) NOT NULL,
      addressOfTheEvent VARCHAR(255) NOT NULL
    );



    CREATE TABLE eventTable(
      idOfEventTable INT IDENTITY PRIMARY KEY,
      number INT NOT NULL UNIQUE
    );


     CREATE TABLE cross_eventTableAndPeople(
      idPeopleRoles INT IDENTITY PRIMARY KEY,
      peopleID INT NOT NULL FOREIGN KEY REFERENCES people(id),
      eventID INT NOT NULL FOREIGN KEY REFERENCES eventTable(idOfEventTable),
      UNIQUE (peopleID, eventID)
    );



    CREATE TABLE presentation(
      presentationID INT IDENTITY PRIMARY KEY,
      title VARCHAR(255) NOT NULL,
      difficulty VARCHAR(65),
      eventCity VARCHAR(65)
    );



    CREATE TABLE room(
      roomID INT IDENTITY PRIMARY KEY,
      roomName VARCHAR(65)
    );



    CREATE TABLE timeSlot(
      timeSlotID INT IDENTITY PRIMARY KEY,
      startTIme VARCHAR(65) NOT NULL UNIQUE,
      endTime VARCHAR(65) NOT NULL UNIQUE
    );



    CREATE TABLE track(
      trackID INT IDENTITY PRIMARY KEY,
      nameOfTheTrack VARCHAR(65) NOT NULL UNIQUE
    );



    CREATE TABLE schedule(
      scheduleID INT IDENTITY PRIMARY KEY,
      presentationID INT NOT NULL UNIQUE FOREIGN KEY REFERENCES presentation(presentationID),
      timeSlotID INT NOT NULL FOREIGN KEY REFERENCES timeSlot(timeSlotID),
      roomID INT NOT NULL FOREIGN KEY REFERENCES room(roomID),
      UNIQUE(roomID, timeSlotID,presentationID)
    );



    CREATE TABLE sponsor(
      sponserID INT IDENTITY PRIMARY KEY,
      nameOfSponsor VARCHAR(65) NOT NULL,
      levelOfSponsor VARCHAR(65) NOT NULL
    );



    CREATE TABLE cross_PresentationTrack(
      presentationTrackID INT IDENTITY PRIMARY KEY,
      trackID INT NOT NULL FOREIGN KEY REFERENCES track(trackID),
      presentationID INT NOT NULL FOREIGN KEY REFERENCES presentation(presentationID)
    );



    CREATE TABLE cross_SpeakerPresentation(
      SpeakerPresentationID INT IDENTITY PRIMARY KEY,
      presentationID INT NOT NULL FOREIGN KEY REFERENCES presentation(presentationID),
      SpeakerID INT NOT NULL FOREIGN KEY REFERENCES people(id),
      UNIQUE(presentationID, SpeakerID)
    );




