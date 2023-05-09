unit acpdv.view.loginsupervisor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  acpdv.utils;

type
  TPagePermissaoSupervisor = class(TForm)
    Panel1: TPanel;
    pnlLogar: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    edtUsuario: TEdit;
    Panel4: TPanel;
    Label2: TLabel;
    Shape2: TShape;
    edtSenha: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Shape3: TShape;
    btnLogar: TSpeedButton;
    Panel7: TPanel;
    Shape4: TShape;
    SpeedButton1: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure Responsive;
  public
    class function New(AOWner: TComponent): TPagePermissaoSupervisor;
    function Embed(Value: TPanel): TPagePermissaoSupervisor;
  end;

var
  PagePermissaoSupervisor: TPagePermissaoSupervisor;

implementation

{$R *.dfm}

{ TForm1 }

function TPagePermissaoSupervisor.Embed(
  Value: TPanel): TPagePermissaoSupervisor;
begin
  Result := Self;
  Self.AddObject(Value);
end;

procedure TPagePermissaoSupervisor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Self.RemoveObject;
    VK_F5: Self.RemoveObject;
    VK_F2: Self.RemoveObject;
  end;
end;

procedure TPagePermissaoSupervisor.FormResize(Sender: TObject);
begin
  Responsive;
end;

procedure TPagePermissaoSupervisor.FormShow(Sender: TObject);
begin
  Responsive;
end;

class function TPagePermissaoSupervisor.New(
  AOWner: TComponent): TPagePermissaoSupervisor;
begin
  Result := Self.Create(AOWner);
end;

procedure TPagePermissaoSupervisor.Responsive;
var
  lHeigth, lWidth: Integer;
begin
  lHeigth := Round((Self.Height - panel1.Height) / 2);
  lWidth := Round((Self.Width - panel1.Width) / 2);

  panel1.Margins.Left := lWidth;
  panel1.Margins.Right := lWidth;
  panel1.Margins.Top := lHeigth;
  panel1.Margins.Bottom := lHeigth;
  panel1.Align := alClient;
end;

end.
