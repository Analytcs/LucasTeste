select distinct NumeroCTRB
from stg_Base_Viagens_Geral

select distinct NrFicha, NumeroCTRB, COUNT(*) as Nome from stg_Base_Viagens_Geral  group by NumeroCTRB HAVING COUNT(*)>1

select  NumeroCTRB,  count(*) as quant FROM [dbo].stg_Base_Viagens_Geral GROUP BY NumeroCTRB having count(*)>1

select *,count (NumeroCTRB) FROM stg_Base_Viagens_Geral GROUP BY NumeroCTRB

select * from Codigo_Empresa