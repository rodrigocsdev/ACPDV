unit acpdv.view.page.fechamentocaixa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Generics.Collections,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls, acpdv.model.caixa, acpdv.model.enum,
  acpdv.view.componente.litatipopgfechamento, acpdv.controller;

type
  TPageFechamentoCaixa = class(TForm)
    pnlContainer: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    ComboBox1: TComboBox;
    Panel8: TPanel;
    Edit1: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel12: TPanel;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    FController: TController;
    FProc : TProc<Boolean>;
    FFechamento: TDictionary<String, Variant>;
    FIndex: Integer;
    FLista: TComponentListaFechamentoCaixa;
    procedure Responsive;
    procedure RemoveIntemLista(Sender: TObject);
  public
    class function New(AOwner: TComponent): TPageFechamentoCaixa;
    function Embed(Value: TWinControl): TPageFechamentoCaixa;
    function Informacoes(Value: TDictionary<String, Variant>): TPageFechamentoCaixa;
    function ValidarCaixa(Value: TProc<Boolean>): TPageFechamentoCaixa;
  end;

implementation

{$R *.dfm}
{ TForm1 }

function TPageFechamentoCaixa.Embed(Value: TWinControl): TPageFechamentoCaixa;
begin
  Result := Self;
  Self.Parent := Value;
end;

procedure TPageFechamentoCaixa.FormCreate(Sender: TObject);
var
  i: TTipoPagamento;
begin
  FController:= TController.New;
  FFechamento := TDictionary<String,Variant>.Create;
  Responsive;
  ComboBox1.Items.Clear;
  for I := Low(TTipoPagamento) to High(TTipoPagamento) do
    ComboBox1.Items.Add(I.ToString);
end;

procedure TPageFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

procedure TPageFechamentoCaixa.FormResize(Sender: TObject);
begin
  Responsive;
end;

procedure TPageFechamentoCaixa.FormShow(Sender: TObject);
begin
  Responsive;
end;

function TPageFechamentoCaixa.Informacoes(Value: TDictionary<String, Variant>): TPageFechamentoCaixa;
var
  lKey: String;
begin
  Result := Self;
  for lKey in Value.Keys do
    FFechamento.AddOrSetValue(lKey, Value[lKey]);
end;

class function TPageFechamentoCaixa.New(AOwner: TComponent): TPageFechamentoCaixa;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageFechamentoCaixa.RemoveIntemLista(Sender: TObject);
begin
  ListBox1.DeleteSelected;
  FLista.DisposeOf;
  Dec(FIndex);
end;

procedure TPageFechamentoCaixa.Responsive;
begin
  pnlContainer.Margins.Left := Round((Self.Width - pnlContainer.Width) / 2);
  pnlContainer.Margins.Right := Round((Self.Width - pnlContainer.Width) / 2);
  pnlContainer.Margins.Top := Round((Self.Height - pnlContainer.Height) / 2);
  pnlContainer.Margins.Bottom := Round((Self.Height - pnlContainer.Height) / 2);
  pnlContainer.Align := alClient;
end;

procedure TPageFechamentoCaixa.SpeedButton1Click(Sender: TObject);
begin
  inc(FIndex);
  FLista := TComponentListaFechamentoCaixa.New(Self)
    .TipoPagamento(ComboBox1.Text)
    .Valor(Edit1.Text)
    .Embed(ListBox1)
    .Nome('Frame' + FIndex.ToString)
    .Click(RemoveIntemLista)
    .Alinhamento(alTop);

  FFechamento.AddOrSetValue(ComboBox1.Text,StringReplace(Edit1.Text,'R$','',[rfReplaceAll]));
end;

procedure TPageFechamentoCaixa.SpeedButton2Click(Sender: TObject);
begin
  FController.Caixa.FecharCaixa(FFechamento);
  FProc(FController.Caixa.CaixaAberto);
  close;
end;

procedure TPageFechamentoCaixa.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

function TPageFechamentoCaixa.ValidarCaixa(
  Value: TProc<Boolean>): TPageFechamentoCaixa;
begin
  Result := Self;
  FProc := Value;
end;

end.
