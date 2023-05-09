unit acpdv.utils.forms.impl.gerenciadorform;

interface

uses
  acpdv.utils.forms.interfaces,
  Vcl.forms,
  System.Generics.Collections;

type
  TGerenciadorForm<T> = class(TInterfacedObject, iGerenciadorForm<T>)
  private
    [weak]
    FForms: iForm;
    FFormIndex: TForm;
    FListForm: TObjectDictionary<String, TForm>;
    procedure LimpaListaForms;
  public
    constructor Create(forms: iForm);
    destructor Destroy; override;
    class function New(forms: iForm): iGerenciadorForm<T>;
    function Add: iGerenciadorForm<T>;
    function Get: TForm;
    function GetIndex: TForm;
    function Remove: iGerenciadorForm<T>;
  end;

implementation

function TGerenciadorForm<T>.Add: iGerenciadorForm<T>;
var
  lForm: TForm;
begin
  LimpaListaForms;

  if not FListForm.TryGetValue(FForms.Key, lForm) then
  begin
    Application.CreateForm(FForms.ComponetClass, lForm);
    FListForm.Add(FForms.Key, lForm);
  end;
  lForm.Parent := FForms.Parent;
  lForm.Show;

  if FForms.Index then
    FFormIndex := lForm;
end;

constructor TGerenciadorForm<T>.Create(forms: iForm);
begin
  FForms := forms;
  FListForm := TObjectDictionary<String, TForm>.Create;
end;

destructor TGerenciadorForm<T>.Destroy;
begin
  FListForm.DisposeOf;
  inherited;
end;

procedure TGerenciadorForm<T>.LimpaListaForms;
begin
  if FListForm.Count > 10 then
    FListForm.Clear;
end;

function TGerenciadorForm<T>.Get: TForm;
begin
  FListForm.TryGetValue(FForms.Key, Result);
end;

function TGerenciadorForm<T>.GetIndex: TForm;
begin
  Result := FFormIndex;
end;

class function TGerenciadorForm<T>.New(forms: iForm): iGerenciadorForm<T>;
begin
  Result := Self.Create(forms);
end;

function TGerenciadorForm<T>.Remove: iGerenciadorForm<T>;
var
  lForm: TForm;
begin
  if FListForm.TryGetValue(FForms.Key, lForm) then
  begin
    lForm.Close;
    FListForm.Remove(FForms.Key);
  end;
end;

end.
