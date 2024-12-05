
select * from [dbo].[stg_COMPLEMENTO_VALORESFV](nolock)

select * from vw_FicheViagensGeral(nolock)
select * from [dbo].[vw_FicheViagensGeral](nolock)

CREATE VIEW vw_COMPLEMENTO_VALORESFV as

select distinct CONCAT(CdEmpresa, ' - ', NrFicha) as ID_FICHA from [dbo].[stg_COMPLEMENTO_VALORESFV](nolock) 


select distinct concat(EmpresaFicha,' - ',NrFicha) as ID_Ficha from [dbo].[vw_FicheViagensGeral](nolock)


select * from [dbo].[vw_FicheViagensGeral] AS t

LEFT JOIN vw_COMPLEMENTO_VALORESFV AS tp

ON t.ID_FICHA = tp.ID_FICHA 


select * from [dbo].[vw_FicheViagensGeral] AS t

RIGHT  JOIN vw_COMPLEMENTO_VALORESFV AS tp

ON t.ID_FICHA = tp.ID_FICHA 


select* from [dbo].[vw_FicheViagensGeral] AS t

FULL outer JOIN vw_COMPLEMENTO_VALORESFV AS tp

ON t.ID_FICHA = tp.ID_FICHA 



select* from [dbo].[vw_FicheViagensGeral] AS t

CROSS JOIN vw_COMPLEMENTO_VALORESFV AS tp

where t.ID_FICHA = tp.ID_FICHA 