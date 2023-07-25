unit acpdv.view.componente.mensagens;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  acpdv.utils.Forms.impl.resourcesimages,
  acpdv.utils;

type
  TTipoMensagem = (INFORMACAO, ERRO, ALERTA);

  TPageMensagens = class(TForm)
    pnlContainer: TPanel;
    pnlTitulo: TPanel;
    Image: TImage;
    pnlButton: TPanel;
    pnlCancelar: TPanel;
    ShapeCancelar: TShape;
    btnCancelar: TSpeedButton;
    pnlConfirmar: TPanel;
    ShapeConfirmar: TShape;
    btnConfirmar: TSpeedButton;
    pnlOk: TPanel;
    ShapeOk: TShape;
    btnOk: TSpeedButton;
    pnlMensagem: TPanel;
    lblMensagens: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FProcok: TProc<TObject>;
    FProcCancelar: TProc<TObject>;
    FProcConfirmar: TProc<TObject>;
    procedure Responsive;
    procedure ModelarMensagem(const aMensagem: String; aTipo: TTipoMensagem);
    procedure TipoMensagem(aTipo: TTipoMensagem);
  public
    class function New(AOWner: TComponent): TPageMensagens;
    function Mensagem(const aMensagem: String;
      aTipo: TTipoMensagem): TPageMensagens;
    function Embed(aParent: TPanel): TPageMensagens;
    function ClickOk(Proc: TProc<TObject>): TPageMensagens;
    function ClickConfirmar(Proc: TProc<TObject>): TPageMensagens;
    function ClickCancelar(Proc: TProc<TObject>): TPageMensagens;
  end;

implementation

{$R *.dfm}
{ TForm1 }

procedure TPageMensagens.ModelarMensagem(const aMensagem: String;
  aTipo: TTipoMensagem);
begin
  Self.lblMensagens.Caption := aMensagem;
  TipoMensagem(aTipo);
end;

procedure TPageMensagens.btnCancelarClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

procedure TPageMensagens.btnConfirmarClick(Sender: TObject);
begin
  if Assigned(FProcConfirmar) then
    FProcConfirmar(Sender);
  Self.RemoveObject;
end;

procedure TPageMensagens.btnOkClick(Sender: TObject);
begin
  if Assigned(FProcok) then
    FProcok(Sender);
  Self.RemoveObject;
end;

function TPageMensagens.ClickCancelar(Proc: TProc<TObject>): TPageMensagens;
begin
  Result := Self;
  FProcCancelar := Proc;
end;

function TPageMensagens.ClickConfirmar(Proc: TProc<TObject>): TPageMensagens;
begin
  Result := Self;
  FProcConfirmar := Proc;
end;

function TPageMensagens.ClickOk(Proc: TProc<TObject>): TPageMensagens;
begin
  Result := Self;
  FProcok := Proc;
end;

function TPageMensagens.Embed(aParent: TPanel): TPageMensagens;
begin
  Result := Self;
  Self.AddObject(aParent);
end;

procedure TPageMensagens.FormCreate(Sender: TObject);
begin
  Responsive;
end;

function TPageMensagens.Mensagem(const aMensagem: String;
      aTipo: TTipoMensagem): TPageMensagens;
begin
  Result := Self;
  Self.ModelarMensagem(aMensagem, aTipo);
end;

class function TPageMensagens.New(AOWner: TComponent): TPageMensagens;
begin
  Result := Self.Create(AOWner);
end;

procedure TPageMensagens.Responsive;
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

procedure TPageMensagens.TipoMensagem(aTipo: TTipoMensagem);
begin
  case aTipo of
    INFORMACAO:
      begin
        Self.pnlTitulo.Caption := 'Informação';
        Self.pnlCancelar.Visible := True;
        Self.pnlConfirmar.Visible := True;
        Self.btnCancelar.Caption := 'Cancelar';
        Self.btnConfirmar.Caption := 'Confirmar';
        TResourceImage.New.ResourceImage(Image, 'informacao');
      end;
    ERRO:
      begin
        Self.pnlTitulo.Caption := 'Erro';
        Self.pnlOk.Visible := True;
        Self.btnOk.Caption := 'Ok';
        TResourceImage.New.ResourceImage(Image, 'erro');
      end;
    ALERTA:
      begin
        Self.pnlTitulo.Caption := 'Alerta';
        Self.pnlOk.Visible := True;
        Self.btnOk.Caption := 'Ok';
        TResourceImage.New.ResourceImage(Image, 'alerta');
      end;
  end;
end;

end.
