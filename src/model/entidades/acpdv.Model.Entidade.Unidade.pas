unit acpdv.Model.Entidade.Unidade;

interface

type
  TUnidade = class
  private
    FId :String;
    FUnidade :String;

  public
    function GetId :String;
    function SetId(const Value :String): TUnidade;
    function GetUnidade :String;
    function SetUnidade(const Value :String): TUnidade;

    class function New: TUnidade;
end;

implementation

class function TUnidade.New: TUnidade;
begin
  Result := Self.Create;
end;

function TUnidade.SetId(const Value :String): TUnidade;
begin
  Result := Self;
  FId := Value;
end;

function TUnidade.GetId :String;
begin
  Result := FId;
end;

function TUnidade.SetUnidade(const Value :String): TUnidade;
begin
  Result := Self;
  FUnidade := Value;
end;

function TUnidade.GetUnidade :String;
begin
  Result := FUnidade;
end;

end.

