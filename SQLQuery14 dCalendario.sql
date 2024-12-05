
CREATE VIEW vw_Ficha_Manifesto as
select 
distinct CONCAT(EmpresaFicha, NrFicha) as IDFicha,
EmpresaRomaneio,
RotaRomaneio,
RomaneioManifesto
from [dbo].[stg_Base_Viagens_Geral](nolock)
WHERE CONCAT(EmpresaFicha, NrFicha)>0 and  EmpresaRomaneio IS NULL and RotaRomaneio IS NULL and DtEmissaoRmMan >='2022-01-01 00:00:00.000'



CREATE VIEW vw_Ficha_Romaneio as
select 
distinct CONCAT(EmpresaFicha, NrFicha) as IDFicha,
EmpresaRomaneio,
RotaRomaneio,
RomaneioManifesto
from [dbo].[stg_Base_Viagens_Geral](nolock)
WHERE CONCAT(EmpresaFicha, NrFicha)>0 and EmpresaRomaneio>0 and RotaRomaneio>0 and DtEmissaoRmMan >='2022-01-01 00:00:00.000'

select * from [dbo].[vw_Ficha_Manifesto]

select * from [dbo].[vw_Ficha_Romaneio]



select 
CONCAT(EmpresaFicha, NrFicha) as IDFicha,
EmpresaRomaneio,
RotaRomaneio,
RomaneioManifesto,
DtEmissaoRmMan

from [dbo].[stg_Base_Viagens_Geral](nolock)
where CONCAT(EmpresaFicha, NrFicha) = '13214' and DtEmissaoRmMan >='2022-12-01 00:00:00.000'

select distinct CdEmpresa from [dbo].[stg_Base_Ficha_Viagens] (nolock)

select distinct EmpresaCTE from [dbo].[stg_Base_Viagens_Geral](nolock)