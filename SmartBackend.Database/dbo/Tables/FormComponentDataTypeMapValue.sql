CREATE TABLE [dbo].[FormComponentDataTypeMapValue]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[FormComponentEntityMapId] UNIQUEIDENTIFIER NULL,
	[FormComponentDataTypeMapId] uniqueIdentifier NULL,
	[EntityId] uniqueIdentifier NULL,
	[EntityIdentifierId] UNIQUEIDENTIFIER  NULL,
	[Value] nvarchar(MAX) NULL,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponentDataTypeMapValue_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_FormComponentDataTypeMapValue_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
