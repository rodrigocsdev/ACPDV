unit acpdv.view.page.pix;

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
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFramePix = class(TFrame)
    pnlQrCode: TPanel;
    Image1: TImage;
  private

  public
    class function New(AOwner: TComponent): TFramePix;
    function Alinhamento(Value: TAlign): TFramePix;
    function Embed(Value: TWinControl): TFramePix;
  end;

implementation

{$R *.dfm}
{ TFramePix }

{ TFramePix }

function TFramePix.Alinhamento(Value: TAlign): TFramePix;
begin
  Result := Self;
  Self.Align := VAlue;
end;

function TFramePix.Embed(Value: TWinControl): TFramePix;
begin
  Result := Self;
  Self.Parent := VAlue;
end;

class function TFramePix.New(AOwner: TComponent): TFramePix;
begin
  Result := Self.Create(Aowner);
end;

end.
