unit acpdv.Model.Entidade.Operador;

interface

type
  TOperador = class
  private
    FId :Integer;
    FNome :String;
    FSenha: String;
  public
    function GetId :Integer;
    function SetId(const Value :Integer): TOperador;
    function GetNome :String;
    function SetNome(const Value :String): TOperador;
    function GetSenha: String;
    function SetSenha(const Value: String): TOperador;

    class function New: TOperador;
end;

implementation

class function TOperador.New: TOperador;
begin
  Result := Self.Create;
end;

function TOperador.SetId(const Value :Integer): TOperador;
begin
  Result := Self;
  FId := Value;
end;

function TOperador.GetId :Integer;
begin
  Result := FId;
end;

function TOperador.SetNome(const Value :String): TOperador;
begin
  Result := Self;
  FNome := Value;
end;

function TOperador.SetSenha(const Value: String): TOperador;
begin
  Result := Self;
  FSenha := VAlue;
end;

function TOperador.GetNome :String;
begin
  Result := FNome;
end;

function TOperador.GetSenha: String;
begin
  Result := FSenha;
end;

end.

