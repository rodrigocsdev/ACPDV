unit acpdv.view.componente.listaitem;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TComponenteListaItem = class(TFrame)
    Shape1: TShape;
    pnlContainer: TPanel;
    pnlItem: TPanel;
    pnlCondigo: TPanel;
    pnlSubTotal: TPanel;
    pnlQuantidade: TPanel;
    pnlValorUnitario: TPanel;
    pnlDescricao: TPanel;
    lblDescricao: TLabel;
  private
    FProc: TProc<TObject>;
    FQuantidade: Double;
    FValorUnitario: Double;
  public
    class function New(AOWner: TComponent): TComponenteListaItem;
    function Embed(Value: TWinControl): TComponenteListaItem;
    function Item(Value: Integer): TComponenteListaItem;
    function Codigo(Value: String): TComponenteListaItem;
    function Descricao(Value: String): TComponenteListaItem;
    function Quantidade(Value: Double): TComponenteListaItem;
    function ValorUnitario(Value: Double): TComponenteListaItem;
    function Click(Value: TProc<TObject>): TComponenteListaItem;
    function Alinhamento(Value: TAlign): TComponenteListaItem;
    function Nome(Value: String): TComponenteListaItem;
    function Build: TComponenteListaItem;
  end;

implementation

{$R *.dfm}

{ TComponenteListaItem }

function TComponenteListaItem.Alinhamento(Value: TAlign): TComponenteListaItem;
begin
  Result := Self;
  Self.Align := alBottom;
  Self.Align := Value;
end;

function TComponenteListaItem.Build: TComponenteListaItem;
begin
  Result := Self;
  pnlSubTotal.Caption := FormatCurr('"R$ ",0.00', (FValorUnitario*FQuantidade));
end;

function TComponenteListaItem.Click(
  Value: TProc<TObject>): TComponenteListaItem;
begin
  Result := Self;
  FProc := Value;
end;

function TComponenteListaItem.Codigo(Value: String): TComponenteListaItem;
begin
  Result := Self;
  pnlCondigo.Caption := Value;
end;

function TComponenteListaItem.Descricao(Value: String): TComponenteListaItem;
begin
  Result := Self;
  if Length(Value) > 40 then
    pnlDescricao.Padding.Top := 0;
  lblDescricao.Caption := Value;
end;

function TComponenteListaItem.Embed(Value: TWinControl): TComponenteListaItem;
begin
  Result := Self;
  Self.Parent := Value;
end;

function TComponenteListaItem.Item(Value: Integer): TComponenteListaItem;
begin
  Result := Self;
  pnlItem.Caption := Value.ToString;
end;

class function TComponenteListaItem.New(
  AOWner: TComponent): TComponenteListaItem;
begin
  Result := Self.Create(AOWner);
end;

function TComponenteListaItem.Nome(Value: String): TComponenteListaItem;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponenteListaItem.Quantidade(Value: Double): TComponenteListaItem;
begin
  Result := Self;
  FQuantidade := Value;
  pnlQuantidade.Caption := FormatFloat(',0.000', FQuantidade);
end;

function TComponenteListaItem.ValorUnitario(
  Value: Double): TComponenteListaItem;
begin
  Result := Self;
  FValorUnitario := Value;
  pnlValorUnitario.Caption := FormatCurr('"R$ ",0.00', FValorUnitario);
end;

end.
