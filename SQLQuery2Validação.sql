 select * from tmplstGeOpe_Exp (nolock)

select 
iTeus, dTotComp, dTotVenda, dVlVendaOrig, dVlFrete, dTotTx, sLucratReal
from tmplstGeOpe_Exp (nolock)

select 
*
from tmplstGeOpe_Exp (nolock)

select 
sNumProc as 'Numero do Processo',
sProd as Produto,
sCli as Cliente,
sFamiCli as 'Fam�lia do Cliente',
sConsignee as Consignee,
sCiaAerea as 'Cia A�rea / Armador',
sAgente as Agente,
sPurOrder as 'Purcharse Order',
sInvoice as Invoice,
sRefCli as 'Ref. Cliente',
sModalid as Modalidade,
sNeg as Negocia��o,
sEscopo as Escopo,
sOferta as Oferta,
sModPagtoMaster as 'Modalidade de Pagto master',

sModPagtoHouse as 'Modalidade Pagto House',
sIncoterm as Incoterm,
sRespOpe as 'Respons�vel Operacional',
dtAbert as 'Dt de Abertura',
dtRecebInst as 'Recebimento da Instru��o',
dtSolicRes as 'Dt. Solicita��o Reserva',
dtSolicColeta as 'Solicitar coleta em',
dtColetarDia as 'Coletar no Dia',
dtColetaConf as 'Coleta confirmada em',
sTransp as Transportadora,
sNumDdeDseDue as 'N�mero DDE/DSE/DUE',
dtSolicBooking as 'Solicitar Booking Em',
dtReceb as 'Recebida em',
sNumReserva as 'N�mero da Reserva',
dtConfResEnvCli as 'Conf. De Reserva Enviada para o Cliente em:',

dtDeadLineCli as 'Dead Line do Cliente',
dtDeadLineArm as 'Dead Line do Armador',
dtDraftReceb as 'Draft Recebido em',
dtDraftEnvArm as 'Draft Enviado ao armador',
dtGateIn as 'Gate In',
dtDraftHblMblEnvAg as 'Draft HBL e MBL Enviados ao agente em',
dtConfDraftAg as 'Confirma��o de draft pelo Agente em:',
sAeropDesembTermEstuf as 'Aeroporto de Desembara�o / Terminal de Estufagem',
sAeropEmb as 'Aeroporto de Embarque / Porto de Embarque',
dtConfEmb as 'Confima��o de Embarque/ Conf. Sa�da',
sAeropDest as 'Aeroporto de Destino / Porto de Destino',
sPaisDest as 'Pa�s de destino',
dtPrevChegPortoDest as 'Prev. Chegada Porto Destino',
dtChegAeropDest as 'Chegada Aeroporto Destino / Conf. Chegada Porto Destino',
dtLibMercCnee as 'Libera��o Merc. Pelo Cnee',
sMawbMbl as 'MAWB/MBL',
sHawbHbl as 'HAWB/HBL',

sNavio as Navio,
iQtdVol as 'Qtd Volume',
dTotBruto as 'Tot. Bruto',
dTotTx as 'Tot. Tx',
sM3 as 'M�',
iQtdCNT as 'Qtd de CNT',
iTeus as TEUS,
dTotComp as 'Total Compra',
dTotVenda as 'Total Venda',
sMoedaVendaOrig as 'Moeda Venda Origem',
dVlVendaOrig as 'VL Venda Origem',
sMoedaFrete as 'Moeda Frete',
dVlFrete as 'VL Frete',
dLucroOpe as 'Lucro Operacional',
sLucratReal as 'Lucratividade Real',

sMotCanc as 'Motivo do Cancelamento',
dDiverg as Diverg�ncia,
dtEnvFatCli as 'DT Envio Fatura ao Cliente',
dtEnvFatAg as 'DT Envio Fatura ao Agente',
sJustPrej as 'ustificativa Prejuizo',
dtEmisFat as 'Dt Emiss�o Fatura',
dVlAproxFat as 'Vl. Aprox. da Fatura',
dVlTotItensVenda as 'Valor total de intens a venda',
dProfitPgAg as	ProfitPgAg,
sMoedaProfitAg as 'Moeda ProfitAg'
from tmplstGeOpe_Exp (nolock)