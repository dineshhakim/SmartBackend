CREATE TABLE [dbo].[GlobalLookup]
(
	[Id]  UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[TenantId] uniqueIdentifier NULL,
	[GlobalLookupTypeId] UNIQUEIDENTIFIER NULL,
	[ParentId] UNIQUEIDENTIFIER NULL,
    [IsDeleted]       BIT  DEFAULT ((0)) NOT NULL,
    [UserCreatedById] UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]       DATETIME2 (7)    NOT NULL,
	[UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
    CONSTRAINT [FK_GlobalLookup_User] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
	CONSTRAINT [FK_GlobalLookup_GlobalLookupType] FOREIGN KEY ([GlobalLookupTypeId]) REFERENCES [dbo].[GlobalLookupType] ([Id]),
	CONSTRAINT [FK_GlobalLookup_User1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
