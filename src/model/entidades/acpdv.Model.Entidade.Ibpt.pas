unit acpdv.Model.Entidade.Ibpt;

interface

type
  TIbpt = class
  private
    FId :String;
    FExtipi :String;
    FTipo :Integer;
    FAliqNacional :Currency;
    FAliqImportado :Currency;
    FAliqEstadual :Currency;
    FAliqMunicipal :Currency;
    FCest :String;

  public
    function GetId :String;
    function SetId(const Value :String): TIbpt;
    function GetExtipi :String;
    function SetExtipi(const Value :String): TIbpt;
    function GetTipo :Integer;
    function SetTipo(const Value :Integer): TIbpt;
    function GetAliqNacional :Currency;
    function SetAliqNacional(const Value :Currency): TIbpt;
    function GetAliqImportado :Currency;
    function SetAliqImportado(const Value :Currency): TIbpt;
    function GetAliqEstadual :Currency;
    function SetAliqEstadual(const Value :Currency): TIbpt;
    function GetAliqMunicipal :Currency;
    function SetAliqMunicipal(const Value :Currency): TIbpt;
    function GetCest :String;
    function SetCest(const Value :String): TIbpt;

    class function New: TIbpt;
end;

implementation

class function TIbpt.New: TIbpt;
begin
  Result := Self.Create;
end;

function TIbpt.SetId(const Value :String): TIbpt;
begin
  FId := Value;
end;

function TIbpt.GetId :String;
begin
  Result := FId;
end;

function TIbpt.SetExtipi(const Value :String): TIbpt;
begin
  FExtipi := Value;
end;

function TIbpt.GetExtipi :String;
begin
  Result := FExtipi;
end;

function TIbpt.SetTipo(const Value :Integer): TIbpt;
begin
  FTipo := Value;
end;

function TIbpt.GetTipo :Integer;
begin
  Result := FTipo;
end;

function TIbpt.SetAliqNacional(const Value :Currency): TIbpt;
begin
  FAliqNacional := Value;
end;

function TIbpt.GetAliqNacional :Currency;
begin
  Result := FAliqNacional;
end;

function TIbpt.SetAliqImportado(const Value :Currency): TIbpt;
begin
  FAliqImportado := Value;
end;

function TIbpt.GetAliqImportado :Currency;
begin
  Result := FAliqImportado;
end;

function TIbpt.SetAliqEstadual(const Value :Currency): TIbpt;
begin
  FAliqEstadual := Value;
end;

function TIbpt.GetAliqEstadual :Currency;
begin
  Result := FAliqEstadual;
end;

function TIbpt.SetAliqMunicipal(const Value :Currency): TIbpt;
begin
  FAliqMunicipal := Value;
end;

function TIbpt.GetAliqMunicipal :Currency;
begin
  Result := FAliqMunicipal;
end;

function TIbpt.SetCest(const Value :String): TIbpt;
begin
  FCest := Value;
end;

function TIbpt.GetCest :String;
begin
  Result := FCest;
end;

end.

