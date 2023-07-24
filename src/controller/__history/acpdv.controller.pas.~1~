unit acpdv.controller;

interface

uses
  acpdv.model.core.entityoperador;

type
  TController = class
  private
    FOperador: TEntityOperador;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: TController;
    function Operador: TEntityOperador;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin
  FOperador.Free;
  inherited;
end;

class function TController.New: TController;
begin
  Result := Self.Create;
end;

function TController.Operador: TEntityOperador;
begin
  if not Assigned(FOperador) then
    FOperador := TEntityOperador.New;
  Result := FOperador;
end;

end.
