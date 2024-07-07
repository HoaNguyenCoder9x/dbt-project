select 
	 region as gba
	,area as region
	,sitecode 
	,status 
	,route_code_accenture 
	,sales_accenture_code 
	,sale_person_name 
	,dsr_type 
	,territory_code 
	,gender 
	,joining_date 
	,create_date 
	,stop_date 
	,day_of_birth 
	,usm_name
	,usm_id 
	,asm_name
	,asm_id 
	,rsm_name 
	,rsm_id 
from {{ source('my_source','salesman_infor_tbl') }}  
where lower(status) in ('working', 'vacancy')