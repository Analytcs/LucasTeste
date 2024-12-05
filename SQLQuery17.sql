
CREATE TABLE [dbo].[stg_Base_Viagens_Geral](
[EmpresaFicha]  [int] NULL,
NrFicha  [int] NULL,
VlComissao [numeric](14, 4) NULL,
CdRotaRMS [int] NULL,
MotoristaFV [varchar](50) NULL,
ProprietarioFV [varchar](50) NULL,
VeiculoFV [varchar](8) NULL,
CarretaFV [varchar](8) NULL,
Carreta2FV [varchar](8) NULL,
Carreta3FV [varchar](8) NULL,
UserFicha [varchar](23) NULL,
EmpresaRomaneio [int] NULL,
RotaRomaneio [int] NULL,
RomaneioManifesto [varchar](23) NULL,
UserRomaneioManifesto [varchar](23) NULL,
DtEmissaoRmMan [datetime] NULL,
VeiculoRmMan [varchar](8) NULL,
CarretaRmMan [varchar](8) NULL,
Carreta2RmMan [varchar](8) NULL,
Carreta3RmMan [varchar](8) NULL,
MotoristaRmMan [varchar](50) NULL,
ProprietarioRmMan [varchar](50) NULL,
NumeroCTRB [varchar](21) NULL,
UserCtrb [varchar](23) NULL,
DtEmissaoCTRB [datetime] NULL,
ValorTotalCTRB [numeric](38, 4) NULL,
AdtoCTRB [numeric](38, 4) NULL,
PedagioCTRB [numeric](38, 4) NULL,
EmpresaCTE [int] NULL,
VlFretePeso [numeric](38, 4) NULL,
VlFreteValor [numeric](38, 4) NULL,
VlPedagio [numeric](38, 4) NULL,
VlGRIS [numeric](14, 4) NULL,
VlTotalPrestacao [numeric](38, 4) NULL,
NrDoctoFiscal [int] NULL,
UserCTE [varchar](23) NULL,
TipoDoctoFiscal [varchar](23) NULL,
DtEmissaoCTE [datetime] NULL,
CidadeColeta [varchar](50) NULL,
DsUFOrigem [varchar](8) NULL,
CidadeEntrega [varchar](50) NULL,
DsUFDestino [varchar](8) NULL,
CdRemetente [varchar](20) NULL,
DsRemetente [varchar](50) NULL,
CdDestinatario [varchar](20) NULL,
DsDestinatario [varchar](50) NULL,
CdInscricao [varchar](20) NULL,
DsPagador [varchar](50) NULL,
CdRedespacho [varchar](20) NULL,
DsRedespacho [varchar](50) NULL
) ON [PRIMARY]
GO