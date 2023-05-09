unit acpdv.view.page.dinheiro;

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
  Vcl.StdCtrls;

type
  TFrameDinheiro = class(TFrame)
    pnlContainerDinheiro: TPanel;
    pnlRecebido: TPanel;
    Label1: TLabel;
    edtRecebido: TEdit;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TFrameDinheiro;
    function Alinhamento(Value: TAlign): TFrameDinheiro;
    function Embed(Value: TWinControl): TFrameDinheiro;
  end;

implementation

{$R *.dfm}

{ TFrameDinheiro }

function TFrameDinheiro.Alinhamento(Value: TAlign): TFrameDinheiro;
begin
  Result := Self;
  Self.Align := VAlue;
end;

function TFrameDinheiro.Embed(Value: TWinControl): TFrameDinheiro;
begin
  Result := Self;
  Self.Parent := VAlue;
end;

class function TFrameDinheiro.New(AOwner: TComponent): TFrameDinheiro;
begin
  Result := Self.Create(Aowner);
end;

end.
