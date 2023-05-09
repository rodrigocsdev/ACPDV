unit acpdv.Model.Entidade.Cfop;

interface

type
  TCfop = class
  private
    FId :Integer;
    FDescricao :String;
  public
    function GetId :Integer;
    function SetId(const Value :Integer): TCfop;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCfop;

    class function New: TCfop;
end;

implementation

class function TCfop.New: TCfop;
begin
  Result := Self.Create;
end;

function TCfop.SetId(const Value :Integer): TCfop;
begin
  FId := Value;
end;

function TCfop.GetId :Integer;
begin
  Result := FId;
end;

function TCfop.SetDescricao(const Value :String): TCfop;
begin
  FDescricao := Value;
end;

function TCfop.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

