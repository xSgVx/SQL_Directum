select			
		ProdName,
		Sellers.Surname,
		Sellers.Name,		
		concat((ProdCount / sum(Sales.Quantity) * 100), '%') as SoldPerc
from
(select	Products.ID as ProdID, 
		Products.Name as ProdName, 
		(sum(Sales.Quantity)) as ProdCount,
		Sellers.ID as SelID
from	Sales, Products, Sellers
where	Sales.IDProd = Products.ID and 
		Sellers.ID = Sales.IDSel and
		dbo.Sales.Date > '01.10.2013 00:00' and 
		dbo.Sales.Date < '08.10.2013 00:00'
group by Sellers.ID, Products.ID, 
		 Products.Name, Sales.Quantity) as T1, Sales, Sellers, Arrivals

where	Sales.IDProd = T1.ProdID and
		T1.SelID = Sellers.ID and
		T1.ProdID = Arrivals.IDProd and
		Arrivals.Date > '07.09.2013 00:00' and
		Arrivals.Date < '08.10.2013 00:00'

group by ProdID, ProdName, 
		 Sellers.Surname, Sellers.Name, 
		 ProdCount