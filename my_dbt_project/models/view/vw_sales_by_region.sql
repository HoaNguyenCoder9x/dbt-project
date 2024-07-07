with 
t1
as
(
select b.gba, b.region, b.province,b.key_cities
,sum(a.total_net_amount) total_net_amount 

from {{ ref('cons_tbl_invoice_combined') }} a
left join 
{{ref('cons_tbl_distributor_dim' )}}  b on b.sitecode = a.distributor_code 
where a.return_date  is NULL and gba = 'GT'
group by b.gba, b.region, b.province,b.key_cities
)
,

t0
as
(
select * , sum(total_net_amount) over () as total_sales
from t1
)


select *, round((total_net_amount *100) / total_sales,2) percentage
from t0 
order by total_net_amount desc