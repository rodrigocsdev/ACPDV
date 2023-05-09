unit acpdv.utils.forms.impl.forms;

interface

uses
  acpdv.utils.forms.interfaces, System.Classes, Vcl.ExtCtrls,
  acpdv.utils.forms.impl.gerenciadorform, System.SysUtils, Vcl.Controls;

type
  TForms = class(TInterfacedObject, iForm)
  private
    FKey: String;
    FComponentClass: TComponentClass;
    FParent: TPanel;
    FIndex: Boolean;
    FForm: iGerenciadorForm<iForm>;
    FProc: TProc;
    FKeyEvent: TKeyEvent;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iForm;
    function Key(Value: String): iForm; overload;
    function Key: String; overload;
    function ComponentClass(Value: TComponentClass): iForm; overload;
    function ComponetClass: TComponentClass; overload;
    function Parent(Value: TPanel): iForm; overload;
    function Parent: TPanel; overload;
    function Index(Value: Boolean): iForm; overload;
    function Index: Boolean; overload;
    function FormAction: iGerenciadorForm<iForm>;
    function Execuete(Value: TProc): iForm;
    function KeyDow(Value: TKeyEvent): iForm;
  end;

implementation

function TForms.ComponentClass(Value: TComponentClass): iForm;
begin
  Result := Self;
  FComponentClass := Value;
end;

function TForms.ComponetClass: TComponentClass;
begin
  Result := FComponentClass;
end;

constructor TForms.Create;
begin

end;

destructor TForms.Destroy;
begin

  inherited;
end;

function TForms.Execuete(Value: TProc): iForm;
begin
  Result := Self;
  FProc := Value;
end;

function TForms.FormAction: iGerenciadorForm<iForm>;
begin
  if not Assigned(FForm) then
    FForm := TGerenciadorForm<iForm>.New(Self);
  Result := FForm;
end;

function TForms.Index: Boolean;
begin
  Result := FIndex;
end;

function TForms.Index(Value: Boolean): iForm;
begin
  Result := Self;
  FIndex := Value;
end;

function TForms.Key: String;
begin
  Result := FKey;
end;

function TForms.KeyDow(Value: TKeyEvent): iForm;
begin
  Result := Self;
  FKeyEvent := VAlue;
end;

function TForms.Key(Value: String): iForm;
begin
  Result := Self;
  FKey := Value;
end;

class function TForms.New: iForm;
begin
  Result := Self.Create;
end;

function TForms.Parent(Value: TPanel): iForm;
begin
  Result := Self;
  FParent := Value;
end;

function TForms.Parent: TPanel;
begin
  Result := FParent;
end;

end.
