unit acpdv.Model.Entidade.Cidade;

interface

type
  TCidade = class
  private
    FCodIbge :Integer;
    FDescricao :String;
    FIdUf :String;
  public
    function GetCodIbge :Integer;
    function SetCodIbge(const Value :Integer): TCidade;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCidade;
    function GetIdUf :String;
    function SetIdUf(const Value :String): TCidade;

    class function New: TCidade;
end;

implementation

class function TCidade.New: TCidade;
begin
  Result := Self.Create;
end;

function TCidade.SetCodIbge(const Value :Integer): TCidade;
begin
  FCodIbge := Value;
end;

function TCidade.GetCodIbge :Integer;
begin
  Result := FCodIbge;
end;

function TCidade.SetDescricao(const Value :String): TCidade;
begin
  FDescricao := Value;
end;

function TCidade.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TCidade.SetIdUf(const Value :String): TCidade;
begin
  FIdUf := Value;
end;

function TCidade.GetIdUf :String;
begin
  Result := FIdUf;
end;

end.

