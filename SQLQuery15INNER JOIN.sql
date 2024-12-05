select max(DtPrevisaoEntregaCTe )from [dbo].[stg_Performance_Geral] (nolock)

select *from [dbo].[tbl_Performa_MesoRegiao]
select distinct Nome_Municipio from [dbo].[tbl_Performa_MesoRegiao]

select distinct Nome_Município from [dbo].[tbl_MesorRegiao]


select * from [dbo].[tbl_MesorRegiao]

sp_rename 'tbl_MesorRegiao.Cidade' , 'Estados', 'COLUMN'

select * from [dbo].[tbl_MesorRegiao]

select * from [dbo].[tblRegiao]


create view vw_Mesorregiao as 

SELECT 
		tbl_MesorRegiao.UF
      ,tbl_MesorRegiao.Estados
      ,tbl_MesorRegiao."Região Intermediária"
      ,tbl_MesorRegiao."Região Imediata"
      ,tbl_MesorRegiao."Mesorregião Geográfica"
      ,tbl_MesorRegiao."Nome_Mesorregião"
      ,tbl_MesorRegiao."Microrregião Geográfica"
      ,tbl_MesorRegiao."Nome_Microrregião"
      ,tbl_MesorRegiao."Código Município"
      ,tbl_MesorRegiao."Nome_Município"
      ,tbl_MesorRegiao."Código de Distrito"
      ,tbl_MesorRegiao."Nome_Distrito"
	  ,tblRegiao.Pais
	  ,tblRegiao.Regiao
	  ,tblRegiao.Estados

	FROM tbl_MesorRegiao 

	INNER JOIN tblRegiao

	ON tbl_MesorRegiao.Estados = tblRegiao.Estados;

SELECT *
	FROM 
	Pais,
	Regiao,
	Estados tbl_MesorRegiao 

INNER JOIN tblRegiao
 UF as "UF Sigla",
 Pais,
 Regiao,
 Estados

ON tbl_MesorRegiao.Estados = tblRegiao.Estados;