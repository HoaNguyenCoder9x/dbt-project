select a.customer_code ,b.CUST_CD , b.CUST_NAME , ROUND( sum(a.total_net_amount ), 0) AS total_sales 
from {{ ref('cons_tbl_invoice_combined') }} a
left join {{ref('cons_tbl_customer_dim')}} b on b.CUST_CD  = a.customer_code 
left join {{ref('cons_tbl_distributor_dim')}} c on a.distributor_code  = c.sitecode 
where c.gba  = 'GT'
 
group by a.customer_code ,b.CUST_CD , b.CUST_NAME 
order by sum(a.total_net_amount) desc
LIMIT 20
