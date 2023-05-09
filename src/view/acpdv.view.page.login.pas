unit acpdv.view.page.login;

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
  Vcl.Buttons,
  Vcl.Imaging.jpeg,
  acpdv.view.componente.Transparencia,
  acpdv.utils,
  acpdv.controller;

type
  TPageLogin = class(TForm)
    pnlContainer: TPanel;
    pnlLogin: TPanel;
    pnlImage: TPanel;
    pnlLogar: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    edtUsuario: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Shape2: TShape;
    edtSenha: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Shape3: TShape;
    btnLogar: TSpeedButton;
    Image: TImage;
    procedure btnLogarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FController: TController;
    FFundo: TFundoTransparente;
    FProc: TProc<String>;
    FPanel: TPanel;
  public
    class function New(AOWner: TComponent): TPageLogin;
    function Embed(Value: TPanel): TPageLogin;
    function Informacao(Value: TProc<String>): TPageLogin;
  end;

var
  PageLogin: TPageLogin;

implementation

{$R *.dfm}

procedure TPageLogin.btnLogarClick(Sender: TObject);
begin
  if not (FController.Operador.ValidarOperador(edtUsuario.Text,edtSenha.Text)) then
  begin
    ShowMessage('Login e senha invalido');
    Exit;
  end;
  FProc(edtUsuario.Text);
  Self.RemoveObject;
end;

function TPageLogin.Embed(Value: TPanel): TPageLogin;
begin
  Result := Self;
  Self.Parent := Value;
end;

procedure TPageLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFundo.DisposeOf;
end;

procedure TPageLogin.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FFundo := TFundoTransparente.Create(nil);
  FFundo.Parent := pnlImage;
  FFundo.Show;
end;

function TPageLogin.Informacao(Value: TProc<String>): TPageLogin;
begin
  Result := Self;
  FProc := Value;
end;

class function TPageLogin.New(AOWner: TComponent): TPageLogin;
begin
  Result := Self.Create(AOWner);
end;

end.
