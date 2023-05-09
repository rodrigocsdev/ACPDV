unit acpdv.view.page.identificarcliente;

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
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  acpdv.utils;

type
  TPageIdentificarCliente = class(TForm)
    pnlIdentificacaoCliente: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    pnlCPFCNPJ: TPanel;
    Label1: TLabel;
    Shape2: TShape;
    edtCPFCnpj: TEdit;
    pnlNome: TPanel;
    Label2: TLabel;
    Shape3: TShape;
    edtNome: TEdit;
    pnlButton: TPanel;
    Panel5: TPanel;
    Shape4: TShape;
    Panel6: TPanel;
    Panel7: TPanel;
    Image1: TImage;
    Panel8: TPanel;
    Panel9: TPanel;
    Shape5: TShape;
    Panel10: TPanel;
    Panel11: TPanel;
    Image4: TImage;
    Panel12: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FProc: TProc<String, String>;
    FPanelEmbed: TPanel;
  public
    class function New(AOWner: TComponent): TPageIdentificarCliente;
    function Embed(Value: TPanel): TPageIdentificarCliente;
    function IdentificaCPF: TPageIdentificarCliente;
    function identificarcliente(Value: TProc<String, String>)
      : TPageIdentificarCliente;
  end;

var
  PageIdentificarCliente: TPageIdentificarCliente;

implementation

{$R *.dfm}

function TPageIdentificarCliente.Embed(Value: TPanel): TPageIdentificarCliente;
begin
  Result := Self;
  Self.AddObject(Value);
end;

procedure TPageIdentificarCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2: ShowMessage('Pesquisa cliente PageIdentificarCliente');
    VK_F5: Panel11Click(Sender);
    VK_ESCAPE: Self.RemoveObject;
  end;
end;

procedure TPageIdentificarCliente.FormResize(Sender: TObject);
var
  lHeigth, lWidth: Integer;
begin
  lHeigth := Round((Self.Height - pnlIdentificacaoCliente.Height) / 2);
  lWidth := Round((Self.Width - pnlIdentificacaoCliente.Width) / 2);

  pnlIdentificacaoCliente.Margins.Left := lWidth;
  pnlIdentificacaoCliente.Margins.Right := lWidth;
  pnlIdentificacaoCliente.Margins.Top := lHeigth;
  pnlIdentificacaoCliente.Margins.Bottom := lHeigth;
  pnlIdentificacaoCliente.Align := alClient;
end;

procedure TPageIdentificarCliente.FormShow(Sender: TObject);
begin
  edtCPFCnpj.SetFocus;
end;

function TPageIdentificarCliente.IdentificaCPF: TPageIdentificarCliente;
begin
  Result := Self;
  pnlNome.Visible := False;
  pnlIdentificacaoCliente.Height :=
    (pnlIdentificacaoCliente.Height - pnlNome.Height);
end;

function TPageIdentificarCliente.identificarcliente
  (Value: TProc<String, String>): TPageIdentificarCliente;
begin
  Result := Self;
  FProc := Value;
end;

class function TPageIdentificarCliente.New(AOWner: TComponent)
  : TPageIdentificarCliente;
begin
  Result := Self.Create(AOWner);
end;

procedure TPageIdentificarCliente.Panel11Click(Sender: TObject);
var
  I, lIndex: Integer;
begin
  if Assigned(FProc) then
    FProc(edtCPFCnpj.Text, edtNome.Text);
  Self.RemoveObject;
end;

end.
