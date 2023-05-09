unit acpdv.Model.Entidade.Origem;

interface

type
  TOrigem = class
  private
    FId :Integer;
    FDescricao :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TOrigem;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TOrigem;

    class function New: TOrigem;
end;

implementation

class function TOrigem.New: TOrigem;
begin
  Result := Self.Create;
end;

function TOrigem.SetId(const Value :Integer): TOrigem;
begin
  FId := Value;
end;

function TOrigem.GetId :Integer;
begin
  Result := FId;
end;

function TOrigem.SetDescricao(const Value :String): TOrigem;
begin
  FDescricao := Value;
end;

function TOrigem.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

