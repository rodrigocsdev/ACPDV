unit acpdv.Model.Entidade.CodigoAnp;

interface

type
  TCodigoAnp = class
  private
    FId :Integer;
    FFamilia :String;
    FGrupo :String;
    FSubGrupo :String;
    FSubSubGrupo :String;
    FProduto :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TCodigoAnp;
    function GetFamilia :String;
    function SetFamilia(const Value :String): TCodigoAnp;
    function GetGrupo :String;
    function SetGrupo(const Value :String): TCodigoAnp;
    function GetSubGrupo :String;
    function SetSubGrupo(const Value :String): TCodigoAnp;
    function GetSubSubGrupo :String;
    function SetSubSubGrupo(const Value :String): TCodigoAnp;
    function GetProduto :String;
    function SetProduto(const Value :String): TCodigoAnp;

    class function New: TCodigoAnp;
end;

implementation

class function TCodigoAnp.New: TCodigoAnp;
begin
  Result := Self.Create;
end;

function TCodigoAnp.SetId(const Value :Integer): TCodigoAnp;
begin
  FId := Value;
end;

function TCodigoAnp.GetId :Integer;
begin
  Result := FId;
end;

function TCodigoAnp.SetFamilia(const Value :String): TCodigoAnp;
begin
  FFamilia := Value;
end;

function TCodigoAnp.GetFamilia :String;
begin
  Result := FFamilia;
end;

function TCodigoAnp.SetGrupo(const Value :String): TCodigoAnp;
begin
  FGrupo := Value;
end;

function TCodigoAnp.GetGrupo :String;
begin
  Result := FGrupo;
end;

function TCodigoAnp.SetSubGrupo(const Value :String): TCodigoAnp;
begin
  FSubGrupo := Value;
end;

function TCodigoAnp.GetSubGrupo :String;
begin
  Result := FSubGrupo;
end;

function TCodigoAnp.SetSubSubGrupo(const Value :String): TCodigoAnp;
begin
  FSubSubGrupo := Value;
end;

function TCodigoAnp.GetSubSubGrupo :String;
begin
  Result := FSubSubGrupo;
end;

function TCodigoAnp.SetProduto(const Value :String): TCodigoAnp;
begin
  FProduto := Value;
end;

function TCodigoAnp.GetProduto :String;
begin
  Result := FProduto;
end;

end.

