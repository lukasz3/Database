CREATE DATABASE CarDealerSystem;
GO
USE CarDealerSystem; 
GO
CREATE SCHEMA vehicle;
GO
CREATE SCHEMA usr;
GO

CREATE TABLE vehicle.[Manufacturers]
(
Id INT NOT NULL IDENTITY,
[Name] NVARCHAR(250) NOT NULL,
CONSTRAINT PK_Manufacturers_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO vehicle.[Manufacturers] ([Name]) VALUES ('Audi'), ('Seat'), ('Skoda'), ('Volkswagen'); 

CREATE TABLE vehicle.ModelTypes
(
Id INT NOT NULL,
[Name] NVARCHAR(50) NOT NULL

CONSTRAINT PK_ModelTypes_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO vehicle.ModelTypes (Id, [Name]) VALUES (1, 'Hatchback'), (2, 'Liftback'), (3, 'Sedan'), (4, 'Kombi'), (5, 'SUV'), (6, 'Coupe');  

CREATE TABLE vehicle.[Models]
(
Id INT NOT NULL IDENTITY,
[ManufacturerId] INT NOT NULL,
[ModelTypeId] INT,

[Name] NVARCHAR(250) NOT NULL,
[Generation] NVARCHAR(100) NOT NULL,

CONSTRAINT PK_Models_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_Models_ManufacturerId FOREIGN KEY(ManufacturerId) REFERENCES vehicle.Manufacturers(Id),
CONSTRAINT FK_Models_ModelTypeId FOREIGN KEY(ModelTypeId) REFERENCES vehicle.ModelTypes(Id)
);

DECLARE @AudiId INT = (SELECT TOP 1 Id FROM vehicle.[Manufacturers] WHERE [Name] = 'Audi');
DECLARE @SkodaId INT = (SELECT TOP 1 Id FROM vehicle.[Manufacturers] WHERE [Name] = 'Skoda');
 
INSERT INTO vehicle.[Models] ([ManufacturerId], [ModelTypeId], [Name], [Generation]) 
VALUES (@AudiId, 4, 'A3 Sportback', '8V'),
       (@AudiId, 3, 'A3 Limousine', '8V'),
	   (@AudiId, 4, 'A4 Avant', 'B9'),
       (@AudiId, 3, 'A4 Limousine', 'B9'),
	   (@AudiId, 4, 'A4 Allroad', 'B9'),
	   (@AudiId, 5, 'Q7', '4M'),
	   (@SkodaId, 2, 'Octavia Liftback', 'III'),
	   (@SkodaId, 4, 'Octavia Combi', 'III'),
	   (@SkodaId, 2, 'Superb Liftback', 'III'),
	   (@SkodaId, 4, 'Superb Combi', 'III'),
	   (@SkodaId, 5, 'Kodiaq', 'I');

	    

 CREATE TABLE vehicle.EquipmentMainTypes
 (
 [Id] INT NOT NULL,
 [TypeName] NVARCHAR(250) NOT NULL,

 CONSTRAINT PK_EquipmentMainTypes_Id PRIMARY KEY CLUSTERED (Id)
 );

 INSERT INTO vehicle.EquipmentMainTypes (Id, TypeName) VALUES 
 (1, 'Bezpieczeñstwo'), 
 (2, 'Widocznoœæ'), 
 (3, 'Funkcjonalnoœæ'), 
 (4, 'Komfort'), 
 (5, 'Kierownice'), 
 (6, 'Audio i Komunikacja'),
 (7, 'Ko³a'),
 (8, 'Lakiery'),
 (9, 'Pakiety serwisowe'),
 (10, 'Skrzynia biegów');


 CREATE TABLE vehicle.Equipment
 (
  [Id] INT NOT NULL IDENTITY(1,1),
  [EquipmentMainTypeId] INT NOT NULL,
  [EquipmentName] NVARCHAR(500) NOT NULL, 
  
  CONSTRAINT PK_Equipment_Id PRIMARY KEY CLUSTERED (Id),
  CONSTRAINT FK_Equipment_EquipmentMainTypeId FOREIGN KEY(EquipmentMainTypeId) REFERENCES vehicle.EquipmentMainTypes(Id)
 );

 INSERT INTO vehicle.Equipment (EquipmentMainTypeId, EquipmentName) VALUES
 (1, 'ESP z ABS, EBV, MSR, ASR, EDS, XDS+, DSR, TSA, CBC'),
 (1, 'MULTICOLLISION BRAKE - hamulec antykolizyjny'),
 (1, 'TPM – system kontroli ciœnienia w ogumieniu'),
 (1, 'CREW PROTECT ASSIST - aktywna funkcja ochrony kierowcy i pasa¿era z przodu'),
 (1, 'LANE ASSIST - asystent pasa ruchu'),
 (1, 'FRONT ASSIST - kontrola odstêpu z funkcj¹ awaryjnego hamowania, system hamowania awaryjnego w przypadku wykrycia pieszych przed pojazdem'),
(2, 'Reflektory halogenowe'),
(2, 'Œwiat³a LED do jazdy dziennej DAY-LIGHT'),
(2, 'Podgrzewana przednia szyba'),
(2, 'AUTO LIGHT ASSIST - funkcja automatycznego w³¹czania i wy³¹czania œwiate³ drogowych '),
(3, 'Hak holowniczy (demontowany)'),
(3, 'Gniazdo 230 V'),
(4, 'Czujniki parkowania z przodu'),
(4, 'Czujniki parkowania z ty³u'),
(4, 'PARK ASSIST - system wspomagania parkowania'),
(4, 'Kamera cofania'),
(4, 'Klimatyzacja manualna'),
(4, 'Klimatyzacja automatyczna'),
(4, 'Elektronicznie sterowany fotel kierowcy z pamiêci¹ ustawieñ, elektrycznie sterowany fotel pasa¿era'),
(4, 'Tempomat'),
(4, 'Elektrycznie sterowane szyby z przodu'),
(4, 'Elektrycznie sterowane szyby z ty³u'),
(4, 'Elektrycznie lusterka'),
(4, 'Podgrzewane fotele przednie'),
(5, 'Trójramienna skórzana kierownica z ma³ym pakietem skórzanym'),
(5, 'Trójramienna skórzana wielofunkcyjna kierownica (radio i telefon) z ma³ym pakietem skórzanym'),
(6, N'Radio SWING 6,5", wejœcie SD, USB'),
(6, N'Radio BOLERO 8", wejœcie SD, USB'),
(6, 'SOUND SYSTEM CANTON (10 g³oœników, moc 570W, subwoofer, cyfrowy equalizer)'),
(7, N'Stalowe obrêcze kó³ z os³onami SIDUS 6J x 15" z oponami 195/65 R15'),
(7, N'Obrêcze kó³ ze stopów lekkich TRIUS 7J x 17" z oponami 225/45 R17'),
(7, N'Obrêcze kó³ ze stopów lekkich ALARIS 7,5J x 18" z oponami 225/40 R18'),
(8, 'Czerwony'),
(8, 'Bia³y'),
(8, '¯ó³ty'),
(9, 'Pakiet pogwarancyjny 2 lata, do 60 000 km'),
(9, 'Pakiet pogwarancyjny 2 lata, do 120 000 km'),
(10, 'Skrzynia biegów rêczna 6 biegowa'),
(10, 'Automatyczna skrzynia biegów 7 biegowa');


CREATE TABLE vehicle.[ModelVersions]
(
Id INT NOT NULL IDENTITY(1,1),
[ModelId] INT NOT NULL,
[VersionName] NVARCHAR(250) NOT NULL,
BasePrice MONEY NOT NULL,

CONSTRAINT PK_ModelVersions_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_ModelVersions_ModelId FOREIGN KEY(ModelId) REFERENCES vehicle.Models(Id)
);

DECLARE @SkodaOctaviaLiftback INT = (SELECT TOP 1 Id FROM vehicle.Models WHERE [Name] = 'Octavia Liftback');  
DECLARE @SkodaOctaviaCombi INT = (SELECT TOP 1 Id FROM vehicle.Models WHERE [Name] = 'Octavia Combi');

INSERT INTO vehicle.[ModelVersions] (ModelId, VersionName, BasePrice) VALUES 
(@SkodaOctaviaLiftback, 'ACTIVE 1.5 TSI ACT', 73750),
(@SkodaOctaviaLiftback, 'AMBITION 1.5 TSI ACT', 78150),
(@SkodaOctaviaLiftback, 'STYLE 1.5 TSI ACT', 83150),
(@SkodaOctaviaLiftback, 'AMBITION 2.0 TSI 4x4', 104900),
(@SkodaOctaviaLiftback, 'STYLE 2.0 TSI 4x4', 106850),
(@SkodaOctaviaLiftback, 'AMBITION 2.0 TDI', 90350),
(@SkodaOctaviaLiftback, 'STYLE 2.0 TDI', 95750),

(@SkodaOctaviaCombi, 'ACTIVE 1.5 TSI ACT', 77700),
(@SkodaOctaviaCombi, 'AMBITION 1.5 TSI ACT', 82150),
(@SkodaOctaviaCombi, 'STYLE 1.5 TSI ACT', 88000),
(@SkodaOctaviaCombi, 'AMBITION 2.0 TSI 4x4', 105900),
(@SkodaOctaviaCombi, 'STYLE 2.0 TSI 4x4', 111800),
(@SkodaOctaviaCombi, 'AMBITION 2.0 TDI', 94350),
(@SkodaOctaviaCombi, 'STYLE 2.0 TDI', 100200);


 CREATE TABLE vehicle.ModelVersionAvailableEquipment
 (
 [Id] INT NOT NULL IDENTITY(1,1),
 [ModelVersionId] INT NOT NULL,
 [EquipmentId] INT NOT NULL,
 [Price] Money NULL,
 
 CONSTRAINT PK_ModelVersionAvailableEquipment_Id PRIMARY KEY CLUSTERED (Id),
 CONSTRAINT FK_ModelVersionAvailableEquipment_ModelVersionId FOREIGN KEY(ModelVersionId) REFERENCES vehicle.ModelVersions(Id),
 CONSTRAINT FK_ModelVersionAvailableEquipment_EquipmentId FOREIGN KEY(EquipmentId) REFERENCES vehicle.Equipment(Id)
 );

 DECLARE @TmpTable TABLE
(
Id INT
);

INSERT INTO @TmpTable (Id)
SELECT Id FROM vehicle.[ModelVersions] WHERE [VersionName] LIKE 'ACTIVE%'

;WITH activeStandardEq AS
(
SELECT Id FROM vehicle.Equipment WHERE EquipmentName 
IN 
(
'ESP z ABS, EBV, MSR, ASR, EDS, XDS+, DSR, TSA, CBC',
'MULTICOLLISION BRAKE - hamulec antykolizyjny',
'TPM – system kontroli ciœnienia w ogumieniu',
'CREW PROTECT ASSIST - aktywna funkcja ochrony kierowcy i pasa¿era z przodu',
'Klimatyzacja manualna',
'Trójramienna skórzana kierownica z ma³ym pakietem skórzanym',
N'Radio SWING 6,5", wejœcie SD, USB',
N'Stalowe obrêcze kó³ z os³onami SIDUS 6J x 15" z oponami 195/65 R15',
'Skrzynia biegów rêczna 6 biegowa'
)
)
INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, NULL FROM @TmpTable t
CROSS JOIN activeStandardEq a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1000 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
  'Elektrycznie sterowane szyby z ty³u',
  'Elektrycznie lusterka'
  )
) AS a


INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1500 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Czerwony',
   'Bia³y',
   '¯ó³ty'
  )
) AS a


INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1400 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Pakiet pogwarancyjny 2 lata, do 60 000 km'
  )
) AS a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(2400 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Pakiet pogwarancyjny 2 lata, do 120 000 km'
  )
) AS a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(8000 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Automatyczna skrzynia biegów 7 biegowa'
  )
) AS a

-- AMBITION
DELETE FROM @TmpTable;


INSERT INTO @TmpTable (Id)
SELECT Id FROM vehicle.[ModelVersions] WHERE [VersionName] LIKE 'AMBITION%'

;WITH ambitionStandardEq AS
(
SELECT Id FROM vehicle.Equipment WHERE EquipmentName 
IN 
(
'ESP z ABS, EBV, MSR, ASR, EDS, XDS+, DSR, TSA, CBC',
'MULTICOLLISION BRAKE - hamulec antykolizyjny',
'TPM – system kontroli ciœnienia w ogumieniu',
'CREW PROTECT ASSIST - aktywna funkcja ochrony kierowcy i pasa¿era z przodu',
'Klimatyzacja manualna',
'Trójramienna skórzana kierownica z ma³ym pakietem skórzanym',
N'Radio SWING 6,5", wejœcie SD, USB',
N'Stalowe obrêcze kó³ z os³onami SIDUS 6J x 15" z oponami 195/65 R15',
'Skrzynia biegów rêczna 6 biegowa',
'LANE ASSIST - asystent pasa ruchu',
'Elektrycznie sterowane szyby z ty³u'
)
)
INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, NULL FROM @TmpTable t
CROSS JOIN ambitionStandardEq a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(800 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
  'Elektrycznie lusterka',
  'Tempomat'
  )
) AS a


INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1400 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Czerwony',
   'Bia³y',
   '¯ó³ty'
  )
) AS a


INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1300 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Pakiet pogwarancyjny 2 lata, do 60 000 km',
   'FRONT ASSIST - kontrola odstêpu z funkcj¹ awaryjnego hamowania, system hamowania awaryjnego w przypadku wykrycia pieszych przed pojazdem'
  )
) AS a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(2300 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Pakiet pogwarancyjny 2 lata, do 120 000 km',
   'Klimatyzacja automatyczna'
  )
) AS a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(8000 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Automatyczna skrzynia biegów 7 biegowa'
  )
) AS a

-- STYLE
DELETE FROM @TmpTable;


INSERT INTO @TmpTable (Id)
SELECT Id FROM vehicle.[ModelVersions] WHERE [VersionName] LIKE 'STYLE%'

;WITH styleStandardEq AS
(
SELECT Id FROM vehicle.Equipment WHERE EquipmentName 
IN 
(
'ESP z ABS, EBV, MSR, ASR, EDS, XDS+, DSR, TSA, CBC',
'MULTICOLLISION BRAKE - hamulec antykolizyjny',
'TPM – system kontroli ciœnienia w ogumieniu',
'CREW PROTECT ASSIST - aktywna funkcja ochrony kierowcy i pasa¿era z przodu',
'Trójramienna skórzana kierownica z ma³ym pakietem skórzanym',
N'Radio SWING 6,5", wejœcie SD, USB',
N'Stalowe obrêcze kó³ z os³onami SIDUS 6J x 15" z oponami 195/65 R15',
'Skrzynia biegów rêczna 6 biegowa',
'LANE ASSIST - asystent pasa ruchu',
'Elektrycznie sterowane szyby z ty³u',
'Elektrycznie lusterka',
'Klimatyzacja automatyczna',
'Czujniki parkowania z przodu',
'Czujniki parkowania z ty³u'
)
)
INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, NULL FROM @TmpTable t
CROSS JOIN styleStandardEq a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(800 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
  'Tempomat',
  'Podgrzewana przednia szyba',
  'FRONT ASSIST - kontrola odstêpu z funkcj¹ awaryjnego hamowania, system hamowania awaryjnego w przypadku wykrycia pieszych przed pojazdem'
  )
) AS a


INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1400 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Czerwony',
   'Bia³y',
   '¯ó³ty'
  )
) AS a


INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(1300 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Pakiet pogwarancyjny 2 lata, do 60 000 km',
   N'Obrêcze kó³ ze stopów lekkich TRIUS 7J x 17" z oponami 225/45 R17',
   'Podgrzewane fotele przednie'
  )
) AS a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(2300 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Pakiet pogwarancyjny 2 lata, do 120 000 km',
   'Elektronicznie sterowany fotel kierowcy z pamiêci¹ ustawieñ, elektrycznie sterowany fotel pasa¿era'
  )
) AS a

INSERT INTO vehicle.ModelVersionAvailableEquipment (ModelVersionId, EquipmentId, Price)  
SELECT t.id AS ModelVersionId, a.Id AS EquipmentId, a.Price FROM @TmpTable t
CROSS JOIN
(
  SELECT Id, CAST(8000 AS MONEY) AS Price FROM vehicle.Equipment WHERE EquipmentName 
  IN 
  ( 
   'Automatyczna skrzynia biegów 7 biegowa'
  )
) AS a


--silniki:
CREATE TABLE vehicle.Engines
(
Id INT NOT NULL IDENTITY (1,1),
[Name] NVARCHAR(100),

CONSTRAINT PK_Engines_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO vehicle.Engines([Name]) VALUES ('1.5 TSI'), ('2.0 TSI'), ('2.0 TDI');


CREATE TABLE vehicle.EngineProperties
(
[Id] INT NOT NULL,
[Property] NVARCHAR(50) NOT NULL, --kw km  fuel type
[Value] NVARCHAR(100) NOT NULL,  
[Description] NVARCHAR(500) NOT NULL 

CONSTRAINT PK_EngineProperties_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO vehicle.EngineProperties (Id, Property, [Value], [Description]) VALUES 
(1, 'FuelType', 'FT', 'Rodzaj paliwa'),
(2, 'FT', 'Diesel', 'Rodzaj paliwa: diesel'),
(3, 'FT', 'Petrol', 'Rodzaj paliwa: benzyna'),
(4, 'EnginePower', 'PS', 'Moc silnika (konie mechaniczne)'),
(5, 'EnginePower', 'Kilowatts', 'Moc silnika (kilowaty)'),
(6, 'PS', '150', 'Moc silnika: 150 KM'),
(7, 'PS', '190', 'Moc silnika: 190KM'); 


CREATE TABLE vehicle.EngineValues
(
Id INT NOT NULL IDENTITY(1,1),
[EngineId] INT NOT NULL,
[EnginePropertyId] INT NOT NULL,
[ValueId] INT NOT NULL,

CONSTRAINT PK_EngineValues_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_EngineValues_EngineId FOREIGN KEY(EngineId) REFERENCES vehicle.Engines(Id),
CONSTRAINT FK_EngineValues_EnginePropertyId FOREIGN KEY(EnginePropertyId) REFERENCES vehicle.EngineProperties(Id),
CONSTRAINT FK_EngineValues_ValueId FOREIGN KEY(ValueId) REFERENCES vehicle.EngineProperties(Id)
);

DECLARE @15TFSI INT = (SELECT TOP 1 Id FROM vehicle.Engines WHERE [Name] = '1.5 TSI');
DECLARE @20TFSI INT = (SELECT TOP 1 Id FROM vehicle.Engines WHERE [Name] = '2.0 TSI');
DECLARE @20TDI INT = (SELECT TOP 1 Id FROM vehicle.Engines WHERE [Name] = '2.0 TDI'); 

INSERT INTO vehicle.EngineValues (EngineId, EnginePropertyId, [ValueId]) VALUES 
(@15TFSI, 1, 3),
(@15TFSI, 4, 6),
(@20TFSI, 1, 3),
(@20TFSI, 4, 7),
(@20TDI, 1, 2), 
(@20TDI, 4, 6);


CREATE TABLE vehicle.ModelVersionEngines
(
Id INT NOT NULL IDENTITY(1,1),
ModelVersionId INT NOT NULL,
EngineId INT NOT NULL,

CONSTRAINT PK_ModelVersionEngines_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_ModelVersionEngines_ModelVersionId FOREIGN KEY(ModelVersionId) REFERENCES vehicle.ModelVersions(Id),
CONSTRAINT FK_ModelVersionEngines_EngineId FOREIGN KEY(EngineId) REFERENCES vehicle.Engines(Id)
);

--1.5 TFSI
DELETE FROM @TmpTable;

INSERT INTO @TmpTable (Id)
SELECT Id FROM vehicle.[ModelVersions] WHERE [VersionName] LIKE '%1.5 TSI%'


INSERT INTO vehicle.ModelVersionEngines(ModelVersionId, EngineId)
SELECT Id AS ModelVersionId, @15TFSI FROM @TmpTable

--2.0 TFSI
DELETE FROM @TmpTable;


INSERT INTO @TmpTable (Id)
SELECT Id FROM vehicle.[ModelVersions] WHERE [VersionName] LIKE '%2.0 TSI%'

INSERT INTO vehicle.ModelVersionEngines(ModelVersionId, EngineId)
SELECT Id AS ModelVersionId, @20TFSI FROM @TmpTable

--2.0 TDI
DELETE FROM @TmpTable;

INSERT INTO @TmpTable (Id)
SELECT Id FROM vehicle.[ModelVersions] WHERE [VersionName] LIKE '%2.0 TDI%'

INSERT INTO vehicle.ModelVersionEngines(ModelVersionId, EngineId)
SELECT Id AS ModelVersionId, @20TDI FROM @TmpTable


CREATE TABLE usr.UserTypes
(
Id INT NOT NULL,
[UserType] VARCHAR(250),

CONSTRAINT PK_UserTypes_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO usr.UserTypes (Id, UserType) VALUES (1, 'Seller'), (2, 'Buyer');

CREATE TABLE usr.Users 
(
Id INT NOT NULL IDENTITY(1,1),
[UserTypeId] INT NOT NULL,
[Name] NVARCHAR(100) NOT NULL,
[Surname] NVARCHAR(100) NOT NULL

CONSTRAINT PK_Users_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_Users_UserTypeId FOREIGN KEY(UserTypeId) REFERENCES usr.UserTypes(Id)
);

INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('£ukasz', 'Kowalski', 1);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Marcin', 'Waœniowski', 1);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Marcin', 'Koralewski', 1);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Tomasz', 'Koralewski', 2);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Agnieszka', 'Marcinkowska', 2);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Monika', 'Marcinkowska', 2);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Anna', 'Augustowicz', 2);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Wojciech', 'Augustowicz', 2);
INSERT INTO usr.Users ([Name], [Surname], [UserTypeId]) VALUES ('Agnieszka', 'Wojtowicz', 2);

CREATE TABLE usr.AddressTypes
(
 Id INT NOT NULL,
 [AddressType] NVARCHAR(10) NOT NULL,
 [Description] NVARCHAR(250) NOT NULL,

 CONSTRAINT PK_AddressTypes_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO usr.AddressTypes (Id, [AddressType], [Description])
VALUES (1, 'Z', 'Adres zameldowania'), (2, 'K', 'Adres korespondecyjny');

CREATE TABLE usr.Cities
(
Id INT NOT NULL IDENTITY(1,1),
CityName NVARCHAR(250) NOT NULL

CONSTRAINT PK_Cities_Id PRIMARY KEY CLUSTERED (Id)
);

INSERT INTO usr.Cities (CityName) VALUES ('Wroc³aw'), ('Poznañ');

CREATE TABLE usr.Addresses
(
Id INT NOT NULL Identity(1,1),
UserId INT NOT NULL,
AddressTypeId INT NOT NULL,
CityId INT NOT NULL,

CONSTRAINT PK_Addresses_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_Addresses_UserId FOREIGN KEY(UserId) REFERENCES usr.Users(Id),
CONSTRAINT FK_Addresses_AddressTypeId FOREIGN KEY(AddressTypeId) REFERENCES usr.AddressTypes(Id),
CONSTRAINT FK_Addresses_CityId FOREIGN KEY(CityId) REFERENCES usr.Cities(Id)
); 

INSERT INTO usr.Addresses (UserId, AddressTypeId, CityId)  
SELECT usr.Id, 2, c.CityId FROM usr.Users usr
CROSS JOIN
(
 SELECT FLOOR(RAND()*(2)+1) AS CityId
) c


CREATE TABLE vehicle.CarOrders
(
Id INT NOT NULL IDENTITY(1,1),
ModelVersionId INT NOT NULL,
BuyerId INT NOT NULL,
SellerId INT NOT NULL,
SellDate DATETIME NOT NULL,
DeliveryDate DATETIME NOT NULL,
Price MONEY NOT NULL,

CONSTRAINT PK_CarOrders_Id PRIMARY KEY CLUSTERED (Id)
);

CREATE TABLE vehicle.CarOrderOptionalEquipment
(
Id INT NOT NULL IDENTITY(1,1),
OrderId INT NOT NULL,
ModelVersionAvailableEquipmentId INT NOT NULL,

CONSTRAINT PK_CarOrderOptionalEquipment_Id PRIMARY KEY CLUSTERED (Id),
CONSTRAINT FK_CarOrderOptionalEquipment_OrderId FOREIGN KEY(OrderId) REFERENCES vehicle.CarOrders(Id),
CONSTRAINT FK_CarOrderOptionalEquipment_ModelVersionAvailableEquipmentId FOREIGN KEY(ModelVersionAvailableEquipmentId) REFERENCES vehicle.ModelVersionAvailableEquipment(Id)
);

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

INSERT INTO vehicle.CarOrderOptionalEquipment (OrderId, ModelVersionAvailableEquipmentId)
SELECT @OrderId, mvae.Id
  FROM [CarDealerSystem].[vehicle].[ModelVersions] mv
  INNER JOIN vehicle.Models m ON m.Id = mv.ModelId
  INNER JOIN vehicle.ModelVersionAvailableEquipment mvae ON mvae.ModelVersionId = mv.Id
  INNER JOIN vehicle.Equipment e ON e.Id = mvae.EquipmentId
  WHERE mv.VersionName = 'ACTIVE 1.5 TSI ACT' and m.[Name] = 'Octavia Combi'
        AND mvae.Price =  1000.00   
