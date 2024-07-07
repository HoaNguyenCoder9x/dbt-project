select 
	 productcode
	,sapcode 
	,english_description 
	,vietnamese_decription 
	,category_level_1 
	,sub_category_level_2 
	,brand_level_3
	,subrand_level_4 
	,subrand_2_level_5 
	,type_level_6 
	,sub_type_level_7 
	,length_level8 
	,variety_level_9 
	,size_level_10 
from {{ source('my_source','sku_list_tbl') }}
where end_date_price = '9999-12-31 00:00:00.000'