CREATE TABLE [dbo].[FormComponentAttributeType]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[Name] nvarchar(255) NOT NULL,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponentAttributeType_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[TitanUser] ([Id]),
    CONSTRAINT [FK_FormComponentAttributeType_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[TitanUser] ([Id])
)
