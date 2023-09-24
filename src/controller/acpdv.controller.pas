unit acpdv.controller;

interface

uses
  acpdv.model.core.entityoperador,
  acpdv.model.core.entitycaixa,
  acpdv.model.core.entityproduto, acpdv.model.core.entityvendas;

type
  TController = class
  private
    FOperador: TEntityOperador;
    FCaixa: TEntityCaixa;
    FProduto: TEntityProduto;
    FVenda: TEntityVendas;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: TController;
    function Operador: TEntityOperador;
    function Caixa: TEntityCaixa;
    function Produto: TEntityProduto;
    function Venda: TEntityVendas;
  end;

implementation

{ TController }

function TController.Caixa: TEntityCaixa;
begin
  if not Assigned(FCaixa) then
    FCaixa := TEntityCaixa.New;
  Result := FCaixa;
end;

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

function TController.Produto: TEntityProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TEntityProduto.New;
  Result := FProduto;
end;

function TController.Venda: TEntityVendas;
begin
  if not Assigned(FVenda) then
    FVenda := TEntityVendas.New;
  Result := FVenda;
end;

end.
