unit acpdv.Model.Entidade.CAIXA;

interface

type
  TCaixa = class
  private
    FId :Integer;
    FNome :String;
  public
    function GetId :Integer;
    function SetId(const Value :Integer): TCaixa;
    function GetNome :String;
    function SetNome(const Value :String): TCaixa;

    class function New: TCaixa;
end;

implementation

class function TCaixa.New: TCaixa;
begin
  Result := Self.Create;
end;

function TCaixa.SetId(const Value :Integer): TCaixa;
begin
  FId := Value;
end;

function TCaixa.GetId :Integer;
begin
  Result := FId;
end;

function TCaixa.SetNome(const Value :String): TCaixa;
begin
  FNome := Value;
end;

function TCaixa.GetNome :String;
begin
  Result := FNome;
end;

end.

