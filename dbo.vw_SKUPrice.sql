CREATE VIEW dbo.vw_SKUPriceâ

AS
(
	SELECT ID, Code, Name, dbo.GetSKUPrice(ID) as SKUP FROM dbo.SKU
)