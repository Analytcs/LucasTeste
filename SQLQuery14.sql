create or alter view dbo.vw_stg_Auditoria_Entrega AS

select
[Empresa da Ficha Viagem], 
[Numero da Ficha],
[Sequencia Entrega da Ficha], 
[Motorista Ficha], 
[Nome Motorista], 
[NrPlaca Ficha], 
[NrPlacaReboque2 da Ficha], 
[NrPlacaReboque3 da Ficha], 
[ID CTE], 
[TipoEmissaoCTE],
[Inscricao CTE],
[Data Emissao CTE],
[Data Entrega CTE], 
[Previsão Entrega CTE], 
[CdRemetente CTE],
[CdDestinatario CTE], [CdConsignatario CTE], [CdRedespacho CTE], [NrCepColeta CTE], [NrCepEntrega CTE], [QtPeso CTE], [NrNotaFiscal], [QtVolume CTE], [DsMarca CTE], [NrMarca CTEc], [VlMercadoria CTE], [Emissor CTE], [VlTotalPrestacao CTE], [VlBaseCalculo CTE], [VlICMS CTE], [VlLiquido CTE], [VlFretePeso CTE], [VlFreteValor CTE], [VlSECCAT CTE], [VlGris CTE], [VlPedagio CTE], [VlOutros CTE], [NrTransporte NFE], [cd_entrega], [cd_tenant], [vl_nota], [ds_cnpj], [ds_placa], [ds_cidade_origem], [ds_estado_origem], [ds_cidade_destino], [ds_estado_destino], [vl_km_total_cte], CONVERT(DATETIME,dt_previsao_entrega_cte) dt_previsao_entrega_cte, [vl_km_restante], [dt_previsao_entrega], [id_status], [ds_cidade_atual], [ds_estado_atual], [id_trecho], [Interacao], [vl_latitude], [vl_longitude],
CONVERT(numeric(12,8), REPLACE([vl_latitude],',','.')) LAT, 
CONVERT(numeric(12,8), REPLACE([vl_longitude],',','.')) LONG
from [dbo].[stg_Auditoria_Entrega]
