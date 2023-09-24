unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Printers;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
  private
    procedure Memo_Print(Conteudo:TStrings);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
{ TForm2 }

procedure TForm2.Button3Click(Sender: TObject);
begin
  Memo_Print(Memo1.Lines);
end;

procedure TForm2.Memo_Print(Conteudo: TStrings);
Var
   MemoFile : TextFile;
   P : Integer;
Begin
   AssignPrn(MemoFile);
   Rewrite(MemoFile);
   For P := 0 to Conteudo.Count - 1 do
   Writeln(MemoFile,Conteudo.Strings[P]);
   CloseFile(MemoFile);
end;

end.
