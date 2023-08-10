CREATE OR ALTER TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
	BEGIN
		UPDATE dbo.Basket
		SET dbo.Basket.DiscountValue = dbo.Basket.Value*0.05 WHERE ID_SKU IN (SELECT ID_SKU FROM inserted GROUP BY ID_SKU HAVING COUNT(*)>=2)
		UPDATE dbo.Basket
		SET dbo.Basket.DiscountValue = 0 WHERE ID_SKU IN (SELECT ID_SKU FROM inserted GROUP BY ID_SKU HAVING COUNT(*)<2)
	END;