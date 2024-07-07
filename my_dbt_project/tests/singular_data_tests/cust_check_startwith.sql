select * 
from {{ ref('cons_tbl_customer_dim') }}
where (CUST_CD not like 'CT%')
