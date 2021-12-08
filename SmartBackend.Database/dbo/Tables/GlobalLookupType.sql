CREATE TABLE [dbo].[GlobalLookupType]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[ParentId] UNIQUEIDENTIFIER NULL,
	[IsSystem]        BIT              NOT NULL DEFAULT 0,
	[IsGlobal]		BIT              NOT NULL DEFAULT 0,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_GlobalLookupType_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_GlobalLookupType_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
