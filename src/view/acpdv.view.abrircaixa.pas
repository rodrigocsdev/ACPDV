unit acpdv.view.abrircaixa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  acpdv.utils, acpdv.model.caixa, acpdv.controller;

type
  TPageAbrirCaixa = class(TForm)
    pnlContainer: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Shape1: TShape;
    edtValorSuprimento: TEdit;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FController: TController;

    FProc: TProc<Boolean>;
    FList: TDictionary<String, Variant>;
    procedure Responsive;
  public
    class function New(AOwner: TComponent): TPageAbrirCaixa;
    function Embed(Value: TPanel): TPageAbrirCaixa;
    function Informacoes(Value: TDictionary<String, Variant>): TPageAbrirCaixa;
    function Click(Value: TProc<Boolean>): TPageAbrirCaixa;
  end;

implementation

{$R *.dfm}
{ TForm1 }

function TPageAbrirCaixa.Click(Value: TProc<Boolean>): TPageAbrirCaixa;
begin
  Result := Self;
  FProc := Value;
end;

function TPageAbrirCaixa.Embed(Value: TPanel): TPageAbrirCaixa;
begin
  Result := Self;
  Self.AddObject(Value);
end;

procedure TPageAbrirCaixa.FormCreate(Sender: TObject);
begin
  FController:= TController.New;
  FList:= TDictionary<String, Variant>.Create;
end;

procedure TPageAbrirCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.RemoveObject;
end;

procedure TPageAbrirCaixa.FormResize(Sender: TObject);
begin
  Responsive;
end;

procedure TPageAbrirCaixa.FormShow(Sender: TObject);
begin
  Responsive;
end;

function TPageAbrirCaixa.Informacoes(
  Value: TDictionary<String, Variant>): TPageAbrirCaixa;
var
  lKey: String;
begin
  Result := Self;
  for lKey in Value.Keys do
    FList.Add(lKey, Value[lKey]);
end;

class function TPageAbrirCaixa.New(AOwner: TComponent): TPageAbrirCaixa;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageAbrirCaixa.Responsive;
begin
  pnlContainer.Margins.Left := Round((Self.Width - pnlContainer.Width) / 2);
  pnlContainer.Margins.Right := Round((Self.Width - pnlContainer.Width) / 2);
  pnlContainer.Margins.Top := Round((Self.Height - pnlContainer.Height) / 2);
  pnlContainer.Margins.Bottom := Round((Self.Height - pnlContainer.Height) / 2);
  pnlContainer.Align := alClient;
end;

procedure TPageAbrirCaixa.SpeedButton1Click(Sender: TObject);
begin
  FList.AddOrSetValue('SALDOINICIAL',
    StringReplace(edtValorSuprimento.Text,'R$','',[rfReplaceAll]));
  FController.Caixa.AbrirCaixa(FList);
  if Assigned(FProc) then
    FProc(FController.Caixa.CaixaAberto);
  Self.RemoveObject;
end;

end.
