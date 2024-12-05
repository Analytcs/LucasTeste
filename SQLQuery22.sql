
SELECT        A.CdEmpresa, A.NrFicha, A.VlComissao, A.CdRotaRMS, B.DsNome, C.DsNome, A.NrPlaca, A.NrPlacaReboque1 AS CarretaFV, A.NrPlacaReboque2 AS Carreta2FV, A.NrPlacaReboque3, A.DsUsuarioCadastro, D.CdEmpresaRom, 
                         D.CdRota, CAST(D.CdRomaneio AS varchar(20)) AS RomaneioManifesto, E.DsUsuario, E.DtRomaneio, E.NrPlaca, E.NrPlacaReboque1, E.NrPlacaReboque2, E.NrPlacaReboque3, F.DsNome, G.DsNome, 
                         H.CdCartaFrete AS NumeroCTRB, I.DsUsuarioInc AS UserCtrb, I.DtEmissao AS DtEmissaoCTRB,
                             (SELECT        TOP (1) ISNULL(VlEvento, 0) AS VlEVento
                               FROM            FTRCftMv AS EV
                               WHERE        (CdEmpresa = I.CdEmpresa) AND (CdCartaFrete = I.CdCartaFrete) AND (ISNULL(CdEvento, 0) = 1)) AS ValorTotalCTRB,
                             (SELECT        TOP (1) ISNULL(VlEvento, 0) AS VlEVento
                               FROM            FTRCftMv AS EV
                               WHERE        (CdEmpresa = I.CdEmpresa) AND (CdCartaFrete = I.CdCartaFrete) AND (ISNULL(CdEvento, 0) = 2)) AS AdtoCTRB,
                             (SELECT        TOP (1) ISNULL(VlEvento, 0) AS VlEVento
                               FROM            FTRCftMv AS EV
                               WHERE        (CdEmpresa = I.CdEmpresa) AND (CdCartaFrete = I.CdCartaFrete) AND (ISNULL(CdEvento, 0) = 7)) AS PedagioCTRB, K.CdEmpresa AS EmpresaCTE, K.VlFretePeso, K.VlFreteValor, K.VlPedagio, K.VlGris, 
                         K.VlTotalPrestacao, K.NrDoctoFiscal, K.dsusuario AS UserCTE, L.DsApelido AS TipoDoctoFiscal, K.DtEmissao AS DtEmissaoCTE, M.DsLocal AS CidadeColeta, M.DsUF AS DsUFOrigem, N.DsLocal AS CidadeEntrega, 
                         N.DsUF AS DsUFDestino, K.CdRemetente, O.DsEntidade AS DsRemetente, K.CdDestinatario, P.DsEntidade AS DsDestinatario, K.CdInscricao, Q.DsEntidade AS DsPagador, K.CdRedespacho, R.DsRedespacho
FROM            GTCFV AS A LEFT OUTER JOIN
                         GTCFunDp AS B ON B.NrCPF = A.CdMotorista LEFT OUTER JOIN
                         GTCFunDp AS C ON C.NrCPF = A.CdProprietario LEFT OUTER JOIN
                         GTCFVRom AS D ON D.CdEmpresa = A.CdEmpresa AND D.NrFicha = A.NrFicha LEFT OUTER JOIN
                         CCERoman AS E ON E.CdEmpresa = D.CdEmpresaRom AND E.CdRota = D.CdRota AND E.CdRomaneio = D.CdRomaneio LEFT OUTER JOIN
                         GTCFunDp AS F ON F.NrCPF = E.NrCPFMotorista LEFT OUTER JOIN
                         GTCFunDp AS G ON G.NrCPF = E.NrCPFProprietario LEFT OUTER JOIN
                         FTRCFTFV AS H ON H.CdEmpresaFV = A.CdEmpresa AND H.NrFicha = A.NrFicha LEFT OUTER JOIN
                         FTRCft AS I ON I.CdEmpresa = H.CdEmpresa AND I.CdCartaFrete = H.CdCartaFrete LEFT OUTER JOIN
                         CCERomIt AS J ON J.CdEmpresa = E.CdEmpresa AND J.CdRota = E.CdRota AND J.CdRomaneio = E.CdRomaneio LEFT OUTER JOIN
                         GTCConhe AS K ON K.CdEmpresa = J.CdEmpresaColetaEntrega AND K.NrSeqControle = J.NrSeqControle LEFT OUTER JOIN
                         SISTDF AS L ON L.CdTpDoctoFiscal = K.CdTpDoctoFiscal LEFT OUTER JOIN
                         SISCEP AS M ON M.NrCep = K.NrCepColeta LEFT OUTER JOIN
                         SISCEP AS N ON N.NrCep = K.NrCepEntrega LEFT OUTER JOIN
                         SISCli AS O ON O.CdInscricao = K.CdRemetente LEFT OUTER JOIN
                         SISCli AS P ON P.CdInscricao = K.CdDestinatario LEFT OUTER JOIN
                         SISCli AS Q ON Q.CdInscricao = K.CdInscricao LEFT OUTER JOIN
                         GTCRED AS R ON R.CdRedespacho = K.CdRedespacho
WHERE        (ISNULL(E.InSituacao, 0) = 0) AND (ISNULL(I.InSituacao, 0) <> 9) AND (ISNULL(J.InSituacao, 0) <> 9) AND (ISNULL(K.InConhecimento, 0) = 0) AND (E.CdRomaneio IS NOT NULL)
UNION
SELECT        A.CdEmpresa AS EmpresaFicha, A.NrFicha, A.VlComissao, A.CdRotaRMS, B.DsNome AS MotoristaFV, C.DsNome AS ProprietarioFV, A.NrPlaca AS VeiculoFV, A.NrPlacaReboque1 AS CarretaFV, A.NrPlacaReboque2 AS Carreta2FV, 
                         A.NrPlacaReboque3 AS Carreta3FV, A.DsUsuarioCadastro AS UserFicha, NULL AS EmpresaRomaneio, NULL AS RotaRomaneio, CAST(D.NrManifesto AS varchar(20)) AS RomaneioManifesto, 
                         E.DsUsuarioInc AS UserRomaneioManifesto, E.DtEmissao AS DtEmissaoRmMan, E.NrPlaca AS VeiculoRmMan, vw_AuditoriaFicha