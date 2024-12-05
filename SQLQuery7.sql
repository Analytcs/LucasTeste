select * from [dbo].[stg_CTEBase] 
select * from [dbo].[BaseNova2_Cliente]

select * from [dbo].[stg_Auditoria_Entrega] where [ID CTE] = '4672526132087' order by id_trecho

select COUNT(distinct cdempresa) FROM [dbo].[stg_CTEBase]

select COUNT(cdempresa) FROM [dbo].[stg_CTEBase]

select *,count (cdempresa) FROM [dbo].[stg_CTEBase] GROUP BY cdempresa

select cdempresa,  count(*) as quant FROM [dbo].[stg_CTEBase] GROUP BY cdempresa having count(*)>1

select * from [dbo].[stg_CTEBase] where cdempresa = '56693308368'


select * from [dbo].[stg_CTEBase] where cdempresa = '3622071246'

CREATE VIEW wv_Cliente_CTEBase as
select DISTINCT
cdempresa,
DsRemetente 
from [dbo].[stg_CTEBase] (nolock)


select 
cdempresa,
DsRemetente,
count(*) registros
from (select DISTINCT
cdempresa,
DsRemetente 
from [dbo].[stg_CTEBase] (nolock)) as a
group by cdempresa,
DsRemetente
--having cdempresa = '56693308368'
having count(*) >1

select DISTINCT
cdempresa,
DsRemetente 
from [dbo].[stg_CTEBase] (nolock)
where cdempresa = '56693308368'
3622071246