/*
Script to get Form Designer Information
*/

--- Find all the IDs
DECLARE @LD_Name NVARCHAR(100) = 'Sec Event Liyana'

SELECT
	LD.LayoutDesignID,
	LD.LayoutDesignName,
	LD_G.LayoutDesignGroupID,
	LD_G.LayoutDesignGroupName,
	LD_F.LayoutDesignFieldsID,
	LD_F.FieldName,
	M.MenuName
FROM msaLayoutDesign LD
LEFT JOIN msaLayoutDesignGroup LD_G ON LD_G.LayoutDesignID = LD.LayoutDesignID
LEFT JOIN msaLayoutDesignFields LD_F ON LD_F.LayoutDesignGroupID = LD_G.LayoutDesignGroupID
LEFT JOIN msaMenu M ON M.MenuID = LD.MenuId
WHERE
	LD.LayoutDesignName = @LD_Name

--- Show the layout field settings
SELECT
	UserDefinedFieldID,
	LayoutDesignGroupName,
	FieldName,
	DisplayName,
	ControlType,
	Description,
	DropDownValueList,
	DropDownSource,
	M.MenuName
FROM msaUserDefinedFieldsMetadata UD_M
LEFT JOIN msaLayoutDesignGroup LD_G ON LD_G.LayoutDesignID = UD_M.LayoutDesignGroupID
LEFT JOIN msaMenu M ON M.MenuID = UD_M.MenuID
WHERE LD_G.LayoutDesignGroupName LIKE '%Liyana%'


--- Display the value of field for each record
SELECT
	UDFieldValueID,
	UD_M.DisplayName,
	UD_M.FieldName,
	RecordID,
	Value,
	AuditLastModifiedDate,
	M.MenuName
FROM msaUserDefinedFieldsValue UD_V
LEFT JOIN msaUserDefinedFieldsMetadata UD_M ON UD_M.UserDefinedFieldID = UD_V.UserDefinedFieldID
LEFT JOIN msaMenu M ON M.MenuID = UD_M.MenuID