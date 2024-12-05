select * from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101'  -- i.e. 00:00 of the next day

select DISTINCT concat(EmpresaFicha, NrFicha) from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101'  -- i.e. 00:00 of the next day

select sum(Prestacao) from
(select IDFicha, sum(VLTotalPrestacao) as Prestacao from
(select concat(EmpresaFicha, NrFicha) as IDFicha, VlTotalPrestacao from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101') as tabe -- i.e. 00:00 of the next day 
group by IDFicha) as Soma 




select sum(Prestacao) from
(select IDCTE, sum(VLTotalPrestacao) as Prestacao from
(select  DISTINCT concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) as IDCTE, VLTotalPrestacao from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20221109') as tabe -- i.e. 00:00 of the next day 
group by IDCTE) as Soma 


select DISTINCT concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101'  -- i.e. 00:00 of the next day


select DISTINCT VlTotalPrestacao, concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) as IDCTE from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101'
AND concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) = '1410602CT-e 57 7'



select sum(Prestacao) from
(select DISTINCT IDCTE, sum(VLTotalPrestacao) as Prestacao from
(select  DISTINCT concat(concat(EmpresaCTE, NrDoctoFiscal),TipoDoctoFiscal) as IDCTE, VLTotalPrestacao from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20221109') as tabe -- i.e. 00:00 of the next day 
group by IDCTE) as Soma 


select sum(Comissao) from
(select IDFicha, sum(VLComissao) as Comissao from
(select DISTINCT concat(EmpresaFicha, NrFicha) as IDFicha, VLComissao from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101') as tabe -- i.e. 00:00 of the next day 
group by IDFicha) as Soma 

select MAX(DtEmissaoRmMan) as DtEmissao from [dbo].[stg_Base_Viagens_Geral] (nolock)


select sum(ValorCTRB) from
(select NumeroCTRB, sum(ValorTotalCTRB) as ValorCTRB from
(select DISTINCT NumeroCTRB, ValorTotalCTRB, concat(EmpresaFicha, NrFicha) as IDFicha from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101') as tabe -- i.e. 00:00 of the next day 
group by NumeroCTRB, IDFicha) as Soma 

concat(EmpresaFicha, NrFicha) as IDFicha,

select sum(ValorCTRB) from
(select NumeroCTRB, sum(ValorTotalCTRB) as ValorCTRB from
(select DISTINCT NumeroCTRB, ValorTotalCTRB, concat(EmpresaFicha, NrFicha) as IDFicha from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101' AND concat(EmpresaFicha, NrFicha) = '') as tabe -- i.e. 00:00 of the next day 
group by NumeroCTRB, IDFicha) as Soma 


select count(NumeroCTRB) as Qunat from
(select  *, concat(EmpresaFicha, NrFicha) as IDFicha from [dbo].[stg_Base_Viagens_Geral] (nolock)
WHERE (DtEmissaoRmMan >= '20220101' AND DtEmissaoRmMan < '20230101' )) as Teste
group by NumeroCTRB, IDFicha

select DISTINCT NumeroCTRB, ValorTotalCTRB, concat(EmpresaFicha, NrFicha) as IDFicha from [dbo].[stg_Base_Viagens_Geral] 

AND concat(EmpresaFicha, NrFicha) = ''

AND concat(EmpresaFicha, NrFicha) = ''

select sum(ValorTotalCTRB) from
(select NumeroCTRB, ValorTotalCTRB, NrFicha  from [dbo].[stg_Base_Viagens_Geral]) as teste
where NumeroCTRB = 16 and NrFicha >0

select sum(ValorTotalCTRB)  from
(select DISTINCT NumeroCTRB, convert(float, ValorTotalCTRB)as ValorTotalCTRB  from [dbo].[stg_Base_Viagens_Geral]
where NumeroCTRB >0 AND  DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101' order by NumeroCTRB) as teste order by NumeroCTRB

select sum(ValorTotalCTRB) as teste from
(select DISTINCT NumeroCTRB, ValorTotalCTRB  from  [dbo].[stg_Base_Viagens_Geral] where NrFicha IS NULL)as teste
group by NumeroCTRB, ValorTotalCTRB


and 
DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101')

, concat(EmpresaFicha, NrFicha) as IDFicha

select count(*) from
select count(*)  from [dbo].[stg_Base_Viagens_Geral]
where NumeroCTRB >0 AND  DtEmissaoRmMan >= '20220101'  AND DtEmissaoRmMan < '20230101' 