select * from stg_controle_processamento where pacote_id = 6

select * from STG_Pacote where pacote_nome like 'ssis_stg_CRD_Base_Ficha_Viagens'


update stg_controle_processamento
set end_date = getdate(),
status_id = 1
where proc_id = 2577