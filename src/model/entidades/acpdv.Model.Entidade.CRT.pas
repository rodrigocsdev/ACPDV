unit acpdv.Model.Entidade.CRT;

interface

type
  TCrt = class
  private
    FId :Integer;
    FDescricao :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TCrt;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCrt;

    class function New: TCrt;
end;

implementation

class function TCrt.New: TCrt;
begin
  Result := Self.Create;
end;

function TCrt.SetId(const Value :Integer): TCrt;
begin
  FId := Value;
end;

function TCrt.GetId :Integer;
begin
  Result := FId;
end;

function TCrt.SetDescricao(const Value :String): TCrt;
begin
  FDescricao := Value;
end;

function TCrt.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

