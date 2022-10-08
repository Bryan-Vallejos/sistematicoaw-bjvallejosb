/*Cree una función de usuario que muestre un listado de los empleados (HumanResources.Employee) con las siguientes columnas LoginID, JobTitle, BirthDate, HireDate. Además, 
deberá mostrar dos columnas adicionales en las que se muestre un cálculo de la Edad de la persona basado en BirthDate y la Antigüedad basado en HireDate.*/

IF OBJECT_ID (N'HumanResources.ufn_EmployeeList') IS NOT NULL
   DROP FUNCTION HumanResources.ufn_EmployeeList
GO

CREATE FUNCTION HumanResources.ufn_EmployeeList (@Parameter INT = null)
RETURNS @EmployeeList TABLE (
		LoginID NVARCHAR(256),
		JobTitle NVARCHAR(50),
		BirthDate date,
		HireDate date,
		Edad INT,
		Antiguedad INT
	)
AS 
BEGIN 
	IF(@Parameter IS NULL OR @Parameter IS NOT NULL)
	INSERT @EmployeeList(LoginID, JobTitle, BirthDate, HireDate, Edad, Antiguedad)
	SELECT HRE.LoginID, HRE.JobTitle, HRE.BirthDate, HRE.HireDate, DATEDIFF(YEAR,BirthDate, GETDATE()) as Edad, DATEDIFF(YEAR,HireDate, GETDATE()) as Antiguedad
	FROM HumanResources.Employee HRE
	group by LoginID, JobTitle, BirthDate, HireDate

	RETURN;
END
GO

SELECT * FROM HumanResources.ufn_EmployeeList (null)
GO