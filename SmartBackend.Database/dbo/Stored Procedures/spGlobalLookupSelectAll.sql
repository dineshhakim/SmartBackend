----------------------------------------------------------------------------
-- Select all records from GlobalLookup
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupSelectAll

	@Locale nvarchar(10) ='' ,
	@DefaultLocale nvarchar(10) ='' 
-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;

SELECT	 
	t.Id,
	t.GlobalLookupTypeId AS LookupTypeId,
	ISNULL(tltt.Name, dtltt.Name) LookupTypeName,
	t.ParentId AS ParentValue,
	ISNULL(ptr.Name, pdef.Name) ParentValueName,
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

		LEFT OUTER JOIN GlobalLookupTypeTranslation tltt
	ON tltt.GlobalLookupTypeId = t.GlobalLookupTypeId AND tltt.Locale = @Locale
	LEFT OUTER JOIN GlobalLookupTypeTranslation dtltt
	ON dtltt.GlobalLookupTypeId = t.GlobalLookupTypeId AND dtltt.Locale = @DefaultLocale

	  LEFT OUTER JOIN GlobalLookupTranslation ptr
		ON t.ParentId = ptr.GlobalLookupId AND ptr.Locale = @Locale
	 LEFT OUTER JOIN GlobalLookupTranslation pdef
    ON t.ParentId = pdef.GlobalLookupId AND pdef.Locale = @DefaultLocale

WHERE 	t.IsDeleted =0
ORDER BY tr.Name

end

