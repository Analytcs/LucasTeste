select* from(

Select  DISTINCT  A.CdEmpresa as EmpresaFicha,
       A.NrFicha,
         A.VlComissao,
         A.CdRotaRMS,     
         B.DsEntidade as MotoristaFV,
         C.DsEntidade as ProprietarioFV,
         A.NrPlaca as VeiculoFV,
         A.NrPlacaReboque1 as CarretaFV,
         A.NrPlacaReboque2 as Carreta2FV,
         A.NrPlacaReboque3 as Carreta3FV,
         A.DsUsuarioCadastro as UserFicha,
         D.CdEmpresaRom as EmpresaRomaneio,  
         D.CdRota as RotaRomaneio,
         cast (D.CdRomaneio as varchar(20)) as RomaneioManifesto,
         E.DsUsuario as UserRomaneioManifesto,
         E.DtRomaneio as DtEmissaoRmMan,
         E.NrPlaca as VeiculoRmMan,
         E.NrPlacaReboque1 as CarretaRmMan,
         E.NrPlacaReboque2 as Carreta2RmMan,
         E.NrPlacaReboque3 as Carreta3RmMan,
         F.DsNome as MotoristaRmMan,
         G.DsNome as ProprietarioRmMan,
         H.CdCartaFrete as NumeroCTRB,
         I.DsUsuarioInc as UserCtrb,
         I.DtEmissao as DtEmissaoCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = I.CdEmpresa and EV.CdCartaFrete = I.CdCartaFrete and isnull(EV.CdEvento,0) = 1) as ValorTotalCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = I.CdEmpresa and EV.CdCartaFrete = I.CdCartaFrete and isnull(EV.CdEvento,0) = 2) as AdtoCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = I.CdEmpresa and EV.CdCartaFrete = I.CdCartaFrete and isnull(EV.CdEvento,0) = 7) as PedagioCTRB,
         K.CdEmpresa as EmpresaCTE,
       K.VlFretePeso,
         K.VlFreteValor,
         K.VlPedagio,
         K.VlGRIS,
         K.VlTotalPrestacao,
         K.NrDoctoFiscal,
         K.dsusuario as UserCTE,
         L.DsApelido as TipoDoctoFiscal,
         K.DtEmissao as DtEmissaoCTE,
         M.DsLocal as CidadeColeta,
         M.DsUF as DsUFOrigem,
         N.DsLocal as CidadeEntrega,
         N.DsUF as DsUFDestino,
         K.CdRemetente,
         O.DsEntidade as DsRemetente,
         K.CdDestinatario,
         P.DsEntidade as DsDestinatario,
         K.CdInscricao,
         Q.DsEntidade as DsPagador,
         K.CdRedespacho,
         R.DsRedespacho

         from GTCFV A
         LEFT JOIN siscli B ON B.CdInscricao           = A.CdMotorista
         LEFT JOIN siscli C ON C.CdInscricao           = A.CdProprietario
         LEFT JOIN GTCFVROM D ON D.CdEmpresa       = A.CdEmpresa and D.NrFicha = A.NrFicha
         LEFT JOIN CCEROMAN E ON E.CdEmpresa       = D.CdEmpresaRom and E.CdRota = D.CdRota and E.CdRomaneio = D.CdRomaneio
         LEFT JOIN GTCFUNDP F ON F.NrCPF               = E.NrCPFMotorista
         LEFT JOIN GTCFUNDP G ON G.NrCPF               = E.NrCPFProprietario
         LEFT JOIN FTRCFTFV H ON H.CdEmpresaFV   = A.CdEmpresa and H.NrFicha = A.NrFicha
         LEFT JOIN FTRCFT   I ON I.CdEmpresa           = H.CdEmpresa and I.CdCartaFrete = H.CdCartaFrete
         LEFT JOIN CCEROMIT J ON J.CdEmpresa       = E.CdEmpresa and J.CdRota = E.CdRota and J.CdRomaneio = E.CdRomaneio
         LEFT JOIN GTCCONHE K ON K.CdEmpresa       = J.CdEmpresaColetaEntrega and K.NrSeqControle = J.NrSeqControle
         LEFT JOIN SISTDF   L ON L.CdTpDoctoFiscal = K.CdTpDoctoFiscal
       LEFT JOIN SISCEP   M ON M.NrCep           = K.NrCepColeta
       LEFT JOIN SISCEP   N ON N.NrCep           = K.NrCepEntrega
         LEFT JOIN SISCLI   O ON O.CdInscricao     = K.CdRemetente
         LEFT JOIN SISCLI   P ON P.CdInscricao     = K.CdDestinatario
         LEFT JOIN SISCLI   Q ON Q.CdInscricao     = K.CdInscricao
         LEFT JOIN GTCRED   R ON R.CdRedespacho    = K.CdRedespacho

         where isnull(E.InSituacao,0) = 0
         AND   isnull(I.InSituacao,0) <> 9
         AND   isnull(J.InSituacao,0) <> 9
         AND   isnull(K.InConhecimento,0) = 0
         AND   E.CdRomaneio is not null
	   ---AND J.NrNotaFiscal IS NOT NULL
	
		
         UNION

Select DISTINCT A.CdEmpresa as EmpresaFicha,
       A.NrFicha,
         A.VlComissao,
         A.CdRotaRMS,     
         B.DsEntidade as MotoristaFV,
         C.DsEntidade as ProprietarioFV,
         A.NrPlaca as VeiculoFV,
         A.NrPlacaReboque1 as CarretaFV,
         A.NrPlacaReboque2 as Carreta2FV,
         A.NrPlacaReboque3 as Carreta3FV,
         A.DsUsuarioCadastro as UserFicha,
         null as EmpresaRomaneio,  
         null as RotaRomaneio,
         cast (D.NrManifesto as varchar(20)) as RomaneioManifesto,
         E.DsUsuarioInc as UserRomaneioManifesto,
         E.DtEmissao as DtEmissaoRmMan,
         E.NrPlaca as VeiculoRmMan,
         E.NrPlacaCarreta as CarretaRmMan,
         E.NrPlacaReboque2 as Carreta2RmMan,
         E.NrPlacaReboque3 as Carreta3RmMan,
         F.DsNome as MotoristaRmMan,
         G.DsNome as ProprietarioRmMan,
         H.CdCartaFrete as NumeroCTRB,
         I.DsUsuarioInc as UserCtrb,
         I.DtEmissao as DtEmissaoCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = I.CdEmpresa and EV.CdCartaFrete = I.CdCartaFrete and isnull(EV.CdEvento,0) = 1) as ValorTotalCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = I.CdEmpresa and EV.CdCartaFrete = I.CdCartaFrete and isnull(EV.CdEvento,0) = 2) as AdtoCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = I.CdEmpresa and EV.CdCartaFrete = I.CdCartaFrete and isnull(EV.CdEvento,0) = 7) as PedagioCTRB,
         K.CdEmpresa as EmpresaCTE,
       K.VlFretePeso,
         K.VlFreteValor,
         K.VlPedagio,
         K.VlGRIS,
         K.VlTotalPrestacao,
         K.NrDoctoFiscal,
         K.dsusuario as UserCTE,
         L.DsApelido as TipoDoctoFiscal,
         K.DtEmissao as DtEmissaoCTE,
         M.DsLocal as CidadeColeta,
         M.DsUF as DsUFOrigem,
         N.DsLocal as CidadeEntrega,
         N.DsUF as DsUFDestino,
         K.CdRemetente,
         O.DsEntidade as DsRemetente,
         K.CdDestinatario,
         P.DsEntidade as DsDestinatario,
         K.CdInscricao,
         Q.DsEntidade as DsPagador,
         K.CdRedespacho,
         R.DsRedespacho

         from GTCFV A
         LEFT JOIN siscli B ON B.CdInscricao           = A.CdMotorista
         LEFT JOIN siscli C ON C.CdInscricao           = A.CdProprietario
         LEFT JOIN GTCFVMAN D ON D.CdEmpresa       = A.CdEmpresa and D.NrFicha = A.NrFicha
         LEFT JOIN GTCMAN   E ON E.NrManifesto     = D.NrManifesto
         LEFT JOIN GTCFUNDP F ON F.NrCPF               = E.CdMotorista
         LEFT JOIN GTCFUNDP G ON G.NrCPF               = E.CdProprietario
         LEFT JOIN FTRCFTFV H ON H.CdEmpresaFV   = A.CdEmpresa and H.NrFicha = A.NrFicha
         LEFT JOIN FTRCFT   I ON I.CdEmpresa           = H.CdEmpresa and I.CdCartaFrete = H.CdCartaFrete
         LEFT JOIN GTCMANCN J ON J.NrManifesto     = E.NrManifesto
         LEFT JOIN GTCCONHE K ON K.CdEmpresa       = J.CdEmpresa and K.NrSeqControle = J.NrSeqControle
         LEFT JOIN SISTDF   L ON L.CdTpDoctoFiscal = K.CdTpDoctoFiscal
       LEFT JOIN SISCEP   M ON M.NrCep           = K.NrCepColeta
       LEFT JOIN SISCEP   N ON N.NrCep           = K.NrCepEntrega
         LEFT JOIN SISCLI   O ON O.CdInscricao     = K.CdRemetente
         LEFT JOIN SISCLI   P ON P.CdInscricao     = K.CdDestinatario
         LEFT JOIN SISCLI   Q ON Q.CdInscricao     = K.CdInscricao
         LEFT JOIN GTCRED   R ON R.CdRedespacho    = K.CdRedespacho

         where isnull(E.InSituacao,0) = 0
         AND   isnull(I.InSituacao,0) <> 9
         AND   isnull(J.InSituacao,0) <> 9
         AND   isnull(K.InConhecimento,0) = 0
         AND   J.NrManifesto is not null) as teste  


UNION

Select null as EmpresaFicha,
       null as NrFicha,
         null as VlComissao,
         null as CdRotaRMS,     
         B.DsNome as MotoristaFV,
         C.DsNome as ProprietarioFV,
         A.NrPlaca as VeiculoFV,
         A.NrPlacaReboque1 as CarretaFV,
         A.NrPlacaReboque2 as Carreta2FV,
         A.NrPlacaReboque3 as Carreta3FV,
         '' as UserFicha,
         null as EmpresaRomaneio,  
         null as RotaRomaneio,
         '' as RomaneioManifesto,
         '' as UserRomaneioManifesto,
         null as DtEmissaoRmMan,
         '' as VeiculoRmMan,
         '' as CarretaRmMan,
         '' as Carreta2RmMan,
         '' as Carreta3RmMan,
         '' as MotoristaRmMan,
         '' as ProprietarioRmMan,
         A.CdCartaFrete as NumeroCTRB,
         A.DsUsuarioInc as UserCtrb,
         A.DtEmissao as DtEmissaoCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = A.CdEmpresa and EV.CdCartaFrete = A.CdCartaFrete and isnull(EV.CdEvento,0) = 1) as ValorTotalCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = A.CdEmpresa and EV.CdCartaFrete = A.CdCartaFrete and isnull(EV.CdEvento,0) = 2) as AdtoCTRB,
         (SELECT TOP 1 isnull(EV.VlEVento,0) as VlEVento from FTRCFTMV EV
          Where EV.CdEmpresa = A.CdEmpresa and EV.CdCartaFrete = A.CdCartaFrete and isnull(EV.CdEvento,0) = 7) as PedagioCTRB,
         null as EmpresaCTE,
       null as VlFretePeso,
         null as VlFreteValor,
         null as VlPedagio,
         null as VlGRIS,
         null as VlTotalPrestacao,
         null as NrDoctoFiscal,
         '' as UserCTE,
         '' as TipoDoctoFiscal,
         null as DtEmissaoCTE,
         '' as CidadeColeta,
         '' as DsUFOrigem,
         '' as CidadeEntrega,
         '' as DsUFDestino,
         '' as CdRemetente,
         '' as DsRemetente,
         '' as CdDestinatario,
         '' as DsDestinatario,
         '' as CdInscricao,
         '' as DsPagador,
         '' as CdRedespacho,
         '' as DsRedespacho
         from FTRCFT A
         LEFT JOIN GTCFUNDP B ON B.NrCPF           = A.NrCGCCPFMot
         LEFT JOIN GTCFUNDP C ON C.NrCPF           = A.NrCGCCPFPropr
         where isnull(A.InSituacao,0) <> 9
         AND   isnull(A.InTipoOrigem,0) = 2 
         and  a.InTipoOrigem = 2
		 and a.DtEmissao >= '2022-01-01' 