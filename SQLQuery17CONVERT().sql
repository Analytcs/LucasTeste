SELECT  convert(datetime, DtEmissao, 103) as DtEmissao
 FROM [stg_CTEBase]
 where convert(datetime, DtEmissao, 103)  >='2022-01-01 00:00:00.000'
 order by 1



WHERE DtEmissao >  '2022-01-01'


format(DtEmissao,datetime)
CONVERT(datetime, DtEmissao)

 convert(date, DtEmissao, 103) as DttEmissao