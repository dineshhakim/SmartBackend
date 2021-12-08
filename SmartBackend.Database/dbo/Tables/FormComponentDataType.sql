CREATE TABLE [dbo].[FormComponentDataType]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[Name] nvarchar(255) NULL,
	[FrontEndKey] nvarchar(255) NULL,
	[ApiUrl] nvarchar(1000) NULL,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponentDataType_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[TitanUser] ([Id]),
    CONSTRAINT [FK_FormComponentDataType_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[TitanUser] ([Id])
)
