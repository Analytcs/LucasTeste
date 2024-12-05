SELECT  DISTINCT 
	CONCAT ( A.CdEmpresa,B.DsApelido,A.NrDoctoFiscal) AS IDDOCUMENTO,
		TB2.CdHistoricoEntrega,
		 tb2.DsHistoricoEntrega,
		 tb1.dsusuario,
		 tb1.CdSequencia,    
		 tb1.HrMovimento,
		 tb1.DtMovimento,
		 tb1.dtdigitacao,
		 tb1.dsorigemmovto
		 

FROM  
	GTCMOVEN tb1  WITH(NOLOCK)
	inner join gtcconhe a  WITH(NOLOCK) on a.nrseqcontrole = tb1.NrSeqControle and a.CdEmpresa = tb1.CdEmpresa 
	INNER JOIN SISTDF B  WITH(NOLOCK) ON B.CdTpDoctoFiscal = a.CdTpDoctoFiscal
	inner join GTCHisEn tb2 WITH(NOLOCK) on tb1.CdOcorrencia = tb2.CdHistoricoEntrega
where
	a.DtCancelamento is null
	order by 1, 5