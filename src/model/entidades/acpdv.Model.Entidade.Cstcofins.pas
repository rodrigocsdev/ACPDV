unit acpdv.Model.Entidade.Cstcofins;

interface

type
  TCstcofins = class
  private
    FId :String;
    FDescricao :String;

  public
    function GetId :String;
    function SetId(const Value :String): TCstcofins;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCstcofins;

    class function New: TCstcofins;
end;

implementation

class function TCstcofins.New: TCstcofins;
begin
  Result := Self.Create;
end;

function TCstcofins.SetId(const Value :String): TCstcofins;
begin
  FId := Value;
end;

function TCstcofins.GetId :String;
begin
  Result := FId;
end;

function TCstcofins.SetDescricao(const Value :String): TCstcofins;
begin
  FDescricao := Value;
end;

function TCstcofins.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

