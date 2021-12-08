----------------------------------------------------------------------------
-- Select a single record from GlobalLookup
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupSelectById
	@Id uniqueidentifier,
	@Locale nvarchar(10) ='',
	@DefaultLocale nvarchar(10)=''
-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;


SELECT	 t.Id,
	 t.GlobalLookupTypeId AS LookupTypeId,
	 t.ParentId,
	ISNULL(tr.Name, def.Name) Name,
	ISNULL(tr.Description, def.Description) Description,
	ISNULL(tr.Locale, def.Locale) Locale,
	ISNULL(tr.UserCreatedById, def.UserCreatedById) UserCreatedById,
	ISNULL(tr.CreatedOn, def.CreatedOn) CreatedOn,
	ISNULL(tr.UserModifiedById, def.UserModifiedById) UserModifiedById,
	ISNULL(tr.ModifiedOn, def.ModifiedOn) ModifiedOn,
	ISNULL(tr.IsDeleted, def.IsDeleted) IsDeleted
FROM	GlobalLookup t
  LEFT OUTER JOIN GlobalLookupTranslation tr
    ON t.Id = tr.GlobalLookupId AND tr.Locale = @Locale
  LEFT OUTER JOIN GlobalLookupTranslation def
    ON t.Id = def.GlobalLookupId AND def.Locale = @DefaultLocale
WHERE 	t.Id = @Id


end
