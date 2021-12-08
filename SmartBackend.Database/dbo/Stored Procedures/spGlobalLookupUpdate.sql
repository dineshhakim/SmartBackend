----------------------------------------------------------------------------
-- Update a single record in GlobalLookup
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupUpdate
	@Id uniqueidentifier,
	@GlobalLookupTypeId uniqueidentifier = NULL,
	@ParentId uniqueidentifier = NULL,
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
	IF(EXISTS(SELECT * FROM GlobalLookupTranslation TLT INNER JOIN GlobalLookup TL ON TL.Id = TLT.GlobalLookupId WHERE Upper(TLT.Name)=Upper(@Name) AND TL.GlobalLookupTypeId = @GlobalLookupTypeId and TLT.GlobalLookupId!=@Id ))
	BEGIN
		SELECT 0 AS 'Failure', 'GlobalLookup name "'+@Name+'" already exist. Please try another name.' as Message;
		RETURN
	END


BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION TTUpdate;
			IF (@IsDeleted = 1) 
			BEGIN 
				UPDATE	GlobalLookup
					SET	IsDeleted = COALESCE(@IsDeleted, (0))
					WHERE 	Id = @Id
			END
			ELSE
			BEGIN
			UPDATE	GlobalLookup
				SET	GlobalLookupTypeId = @GlobalLookupTypeId,
	ParentId = @ParentId,
	IsDeleted = COALESCE(@IsDeleted, (0))
			WHERE 	Id = @Id

			MERGE GlobalLookupTranslation WITH(HOLDLOCK) AS TARGET
			USING (VALUES ( @Name, @Description, @UserModifiedById, @ModifiedOn, @IsDeleted))
				AS SOURCE ( Name, Description, UserModifiedById, ModifiedOn, IsDeleted)
				ON TARGET.GlobalLookupId = @Id AND TARGET.Locale = @Locale
			WHEN MATCHED THEN
				UPDATE
				SET Name = SOURCE.Name,
					Description = SOURCE.Description,
					UserModifiedById = SOURCE.UserModifiedById,
					ModifiedOn = SOURCE.ModifiedOn,
					IsDeleted = SOURCE.IsDeleted
			WHEN NOT MATCHED THEN
				INSERT ( Id, GlobalLookupId, Name, Description, Locale, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn, IsDeleted )
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
