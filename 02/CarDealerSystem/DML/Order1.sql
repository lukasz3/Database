DECLARE @SellerId1 INT = (SELECT TOP 1 Id FROM usr.Users WHERE [Name] = '£ukasz' AND [Surname] = 'Kowalski');
DECLARE @SellerId2 INT = (SELECT TOP 1 Id FROM usr.Users WHERE [Name] = 'Marcin' AND [Surname] = 'Koralewski');

DECLARE @BuyerId1 INT = (SELECT TOP 1 Id FROM usr.Users WHERE [Name] = 'Wojciech' AND [Surname] = 'Augustowicz');

DECLARE @ModelersionId INT;
SELECT TOP 1 @ModelersionId = mv.[Id]
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  INNER JOIN vehicle.ModelVersionAvailableEquipment mvae ON mvae.ModelVersionId = mv.Id
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  WHERE mv.VersionName = 'ACTIVE 1.5 TSI ACT' and m.[Name] = 'Octavia Combi'
        AND ISNULL(mvae.Price, 1000) =  1000.00

DECLARE @PriceId INT;		
SELECT @PriceId = (mv.BasePrice + SUM(mvae.Price))
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  INNER JOIN vehicle.ModelVersionAvailableEquipment mvae ON mvae.ModelVersionId = mv.Id
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  WHERE mv.VersionName = 'ACTIVE 1.5 TSI ACT' and m.[Name] = 'Octavia Combi'
        AND mvae.Price =  1000.00
		GROUP BY BasePrice, Price  

INSERT INTO vehicle.CarOrders (ModelVersionId, BuyerId, SellerId, SellDate, DeliveryDate, Price)
VALUES (@ModelersionId, @BuyerId1, @SellerId1, GETDATE() - 68, GETDATE() - 5, @PriceId);

DECLARE @OrderId INT = (SELECT TOP 1 Id FROM vehicle.CarOrders WHERE ModelVersionId = @ModelersionId AND BuyerId = @BuyerId1 AND SellerId = @SellerId1)

INSERT INTO vehicle.CarOrderOptionalEquipment (OrderId, ModelAvailableEquipmentId)
SELECT @OrderId, mvae.Id
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  INNER JOIN vehicle.ModelVersionAvailableEquipment mvae ON mvae.ModelVersionId = mv.Id
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  WHERE mv.VersionName = 'ACTIVE 1.5 TSI ACT' and m.[Name] = 'Octavia Combi'
        AND mvae.Price =  1000.00   