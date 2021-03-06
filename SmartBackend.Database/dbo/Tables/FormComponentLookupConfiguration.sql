CREATE TABLE [dbo].[FormComponentLookupConfiguration]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	[LocalizationKey] NVARCHAR(255) NULL,
	[TableName] NVARCHAR( 255) NULL,
	[TranslationTableName] nvarchar(255)  NULL,
	[ColumnId] nvarchar(255) NULL,
	[ColumnName] nvarchar(255) NULL,
	[TranslationColumnId] nvarchar(255) NULL,
	[TranslationColumnName] nvarchar(255) NULL,
	[ParentId] uniqueIdentifier NULL,
	[ParentColumnName] nvarchar (255) NULL,
	[IsTranslationTable] BIT NULL DEFAULT 0,
	[IsGlobalLookup]	BIT NULL DEFAULT 0,	
	[GlobalLookupTypeId] uniqueIdentifier NULL,
	[IsAllTenantLookup]	BIT NULL DEFAULT 0,
	[FormComponentId] uniqueIdentifier NULL,
	[PermissionId]	INT NULL,
	[PostURL] nvarchar(500) NULL,
	[PutURL] nvarchar(500) NULL,
	[DeleteURL] nvarchar(500) NULL,
	[GridURL] nvarchar(500) NULL,
	[GetAllURL] nvarchar(500) NULL,
	[GetByIdURL] nvarchar(500) NULL,
	[GetByTenantURL] nvarchar(500) NULL,
	[GetAllForDropdown] nvarchar(500) NULL,
	[LookupGroupId] UNIQUEIDENTIFIER NULL,
	[IsDeleted]        BIT NOT NULL DEFAULT 0,
	[IsDeletedAllow]   BIT NULL DEFAULT 0,
	[Sequence]	INT	NULL,	
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	[CacheRegion] nvarchar(255) NULL,
	[IsCaseSensitive] BIT NULL DEFAULT 0, 
    CONSTRAINT [FK_FormComponentLookupConfiguration_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_FormComponentLookupConfiguration_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
