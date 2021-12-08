----------------------------------------------------------------------------
-- Select all records from GlobalLookupType
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeSelectAll

	@Locale nvarchar(10) ='' ,
	@DefaultLocale nvarchar(10) ='' ,
	@tenantId uniqueIdentifier 
-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;

SELECT	 t.Id,
	 t.ParentId,
	 t.IsSystem,
	ISNULL(tr.Name, def.Name) Name,
	ISNULL(tr.Description, def.Description) Description,
	ISNULL(tr.Locale, def.Locale) Locale,
	ISNULL(tr.UserCreatedById, def.UserCreatedById) UserCreatedById,
	ISNULL(tr.CreatedOn, def.CreatedOn) CreatedOn,
	ISNULL(tr.UserModifiedById, def.UserModifiedById) UserModifiedById,
	ISNULL(tr.ModifiedOn, def.ModifiedOn) ModifiedOn,
	ISNULL(tr.IsDeleted, def.IsDeleted) IsDeleted
FROM	GlobalLookupType t
  LEFT OUTER JOIN GlobalLookupTypeTranslation tr
    ON t.Id = tr.GlobalLookupTypeId AND tr.Locale = @Locale
  LEFT OUTER JOIN GlobalLookupTypeTranslation def
    ON t.Id = def.GlobalLookupTypeId AND def.Locale = @DefaultLocale
	LEFT OUTER JOIN GlobalLookupTypeTenantMap glttmp ON glttmp.GlobalLookupTypeId = t.Id

WHERE 	t.IsDeleted =0 AND t.IsSystem = 0   AND (glttmp.TenantId IS NULL OR glttmp.TenantId = @tenantId)  ORDER BY ISNULL(tr.Name, def.Name)

end