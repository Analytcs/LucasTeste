USE [DBStage]
GO

/****** Object:  View [dbo].[vw_vw_PerformaceGeral_JUST]    Script Date: 19/02/2023 14:59:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vw_vw_PerformaceGeral_JUST] as
 SELECT * FROM vw_PerformaceGeral (nolock)
 left join 
 vw_Justificativa
ON vw_PerformaceGeral.IDCTEPERF =  vw_Justificativa.IDDOCUMENTO
GO


select * from  vw_Justificativa
where IDDOCUMENTO like '%240'
 where CTeNr = '240' and CTeEmpresa= '5'



select * from [dbo].[vw_ClientePerfilEntrega](nolock)

 SELECT IDCTEPERF,CTeEmpresa, DsTpDoctoFiscal, CTeNr FROM vw_PerformaceGeral (nolock)
  where DsTpDoctoFiscal is null

 where CTeNr = '240' and CTeEmpresa= '5'