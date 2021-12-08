CREATE TABLE [dbo].[FormComponentDataTypeActionFilterMap]
(
	[Id] UniqueIdentifier NOT NULL PRIMARY KEY,
	[FormComponentDataTypeMapId] uniqueIdentifier NULL,
	[ParentId] uniqueIdentifier NULL,
	[FormComponentActionTypeId] uniqueIdentifier NULL,
	[FormComponentActionFilterId] uniqueIdentifier NULL,
	[ApiUrl] nvarchar(500) NULL,
	[Condition] nvarchar(500) NULL,
	[columnNamesToCheck] nvarchar(2000) NULL,
	[IsShowOnCreate]			BIT             NULL DEFAULT 1,
	[IsShowOnUpdate]			BIT             NULL DEFAULT 1,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponentDataTypeActionFilterMap_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[TitanUser] ([Id]),
    CONSTRAINT [FK_FormComponentDataTypeActionFilterMap_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[TitanUser] ([Id])
)
