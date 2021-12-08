CREATE TABLE [dbo].[FormComponentDataTypeMapOption]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[FormComponentDataTypeMapId] uniqueIdentifier NULL,
	[Name] nvarchar(255) NULL,
	[DisplayOrder] Int NULL,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponentDataTypeMapOption_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[TitanUser] ([Id]),
    CONSTRAINT [FK_FormComponentDataTypeMapOption_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[TitanUser] ([Id])
)
