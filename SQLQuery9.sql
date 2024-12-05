CREATE OR ALTER VIEW vw_CTEBase_CdEmpresa_Unico as

select 
convert(varchar(50),[cdempresa]) [cdempresa], [DsApelidoEmitente], [CEPColeta], [CEPDestino], [dsplacaveiculo], 
[NrPlacaReboque1], [DsMotorista], [VlFretePeso], [VlFreteValor], [VlPedagio], [VlGRIS], [VlTotalPrestacao], 
[nrdoctofiscal], [CdTpDoctoFiscal], [dsapelido], [DtEmissao], [DsSituacao], [DsTpFrete], [DsTipoEmissao], [DsUFOrigem], 
[DsUFDestino], CONVERT(DATETIME,  SUBSTRING(DTENTREGA,7,4) + '/' + SUBSTRING(DTENTREGA,4,2) + '/' + SUBSTRING(DTENTREGA,1,2))  dtentrega,
[DtEmissaoFatura], [dtvencimento], [QtPeso], [QtMetrosCubicos], [VlMercadoria], [VlLiquido], [VlICMS], [QtVolume], 
[CdRemetente], [DsRemetente], [CdDestinatario], [dsDestinatario], [CdConsignatario], [dsConsignatario], [CdInscricao],
[dsPagador], [CdEmpresaDestino], [DsEmpDest], [CidadeColeta], [CidadeEntrega], max([cdfatura]) cdfatura, [InTDE], 
[DoctoOrigem], [NrNotaFiscal], [DsSituacaoArq], [VlFreteOrigem], [VlICMSOrigem], [dsnatureza], [dstransporte], 
[DsUltimaOcorrencia], [DtUltimaOcorrencia], [DsUsuario], [NomeMotorista], [NrRomaneio], [NrPlacaRomaneio], [PlacaManifInterior],
[DtSaidaParceiro], [DsItinerario], [ArquivoConemb], [DtEnvioConemb], [ArquivoOcoren], [DtEnvioOcoren], [ArquivoDocCob], 
[DtEnvioDocCob], [Pedido], [Conteudo], [Previsão de Entrega], [Dt Inclusao Ocorrência], [Dt Ocorrencia], 
[Descrição Ult Ocorrencia], [Usuário Ocorrencia]
from [dbo].[stg_CTEBase] (nolock)
group by convert(varchar(50),[cdempresa]),  [cdempresa], [DsApelidoEmitente], [CEPColeta], [CEPDestino], [dsplacaveiculo],
[NrPlacaReboque1], [DsMotorista], [VlFretePeso], [VlFreteValor], [VlPedagio], [VlGRIS], [VlTotalPrestacao], [nrdoctofiscal], 
[CdTpDoctoFiscal], [dsapelido], [DtEmissao], [DsSituacao], [DsTpFrete], [DsTipoEmissao], [DsUFOrigem], [DsUFDestino],
CONVERT(DATETIME,  SUBSTRING(DTENTREGA,7,4) + '/' + SUBSTRING(DTENTREGA,4,2) + '/' + SUBSTRING(DTENTREGA,1,2)),
[DtEmissaoFatura], [dtvencimento], [QtPeso], [QtMetrosCubicos], [VlMercadoria], [VlLiquido], [VlICMS], [QtVolume],
[CdRemetente], [DsRemetente], [CdDestinatario], [dsDestinatario], [CdConsignatario], [dsConsignatario], [CdInscricao],
[dsPagador], [CdEmpresaDestino], [DsEmpDest], [CidadeColeta], [CidadeEntrega], [InTDE], [DoctoOrigem], [NrNotaFiscal],
[DsSituacaoArq], [VlFreteOrigem], [VlICMSOrigem], [dsnatureza], [dstransporte], [DsUltimaOcorrencia], [DtUltimaOcorrencia],
[DsUsuario], [NomeMotorista], [NrRomaneio], [NrPlacaRomaneio], [PlacaManifInterior], [DtSaidaParceiro], [DsItinerario], 
[ArquivoConemb], [DtEnvioConemb], [ArquivoOcoren], [DtEnvioOcoren], [ArquivoDocCob], [DtEnvioDocCob], [Pedido], [Conteudo],
[Previsão de Entrega], [Dt Inclusao Ocorrência], [Dt Ocorrencia], [Descrição Ult Ocorrencia], [Usuário Ocorrencia]