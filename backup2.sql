USE s17guest15;
GO
BACKUP DATABASE s17guest15
    TO DISK = '\s17guest15.Bak'
      WITH FORMAT,
        MEDIANAME = 'Z_SQLServerBackups',
        NAME = 'Full Backup of s17guest15';
GO