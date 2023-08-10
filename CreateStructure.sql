USE [ics-it];

	CREATE TABLE dbo.SKU
	(
		ID INT  identity (1,1) PRIMARY KEY,
		Code AS	's' + CAST(ID) UNIQUE NOT NULL,
		Name VARCHAR(30) NOT NULL
	);
		CREATE TABLE dbo.Family
	(
		ID INT  identity (1,1) PRIMARY KEY,
		SurName VARCHAR(255) NOT NULL,
		BudgetValue DECIMAL
	);
		CREATE TABLE dbo.Basket
	(
		ID INT  identity (1,1) PRIMARY KEY,
		ID_SKU INT NOT NULL,
		ID_Family INT NOT NULL,
		Quantity INT CHECK (Quantity>=0) NOT NULL,
		Value DECIMAL CHECK (Value>=0) NOT NULL,
		PurchaseDate DATE DEFAULT GETDATE(),
		DiscountValue DECIMAL,
		FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU (ID),
		FOREIGN KEY (ID_Family) REFERENCES dbo.Family (ID)
	);
