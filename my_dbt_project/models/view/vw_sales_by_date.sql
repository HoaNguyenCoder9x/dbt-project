select invoice_date, date_trunc('MONTH',invoice_date) as invoice_month, date_trunc('YEAR',invoice_date) invoice_year , sum(total_net_amount) total_net_amount 
from {{ ref('cons_tbl_invoice_combined') }}
group by invoice_date 
