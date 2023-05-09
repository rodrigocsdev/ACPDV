unit acpdv.Model.Entidade.Turno;

interface

type
  TTurno = class
  private
    FIdTurno :Integer;
    FNome :String;

  public
    function GetIdTurno :Integer;
    function SetIdTurno(const Value :Integer): TTurno;
    function GetNome :String;
    function SetNome(const Value :String): TTurno;

    class function New: TTurno;
end;

implementation

class function TTurno.New: TTurno;
begin
  Result := Self.Create;
end;

function TTurno.SetIdTurno(const Value :Integer): TTurno;
begin
  FIdTurno := Value;
end;

function TTurno.GetIdTurno :Integer;
begin
  Result := FIdTurno;
end;

function TTurno.SetNome(const Value :String): TTurno;
begin
  FNome := Value;
end;

function TTurno.GetNome :String;
begin
  Result := FNome;
end;

end.

