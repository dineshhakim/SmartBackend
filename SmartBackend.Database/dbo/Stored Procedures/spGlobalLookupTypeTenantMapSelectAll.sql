----------------------------------------------------------------------------
-- Select all records from GlobalLookupTypeTenantMap
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeTenantMapSelectAll

-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;


SELECT	Id,
	GlobalLookupTypeId,
	TenantId,
	IsDeleted,
	UserCreatedById,
	CreatedOn,
	UserModifiedById,
	ModifiedOn
FROM	GlobalLookupTypeTenantMap
WHERE 	IsDeleted =0

end