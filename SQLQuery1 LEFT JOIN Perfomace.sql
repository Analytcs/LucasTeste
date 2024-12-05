select concat(CTeEmpresa,' - ', CTeNr,' - ', TipoEmissao)as IDPER,* from [dbo].[stg_Performance_Geral](nolock)
WHERE CTeDtEmissao>= '2022-11-01 00:00:00.000'

select concat(CdEmpresa,' - ', NrDoctoFiscal,' - ', TipoEmissao)as IDCRD, * from [dbo].[stg_CRDBase] (nolock)
WHERE DtEmissao>= '2022-11-01 00:00:00.000'

ON [dbo].[stg_Performance_Geral].



select concat(CTeEmpresa,' - ', CTeNr,' - ',[dbo].[stg_Performance_Geral].TipoEmissao)as IDPER,* from [dbo].[stg_Performance_Geral](nolock)
LEFT JOIN
(select distinct concat(CdEmpresa,' - ', NrDoctoFiscal,' - ', TipoEmissao)as IDCRD, * from [dbo].[stg_CRDBase] (nolock)
WHERE DtEmissao>= '2022-11-01 00:00:00.000') as TESt 
ON concat(CTeEmpresa,' - ', CTeNr,' - ',[dbo].[stg_Performance_Geral].TipoEmissao) = TESt.IDCRD
WHERE CTeDtEmissao>= '2022-11-01 00:00:00.000'



select concat(CdEmpresa,' - ', NrDoctoFiscal,' - ', TipoEmissao)as IDCRD, count(concat(CdEmpresa,' - ', NrDoctoFiscal,' - ', TipoEmissao)) as N from [dbo].[stg_CRDBase] (nolock)
WHERE DtEmissao>= '2022-11-01 00:00:00.000' 
group by concat(CdEmpresa,' - ', NrDoctoFiscal,' - ', TipoEmissao)
order by N


