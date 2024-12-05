select * from stg_CRDBase (NOLOCK) 

where PontoOperacao like '%VIX - ES' and DtEmissao >= convert(datetime,  '20220101')