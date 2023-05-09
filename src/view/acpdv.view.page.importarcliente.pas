unit acpdv.view.page.importarcliente;

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
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  acpdv.utils;

type
  TPageImportarCliente = class(TForm)
    pnlContainer: TPanel;
    pnlTop: TPanel;
    pnlInfo: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    btnSair: TSpeedButton;
    pnlTitulo: TPanel;
    ImageCliente: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Panel5: TPanel;
    Shape1: TShape;
    edtPesquisar: TSearchBox;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FProc: TProc<TObject>;
  public
    class function New(AOWner: TComponent): TPageImportarCliente;
    function Titulo(Value: String): TPageImportarCliente;
    function Image(Value: String): TPageImportarCliente;
    function Click(Value: TProc<TObject>): TPageImportarCliente;
    function Embed(Value: TPanel): TPageImportarCliente;
  end;

  var
    PageImportarCliente: TPageImportarCliente;

implementation

{$R *.dfm}

{ TPageImportarCliente }

procedure TPageImportarCliente.btnSairClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

function TPageImportarCliente.Click(
  Value: TProc<TObject>): TPageImportarCliente;
begin
  Result := Self;
  FProc := Value;
end;

function TPageImportarCliente.Embed(Value: TPanel): TPageImportarCliente;
begin
  Self.AddObject(Value);
end;

procedure TPageImportarCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    self.parent := nil;
    Self.Close;
  end;
end;

function TPageImportarCliente.Image(Value: String): TPageImportarCliente;
begin
  Result := Self;
  ImageCliente.Picture.LoadFromFile(Value);
end;

class function TPageImportarCliente.New(
  AOWner: TComponent): TPageImportarCliente;
begin
  Result := Self.Create(AOWner);
end;

function TPageImportarCliente.Titulo(Value: String): TPageImportarCliente;
begin
  Result := Self;
  pnlTitulo.Caption := Value;
end;

end.
