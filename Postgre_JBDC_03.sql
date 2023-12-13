--//1.Example: Create a function which uses 2 parameters and return the sum of the parameters

CREATE OR REPLACE FUNCTION additionF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS 
$$
BEGIN


RETURN x + y;



END
$$


SELECT * FROM additionF(555, 111) AS "Addition";