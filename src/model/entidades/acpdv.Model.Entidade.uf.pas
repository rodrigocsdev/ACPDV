unit acpdv.Model.Entidade.uf;

interface

type
  TUf = class
  private
    FId :String;
    FDescricao :String;
    FCodIbge :Integer;

  public
    function GetId :String;
    function SetId(const Value :String): TUf;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TUf;
    function GetCodIbge :Integer;
    function SetCodIbge(const Value :Integer): TUf;

    class function New: TUf;
end;

implementation

class function TUf.New: TUf;
begin
  Result := Self.Create;
end;

function TUf.SetId(const Value :String): TUf;
begin
  FId := Value;
end;

function TUf.GetId :String;
begin
  Result := FId;
end;

function TUf.SetDescricao(const Value :String): TUf;
begin
  FDescricao := Value;
end;

function TUf.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TUf.SetCodIbge(const Value :Integer): TUf;
begin
  FCodIbge := Value;
end;

function TUf.GetCodIbge :Integer;
begin
  Result := FCodIbge;
end;

end.

