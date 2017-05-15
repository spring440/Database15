

ALTER PROCEDURE insertPresentation

  @nameOfPresentation varchar(255),
  @NameOfSpeaker varchar(255)


AS
  DECLARE @IdOfPresentation INT
  DECLARE @IdOfSpeaker INT
  DECLARE @presenterRoleID INT


  
/*if the speaker dos not exist we going to insert in to the people table*/
IF NOT EXISTS(SELECT TOP 1 first_Name FROM people WHERE Name = @NameOfSpeaker)
      
  BEGIN
    INSERT INTO people
    (Name) VALUES (@NameOfSpeaker)
    SET @IdOfSpeaker = SCOPE_IDENTITY();
  END
  ELSE
/*else set the Id of speaker equal to id that is form people table where
the name is equal to the name of speaker*/
  BEGIN
    SET @IdOfSpeaker = (SELECT TOP 1 id FROM people WHERE Name = @NameOfSpeaker)
  END




/*if the presentation dos not exist we going to insert in to the presentation table*/
  IF NOT EXISTS(SELECT TOP 1 title FROM presentation WHERE title = @nameOfPresentation)
  BEGIN
    INSERT INTO presentation
    (title) VALUES (@nameOfPresentation)
    SET @IdOfPresentation = SCOPE_IDENTITY();
  END
  ELSE
  /*else set the Id of presentation equal to roles id that is coming form presentation table
  where the title is equal to the name of presentation*/
  BEGIN
    SET @IdOfPresentation = (SELECT TOP 1 presentationID FROM presentation WHERE title = @nameOfPresentation)
  END




/*Set the role id of the speaker to the id associated with 'Presenter'*/
  SET @presenterRoleID =  (SELECT TOP 1 id_roles FROM Roles WHERE titleOfRoles='Presenter')
/*check if the speaker associated with the 'present role '*/
  IF NOT EXISTS(SELECT TOP 1 idPeopleRoles FROM cross_roleAndPeople
  WHERE idPeopleRoles= @IdOfSpeaker AND idRole = @presenterRoleID)
/*if not label the person as a presenter*/
  BEGIN
    INSERT INTO cross_roleAndPeople
    (idPeople, idRole)
    VALUES
    (@IdOfSpeaker , @presenterRoleID)
  END


/*it is finally make connection between the presentation and speaker*/
  INSERT INTO cross_SpeakerPresentation
  (presentationID, SpeakerID) VALUES (@IdOfPresentation, @IdOfSpeaker )
GO


/* CREATE PROCEDURE for budapest */
ALTER PROCEDURE budapestData
  AS
  SELECT  * FROM presentation WHERE eventCity='Budapest'
