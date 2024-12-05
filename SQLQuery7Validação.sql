
select count(NumeroCTRB)  from [dbo].[stg_Base_Viagens_Geral]
where NumeroCTRB >0 AND  DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101' 

select sum(ValorTotalCTRB) as ValorCTRB from
(select distinct NumeroCTRB from  [dbo].[stg_Base_Viagens_Geral] where NumeroCTRB >0 and DtEmissaoCTRB>= convert(datetime,  '20220101') )as teste

, ValorTotalCTRB
group by NumeroCTRB

AND 
DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101'

select sum(ValorTotalCTRB) from
(select distinct NumeroCTRB, convert(float, ValorTotalCTRB) as ValorTotalCTRB  from  [dbo].[stg_Base_Viagens_Geral] 
where (DtEmissaoRmMan>= convert(datetime,  '20220101')and NumeroCTRB is not NULL)) as teste

select sum(ValorTotalCTRB) from
(select distinct NumeroCTRB, convert(float, ValorTotalCTRB) as ValorTotalCTRB  from  [dbo].[stg_Base_Viagens_Geral] 
where (DtEmissaoRmMan>= convert(datetime,  '20220101'))) as teste


select sum(ValorTotalCTRB) AS Valor from
(select  distinct convert(float, ValorTotalCTRB) as ValorTotalCTRB , concat(EmpresaFicha, NrFicha) as IDFicha from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE (DtEmissaoRmMan >= '20220101' AND DtEmissaoRmMan < '20230101' and EmpresaFicha IS NULL )) as Teste


group by NumeroCTRB, IDFicha

select *  from [dbo].[stg_Base_Viagens_Geral] (nolock)


select sum(ValorTotalCTRB) AS Valor from
(select  distinct convert(float, ValorTotalCTRB) as ValorTotalCTRB,concat(EmpresaFicha, NrFicha) as IDFicha from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE ( DtEmissaoRmMan>= convert(datetime,  '20220101')and concat(EmpresaFicha, NrFicha)!='')) as Teste

select concat(EmpresaFicha, NrFicha) as IdFicha from [dbo].[stg_Base_Viagens_Geral] (nolock)
where concat(EmpresaFicha, NrFicha)!=''

select sum(VLtotalPrestacao) AS Valor from
(select VLtotalPrestacao  from [dbo].[stg_Base_Viagens_Geral] where NumeroCTRB = 10050) as teste

select *  from [dbo].[stg_Base_Viagens_Geral]

select sum(Prestacao) from
(select DISTINCT IDCTE, sum(VLTotalPrestacao) as Prestacao from
(select  DISTINCT concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) as IDCTE, convert(float, VLTotalPrestacao) as VLTotalPrestacao 
from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >=convert(datetime,  '20220101')) as tabe -- i.e. 00:00 of the next day 
group by IDCTE) as Soma 

select sum(VLTotalPrestacao) from
(select distinct concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) as IDCTE, convert(float, VLTotalPrestacao) as VLTotalPrestacao 
from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE (DtEmissaoRmMan >=convert(datetime,  '20220101') and concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) = '143547CT-e 57 7') and EmpresaCTE >0) as teste