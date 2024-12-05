

select 
convert(varchar(50),[cdempresa]) [cdempresa], max([DsApelidoEmitente]) [DsApelidoEmitente],
max([CEPColeta]) [CEPColeta],max([CEPDestino]) [CEPDestino], max([dsplacaveiculo]) [dsplacaveiculo],
max([NrPlacaReboque1])[NrPlacaReboque1], max([DsMotorista])[DsMotorista], max([VlFretePeso]) [VlFretePeso], 
max([VlFreteValor])[VlFreteValor], max([VlPedagio]) [VlPedagio], max([VlGRIS])[VlGRIS], 
max([VlTotalPrestacao])[VlTotalPrestacao], max([nrdoctofiscal])[nrdoctofiscal], max([CdTpDoctoFiscal])[CdTpDoctoFiscal], 
max([dsapelido])[dsapelido], max([DtEmissao])[DtEmissao], max([DsSituacao])[DsSituacao], max([DsTpFrete])[DsTpFrete], 
max([DsTipoEmissao])[DsTipoEmissao], max([DsUFOrigem])[DsUFOrigem], max([DsUFDestino])[DsUFDestino], max([dtentrega])[dtentrega],
max([DtEmissaoFatura])[DtEmissaoFatura], max([dtvencimento])[dtvencimento], max([QtPeso])[QtPeso], 
max([QtMetrosCubicos])[QtMetrosCubicos], max([VlMercadoria])[VlMercadoria], max([VlLiquido])[VlLiquido],
max([VlICMS])[VlICMS], max([QtVolume])[QtVolume], max([CdRemetente])[CdRemetente], max([DsRemetente])[DsRemetente],
max([CdDestinatario])[CdDestinatario], max([dsDestinatario])[dsDestinatario], max([CdConsignatario])[CdConsignatario],
max([dsConsignatario])[dsConsignatario], max([CdInscricao])[CdInscricao], max([dsPagador])[dsPagador],
max([CdEmpresaDestino])[CdEmpresaDestino], max([DsEmpDest])[DsEmpDest], max([CidadeColeta])[CidadeColeta], 
max([CidadeEntrega])[CidadeEntrega], max([cdfatura])[cdfatura], max([InTDE])[InTDE], max([DoctoOrigem])[DoctoOrigem],
max([NrNotaFiscal])[NrNotaFiscal], max([DsSituacaoArq])[DsSituacaoArq], max([VlFreteOrigem])[VlFreteOrigem],
max([VlICMSOrigem])[VlICMSOrigem], max([dsnatureza])[dsnatureza], max([dstransporte])[dstransporte],
max([DsUltimaOcorrencia])[DsUltimaOcorrencia], max([DtUltimaOcorrencia])[DtUltimaOcorrencia], max([DsUsuario])[DsUsuario],
max([NomeMotorista])[NomeMotorista], max([NrRomaneio])[NrRomaneio], max([NrPlacaRomaneio])[NrPlacaRomaneio],
max([PlacaManifInterior])[PlacaManifInterior], max([DtSaidaParceiro])[DtSaidaParceiro], max([DsItinerario])[DsItinerario],
max([ArquivoConemb])[ArquivoConemb], max([DtEnvioConemb])[DtEnvioConemb], max([ArquivoOcoren])[ArquivoOcoren],
max([DtEnvioOcoren])[DtEnvioOcoren], max([ArquivoDocCob])[ArquivoDocCob], max([DtEnvioDocCob])[DtEnvioDocCob],
max([Pedido])[Pedido], max([Conteudo])[Conteudo], max([Previsão de Entrega])[Previsão de Entrega], 
max([Dt Inclusao Ocorrência])[Dt Inclusao Ocorrência], max([Dt Ocorrencia])[Dt Ocorrencia], 
max([Descrição Ult Ocorrencia])[Descrição Ult Ocorrencia], max([Usuário Ocorrencia])[Usuário Ocorrencia]

from [dbo].[stg_CTEBase] (nolock)
group by convert(varchar(50),[cdempresa])

select cdempresa,  count(*) as quant FROM [dbo].[stg_CTEBase] GROUP BY cdempresa having count(*)>1

select *  from [stg_CTEBase] 
where cdempresa = '56693308368'

select dt_previsao_entrega_cte

from  [dbo].[stg_Auditoria_Entrega]
where dt_previsao_entrega_cte = '2022-09-28 00:00:00.000'