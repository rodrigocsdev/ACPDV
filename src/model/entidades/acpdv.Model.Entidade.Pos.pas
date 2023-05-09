unit acpdv.Model.Entidade.Pos;

interface

type
  TPos = class
  private
    FId :Integer;
    FIdEmpresa :Integer;
    FDescricao :String;
    FNumeroSerie :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TPos;
    function GetIdEmpresa :Integer;
    function SetIdEmpresa(const Value :Integer): TPos;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TPos;
    function GetNumeroSerie :String;
    function SetNumeroSerie(const Value :String): TPos;

    class function New: TPos;
end;

implementation

class function TPos.New: TPos;
begin
  Result := Self.Create;
end;

function TPos.SetId(const Value :Integer): TPos;
begin
  FId := Value;
end;

function TPos.GetId :Integer;
begin
  Result := FId;
end;

function TPos.SetIdEmpresa(const Value :Integer): TPos;
begin
  FIdEmpresa := Value;
end;

function TPos.GetIdEmpresa :Integer;
begin
  Result := FIdEmpresa;
end;

function TPos.SetDescricao(const Value :String): TPos;
begin
  FDescricao := Value;
end;

function TPos.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TPos.SetNumeroSerie(const Value :String): TPos;
begin
  FNumeroSerie := Value;
end;

function TPos.GetNumeroSerie :String;
begin
  Result := FNumeroSerie;
end;

end.

