create  function check_registration(@username nvarchar(50) , @password nvarchar(50))
returns @response table(
message_ nvarchar(50)
)
as 
begin 
with reg(column_) as (
 select 
	   case when  Count(*)>0 then 'success' else 'can not find user' end  
	   from registration where username =@username and password_ =@password
)
insert  @response
select column_ from reg
return 
end 

select * from dbo.check_registration('Tahir' , '12134')