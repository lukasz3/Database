/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
         
       e.EquipmentName
       ,m.Name
	   ,mv.VersionName
       ,mvae.[Id]
      ,mvae.[ModelVersionId]
      ,mvae.[EquipmentId]
      ,mvae.[Price]
  FROM [vehicle].[ModelVersionAvailableEquipment] mvae
  INNER JOIN vehicle.ModelVersions mv ON mv.Id = mvae.ModelVersionId
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  WHERE VersionName = 'ACTIVE 1.5 TSI ACT' AND m.Name = 'Octavia Liftback'
  AND Price IS NULL
