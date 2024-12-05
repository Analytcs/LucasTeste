SELECT * FROM ( 
SELECT 
 
  CASE
    WHEN ISNULL(CTeDtEntrega,0) <> 0 THEN
 
      CASE
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) = 0 THEN
               CASE
                 WHEN CTeDtEntrega <  DtPrevisaoEntregaCTe THEN datediff(day, CTeDtEntrega,DtPrevisaoEntregaCTe)*-1
                 WHEN CTeDtEntrega >= DtPrevisaoEntregaCTe THEN datediff(day, DtPrevisaoEntregaCTe,CTeDtEntrega)
               END
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) <> 0 THEN
               CASE
                 WHEN CTeDtEntrega <  DtAgendamentoEntregaCTe THEN datediff(day,CTeDtEntrega,DtAgendamentoEntregaCTe)*-1
                 WHEN CTeDtEntrega >= DtAgendamentoEntregaCTe THEN datediff(day,DtAgendamentoEntregaCTe,CTeDtEntrega)
               END 
        ELSE 0
      END
 
    WHEN ISNULL(CTeDtEntrega,0) = 0 THEN    
    
      CASE
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) = 0 THEN
               CASE
                 WHEN GETDATE() <  DtPrevisaoEntregaCTe THEN datediff(day,GETDATE(),DtPrevisaoEntregaCTe)*-1
                 WHEN GETDATE() >= DtPrevisaoEntregaCTe THEN datediff(day,DtPrevisaoEntregaCTe,GETDATE())
               END
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) <> 0 THEN
               CASE
                 WHEN GETDATE() <  DtAgendamentoEntregaCTe THEN datediff(day,GETDATE(),DtAgendamentoEntregaCTe)*-1
                 WHEN GETDATE() >= DtAgendamentoEntregaCTe THEN datediff(day,DtAgendamentoEntregaCTe,GETDATE())
               END 
        ELSE 0
      END
    
  END AS NrDiasAtraso,
 
 
  CASE
    WHEN ISNULL(CTeDtEntrega,0) <> 0 THEN
      CASE
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) = 0 THEN
               CASE
                 WHEN CTeDtEntrega < DtPrevisaoEntregaCTe THEN 'ANTES DO PRAZO'
                 WHEN CTeDtEntrega = DtPrevisaoEntregaCTe THEN 'NO PRAZO'
                 WHEN CTeDtEntrega > DtPrevisaoEntregaCTe THEN 'FORA DO PRAZO'
               END
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) <> 0 THEN
               CASE
                 WHEN CTeDtEntrega < DtAgendamentoEntregaCTe THEN 'ANTES DO PRAZO'
                 WHEN CTeDtEntrega = DtAgendamentoEntregaCTe THEN 'NO PRAZO'
                 WHEN CTeDtEntrega > DtAgendamentoEntregaCTe THEN 'FORA DO PRAZO'
               END 
        ELSE 'ND'
      END
                   
    WHEN ISNULL(CTeDtEntrega,0) = 0 THEN
 
      CASE
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) = 0 THEN
               CASE
                 WHEN CONVERT(DATE, GETDATE()) < CONVERT(DATE, DtPrevisaoEntregaCTe) THEN 'ANTES DO PRAZO'
                 WHEN CONVERT(DATE, GETDATE()) = CONVERT(DATE, DtPrevisaoEntregaCTe) THEN 'NO PRAZO'
                 WHEN CONVERT(DATE, GETDATE()) > CONVERT(DATE, DtPrevisaoEntregaCTe) THEN 'FORA DO PRAZO'
               END
        WHEN ISNULL(DtAgendamentoEntregaCTe,0) <> 0 THEN
               CASE
                 WHEN CONVERT(DATE, GETDATE()) < CONVERT(DATE, DtAgendamentoEntregaCTe) THEN 'ANTES DO PRAZO'
                 WHEN CONVERT(DATE, GETDATE()) = CONVERT(DATE, DtAgendamentoEntregaCTe) THEN 'NO PRAZO'
                 WHEN CONVERT(DATE, GETDATE()) > CONVERT(DATE, DtAgendamentoEntregaCTe) THEN 'FORA DO PRAZO'
               END 
        ELSE 'ND'
      END
      
  END AS Status,
  
  
  --DEFINIÇÃO DA DATA DE PREVISÃO DE ENTREGA DO CTE
  CASE
    WHEN ISNULL(DtAgendamentoEntregaCTe,0) = 0  THEN DtPrevisaoEntregaCTe
    WHEN ISNULL(DtAgendamentoEntregaCTe,0) <> 0 THEN DtAgendamentoEntregaCTe
    ELSE ''
  END AS DtPrevisaoEntregaCTeNova,


  --DEFINIÇÃO DA FICHA DE VIAGEM
  FichaVUltRom AS FichaViagem,
  case when DtManifesto is null and DtRomaneio is not null then DtRomaneio
       when DtManifesto is not null and DtRomaneio is null then DtManifesto 
       when DtManifesto is not null and DtRomaneio is not null and DtManifesto < DtRomaneio then DtManifesto else DtRomaneio end as Hora, 
  *
FROM(

SELECT 
  NFCTe.CdInscricao AS CNPJRemetente,
  upper(Rem.DsEntidade) AS NomeRemetente,
  NFCTe.NrSerie AS NFSerie,
  NFCTe.NrNotaFiscal AS NFNr,
  NF.VlNotaFiscal AS NFVlr,
  NF.DtEmissao AS NFDtEmissao,
 
  CTe.CdEmpresa AS CTeEmpresa,
  CTe.NrDoctoFiscal AS CTeNr,
  CTe.DtDigitacao as CTeDtEmissao,  
  
  DtPrevisaoEntregaCTe = dbo.SP_CalculaDtPrevisaoEntregaPercReg(CTe.DtEmissao, CTe.CdEmpresaDestino, CTe.CdPercurso, CTe.CdTransporte, CTe.CdRemetente, CTe.CdDestinatario, CTe.CdEmpresa, CTe.NrSeqControle),

  DtAgendamentoEntregaCTe = (SELECT max(M.DtAgendamento) 
                             FROM GTCMOVEN M WITH (NOLOCK) 
                             WHERE 1=1
                             AND M.Cdempresa = CTe.CdEMpresa
                             AND M.NrSeqControle = CTe.NrSeqControle),

  CTe.DtEntrega AS CTeDtEntrega,

  NF.CdDestinatario AS CNPJDestinatario,
  upper(Des.DsEntidade) AS NomeDestinatario,
  CepDes.DsLocal AS CidadeDestino,
  CepDes.DsUF AS UFDestino,
  Pag.CdInscricao as CNPJPagador,
  upper(Pag.DsEntidade) AS NomePagador, 
  Cte.NrSeqControle,
  CTe.CdNatureza AS NaturezaCod,
  Nat.DsNatureza AS NaturezaNome,
  TpT.DsTransporte as TipoTransporte,
  NF.QtVolume AS Volumes,
  
  HistEntregaCod = (SELECT Ocor.CdHistoricoEntrega
                    FROM GTCMovEn MovEn WITH (NOLOCK)
                    LEFT JOIN GTCHisEn Ocor WITH (NOLOCK) ON Ocor.CdHistoricoEntrega = MovEn.CdOcorrencia
                    WHERE 1=1
                    AND MovEn.CdEmpresa = CTe.CdEmpresa
                    AND MovEn.NrSeqControle = CTe.NrSeqControle
                    AND MovEn.CdSequencia = (SELECT MAX(MaxSeq.CdSequencia) 
                                             FROM GTCMovEn MaxSeq WITH (NOLOCK)
                                             WHERE 1=1
                                             AND MaxSeq.CdEmpresa = CTe.CdEmpresa
                                             AND MaxSeq.NrSeqControle = CTe.NrSeqControle)),

  HistEntregaNome = (SELECT Ocor.DsHistoricoEntrega
                     FROM GTCMovEn MovEn WITH (NOLOCK)
                     LEFT JOIN GTCHisEn Ocor WITH (NOLOCK) ON Ocor.CdHistoricoEntrega = MovEn.CdOcorrencia
                     WHERE 1=1
                     AND MovEn.CdEmpresa = CTe.CdEmpresa
                     AND MovEn.NrSeqControle = CTe.NrSeqControle
                     AND MovEn.CdSequencia = (SELECT MAX(MaxSeq.CdSequencia) 
                                              FROM GTCMovEn MaxSeq WITH (NOLOCK)
                                              WHERE 1=1
                                              AND MaxSeq.CdEmpresa = CTe.CdEmpresa
                                              AND MaxSeq.NrSeqControle = CTe.NrSeqControle)),


   FichaVUltManifesto = (SELECT CONCAT(CONVERT(NVARCHAR(10), FVMan.CdEmpresa), '/', CONVERT(NVARCHAR(10), FVMan.NrFicha))
                         FROM GTCManCn ManCTe WITH (NOLOCK)
                         LEFT JOIN GTCMan Man WITH (NOLOCK) ON Man.NrManifesto = ManCTe.NrManifesto
                         INNER JOIN GTCFvMan FVMan WITH (NOLOCK) ON FVMan.NrManifesto = Man.NrManifesto
                         WHERE 1=1
                         AND isnull(Man.DtCancelamento,0) = 0
                         AND isnull(FVMan.DtCancelamento,0) = 0
                         AND ManCTe.CdEmpresa = CTe.CdEmpresa
                         AND ManCTe.NrSeqControle = CTe.NrSeqControle
                         AND ManCTe.DtCadastro = (SELECT max(ManCTex.DtCadastro)
                                                FROM GTCManCn ManCTex WITH (NOLOCK)
                                                LEFT JOIN GTCMan Manx WITH (NOLOCK) ON Manx.NrManifesto = ManCTex.NrManifesto
                                                WHERE 1=1
                                                AND isnull(Manx.DtCancelamento,0) = 0
                                                AND ManCTex.CdEmpresa = CTe.CdEmpresa
                                                AND ManCTex.NrSeqControle = CTe.NrSeqControle)),
  
  FichaVUltRom = (SELECT (cast(Rom.CdEmpresa as varchar(10))+ '-'+ cast(Rom.CdRota as varchar(10))+'-'+cast(Rom.CdRomaneio as varchar(10))) as Roman
               FROM CCERomIt RomCTe WITH (NOLOCK)
               LEFT JOIN CCERoman Rom WITH (NOLOCK) ON RomCTe.CdEmpresa = Rom.CdEmpresa
                                                   AND RomCTe.CdRota = Rom.CdRota
                                                   AND RomCTe.CdRomaneio = Rom.CdRomaneio
               INNER JOIN GTCFVRom FVRom WITH (NOLOCK) ON FVRom.CdEmpresaRom = Rom.CdEmpresa
                                                     AND FVRom.CdRota = Rom.CdRota
                                                     AND FVRom.CdRomaneio =  Rom.CdRomaneio                  
               WHERE 1=1
               AND isnull(Rom.InSituacao,0) = 0
               AND isnull(RomCTe.InSituacao,0) <> 9
               AND RomCTe.CdEmpresaColetaEntrega = CTe.CdEmpresa
               AND RomCTe.NrSeqControle = CTe.NrSeqControle
               AND Rom.DtCadastro = (SELECT max(Romx.DtCadastro)
                                     FROM CCERomIt RomCTex WITH (NOLOCK)
                                     LEFT JOIN CCERoman Romx WITH (NOLOCK) ON RomCTex.CdEmpresa = Romx.CdEmpresa
                                                                          AND RomCTex.CdRota = Romx.CdRota
                                                                          AND RomCTex.CdRomaneio = Romx.CdRomaneio
                                     WHERE 1=1
                                     AND isnull(Romx.InSituacao,0) = 0
                                     AND isnull(RomCTex.InSituacao,0) <> 9
                                     AND RomCTex.CdEmpresaColetaEntrega = CTe.CdEmpresa
                                     AND RomCTex.NrSeqControle = CTe.NrSeqControle)),

  DtRomaneio = (select case when min(cast(convert(varchar(10),Roman.DtRomaneio,101) + ' ' + convert(varchar(10),Roman.HrRomaneio,108) as datetime)) < '01/01/2020' then null else min(cast(convert(varchar(10),Roman.DtRomaneio,101) + ' ' + convert(varchar(10),Roman.HrRomaneio,108) as datetime)) end as DtRomaneio from cceroman Roman
                Left Join CCEROMIT Romit ON Romit.CdEmpresa = Roman.CdEmpresa and Romit.CdRota = Roman.CdRota and Romit.CdRomaneio = Roman.CdRomaneio 
                where Romit.CdEmpresaColetaEntrega = CTe.CdEmpresa and Romit.NrSeqControle = CTe.NrSeqControle 
                                     AND isnull(Roman.InSituacao,0) = 0
                                     AND isnull(Romit.InSituacao,0) <> 9 ),
  DtManifesto = (select case when min(cast(convert(varchar(10),man.DtSaida,101) + ' ' + convert(varchar(10),man.HrSaida,108) as datetime)) < '01/01/2020' then null else min(cast(convert(varchar(10),man.DtSaida,101) + ' ' + convert(varchar(10),man.HrSaida,108) as datetime)) end as DtManifesto from GTCMAN man
                Left Join GTCMANCN mancn ON mancn.NrManifesto = man.Nrmanifesto 
                where mancn.CdEmpresa = CTe.CdEmpresa and mancn.NrSeqControle = CTe.NrSeqControle 
                                     AND isnull(man.InSituacao,0) = 0
                                     AND isnull(mancn.InSituacao,0) =0 ),
   case when isnull(CTe.intipoemissao,0)=0 then 'Normal' 
            when isnull(CTe.intipoemissao,0)=1 then 'Dev Total'
            when isnull(CTe.intipoemissao,0)=2 then 'Reentrega'
            when isnull(CTe.intipoemissao,0)=3 then 'Dev Parcial'
            when isnull(CTe.intipoemissao,0)=4 then 'Complementar'
            when isnull(CTe.intipoemissao,0)=5 then 'Cotação de Frete'
            when isnull(CTe.intipoemissao,0)=6 then 'Armazenagem'
            when isnull(CTe.intipoemissao,0)=7 then 'Paletizacao'
            when isnull(CTe.intipoemissao,0)=8 then 'Diaria'
            when isnull(CTe.intipoemissao,0)=9 then 'Redespacho Prop'
            when isnull(CTe.intipoemissao,0)=10 then 'Agendamento'
            when isnull(CTe.intipoemissao,0)=11 then 'Redepacho'
            when isnull(CTe.intipoemissao,0)=12 then 'SubContrato'
            when isnull(CTe.intipoemissao,0)=13 then 'Refaturamento'
            when isnull(CTe.intipoemissao,0)=14 then 'Substituição'
            when isnull(CTe.intipoemissao,0)=15 then 'Anulação'
       end as TipoEmissao, 
	   GRP.DsGrupoCliente, GRP.CdGrupoCliente,
  1 AS NrRegistros
FROM GTCNFCon      NFCTe  WITH (NOLOCK)
LEFT JOIN GTCNf    NF     WITH (NOLOCK) ON NF.cdremetente = NFCTe.cdinscricao 
                                       AND NF.nrserie = NFCTe.nrserie 
                                       AND NF.NrNotaFiscal = NFCTe.NrNotaFiscal 
LEFT JOIN GTCConhe CTe    WITH (NOLOCK) ON CTe.CdEmpresa = NFCTe.CdEmpresa
                                       AND CTe.NrSeqControle = NFCTe.NrSeqControle
LEFT JOIN GTCConCe ConCe  WITH (NOLOCK) ON ConCe.CdEmpresa = CTe.CdEmpresa
                                       AND ConCe.NrSeqControle = CTe.NrSeqControle
LEFT JOIN SISCli   Rem    WITH (NOLOCK) ON Rem.CdInscricao = NF.CdRemetente
LEFT JOIN SISCli   Des    WITH (NOLOCK) ON Des.CdInscricao = NF.CdDestinatario
LEFT JOIN SISCli   Pag    WITH (NOLOCK) ON Pag.CdInscricao = Cte.CdInscricao
LEFT JOIN SISCEP   CepDes WITH (NOLOCK) ON CepDes.NrCep = Des.NrCEP
LEFT JOIN GTCNatur Nat    WITH (NOLOCK) ON Nat.CdNatureza = CTe.CdNatureza 
LEFT JOIN sisclifa Clifa  with (nolock) on Clifa.cdinscricao = CTe.cdinscricao 
LEFT JOIN sisgrupo Grp    with (nolock) on Grp.cdgrupocliente = Clifa.cdgrupocliente 
LEFT JOIN GTCTrans TpT    with (nolock) on TpT.cdTransporte = Cte.cdTransporte 
WHERE 1=1
AND isnull(CTe.InConhecimento,0) = 0 --CTEs ATIVOS

)AS AGRUPADO1
)AS AGRUPADO2
WHERE 1=1
