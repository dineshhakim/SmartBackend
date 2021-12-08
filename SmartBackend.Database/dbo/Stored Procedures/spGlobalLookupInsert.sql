----------------------------------------------------------------------------
-- Insert a single record into GlobalLookup
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupInsert
	@Id uniqueidentifier,
	@TenantId uniqueidentifier Null,
	@GlobalLookupTypeId uniqueidentifier = NULL,
	@ParentId uniqueidentifier = NULL,
	@UserCreatedById uniqueidentifier,
	@CreatedOn datetime2,
	@Name nvarchar(250),
	@Description nvarchar(500) = NULL,
	@Locale nvarchar(10)
	,@DefaultLocale nvarchar(10)
-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;



	--Duplicate check in Translation Table
	IF(EXISTS(SELECT * FROM GlobalLookupTranslation TLT INNER JOIN GlobalLookup TL ON TL.Id = TLT.GlobalLookupId WHERE Upper(TLT.Name)=Upper(@Name) AND TL.GlobalLookupTypeId = @GlobalLookupTypeId ))
	BEGIN
		SELECT 0 AS 'Failure', 'Lookup name "'+@Name+'" already exist. Please try another name.' as Message;
		RETURN
	END


	BEGIN TRY BEGIN TRANSACTION TTInsert;
			INSERT GlobalLookup(Id,TenantId, GlobalLookupTypeId, ParentId, IsDeleted, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn)
			VALUES (@Id,@TenantId, @GlobalLookupTypeId, @ParentId, 0, @UserCreatedById, @CreatedOn, null, null)

			INSERT GlobalLookupTranslation(Id, GlobalLookupId, Name, Description, Locale, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn, IsDeleted)
			VALUES (NEWID(), @Id, @Name, @Description, @DefaultLocale, @UserCreatedById, @CreatedOn, NULL, NULL, 0)


			IF(@Locale <> @DefaultLocale)
			BEGIN 
				INSERT GlobalLookupTranslation(Id, GlobalLookupId, Name, Description, Locale, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn, IsDeleted)
				VALUES (NEWID(), @Id, @Name, @Description, @Locale, @UserCreatedById, @CreatedOn, NULL, NULL, 0)

			END
		COMMIT TRANSACTION TTInsert;

		SELECT 1 AS 'Success';
	END TRY
	BEGIN CATCH
		
	
	EXEC spGetErrorInfo;

		IF(@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION TTInsert;
			PRINT 'Error detected, all changes reversed';
		END;
		
	END CATCH;

	end
