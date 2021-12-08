----------------------------------------------------------------------------
-- Update a single record in GlobalLookupTypeTenantMap
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeTenantMapUpdate
	@Id uniqueidentifier,
	@GlobalLookupTypeId uniqueidentifier = NULL,
	@IsDeleted bit
	-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;

	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION TTUpdate;
			IF (@IsDeleted = 1) 
			BEGIN 
				UPDATE	GlobalLookupTypeTenantMap
					SET	IsDeleted = COALESCE(@IsDeleted, (0))
					WHERE 	Id = @Id
			END
			ELSE
			BEGIN
			UPDATE	GlobalLookupTypeTenantMap
				SET	GlobalLookupTypeId = @GlobalLookupTypeId,
	IsDeleted = COALESCE(@IsDeleted, (0))
			WHERE 	Id = @Id

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
