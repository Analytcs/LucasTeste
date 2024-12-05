select * from [dbo].[stg_Auditoria_Entrega](nolock)

select * from [dbo].[vw_PerformaceGeral](nolock)


select * from STG_Controle_Processamento
where pacote_id = 7 and status_id = 2 


where status_id = 2 

select * from STG_Pacote

update STG_Controle_Processamento set status_id = 1, end_date = GETDATE()
where proc_id = 4191