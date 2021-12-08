----------------------------------------------------------------------------
-- Insert a single record into GlobalLookupType
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeInsert
	@Id uniqueidentifier,
	@ParentId uniqueidentifier = NULL,
	@IsSystem bit = NULL,
	@IsDeleted bit = NULL,
	@UserCreatedById uniqueidentifier,
	@CreatedOn datetime2,
	@UserModifiedById uniqueidentifier = NULL,
	@ModifiedOn datetime2 = NULL,
	@Name nvarchar(250),
	@Description nvarchar(500) = NULL,
	@Locale nvarchar(10)
	,@DefaultLocale nvarchar(10)
	-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;



	--Duplicate check in Translation Table
	IF (EXISTS(SELECT * FROM GlobalLookupTypeTranslation WHERE Upper(Name)=Upper(@Name)))
	BEGIN
		SELECT 0 AS 'Failure', 'GlobalLookupType name "'+@Name+'" already exist. Please try another name.' as Message;
		RETURN
	END


	BEGIN TRY BEGIN TRANSACTION TTInsert;
			
			INSERT GlobalLookupType(Id, ParentId, IsSystem, IsDeleted, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn)
			VALUES (@Id, @ParentId, COALESCE(@IsSystem, (0)), COALESCE(@IsDeleted, (0)), @UserCreatedById, @CreatedOn, @UserModifiedById, @ModifiedOn)

			INSERT GlobalLookupTypeTranslation(Id, GlobalLookupTypeId, Name, Description, Locale, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn, IsDeleted)
			VALUES (NEWID(), @Id, @Name, @Description, @DefaultLocale, @UserCreatedById, @CreatedOn, NULL, NULL, COALESCE(@IsDeleted, (0)))


			IF(@Locale <> @DefaultLocale)
			BEGIN 
				INSERT GlobalLookupTypeTranslation(Id, GlobalLookupTypeId, Name, Description, Locale, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn, IsDeleted)
				VALUES (NEWID(), @Id, @Name, @Description, @Locale, @UserCreatedById, @CreatedOn, NULL, NULL, COALESCE(@IsDeleted, (0)))

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