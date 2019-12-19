SELECT
co.BuyerId,
u.Name,
u.Surname 
FROM vehicle.CarOrders co
FULL OUTER JOIN usr.Users u ON co.BuyerId = u.Id