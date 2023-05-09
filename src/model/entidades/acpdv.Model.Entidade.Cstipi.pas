unit acpdv.Model.Entidade.Cstipi;

interface

type
  TCstipi = class
  private
    FId :String;
    FDescricao :String;

  public
    function GetId :String;
    function SetId(const Value :String): TCstipi;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCstipi;

    class function New: TCstipi;
end;

implementation

class function TCstipi.New: TCstipi;
begin
  Result := Self.Create;
end;

function TCstipi.SetId(const Value :String): TCstipi;
begin
  FId := Value;
end;

function TCstipi.GetId :String;
begin
  Result := FId;
end;

function TCstipi.SetDescricao(const Value :String): TCstipi;
begin
  FDescricao := Value;
end;

function TCstipi.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

