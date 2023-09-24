unit acpdv.view.page.pagamento;

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
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  acpdv.utils,
  acpdv.view.page.cartao,
  acpdv.view.page.pix,
  acpdv.view.page.dinheiro,
  acpdv.controller,
  System.Generics.Collections, acpdv.model.dtos;

type
  TPagePagamento = class(TForm)
    pnlContainer: TPanel;
    pnlInformacoes: TPanel;
    Panel1: TPanel;
    pnlInfoVenda: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel5: TPanel;
    Label2: TLabel;
    lblTotalVenda: TLabel;
    Panel6: TPanel;
    Label4: TLabel;
    edtDesconto: TEdit;
    Panel7: TPanel;
    Label5: TLabel;
    edtAcrecimo: TEdit;
    Panel8: TPanel;
    Label6: TLabel;
    lblReceber: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label8: TLabel;
    edtRecebido: TEdit;
    Panel11: TPanel;
    Label9: TLabel;
    lblRestante: TLabel;
    Panel12: TPanel;
    Label11: TLabel;
    lblTroco: TLabel;
    pnlPagamento: TPanel;
    pnlFormasPagamento: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Shape2: TShape;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    pnlListaPagamentos: TPanel;
    pnlCartao: TPanel;
    ShapeCartao: TShape;
    Panel20: TPanel;
    pnlCartaoAcao: TPanel;
    Image2: TImage;
    Panel22: TPanel;
    pnlPix: TPanel;
    ShapePix: TShape;
    Panel24: TPanel;
    pnlPixAcao: TPanel;
    Image3: TImage;
    Panel26: TPanel;
    pnlDinheiro: TPanel;
    ShapeDinheiro: TShape;
    Panel28: TPanel;
    pnlDinheiroAcao: TPanel;
    Image4: TImage;
    Panel30: TPanel;
    pnlContainerPg: TPanel;
    Panel32: TPanel;
    Shape6: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlPagamentoClick(Sender: TObject);
    procedure pnlCartaoAcaoClick(Sender: TObject);
    procedure pnlPixAcaoClick(Sender: TObject);
    procedure pnlDinheiroAcaoClick(Sender: TObject);
    procedure edtRecebidoChange(Sender: TObject);
  private
    FController: TController;
    FVenda: TDTOVenda;
    FLista: TDictionary<String,Variant>;

    FProc: TProc<TObject>;

    procedure Responsive;
    procedure AjustabotaoVenda;
    procedure SetClick(Shape: TShape; Panel: TPanel);
  public
    class function New(AOWner: TComponent): TPagePagamento;
    function Informacoes(Value: TDictionary<String, Variant>): TPagePagamento;
    function TotalVenda(Value: Currency): TPagePagamento;
    function Desconto(Value: Currency): TPagePagamento;
    function Acrescimo(Value: Currency): TPagePagamento;
    function Click(Value: TProc<TObject>): TPagePagamento;
    function Embed(Value: TPanel): TPagePagamento;
  end;

var
  PagePagamento: TPagePagamento;

implementation

{$R *.dfm}
{ TPagePagamentoDefault }

function TPagePagamento.Acrescimo(Value: Currency): TPagePagamento;
begin
  Result := Self;
  edtAcrecimo.Text := FormatCurr('0,0.00', Value);
  FVenda.Acrescimo := Value;
end;

procedure TPagePagamento.AjustabotaoVenda;
begin
  if pnlContainerPg.ControlCount > 1 then
    pnlPagamento.Caption := 'Finalizar Venda'
  else
    pnlPagamento.Caption := 'Cancelar e Retornar';
end;

function TPagePagamento.Click(Value: TProc<TObject>): TPagePagamento;
begin
  Result := Self;
  FProc := Value;
end;

function TPagePagamento.Desconto(Value: Currency): TPagePagamento;
begin
  Result := Self;
  edtDesconto.Text := FormatCurr('0,0.00', Value);
  FVenda.Desconto := Value;
end;

procedure TPagePagamento.edtRecebidoChange(Sender: TObject);
begin
  edtRecebido.Text := FormatCurr(',0.00',
    StrToCurr(edtRecebido.Text));
  FVenda.Recebido := StrToCurrDef(edtRecebido.Text, 0);
  lblRestante.Caption := FormatCurr(',0.00',
    (FVenda.ValorTotal + FVenda.Acrescimo - FVenda.Desconto) -
    FVenda.Recebido);
  lblTroco.Caption := FormatCurr(',0.00', FVenda.ValorTotal -
    FVenda.Recebido);
end;

function TPagePagamento.Embed(Value: TPanel): TPagePagamento;
begin
  Result := Self;
  Self.AddObject(Value);
end;

procedure TPagePagamento.FormCreate(Sender: TObject);
begin
  FController:= TController.New;
  FLista := TDictionary<String,Variant>.Create;
end;

procedure TPagePagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Self.RemoveObject;
    VK_F5:
      begin
        TFrameCartao.New(Self).Alinhamento(alClient).Embed(pnlContainerPg);
        SetClick(ShapeCartao, pnlListaPagamentos);
        FVenda.FormaPagamento := 'Cartao';
        AjustabotaoVenda;
      end;
    VK_F6:
      begin
        TFramePix.New(Self).Alinhamento(alClient).Embed(pnlContainerPg);
        SetClick(ShapePix, pnlListaPagamentos);
        FVenda.FormaPagamento := 'Pix';
        AjustabotaoVenda;
      end;
    VK_F7:
      begin
        TFrameDinheiro.New(Self).Alinhamento(alClient)
        .Recebido(FVenda.Recebido).Embed(pnlContainerPg);
        SetClick(ShapeDinheiro, pnlListaPagamentos);
        FVenda.FormaPagamento := 'Dinheiro';
        AjustabotaoVenda;
      end;
  end;
end;

procedure TPagePagamento.FormResize(Sender: TObject);
begin
  Responsive;
end;

procedure TPagePagamento.FormShow(Sender: TObject);
begin
  Responsive;
end;

function TPagePagamento.Informacoes(
  Value: TDictionary<String, Variant>): TPagePagamento;
begin
  Result := Self;
  for var lKey in value.Keys do
    FLista.AddOrSetValue(lKey, Value[lKey]);
end;

class function TPagePagamento.New(AOWner: TComponent)
  : TPagePagamento;
begin
  Result := Self.Create(AOWner);
end;

procedure TPagePagamento.pnlCartaoAcaoClick(Sender: TObject);
begin
  TFramePix.New(Self).Alinhamento(alClient).Embed(pnlContainerPg);
        SetClick(ShapePix, pnlListaPagamentos);
        FVenda.FormaPagamento := 'Cartao';
        AjustabotaoVenda;
end;

procedure TPagePagamento.pnlDinheiroAcaoClick(Sender: TObject);
begin
 TFrameDinheiro.New(Self).Alinhamento(alClient)
  .Recebido(FVenda.Recebido).Embed(pnlContainerPg);
        SetClick(ShapeDinheiro, pnlListaPagamentos);
        FVenda.FormaPagamento := 'Dinheiro';
        AjustabotaoVenda;
end;

procedure TPagePagamento.pnlPagamentoClick(Sender: TObject);
begin
  if pnlPagamento.Caption = 'Finalizar Venda' then
  begin
    FVenda.Numero := FLista['NUMERO'];
    FVenda.Serie := FLista['ID_CAIXA'];
    FVenda.Desconto := StrToCurrDef(edtDesconto.Text,0);
    FVenda.Acrescimo := StrToCurrDef(edtAcrecimo.Text,0);
    FVenda.ValorTotal := StrToCurrDef(lblTotalVenda.Caption,0);
    FVenda.Recebido := StrToCurrDef(edtRecebido.Text,0);
    FVenda.Troco := StrToCurrDef(lblTroco.Caption,0);
    FController.Venda.FechaVenda(FVenda);
    if Assigned(FProc) then
      FProc(Sender);
    Self.RemoveObject;
  end;
end;

procedure TPagePagamento.pnlPixAcaoClick(Sender: TObject);
begin
  TFramePix.New(Self).Alinhamento(alClient).Embed(pnlContainerPg);
        SetClick(ShapePix, pnlListaPagamentos);
        FVenda.FormaPagamento := 'Pix';
        AjustabotaoVenda;
end;

procedure TPagePagamento.Responsive;
var
  lHeigth, lWidth: Integer;
begin
  lHeigth := Round((Self.Height - pnlContainer.Height) / 2);
  lWidth := Round((Self.Width - pnlContainer.Width) / 2);

  pnlContainer.Margins.Left := lWidth;
  pnlContainer.Margins.Right := lWidth;
  pnlContainer.Margins.Top := lHeigth;
  pnlContainer.Margins.Bottom := lHeigth;
  pnlContainer.Align := alClient;
end;

procedure TPagePagamento.SetClick(Shape: TShape; Panel: TPanel);
begin
  ShapeCartao.Pen.Style := psClear;
  ShapePix.Pen.Style := psClear;
  ShapeDinheiro.Pen.Style := psClear;

  Shape.Pen.Style := psSolid;

  Panel.Visible := False;
  Panel.Visible := True;
end;

function TPagePagamento.TotalVenda(Value: Currency): TPagePagamento;
begin
  Result := Self;
  lblTotalVenda.Caption := FormatCurr(',0.00', Value);
  lblReceber.Caption := FormatCurr('0,0.00', Value);
  FVenda.ValorTotal := Value;
end;

end.
