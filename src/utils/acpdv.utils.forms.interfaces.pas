unit acpdv.utils.forms.interfaces;

interface

uses
  Vcl.Forms, System.Classes, Vcl.ExtCtrls, System.SysUtils, Vcl.Controls;

type
  iGerenciadorForm<T> = interface
    function Add: iGerenciadorForm<T>;
    function Get: TForm;
    function GetIndex: TForm;
    function Remove: iGerenciadorForm<T>;
  end;

  iForm = interface
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

  iImage = interface
    function ResourceImage(aImage: TImage; aResource: String): iImage;
  end;

implementation

end.
