select (cast(A.CdEmpresa as varchar(10))+' - '+b.DsApelido) as Empresa,
A.DtEmissao,
A.CdEmpresa,
A.NrFicha,
A.CdRotaRMS,
A.DtFechamento,
A.NrPlaca,
case when isnull(c.inveiculo,0) = 0 then F.DsTpVeiculo else g.DsTpVeiculo end as TipoVeiculo,
A.NrPlacaReboque1,
A.NrPlacaReboque2,
A.NrPlacaReboque3, 
H.DsNome as Motorista, 
I.DsNome as Proprietario,
(Select top 1 (cast(Ct.CdEmpresa as varchar(10))+'-'+cast(Ct.CdCartaFrete as varchar(10))) as CTRB from FTRCFTFV Ct LEFT JOIN FTRCFT CF on CF.CdEmpresa = Ct.CdEMpresa and CF.CdCartaFrete = Ct.CdCartaFrete where Ct.CdEmpresaFv = A.CdEmpresa and Ct.NrFicha = A.NrFicha and isnull(CF.InSituacao,0) <> 9) as CTRB,
(Select top 1 CF.DtEmissao as DtCTRB from FTRCFTFV Ct LEFT JOIN FTRCFT CF on CF.CdEmpresa = Ct.CdEMpresa and CF.CdCartaFrete = Ct.CdCartaFrete where Ct.CdEmpresaFv = A.CdEmpresa and Ct.NrFicha = A.NrFicha and isnull(CF.InSituacao,0) <> 9) as DtCTRB,
(Select sum(isnull(M.VlEvento,0)) as Adto from FTRCFTFV Ct 
  LEFT JOIN FTRCFTMV M On M.CdEmpresa = Ct.CdEmpresa and M.CdCartaFrete = Ct.CdCartaFrete 
  LEFT JOIN FTRCFT CF on CF.CdEmpresa = Ct.CdEMpresa and CF.CdCartaFrete = Ct.CdCartaFrete 
  where Ct.CdEmpresaFv = A.CdEmpresa and Ct.NrFicha = A.NrFicha and isnull(M.CdEvento,0) = 2 and isnull(CF.InSituacao,0) <> 9) as AdtoCTRB,
(Select sum(isnull(M.VlEvento,0)) as Adto from FTRCFTFV Ct 
  LEFT JOIN FTRCFTMV M On M.CdEmpresa = Ct.CdEmpresa and M.CdCartaFrete = Ct.CdCartaFrete 
  LEFT JOIN FTRCFT CF on CF.CdEmpresa = Ct.CdEMpresa and CF.CdCartaFrete = Ct.CdCartaFrete 
  where Ct.CdEmpresaFv = A.CdEmpresa and Ct.NrFicha = A.NrFicha and isnull(M.CdEvento,0) = 7 and isnull(CF.InSituacao,0) <> 9) as PedagioCTRB,
(cast(j.CdEmpresa as varchar(10))+'-'+cast(j.NrControle as varchar(10))) as NrAcerto,
j.DtAbertura as DtAcerto, j.DtFechamento as DtFechaAcerto,
round(A.VlComissao,2) as VlComissao    
from gtcfv a
left join sisempre b on b.cdempresa   = a.cdempresa
left join gtcveidp c on c.nrplaca     = a.nrplaca
left join sisveicu d on d.nrplaca     = c.nrplaca
left join gtcterc  e on e.nrplaca     = c.nrplaca
left join sistpvei f on f.cdTpVeiculo = d.CdTipoVeiculo
left join sistpvei g on g.cdTpVeiculo = e.CdTipoVeiculo
left join gtcfundp h on h.NrCpf       = A.CdMotorista
left join gtcfrete i on i.CdFreteiro  = A.CdProprietario
left join gfvmov   j on j.CdEmpresaFichaViagem = A.CdEmpresa and j.NrFichaViagem = a.NrFicha
where 1=1
      and a.dtemissao>='01/01/2022 00:00:00'
     order by a.cdempresa, a.NrFicha, A.DtEmissao