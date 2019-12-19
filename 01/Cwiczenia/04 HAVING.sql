SELECT [Name],
       COUNT(*) As NameCount
	   FROM usr.Users
	   GROUP BY [Name]
	   HAVING COUNT(*) > 1