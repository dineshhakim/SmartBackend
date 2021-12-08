CREATE PROCEDURE spGetErrorInfo  
 -- With encryption
As 
Begin
Set transaction isolation level read uncommitted;
 
    SELECT   
	     0 as Success,
         ERROR_NUMBER() AS Number  
        ,ERROR_SEVERITY() AS Severity  
        ,ERROR_STATE() AS State  
        ,ERROR_LINE () AS LineNumber  
        ,ERROR_PROCEDURE() AS StoredProcedureName  
        ,ERROR_MESSAGE() AS Message;  
        end
GO
