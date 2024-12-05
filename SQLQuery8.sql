create view vw_CTE_Trecho as

select [id cte], id_trecho, min([Interacao]) as dtInteracao
from 
[dbo].[stg_Auditoria_Entrega] (nolock)
where LEN(id_trecho)>0 
group by [id cte], id_trecho

select [id cte], id_trecho
from 
[dbo].[stg_Auditoria_Entrega] (nolock)
where [ID CTE] = '4672526332089'


select [id cte], id_trecho, min([Interacao]) as dtInteracao
from 
[dbo].[stg_Auditoria_Entrega] (nolock)
where LEN(id_trecho)>0 and
[ID CTE] = '4672526332089'
group by [id cte], id_trecho



select distinct  id_trecho from
[dbo].[stg_Auditoria_Entrega] (nolock)