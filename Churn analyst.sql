WITH Giaodichcuoi AS( 
SELECT
	makhachhang,
	MAX(TRY_CONVERT(varchar,ngayxuatban,101)) lasttrans
  FROM [HSG].[dbo].[ProvinceSale]
	WHERE loaikhachhang NOT IN ('Khách hàng vãng lai', 'CBCNV Hoa Sen')
 GROUP BY makhachhang
 ) 
 SELECT 
	COUNT(*) AS churn_customers
 FROM Giaodichcuoi
 WHERE lasttrans < DATEADD(DAY,-90,GETDATE())
 SELECT COUNT(DISCTINT *)