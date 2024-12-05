select 
	 CONCAT(tr.CdEmpresa,' - ',DsTpDoctoFiscal,' - ',nrdoctofiscal) as ID_CTE_CTE,
	ts.DsApelidoEmitente,
	ts.CdTpDoctoFiscal,
	ts.nrdoctofiscal,
	ts.NomeMotorista,
	ts.DsUFOrigem,
	ts.DsUFDestino,
	ts.CidadeColeta,
	ts.CidadeEntrega,
	CONVERT(datetime, DtEmissao, 103) AS DtEmissao,
	tg.DsTpDoctoFiscal,
	tr.CdEmpresa
from [dbo].[stg_CTEBase](nolock)ts inner join  [dbo].[tb_SERIE] as tg  ON ts.CdTpDoctoFiscal = tg.CdTpDoctoFiscal
inner join  [dbo].[Codigo_Empresa](nolock) as tr  ON tr.Filial_Empresa = ts.DsApelidoEmitente
where convert(datetime, DtEmissao, 103)  >='2022-01-01 00:00:00.000'