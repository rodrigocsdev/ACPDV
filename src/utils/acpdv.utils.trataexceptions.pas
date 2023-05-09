unit acpdv.utils.trataexceptions;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  System.Classes,
  Vcl.Graphics,
  Vcl.Imaging.jpeg,
  acpdv.view.componente.mensagens,
  Vcl.ExtCtrls;

type
  TException = class
  private
    FLogFile: String;
    FApplicationPath: String;
    FLogPath: String;
    FLogImages: String;

    procedure GravarImagemFomulario(const aNomeArquivo: String;
      aFormulario: TForm);
    procedure GravarLog(aInfo, aMensagem: String);
    procedure TrataException(Sender: TObject; E: Exception);
    procedure TrataMensagem(OWner: TComponent; E: Exception);
  public
    constructor Create;
  end;

implementation

{ TException }

constructor TException.Create;
begin
  FApplicationPath := IncludeTrailingPathDelimiter
    ((ExtractFilePath(ParamStr(0))));
  FLogPath := IncludeTrailingPathDelimiter(FApplicationPath + 'LOGS');
  FLogImages := IncludeTrailingPathDelimiter(FLogPath + 'IMAGES');
  FLogFile := FLogPath + ExtractFileName(ChangeFileExt(ParamStr(0), '')
    ) + '.log';

  ForceDirectories(FLogPath);
  ForceDirectories(FLogImages);

  Application.OnException := TrataException;
end;

procedure TException.GravarImagemFomulario(const aNomeArquivo: String;
  aFormulario: TForm);
var
  lBitmap: TBitmap;
  lJpg: TJpegImage;
begin
  lBitmap := TBitmap.Create;
  lJpg := TJpegImage.Create;
  try
    lBitmap.Assign(aFormulario.GetFormImage);
    lJpg.Assign(lBitmap);
    lJpg.SaveToFile(Format('%s\%s.jpg', [FLogImages, aNomeArquivo]));
  finally
    lBitmap.DisposeOf;
    lJpg.DisposeOf;
  end;
end;

procedure TException.GravarLog(aInfo, aMensagem: String);
var
  lArq: TextFile;
begin
  AssignFile(lArq, FLogFile);
  if not FileExists(FLogFile) then
    Rewrite(lArq)
  else
    Append(lArq);

  Writeln(lArq, aInfo + aMensagem);
  CloseFile(lArq);
end;

procedure TException.TrataException(Sender: TObject; E: Exception);
var
  lDataHora: String;
begin
  lDataHora := FormatDateTime('ddmmyyyyhhmmss', now);

  GravarLog('[Data/Hora........] ', FormatDateTime('dd/mm/yyyy hh:mm:ss', now));
  GravarLog('[Mensagem.........] ', E.Message);
  GravarLog('[Classe Exceção...] ', E.ClassName);

  if (TComponent(Sender) is TForm) then
    GravarLog('[Formulário.......] ', TForm(Sender).Name)
  else
    GravarLog('[Formulário.......] ', TForm(TComponent(Sender).OWner).Name);

  GravarLog('[Unit.............] ', Sender.UnitName);
  GravarLog('[Component Visual.] ', Screen.ActiveControl.Name);
  GravarLog('', StringOfChar('-', 70));
  GravarLog('', '');

  GravarImagemFomulario(lDataHora, Screen.ActiveForm);
  TrataMensagem(TComponent(Sender).Owner, E);
end;

procedure TException.TrataMensagem(OWner: TComponent; E: Exception);
var
  lMensagem: TPageMensagens;
  lPanel: TPanel;
  I: Integer;
begin
  lMensagem:= TPageMensagens.New(OWner);

  if TForm(OWner).Parent <> nil then
    lMensagem.Embed(TPanel(TForm(OWner).Parent))
  else
  begin
    lPanel := TPanel(TForm(OWner).Controls[0]);

    for I := Pred(lPanel.ControlCount) downto 0 do
      if (lPanel.Controls[I] is TPanel) and (lPanel.Controls[I].Tag =  255) then
        lMensagem.Embed(TPanel(lPanel.Controls[I]));
  end;

  if E is EConvertError then
    lMensagem
    .Mensagem('Erro de converção de dados', ERRO)
    .ClickOk(procedure (Sender: TObject)
    begin
    //
    end);
end;

var
  MinhaExcecoes: TException;

initialization

MinhaExcecoes := TException.Create;

finalization

FreeAndNil(MinhaExcecoes);

end.
