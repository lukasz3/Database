SELECT ma.Name, mo.Name, mo.Generation FROM vehicle.Manufacturers ma
RIGHT JOIN vehicle.Models mo ON mo.ManufacturerId = ma.Id