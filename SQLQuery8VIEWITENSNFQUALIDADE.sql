select * from vw_itensNotaFiscal(nolock)
where DtEmissao >= '2022-12-01 00:00:00.000' and DtEmissao < '2022-12-31 00:00:00.000' and nrdoctofiscal = '10529'



select * from vw_ITENNFQUALIDADE(nolock)