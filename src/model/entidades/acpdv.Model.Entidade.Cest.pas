unit acpdv.Model.Entidade.Cest;

interface

type
  TCest = class
  private
    FId :String;
    FNcm :String;
    FDescricao :String;
  public
    function GetId :String;
    function SetId(const Value :String): TCest;
    function GetNcm :String;
    function SetNcm(const Value :String): TCest;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCest;

    class function New: TCest;
end;

implementation

class function TCest.New: TCest;
begin
  Result := Self.Create;
end;

function TCest.SetId(const Value :String): TCest;
begin
  FId := Value;
end;

function TCest.GetId :String;
begin
  Result := FId;
end;

function TCest.SetNcm(const Value :String): TCest;
begin
  FNcm := Value;
end;

function TCest.GetNcm :String;
begin
  Result := FNcm;
end;

function TCest.SetDescricao(const Value :String): TCest;
begin
  FDescricao := Value;
end;

function TCest.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

