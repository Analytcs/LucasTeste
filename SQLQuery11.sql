select 
CONVERT(DATETIME,  SUBSTRING(DTENTREGA,7,4) + '/' + SUBSTRING(DTENTREGA,4,2) + '/' + SUBSTRING(DTENTREGA,1,2)) DTENTREGA 
FROM [stg_CTEBase]

select 
dtentrega
FROM [stg_CTEBase]

SELECT SUBSTRING(DTENTREGA,7,4) + '/' + SUBSTRING(DTENTREGA,4,2) + '/' + SUBSTRING(DTENTREGA,1,2) DT, DTENTREGA FROM [stg_CTEBase]


select 
CONVERT(DATETIME,  SUBSTRING(dt_previsao_entrega_cte,7,4) + '/' + SUBSTRING(dt_previsao_entrega_cte,4,2) + '/' + SUBSTRING(dt_previsao_entrega_cte,1,2)) dt_previsao_entrega_cte
from [dbo].[stg_Auditoria_Entrega]


SELECT SUBSTRING(dt_previsao_entrega_cte,7,4) + '/' + SUBSTRING(dt_previsao_entrega_cte,4,2) + '/' + SUBSTRING(dt_previsao_entrega_cte,1,2) DT, dt_previsao_entrega_cte

where dt_previsao_entrega_cte = '2022-09-28 00:00:00.000'

select 
len(dt_previsao_entrega_cte)
FROM [dbo].[stg_Auditoria_Entrega]

select 
dt_previsao_entrega_cte
FROM [dbo].[stg_Auditoria_Entrega]

select 
CONVERT(DATETIME,dt_previsao_entrega_cte) dt_previsao_entrega_cte
from [dbo].[stg_Auditoria_Entrega]



SELECT DATEDIFF(day, '2022/09/25', '2022/09/28') AS DateDiff