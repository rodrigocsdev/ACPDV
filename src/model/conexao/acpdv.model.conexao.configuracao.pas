unit acpdv.model.conexao.configuracao;

interface

uses
  System.SysUtils,
  System.IniFiles,
  System.Classes,
  System.ZLib;

type
  TConfiguracao = class
  private
    FPath: String;
    FArquivo: TIniFile;

    procedure Comprimir;
    procedure Descomprimir;

    CONST
      ARQUIVOINI = 'CONFIGURACAO.CONF';
      TEMPINI = 'TEMP';
      SECAOCONF = 'CONFIGURACAO';
  public
    constructor Create(Path: String);
    destructor Destroy; override;
    class function New(Path: String): TConfiguracao;
    function SetDataBase(Value: String): TConfiguracao;
    function GetDataBase: String;
    function SetUserName(Value: String): TConfiguracao;
    function GetUserName: String;
    function SetPassword(Value: String): TConfiguracao;
    function GetPassword: String;
    function SetDriveID(Value: String): TConfiguracao;
    function GetDriveID: String;
    procedure Build;
    procedure ReBuild;
  end;

implementation

{ TConfiguracao }

procedure TConfiguracao.Build;
begin
  Comprimir;
end;

procedure TConfiguracao.Comprimir;
var
  lInput, lOut: TStringStream;
begin
  lInput := TStringStream.Create;
  lout := TStringStream.Create;
  try
    lInput.LoadFromFile(FPath+ARQUIVOINI);
    ZCompressStream(lInput, lOut);
    lOut.SaveToFile(FPath+ARQUIVOINI);
  finally
    lInput.Free;
    lOut.Free;
  end;
end;

constructor TConfiguracao.Create(Path: String);
begin
  FPath := Path;
  FArquivo := TIniFile.Create(FPath+ARQUIVOINI);
end;

procedure TConfiguracao.Descomprimir;
var
  lInput, lOut: TStringStream;
begin
  lInput := TStringStream.Create;
  lout := TStringStream.Create;
  try
    lInput.LoadFromFile(FPath+ARQUIVOINI);
    ZDecompressStream(lInput, lOut);

    lOut.SaveToFile(FPath+TEMPINI);

    if Assigned(FArquivo) then
      FArquivo.Free;
    FArquivo := TIniFile.Create(FPath+TEMPINI);
  finally
    lInput.Free;
    lOut.Free;
  end;
end;

destructor TConfiguracao.Destroy;
begin
  FArquivo.Free;
  if FileExists(FPath+TEMPINI) then
    DeleteFile(FPath+TEMPINI);
  inherited;
end;

function TConfiguracao.GetDataBase: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'DATABASE', '');
end;

function TConfiguracao.GetDriveID: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'DRIVEID', '');
end;

function TConfiguracao.GetPassword: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'PASSWORD', '');
end;

function TConfiguracao.GetUserName: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'USERNAME', '');
end;

class function TConfiguracao.New(Path: String): TConfiguracao;
begin
  Result := Self.Create(Path);
end;

procedure TConfiguracao.ReBuild;
begin
  Descomprimir;
end;

function TConfiguracao.SetDataBase(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'DATABASE',Value);
end;

function TConfiguracao.SetDriveID(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'DRIVEID',Value);
end;

function TConfiguracao.SetPassword(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'PASSWORD',Value);
end;

function TConfiguracao.SetUserName(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'USERNAME',Value);
end;

end.
