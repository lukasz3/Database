SELECT BuyerId AS UserId
  FROM vehicle.CarOrders

  INTERSECT

  SELECT Id AS UserId FROM usr.Users