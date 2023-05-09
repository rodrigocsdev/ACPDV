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
  acpdv.view.page.dinheiro;

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
    Label3: TLabel;
    Panel6: TPanel;
    Label4: TLabel;
    edtDesconto: TEdit;
    Panel7: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Panel8: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label8: TLabel;
    Edit2: TEdit;
    Panel11: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Panel12: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
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
  private
    procedure Responsive;
    procedure SetClick(Shape: TShape; Panel: TPanel);
  public
    class function New(AOWner: TComponent): TPagePagamento;
    function Embed(Value: TPanel): TPagePagamento;
  end;

var
  PagePagamento: TPagePagamento;

implementation

{$R *.dfm}
{ TPagePagamentoDefault }

function TPagePagamento.Embed(Value: TPanel): TPagePagamento;
begin
  Result := Self;
  Self.AddObject(Value);
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
      end;
    VK_F6:
      begin
        TFramePix.New(Self).Alinhamento(alClient).Embed(pnlContainerPg);
        SetClick(ShapePix, pnlListaPagamentos);
      end;
    VK_F7:
      begin
        TFrameDinheiro.New(Self).Alinhamento(alClient).Embed(pnlContainerPg);
        SetClick(ShapeDinheiro, pnlListaPagamentos);
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

class function TPagePagamento.New(AOWner: TComponent)
  : TPagePagamento;
begin
  Result := Self.Create(AOWner);
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

end.
