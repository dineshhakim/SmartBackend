----------------------------------------------------------------------------
-- Insert a single record into GlobalLookupTypeTenantMap
----------------------------------------------------------------------------
CREATE PROC spGlobalLookupTypeTenantMapInsert
	@Id uniqueidentifier,
	@GlobalLookupTypeId uniqueidentifier = NULL,
	@TenantId uniqueidentifier = NULL,
	@IsDeleted bit = NULL,
	@UserCreatedById uniqueidentifier,
	@CreatedOn datetime2,
	@UserModifiedById uniqueidentifier = NULL,
	@ModifiedOn datetime2 = NULL
-- With encryption
As 
Begin
Set transaction isolation level read uncommitted;





	BEGIN TRY BEGIN TRANSACTION TTInsert;
			INSERT GlobalLookupTypeTenantMap(Id, GlobalLookupTypeId, TenantId, IsDeleted, UserCreatedById, CreatedOn, UserModifiedById, ModifiedOn)
			VALUES (@Id, @GlobalLookupTypeId, @TenantId, COALESCE(@IsDeleted, (0)), @UserCreatedById, @CreatedOn, @UserModifiedById, @ModifiedOn)

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