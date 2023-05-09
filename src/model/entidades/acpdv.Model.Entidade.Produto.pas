unit acpdv.Model.Entidade.Produto;

interface

type
  TProduto = class
  private
    FId :Integer;
    FAtivo :String;
    FPermiteFracionar :String;
    FGtin :String;
    FDescricao :String;
    FUnd :String;
    FVlUnitario :Currency;
    FNcm :String;
    FExtipi :String;
    FCfop :Integer;
    FOrigem :Integer;
    FCst :String;
    FSnAliqcredito :Currency;
    FIcmsAliquota :Currency;
    FIdCstpis :String;
    FPisAliquota :Currency;
    FIdCstcofins :String;
    FCofinsAliquota :Currency;
    FCest :String;
    FQtdeEstoque :Currency;
    FGeraArquivoBalanca :String;
    FCombustivel :String;
    FIdCodigoAnp :Integer;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TProduto;
    function GetAtivo :String;
    function SetAtivo(const Value :String): TProduto;
    function GetPermiteFracionar :String;
    function SetPermiteFracionar(const Value :String): TProduto;
    function GetGtin :String;
    function SetGtin(const Value :String): TProduto;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TProduto;
    function GetUnd :String;
    function SetUnd(const Value :String): TProduto;
    function GetVlUnitario :Currency;
    function SetVlUnitario(const Value :Currency): TProduto;
    function GetNcm :String;
    function SetNcm(const Value :String): TProduto;
    function GetExtipi :String;
    function SetExtipi(const Value :String): TProduto;
    function GetCfop :Integer;
    function SetCfop(const Value :Integer): TProduto;
    function GetOrigem :Integer;
    function SetOrigem(const Value :Integer): TProduto;
    function GetCst :String;
    function SetCst(const Value :String): TProduto;
    function GetSnAliqcredito :Currency;
    function SetSnAliqcredito(const Value :Currency): TProduto;
    function GetIcmsAliquota :Currency;
    function SetIcmsAliquota(const Value :Currency): TProduto;
    function GetIdCstpis :String;
    function SetIdCstpis(const Value :String): TProduto;
    function GetPisAliquota :Currency;
    function SetPisAliquota(const Value :Currency): TProduto;
    function GetIdCstcofins :String;
    function SetIdCstcofins(const Value :String): TProduto;
    function GetCofinsAliquota :Currency;
    function SetCofinsAliquota(const Value :Currency): TProduto;
    function GetCest :String;
    function SetCest(const Value :String): TProduto;
    function GetQtdeEstoque :Currency;
    function SetQtdeEstoque(const Value :Currency): TProduto;
    function GetGeraArquivoBalanca :String;
    function SetGeraArquivoBalanca(const Value :String): TProduto;
    function GetCombustivel :String;
    function SetCombustivel(const Value :String): TProduto;
    function GetIdCodigoAnp :Integer;
    function SetIdCodigoAnp(const Value :Integer): TProduto;

    class function New: TProduto;
end;

implementation

class function TProduto.New: TProduto;
begin
  Result := Self.Create;
end;

function TProduto.SetId(const Value :Integer): TProduto;
begin
  FId := Value;
end;

function TProduto.GetId :Integer;
begin
  Result := FId;
end;

function TProduto.SetAtivo(const Value :String): TProduto;
begin
  FAtivo := Value;
end;

function TProduto.GetAtivo :String;
begin
  Result := FAtivo;
end;

function TProduto.SetPermiteFracionar(const Value :String): TProduto;
begin
  FPermiteFracionar := Value;
end;

function TProduto.GetPermiteFracionar :String;
begin
  Result := FPermiteFracionar;
end;

function TProduto.SetGtin(const Value :String): TProduto;
begin
  FGtin := Value;
end;

function TProduto.GetGtin :String;
begin
  Result := FGtin;
end;

function TProduto.SetDescricao(const Value :String): TProduto;
begin
  FDescricao := Value;
end;

function TProduto.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TProduto.SetUnd(const Value :String): TProduto;
begin
  FUnd := Value;
end;

function TProduto.GetUnd :String;
begin
  Result := FUnd;
end;

function TProduto.SetVlUnitario(const Value :Currency): TProduto;
begin
  FVlUnitario := Value;
end;

function TProduto.GetVlUnitario :Currency;
begin
  Result := FVlUnitario;
end;

function TProduto.SetNcm(const Value :String): TProduto;
begin
  FNcm := Value;
end;

function TProduto.GetNcm :String;
begin
  Result := FNcm;
end;

function TProduto.SetExtipi(const Value :String): TProduto;
begin
  FExtipi := Value;
end;

function TProduto.GetExtipi :String;
begin
  Result := FExtipi;
end;

function TProduto.SetCfop(const Value :Integer): TProduto;
begin
  FCfop := Value;
end;

function TProduto.GetCfop :Integer;
begin
  Result := FCfop;
end;

function TProduto.SetOrigem(const Value :Integer): TProduto;
begin
  FOrigem := Value;
end;

function TProduto.GetOrigem :Integer;
begin
  Result := FOrigem;
end;

function TProduto.SetCst(const Value :String): TProduto;
begin
  FCst := Value;
end;

function TProduto.GetCst :String;
begin
  Result := FCst;
end;

function TProduto.SetSnAliqcredito(const Value :Currency): TProduto;
begin
  FSnAliqcredito := Value;
end;

function TProduto.GetSnAliqcredito :Currency;
begin
  Result := FSnAliqcredito;
end;

function TProduto.SetIcmsAliquota(const Value :Currency): TProduto;
begin
  FIcmsAliquota := Value;
end;

function TProduto.GetIcmsAliquota :Currency;
begin
  Result := FIcmsAliquota;
end;

function TProduto.SetIdCstpis(const Value :String): TProduto;
begin
  FIdCstpis := Value;
end;

function TProduto.GetIdCstpis :String;
begin
  Result := FIdCstpis;
end;

function TProduto.SetPisAliquota(const Value :Currency): TProduto;
begin
  FPisAliquota := Value;
end;

function TProduto.GetPisAliquota :Currency;
begin
  Result := FPisAliquota;
end;

function TProduto.SetIdCstcofins(const Value :String): TProduto;
begin
  FIdCstcofins := Value;
end;

function TProduto.GetIdCstcofins :String;
begin
  Result := FIdCstcofins;
end;

function TProduto.SetCofinsAliquota(const Value :Currency): TProduto;
begin
  FCofinsAliquota := Value;
end;

function TProduto.GetCofinsAliquota :Currency;
begin
  Result := FCofinsAliquota;
end;

function TProduto.SetCest(const Value :String): TProduto;
begin
  FCest := Value;
end;

function TProduto.GetCest :String;
begin
  Result := FCest;
end;

function TProduto.SetQtdeEstoque(const Value :Currency): TProduto;
begin
  FQtdeEstoque := Value;
end;

function TProduto.GetQtdeEstoque :Currency;
begin
  Result := FQtdeEstoque;
end;

function TProduto.SetGeraArquivoBalanca(const Value :String): TProduto;
begin
  FGeraArquivoBalanca := Value;
end;

function TProduto.GetGeraArquivoBalanca :String;
begin
  Result := FGeraArquivoBalanca;
end;

function TProduto.SetCombustivel(const Value :String): TProduto;
begin
  FCombustivel := Value;
end;

function TProduto.GetCombustivel :String;
begin
  Result := FCombustivel;
end;

function TProduto.SetIdCodigoAnp(const Value :Integer): TProduto;
begin
  FIdCodigoAnp := Value;
end;

function TProduto.GetIdCodigoAnp :Integer;
begin
  Result := FIdCodigoAnp;
end;

end.

