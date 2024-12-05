select * from STG_Controle_Processamento
where status_id = 2 

select * from STG_Pacote

update STG_Controle_Processamento set status_id = 1, end_date = GETDATE()
where proc_id = 3304