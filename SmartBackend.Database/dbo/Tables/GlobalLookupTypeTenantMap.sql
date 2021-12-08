CREATE TABLE [dbo].[GlobalLookupTypeTenantMap]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[GlobalLookupTypeId] UNIQUEIDENTIFIER NULL,
	[TenantId] UNIQUEIDENTIFIER NULL,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_GlobalLookupTypeTenantMap_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_GlobalLookupTypeTenantMap_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id]),
	CONSTRAINT [FK_GlobalLookupTypeTenantMap_Tenant] FOREIGN KEY ([TenantId]) REFERENCES [dbo].[Tenant] ([Id]),
	CONSTRAINT [FK_GlobalLookupTypeTenantMap_GlobalLookupType] FOREIGN KEY ([GlobalLookupTypeId]) REFERENCES [dbo].[GlobalLookupType] ([Id])
)
