unit acpdv.Model.Entidade.Cstpis;

interface

type
  TCstpis = class
  private
    FId :String;
    FDescricao :String;

  public
    function GetId :String;
    function SetId(const Value :String): TCstpis;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCstpis;

    class function New: TCstpis;
end;

implementation

class function TCstpis.New: TCstpis;
begin
  Result := Self.Create;
end;

function TCstpis.SetId(const Value :String): TCstpis;
begin
  FId := Value;
end;

function TCstpis.GetId :String;
begin
  Result := FId;
end;

function TCstpis.SetDescricao(const Value :String): TCstpis;
begin
  FDescricao := Value;
end;

function TCstpis.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

