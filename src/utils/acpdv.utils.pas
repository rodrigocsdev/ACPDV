unit acpdv.utils;

interface

uses
  System.Classes,
	Vcl.ExtCtrls,
	Vcl.Forms,
  Vcl.Controls;

type
  TFormHelper = class helper for TForm
  public
    procedure RemoveObject;
    procedure AddObject(Value: TPanel);
  end;

implementation


procedure TFormHelper.AddObject(Value: TPanel);
begin
  Self.ModalResult := mrOk;
  Self.Parent := Value;
  Self.Show;
end;

procedure TFormHelper.RemoveObject;
begin
  Self.ModalResult := mrNone;
  Self.Parent := nil;
  Self.Close;
end;

end.
