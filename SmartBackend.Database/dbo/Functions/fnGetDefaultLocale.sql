CREATE FUNCTION [dbo].[fnGetDefaultLocale] ()
RETURNS nvarchar(10)  as
BEGIN
	Declare  @DefaultLocale  nvarchar(10) ='en-us'
	 
	return @DefaultLocale
END
