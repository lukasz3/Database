 
 SELECT co.Id, m.Name,  mo.Name, mo.Generation, co.ModelVersionId, ms.VersionName, usrBuyer.Name AS BuyerName, 
	usrBuyer.Surname As BuyerSurname,
	usrSeller.Name AS SellerName,
	usrSeller.Surname AS SellerSurname,
	e.EquipmentName
	FROM vehicle.CarOrders co
 INNER JOIN usr.Users AS usrBuyer ON usrBuyer.Id = co.BuyerId
 INNER JOIN usr.Users AS usrSeller ON usrSeller.Id = co.SellerId
 INNER JOIN vehicle.ModelVersions AS ms ON ms.Id = co.ModelVersionId
 INNER JOIN vehicle.Models AS mo ON mo.Id = ms.ModelId
 INNER JOIN vehicle.Manufacturers AS m ON m.Id = mo.ManufacturerId
 INNER JOIN vehicle.ModelVersionAvailableEquipment AS ae ON ae.ModelVersionId = ms.Id
 INNER JOIN vehicle.Equipment AS e ON e.Id = ae.EquipmentId  
 WHERE co.Id = 1 AND ae.Price IS NULL