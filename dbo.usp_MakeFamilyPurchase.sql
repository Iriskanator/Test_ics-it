CREATE PROCEDURE dbo.usp_MakeFamilyPurchase

@FamilySurName varchar(255)

AS

BEGIN
	IF NOT EXISTS 
		(
			SELECT 1
			FROM dbo.Family
			WHERE SurName = @FamilySurName
		)
	BEGIN
		RAISERROR('Такой семьи нет', 11, 1)
		RETURN;
	END;
	UPDATE dbo.Family
		SET BudgetValue = BudgetValue - (SELECT sum(Value) FROM dbo.Basket b WHERE b.ID_Family in (select ID from dbo.Family WHERE SurName = @FamilySurName))
		WHERE SurName = @FamilySurName
END;