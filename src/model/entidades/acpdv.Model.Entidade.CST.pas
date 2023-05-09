unit acpdv.Model.Entidade.CST;

interface

type
  TCst = class
  private
    FId :String;
    FDescricao :String;
    FSimplesNacional :String;

  public
    function GetId :String;
    function SetId(const Value :String): TCst;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCst;
    function GetSimplesNacional :String;
    function SetSimplesNacional(const Value :String): TCst;

    class function New: TCst;
end;

implementation

class function TCst.New: TCst;
begin
  Result := Self.Create;
end;

function TCst.SetId(const Value :String): TCst;
begin
  FId := Value;
end;

function TCst.GetId :String;
begin
  Result := FId;
end;

function TCst.SetDescricao(const Value :String): TCst;
begin
  FDescricao := Value;
end;

function TCst.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TCst.SetSimplesNacional(const Value :String): TCst;
begin
  FSimplesNacional := Value;
end;

function TCst.GetSimplesNacional :String;
begin
  Result := FSimplesNacional;
end;

end.

