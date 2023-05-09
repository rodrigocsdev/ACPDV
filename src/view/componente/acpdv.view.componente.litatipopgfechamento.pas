unit acpdv.view.componente.litatipopgfechamento;

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
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TComponentListaFechamentoCaixa = class(TFrame)
    Shape1: TShape;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    pnlTipoPagamento: TPanel;
    pnlValor: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    FProc: TProc<TObject>;
  public
    class function New(AWoner: TComponent): TComponentListaFechamentoCaixa;
    function Embed(Value: TWinControl): TComponentListaFechamentoCaixa;
    function Nome(Value: String): TComponentListaFechamentoCaixa;
    function TipoPagamento(Value: String): TComponentListaFechamentoCaixa;
    function Valor(Value: String): TComponentListaFechamentoCaixa;
    function Click(Value: TProc<TObject>): TComponentListaFechamentoCaixa;
    function Alinhamento(Value: TAlign): TComponentListaFechamentoCaixa;
  end;

implementation

{$R *.dfm}

{ TComponentListaFechamentoCaixa }

function TComponentListaFechamentoCaixa.Alinhamento(
  Value: TAlign): TComponentListaFechamentoCaixa;
begin
  Result := self;
  Self.Align := alBottom;
  Self.Align := Value;
end;

function TComponentListaFechamentoCaixa.Click(
  Value: TProc<TObject>): TComponentListaFechamentoCaixa;
begin
  Result := Self;
  FProc := Value;
end;

function TComponentListaFechamentoCaixa.Embed(
  Value: TWinControl): TComponentListaFechamentoCaixa;
begin
  Result := self;
  Self.Parent := Value;
end;

class function TComponentListaFechamentoCaixa.New(
  AWoner: TComponent): TComponentListaFechamentoCaixa;
begin
  Result := Self.Create(AWoner);
end;

function TComponentListaFechamentoCaixa.Nome(
  Value: String): TComponentListaFechamentoCaixa;
begin
  Result := Self;
  Self.Name := Value;
end;

procedure TComponentListaFechamentoCaixa.SpeedButton1Click(Sender: TObject);
begin
  if Assigned(FProc) then
    FProc(Sender);
end;

function TComponentListaFechamentoCaixa.TipoPagamento(
  Value: String): TComponentListaFechamentoCaixa;
begin
  Result := Self;
  pnlTipoPagamento.Caption := Value;
end;

function TComponentListaFechamentoCaixa.Valor(
  Value: String): TComponentListaFechamentoCaixa;
begin
  Result := Self;
  pnlValor.Caption := Format('R$ %s', [Value]);
end;

end.
