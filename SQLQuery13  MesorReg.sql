select * from [dbo].[stg_Base_Ficha_Viagens] (nolock)

SELECT * FROM [stg_CRDBase]


SELECT * FROM [dbo].[stg_Performance_Geral] (nolock)
WHERE NFDtEmissao >= '2022-01-01 00:00:00.000' 


ULTDATAOCO >= '2022-01-01 00:00:00.000' and

select Concat(concat(CdEmpresa, NrDoctoFiscal), DsTpDoctoFiscal) as "ID CRD" from [dbo].[stg_CRDBase](nolock)


select concat(CdEmpresa,NrDoctoFiscal) as IDClienteNf,
CdEmpresa,
NrDoctoFiscal,
DsTpDoctoFiscal,
CdFatura,
DsGrupoCliente,
NotasFiscais,
ULTOCO, 
ULTUSUOCO,
ULTDATAOCO,
DsRedespacho,
CidadeRed,
UFRed,
Destinatario
from [dbo].[stg_CRDBase](nolock)
WHERE DtEmissao >= '2022-11-01 00:00:00.000'  




select 
distinct NrDoctoFiscal
from [dbo].[stg_CRDBase](nolock)
WHERE DtEmissao >= '2022-11-01 00:00:00.000' 


SELECT * FROM [dbo].[stg_Performance_Geral] (nolock)
WHERE NFDtEmissao >= '2022-01-01 00:00:00.000'



SELECT distinct CTeNr FROM [dbo].[stg_Performance_Geral] (nolock)
WHERE NFDtEmissao >= '2022-11-01 00:00:00.000' and CTeNr IN (select 
distinct NrDoctoFiscal
from [dbo].[stg_CRDBase](nolock)
WHERE DtEmissao >= '2022-11-01 00:00:00.000' )


select Concat(concat(CdEmpresa, NrDoctoFiscal), DsTpDoctoFiscal) as "ID CRD" from [dbo].[stg_CRDBase](nolock)

select * from vw_ClienteCRD_PerfilEntrega  

select * from  vw_ClientePerfilEntrega


select concat(CdEmpresa,NrDoctoFiscal,TipoEmissao) as IDCTECRD,
CdEmpresa,
NrDoctoFiscal,
DsTpDoctoFiscal,
CdFatura,
DsGrupoCliente,
NotasFiscais,
ULTOCO, 
ULTUSUOCO,
ULTDATAOCO,
DsRedespacho,
CidadeRed,
UFRed,
Destinatario
from [dbo].[stg_CRDBase](nolock)
WHERE DtEmissao >= '2022-11-01 00:00:00.000'  


SELECT 
distinct
Concat( concat(CTeEmpresa, 
CTeNr),
TipoEmissao)as IDPerformace
FROM [dbo].[stg_Performance_Geral] (nolock)
WHERE NFDtEmissao >= '2022-01-01 00:00:00.000'

select 
concat( concat(CdEmpresa,NrDoctoFiscal), TipoEmissao)
from [dbo].[stg_CRDBase](nolock)
WHERE DtEmissao >= '2022-11-01 00:00:00.000'  


select * from [tbl_Performace_Meta_Cliente]