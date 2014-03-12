BACKUP DATABASE [#{db.database.name}] TO  DISK = N'#{file.db.backup}' WITH  INIT ,  NOUNLOAD ,  NAME = N'#{db.database.name} Sicherung',  NOSKIP ,  STATS = 10,  NOFORMAT

go
quit
