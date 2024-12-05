select MAX(DtEmissaoRmMan) from [dbo].[stg_Base_Viagens_Geral] (nolock)

select status_nome, count(*) registros
from [dbo].[STG_Controle_Processamento] p
inner join [dbo].[STG_Status] s
on p.status_id = s.status_id
where CONVERT(varchar(10), start_date,112) = '20221116'
group by status_nome

select pacote_nome, status_nome, count(*) registros
from [dbo].[STG_Controle_Processamento] p
inner join [dbo].[STG_Status] s
on p.status_id = s.status_id
inner join [dbo].[STG_Pacote] pct
on p.pacote_id = pct.pacote_id
where CONVERT(varchar(10), start_date,112) = '20221116'
group by pacote_nome, status_nome 

select pacote_nome, status_nome, count(*) registros
from [dbo].[STG_Controle_Processamento] p
inner join [dbo].[STG_Status] s
on p.status_id = s.status_id
inner join [dbo].[STG_Pacote] pct
on p.pacote_id = pct.pacote_id
where CONVERT(varchar(10), start_date,112) = '20221116'
group by pacote_nome, status_nome 

select pacote_nome, status_nome, p.start_date, p.end_date
from [dbo].[STG_Controle_Processamento] p
inner join [dbo].[STG_Status] s
on p.status_id = s.status_id
inner join [dbo].[STG_Pacote] pct
on p.pacote_id = pct.pacote_id
where CONVERT(varchar(10), start_date,112) = '20221116'
order by start_date

