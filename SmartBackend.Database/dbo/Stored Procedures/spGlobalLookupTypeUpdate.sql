----------------------------------------------------------------------------
-- Update a single record in GlobalLookupType
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeUpdate
	@Id uniqueidentifier,
	@ParentId uniqueidentifier = NULL,
	@IsSystem bit,
	@IsDeleted bit,
	@Name nvarchar(250),
	@Description nvarchar(500),
	@Locale nvarchar(10),
	@UserModifiedById uniqueidentifier,
	@ModifiedOn datetime2
-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;



	--Duplicate check
	IF(EXISTS(SELECT * FROM GlobalLookupTypeTranslation WHERE GlobalLookupTypeId!=@Id AND Upper(Name)=Upper(@Name)))
	BEGIN
		SELECT 0 AS 'Failure', 'GlobalLookupType name "'+@Name+'" already exist. Please try another name.' as Message;
		RETURN
	END


BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION TTUpdate;
			IF (@IsDeleted = 1) 
			BEGIN 
				UPDATE	GlobalLookupType
					SET	IsDeleted = COALESCE(@IsDeleted, (0))
					WHERE 	Id = @Id
			END
			ELSE
			BEGIN
			UPDATE	GlobalLookupType
				SET	ParentId = @ParentId,
	IsSystem = COALESCE(@IsSystem, (0)),
	IsDeleted = COALESCE(@IsDeleted, (0))
			WHERE 	Id = @Id

			MERGE GlobalLookupTypeTranslation WITH(HOLDLOCK) AS TARGET
			USING (VALUES ( @Name, @Description, @UserModifiedById, @ModifiedOn, @IsDeleted))
				AS SOURCE ( Name, Description, UserModifiedById, ModifiedOn, IsDeleted)
				ON TARGET.GlobalLookupTypeId = @Id AND TARGET.Locale = @Locale
			WHEN MATCHED THEN
				UPDATE
				SET Name = SOURCE.Name,
					Description = SOURCE.Description,
					UserModifiedById = SOURCE.UserModifiedById,
					ModifiedOn = SOURCE.ModifiedOn,
					IsDeleted = SOURCE.IsDeleted
			WHEN NOT MATCHED THEN
				INSERT ( Id, GlobalLookupTypeId, Name, Description, Locale, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn, IsDeleted )
				VALUES ( NEWID(), @Id, @Name, @Description, @Locale, @UserModifiedById, @ModifiedOn, NULL, NULL, COALESCE(@IsDeleted, (0)) );
			END
		COMMIT TRANSACTION TTUpdate;
		Select 1 as 'Success'
	END TRY
	BEGIN CATCH
	    EXEC spGetErrorInfo;
		IF(@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION TTUpdate;
			PRINT 'Error detected, all changes reversed';
		END;
		
	END CATCH;
END;

end