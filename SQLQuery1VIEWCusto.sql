CREATE VIEW vw_Custo_FV_Vazio as
select t.ID_FICHA
	  ,t.CdEmpresa
      ,t.NrFicha
      ,t.VlEntregaFICHA
      ,t.VlComissaoFICHA
      ,t.QtKmRodadoRMS
      ,t.InDeslocamentoVazio
      ,t.CdMotivo
      ,t.DsMotivo
      ,t.VlAdicional
      ,t.DsObservacao
	
from [dbo].[vw_COMPLEMENTO_VALORESFV](nolock) as t
left join [dbo].[vw_FicheViagensGeral](nolock)as tp
ON t.ID_FICHA = tp.ID_FICHA
where Tp.ID_FICHA is null

select * from [dbo].[vw_vw_FicheViagensGeral_CTe_NULL](nolock)

CREATE VIEW vw_Custo_FV_Vazio as

	select * from [dbo].[vw_COMPLEMENTO_VALORESFV](nolock)as t
	LEFT JOIN [vw_FicheViagensGeral] AS tp
	ON t.ID_FICHA = tp.ID_FICHA 
	where Tp.ID_FICHA is null
select * from [dbo].[vw_vw_FicheViagensGeral_CTe_NULL](nolock)


select * from [dbo].[vw_Custo_FV_Vazio]