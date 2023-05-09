unit acpdv.Model.Entidade.NfeItem;

interface

type
  TNfeItem = class
  private
    FSerie :Integer;
    FNumero :Integer;
    FItem :Integer;
    FIdProduto :Integer;
    FGtin :String;
    FDescricao :String;
    FCfop :Integer;
    FUnd :String;
    FQuantidade :Currency;
    FVlUnitario :Currency;
    FVlDesconto :Currency;
    FVlDescontoRateio :Currency;
    FVlOutros :Currency;
    FVlOutrosRateio :Currency;
    FVlProduto :Currency;
    FVlTotal :Currency;
    FOrigem :Integer;
    FCst :String;
    FNcm :String;
    FExtipi :String;
    FSnVbase :Currency;
    FSnAliqcredito :Currency;
    FSnVcredito :Currency;
    FIcmsVbase :Currency;
    FIcmsAliquota :Currency;
    FIcmsVimposto :Currency;
    FPisCst :String;
    FPisVbase :Currency;
    FPisAliquota :Currency;
    FPisVimposto :Currency;
    FCofinsCst :String;
    FCofinsVbase :Currency;
    FCofinsAliquota :Currency;
    FCofinsVimposto :Currency;
    FInAliqFederal :Currency;
    FInVlFederal :Currency;
    FInAliqEstadual :Currency;
    FInVlEstadual :Currency;
    FInAliqMunicipal :Currency;
    FInVlMunicipal :Currency;
    FInfAdicional :String;
    FCest :String;
    FIdCodigoAnp :Integer;

  public
    function GetSerie :Integer;
    function SetSerie(const Value :Integer): TNfeItem;
    function GetNumero :Integer;
    function SetNumero(const Value :Integer): TNfeItem;
    function GetItem :Integer;
    function SetItem(const Value :Integer): TNfeItem;
    function GetIdProduto :Integer;
    function SetIdProduto(const Value :Integer): TNfeItem;
    function GetGtin :String;
    function SetGtin(const Value :String): TNfeItem;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TNfeItem;
    function GetCfop :Integer;
    function SetCfop(const Value :Integer): TNfeItem;
    function GetUnd :String;
    function SetUnd(const Value :String): TNfeItem;
    function GetQuantidade :Currency;
    function SetQuantidade(const Value :Currency): TNfeItem;
    function GetVlUnitario :Currency;
    function SetVlUnitario(const Value :Currency): TNfeItem;
    function GetVlDesconto :Currency;
    function SetVlDesconto(const Value :Currency): TNfeItem;
    function GetVlDescontoRateio :Currency;
    function SetVlDescontoRateio(const Value :Currency): TNfeItem;
    function GetVlOutros :Currency;
    function SetVlOutros(const Value :Currency): TNfeItem;
    function GetVlOutrosRateio :Currency;
    function SetVlOutrosRateio(const Value :Currency): TNfeItem;
    function GetVlProduto :Currency;
    function SetVlProduto(const Value :Currency): TNfeItem;
    function GetVlTotal :Currency;
    function SetVlTotal(const Value :Currency): TNfeItem;
    function GetOrigem :Integer;
    function SetOrigem(const Value :Integer): TNfeItem;
    function GetCst :String;
    function SetCst(const Value :String): TNfeItem;
    function GetNcm :String;
    function SetNcm(const Value :String): TNfeItem;
    function GetExtipi :String;
    function SetExtipi(const Value :String): TNfeItem;
    function GetSnVbase :Currency;
    function SetSnVbase(const Value :Currency): TNfeItem;
    function GetSnAliqcredito :Currency;
    function SetSnAliqcredito(const Value :Currency): TNfeItem;
    function GetSnVcredito :Currency;
    function SetSnVcredito(const Value :Currency): TNfeItem;
    function GetIcmsVbase :Currency;
    function SetIcmsVbase(const Value :Currency): TNfeItem;
    function GetIcmsAliquota :Currency;
    function SetIcmsAliquota(const Value :Currency): TNfeItem;
    function GetIcmsVimposto :Currency;
    function SetIcmsVimposto(const Value :Currency): TNfeItem;
    function GetPisCst :String;
    function SetPisCst(const Value :String): TNfeItem;
    function GetPisVbase :Currency;
    function SetPisVbase(const Value :Currency): TNfeItem;
    function GetPisAliquota :Currency;
    function SetPisAliquota(const Value :Currency): TNfeItem;
    function GetPisVimposto :Currency;
    function SetPisVimposto(const Value :Currency): TNfeItem;
    function GetCofinsCst :String;
    function SetCofinsCst(const Value :String): TNfeItem;
    function GetCofinsVbase :Currency;
    function SetCofinsVbase(const Value :Currency): TNfeItem;
    function GetCofinsAliquota :Currency;
    function SetCofinsAliquota(const Value :Currency): TNfeItem;
    function GetCofinsVimposto :Currency;
    function SetCofinsVimposto(const Value :Currency): TNfeItem;
    function GetInAliqFederal :Currency;
    function SetInAliqFederal(const Value :Currency): TNfeItem;
    function GetInVlFederal :Currency;
    function SetInVlFederal(const Value :Currency): TNfeItem;
    function GetInAliqEstadual :Currency;
    function SetInAliqEstadual(const Value :Currency): TNfeItem;
    function GetInVlEstadual :Currency;
    function SetInVlEstadual(const Value :Currency): TNfeItem;
    function GetInAliqMunicipal :Currency;
    function SetInAliqMunicipal(const Value :Currency): TNfeItem;
    function GetInVlMunicipal :Currency;
    function SetInVlMunicipal(const Value :Currency): TNfeItem;
    function GetInfAdicional :String;
    function SetInfAdicional(const Value :String): TNfeItem;
    function GetCest :String;
    function SetCest(const Value :String): TNfeItem;
    function GetIdCodigoAnp :Integer;
    function SetIdCodigoAnp(const Value :Integer): TNfeItem;

    class function New: TNfeItem;
end;

implementation

class function TNfeItem.New: TNfeItem;
begin
  Result := Self.Create;
end;

function TNfeItem.SetSerie(const Value :Integer): TNfeItem;
begin
  FSerie := Value;
end;

function TNfeItem.GetSerie :Integer;
begin
  Result := FSerie;
end;

function TNfeItem.SetNumero(const Value :Integer): TNfeItem;
begin
  FNumero := Value;
end;

function TNfeItem.GetNumero :Integer;
begin
  Result := FNumero;
end;

function TNfeItem.SetItem(const Value :Integer): TNfeItem;
begin
  FItem := Value;
end;

function TNfeItem.GetItem :Integer;
begin
  Result := FItem;
end;

function TNfeItem.SetIdProduto(const Value :Integer): TNfeItem;
begin
  FIdProduto := Value;
end;

function TNfeItem.GetIdProduto :Integer;
begin
  Result := FIdProduto;
end;

function TNfeItem.SetGtin(const Value :String): TNfeItem;
begin
  FGtin := Value;
end;

function TNfeItem.GetGtin :String;
begin
  Result := FGtin;
end;

function TNfeItem.SetDescricao(const Value :String): TNfeItem;
begin
  FDescricao := Value;
end;

function TNfeItem.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TNfeItem.SetCfop(const Value :Integer): TNfeItem;
begin
  FCfop := Value;
end;

function TNfeItem.GetCfop :Integer;
begin
  Result := FCfop;
end;

function TNfeItem.SetUnd(const Value :String): TNfeItem;
begin
  FUnd := Value;
end;

function TNfeItem.GetUnd :String;
begin
  Result := FUnd;
end;

function TNfeItem.SetQuantidade(const Value :Currency): TNfeItem;
begin
  FQuantidade := Value;
end;

function TNfeItem.GetQuantidade :Currency;
begin
  Result := FQuantidade;
end;

function TNfeItem.SetVlUnitario(const Value :Currency): TNfeItem;
begin
  FVlUnitario := Value;
end;

function TNfeItem.GetVlUnitario :Currency;
begin
  Result := FVlUnitario;
end;

function TNfeItem.SetVlDesconto(const Value :Currency): TNfeItem;
begin
  FVlDesconto := Value;
end;

function TNfeItem.GetVlDesconto :Currency;
begin
  Result := FVlDesconto;
end;

function TNfeItem.SetVlDescontoRateio(const Value :Currency): TNfeItem;
begin
  FVlDescontoRateio := Value;
end;

function TNfeItem.GetVlDescontoRateio :Currency;
begin
  Result := FVlDescontoRateio;
end;

function TNfeItem.SetVlOutros(const Value :Currency): TNfeItem;
begin
  FVlOutros := Value;
end;

function TNfeItem.GetVlOutros :Currency;
begin
  Result := FVlOutros;
end;

function TNfeItem.SetVlOutrosRateio(const Value :Currency): TNfeItem;
begin
  FVlOutrosRateio := Value;
end;

function TNfeItem.GetVlOutrosRateio :Currency;
begin
  Result := FVlOutrosRateio;
end;

function TNfeItem.SetVlProduto(const Value :Currency): TNfeItem;
begin
  FVlProduto := Value;
end;

function TNfeItem.GetVlProduto :Currency;
begin
  Result := FVlProduto;
end;

function TNfeItem.SetVlTotal(const Value :Currency): TNfeItem;
begin
  FVlTotal := Value;
end;

function TNfeItem.GetVlTotal :Currency;
begin
  Result := FVlTotal;
end;

function TNfeItem.SetOrigem(const Value :Integer): TNfeItem;
begin
  FOrigem := Value;
end;

function TNfeItem.GetOrigem :Integer;
begin
  Result := FOrigem;
end;

function TNfeItem.SetCst(const Value :String): TNfeItem;
begin
  FCst := Value;
end;

function TNfeItem.GetCst :String;
begin
  Result := FCst;
end;

function TNfeItem.SetNcm(const Value :String): TNfeItem;
begin
  FNcm := Value;
end;

function TNfeItem.GetNcm :String;
begin
  Result := FNcm;
end;

function TNfeItem.SetExtipi(const Value :String): TNfeItem;
begin
  FExtipi := Value;
end;

function TNfeItem.GetExtipi :String;
begin
  Result := FExtipi;
end;

function TNfeItem.SetSnVbase(const Value :Currency): TNfeItem;
begin
  FSnVbase := Value;
end;

function TNfeItem.GetSnVbase :Currency;
begin
  Result := FSnVbase;
end;

function TNfeItem.SetSnAliqcredito(const Value :Currency): TNfeItem;
begin
  FSnAliqcredito := Value;
end;

function TNfeItem.GetSnAliqcredito :Currency;
begin
  Result := FSnAliqcredito;
end;

function TNfeItem.SetSnVcredito(const Value :Currency): TNfeItem;
begin
  FSnVcredito := Value;
end;

function TNfeItem.GetSnVcredito :Currency;
begin
  Result := FSnVcredito;
end;

function TNfeItem.SetIcmsVbase(const Value :Currency): TNfeItem;
begin
  FIcmsVbase := Value;
end;

function TNfeItem.GetIcmsVbase :Currency;
begin
  Result := FIcmsVbase;
end;

function TNfeItem.SetIcmsAliquota(const Value :Currency): TNfeItem;
begin
  FIcmsAliquota := Value;
end;

function TNfeItem.GetIcmsAliquota :Currency;
begin
  Result := FIcmsAliquota;
end;

function TNfeItem.SetIcmsVimposto(const Value :Currency): TNfeItem;
begin
  FIcmsVimposto := Value;
end;

function TNfeItem.GetIcmsVimposto :Currency;
begin
  Result := FIcmsVimposto;
end;

function TNfeItem.SetPisCst(const Value :String): TNfeItem;
begin
  FPisCst := Value;
end;

function TNfeItem.GetPisCst :String;
begin
  Result := FPisCst;
end;

function TNfeItem.SetPisVbase(const Value :Currency): TNfeItem;
begin
  FPisVbase := Value;
end;

function TNfeItem.GetPisVbase :Currency;
begin
  Result := FPisVbase;
end;

function TNfeItem.SetPisAliquota(const Value :Currency): TNfeItem;
begin
  FPisAliquota := Value;
end;

function TNfeItem.GetPisAliquota :Currency;
begin
  Result := FPisAliquota;
end;

function TNfeItem.SetPisVimposto(const Value :Currency): TNfeItem;
begin
  FPisVimposto := Value;
end;

function TNfeItem.GetPisVimposto :Currency;
begin
  Result := FPisVimposto;
end;

function TNfeItem.SetCofinsCst(const Value :String): TNfeItem;
begin
  FCofinsCst := Value;
end;

function TNfeItem.GetCofinsCst :String;
begin
  Result := FCofinsCst;
end;

function TNfeItem.SetCofinsVbase(const Value :Currency): TNfeItem;
begin
  FCofinsVbase := Value;
end;

function TNfeItem.GetCofinsVbase :Currency;
begin
  Result := FCofinsVbase;
end;

function TNfeItem.SetCofinsAliquota(const Value :Currency): TNfeItem;
begin
  FCofinsAliquota := Value;
end;

function TNfeItem.GetCofinsAliquota :Currency;
begin
  Result := FCofinsAliquota;
end;

function TNfeItem.SetCofinsVimposto(const Value :Currency): TNfeItem;
begin
  FCofinsVimposto := Value;
end;

function TNfeItem.GetCofinsVimposto :Currency;
begin
  Result := FCofinsVimposto;
end;

function TNfeItem.SetInAliqFederal(const Value :Currency): TNfeItem;
begin
  FInAliqFederal := Value;
end;

function TNfeItem.GetInAliqFederal :Currency;
begin
  Result := FInAliqFederal;
end;

function TNfeItem.SetInVlFederal(const Value :Currency): TNfeItem;
begin
  FInVlFederal := Value;
end;

function TNfeItem.GetInVlFederal :Currency;
begin
  Result := FInVlFederal;
end;

function TNfeItem.SetInAliqEstadual(const Value :Currency): TNfeItem;
begin
  FInAliqEstadual := Value;
end;

function TNfeItem.GetInAliqEstadual :Currency;
begin
  Result := FInAliqEstadual;
end;

function TNfeItem.SetInVlEstadual(const Value :Currency): TNfeItem;
begin
  FInVlEstadual := Value;
end;

function TNfeItem.GetInVlEstadual :Currency;
begin
  Result := FInVlEstadual;
end;

function TNfeItem.SetInAliqMunicipal(const Value :Currency): TNfeItem;
begin
  FInAliqMunicipal := Value;
end;

function TNfeItem.GetInAliqMunicipal :Currency;
begin
  Result := FInAliqMunicipal;
end;

function TNfeItem.SetInVlMunicipal(const Value :Currency): TNfeItem;
begin
  FInVlMunicipal := Value;
end;

function TNfeItem.GetInVlMunicipal :Currency;
begin
  Result := FInVlMunicipal;
end;

function TNfeItem.SetInfAdicional(const Value :String): TNfeItem;
begin
  FInfAdicional := Value;
end;

function TNfeItem.GetInfAdicional :String;
begin
  Result := FInfAdicional;
end;

function TNfeItem.SetCest(const Value :String): TNfeItem;
begin
  FCest := Value;
end;

function TNfeItem.GetCest :String;
begin
  Result := FCest;
end;

function TNfeItem.SetIdCodigoAnp(const Value :Integer): TNfeItem;
begin
  FIdCodigoAnp := Value;
end;

function TNfeItem.GetIdCodigoAnp :Integer;
begin
  Result := FIdCodigoAnp;
end;

end.

