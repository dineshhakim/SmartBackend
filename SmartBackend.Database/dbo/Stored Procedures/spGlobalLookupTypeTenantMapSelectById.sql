----------------------------------------------------------------------------
-- Select a single record from GlobalLookupTypeTenantMap
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeTenantMapSelectById
	@Id uniqueidentifier
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
WHERE 	Id = @Id

end