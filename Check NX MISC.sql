SELECT  
	Makho,
	MaVatTu,
	Tenvattu,
	TRY_CAST(REPLACE(REPLACE(LTRIM(RTRIM(Soluong1)),'.',''),',','.') AS decimal(18,2))Soluong1,
	TRY_CAST(REPLACE(REPLACE(LTRIM(RTRIM(Soluong2)),'.',''),',','.') AS decimal(18,2))Soluong2,
	DienGiai
  FROM [HSG].[dbo].[INV_RPT_044_v2_GD2]
  WHERE LoaiGiaoDich IN ('Miscellaneous receipt', 'Move Order Issue')
  AND MaKho IN ('20L', '22L', '42L', '44L')
  AND TRY_CONVERT(date,NgayChungTu,103) > '01/01/2026'
  AND DienGiai NOT LIKE N'%bể%'
  ORDER BY TRY_CONVERT(date,NgayChungTu,103)