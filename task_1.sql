select Sellers.Name, Sellers.Surname, sum(A1) as SoldSum
from
	(select Products.ID, Sales.IDSel, (Products.Price * sum (Sales.Quantity)) as A1
	from	Sales, Products
	where	Sales.IDprod = Products.ID and 
			dbo.Sales.Date > '01.10.2013 00:00' and 
			dbo.Sales.Date < '07.10.2013 23:59'
	group by Products.ID, Sales.IDSel, Products.Price) as table1, Sellers
where table1.IDSel = Sellers.ID
group by Sellers.ID, Sellers.Name, Sellers.Surname