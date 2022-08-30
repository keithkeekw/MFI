--- Create a table to store the information in an array form
DECLARE @Array_IDs TABLE (ProgID INT)
INSERT INTO @Array_IDs VALUES (10336092),(10336091)

SELECT * FROM msaProgramme WITH (NOLOCK)
WHERE ProgrammeID IN (SELECT ProgID FROM @Array_IDs)
ORDER BY ProgrammeID DESC