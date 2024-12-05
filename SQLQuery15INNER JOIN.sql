select max(DtPrevisaoEntregaCTe )from [dbo].[stg_Performance_Geral] (nolock)

select *from [dbo].[tbl_Performa_MesoRegiao]
select distinct Nome_Municipio from [dbo].[tbl_Performa_MesoRegiao]

select distinct Nome_Munic�pio from [dbo].[tbl_MesorRegiao]


select * from [dbo].[tbl_MesorRegiao]

sp_rename 'tbl_MesorRegiao.Cidade' , 'Estados', 'COLUMN'

select * from [dbo].[tbl_MesorRegiao]

select * from [dbo].[tblRegiao]


create view vw_Mesorregiao as 

SELECT 
		tbl_MesorRegiao.UF
      ,tbl_MesorRegiao.Estados
      ,tbl_MesorRegiao."Regi�o Intermedi�ria"
      ,tbl_MesorRegiao."Regi�o Imediata"
      ,tbl_MesorRegiao."Mesorregi�o Geogr�fica"
      ,tbl_MesorRegiao."Nome_Mesorregi�o"
      ,tbl_MesorRegiao."Microrregi�o Geogr�fica"
      ,tbl_MesorRegiao."Nome_Microrregi�o"
      ,tbl_MesorRegiao."C�digo Munic�pio"
      ,tbl_MesorRegiao."Nome_Munic�pio"
      ,tbl_MesorRegiao."C�digo de Distrito"
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