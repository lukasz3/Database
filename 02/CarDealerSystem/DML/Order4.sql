DECLARE @SellerId1 INT = (SELECT TOP 1 Id FROM usr.Users WHERE [Name] = '£ukasz' AND [Surname] = 'Kowalski');
DECLARE @SellerId2 INT = (SELECT TOP 1 Id FROM usr.Users WHERE [Name] = 'Marcin' AND [Surname] = 'Koralewski');

DECLARE @BuyerId1 INT = (SELECT TOP 1 Id FROM usr.Users WHERE [Name] = 'Anna' AND [Surname] = 'Augustowicz');


DECLARE @ModelersionId INT;
SELECT TOP 1 @ModelersionId = mv.[Id]
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  WHERE mv.VersionName = 'AMBITION 2.0 TSI 4x4' and m.[Name] = 'Octavia Combi'

DECLARE @PriceId INT;		
SELECT @PriceId = (mv.BasePrice + SUM(mvae.Price))
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  INNER JOIN vehicle.ModelVersionAvailableEquipment mvae ON mvae.ModelVersionId = mv.Id
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  WHERE mv.VersionName = 'AMBITION 2.0 TSI 4x4' and m.[Name] = 'Octavia Combi'
        AND mvae.Price >=  1500.00
		GROUP BY BasePrice, Price  

INSERT INTO vehicle.CarOrders (ModelVersionId, BuyerId, SellerId, SellDate, DeliveryDate, Price)
VALUES (@ModelersionId, @BuyerId1, @SellerId2, GETDATE() - 80, GETDATE() - 9, @PriceId);

DECLARE @OrderId INT = (SELECT TOP 1 Id FROM vehicle.CarOrders ORDER BY Id DESC)

INSERT INTO vehicle.CarOrderOptionalEquipment (OrderId, ModelVersionAvailableEquipmentId)
SELECT @OrderId, mvae.Id
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  INNER JOIN vehicle.ModelVersionAvailableEquipment mvae ON mvae.ModelVersionId = mv.Id
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  WHERE mv.VersionName = 'AMBITION 2.0 TSI 4x4' and m.[Name] = 'Octavia Combi'
        AND mvae.Price >=  1500.00   