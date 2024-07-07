select 
 hdr.invoice_no
,hdr.distributor_code
,hdr.customer_code
,hdr.route_code
,hdr.order_no
,hdr.invoice_date
,hdr.invoice_due_date
,hdr.order_date
,hdr.delivery_date
,hdr.total_net_amount
,dtl.product_code
,dtl.product_quantity
,rtn.credit_note_no
,rtn.credit_note_date as return_date
,rtn.remark 


from {{ source('my_source', 'invoice_header_tbl') }}  hdr
left join {{ source('my_source', 'invoice_dtl_tbl') }} dtl on dtl.invoice_no  = hdr.invoice_no 
								and dtl.distributor_code  = hdr.distributor_code 
								and dtl.customer_code  = hdr.customer_code 
								and dtl.route_code  = hdr.route_code 
			
left join {{ source('my_source', 'invoice_return_tbl') }} rtn on rtn.invoice_no  = hdr.invoice_no 
								and rtn.distributor_code  = hdr.distributor_code 
								and rtn.customer_code  = hdr.customer_code 
								and rtn.route_code  = hdr.route_code

where hdr.distributor_code <> '12345678'
