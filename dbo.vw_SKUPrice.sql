CREATE VIEW dbo.vw_SKUPrice�

AS
(
	SELECT ID, Code, Name, dbo.GetSKUPrice(ID) as SKUP FROM dbo.SKU
)