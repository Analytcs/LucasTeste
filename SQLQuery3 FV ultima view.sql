select distinct EmpresaFicha from [dbo].[vw_Ficha_Viagens_Geral_Unica_Custo](nolock)

where IDFicha = '74 - 92'

select * from [dbo].[vw_Custo_Adicionais_FV](nolock)
where CdEmpresa = '74' and InDeslocamentoVazio = 1

select * from [dbo].[vw_Custo_Adicionais_FV](nolock)
where  InDeslocamentoVazio = 1

order by 1
where ID_FICHA = '74 - 92'

select distinct EmpresaFicha from [dbo].[stg_Base_Viagens_Geral](nolock) 
where EmpresaFicha = 70

select distinct CdEmpresa from [dbo].[vw_Custo_Adicionais_FV](nolock)order by 1


select distinct EmpresaCTE from [dbo].[stg_Base_Viagens_Geral](nolock) 
where EmpresaFicha = 71

select * from [dbo].[stg_Base_Viagens_Geral](nolock)
where EmpresaFicha = 14164
where EmpresaFicha = 74 order by 1


select * from [dbo].[vw_Ficha_Viagens_Geral_Unica](nolock)
where EmpresaFicha = 74

select * from[dbo].[vw_Ficha_Viagens_Geral_Unica_Custo](nolock)
where EmpresaFicha = 14164

select * from [dbo].[vw_FicheViagensGeral](nolock)

select distinct IDFicha from [dbo].[vw_Ficha_Viagens_Geral_Unica](nolock)