/*
EXEC budapestData;*/


SELECT * FROM dbo.room;


SELECT * FROM dbo.track;

SELECT * FROM dbo.presentation p
INNER JOIN dbo.schedule s ON s.presentationID=p.presentationID;
