unit acpdv.model.conexao;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Datasnap.DBClient,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  acpdv.model.conexao.configuracao;

type
  TConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FSQL: String;
  public
    class function New: TConexao;
    function SQL(Value: String): TConexao;
    function Params(aParam: String; Value: Variant): TConexao; overload;
    function Params(aIndex: Integer; Value: Variant): TConexao; overload;
    function DataSource(DataSource: TDataSource): TConexao;
    function DataSet: TDataSet;
    function ExecSQL: TConexao;
    function Open: TConexao;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TConexao }

procedure TConexao.DataModuleCreate(Sender: TObject);
var
  lConf: TConfiguracao;
begin
  lConf := TConfiguracao.Create(ExtractFilePath(ParamStr(0)));
  lConf.ReBuild;
  try
    FDConnection.Params.Clear;
    FDConnection.Params.DriverID := lConf.GetDriveID;
    FDConnection.Params.Database := lConf.GetDataBase;
    FDConnection.Params.UserName := lConf.GetUserName;
    FDConnection.Params.Password := lConf.GetPassword;

    if lConf.GetDriveID = 'SQLite' then
      FDConnection.Params.Add('LockingMode=Normal');
  finally
    lConf.Free;
  end;
  FDConnection.Connected := True;
end;

function TConexao.DataSet: TDataSet;
begin
  Result := FDQuery;
end;

function TConexao.DataSource(DataSource: TDataSource): TConexao;
begin
  Result := Self;
  DataSource.DataSet := FDQuery;
end;

function TConexao.ExecSQL: TConexao;
begin
  Result := Self;
  FDConnection.StartTransaction;
  try
    FDQuery.Prepare;
    FDQuery.ExecSQL;
    FDConnection.Commit;
  except
    FDConnection.Rollback;
    raise Exception.Create('Erro ao registrar os dados');
  end;
end;

class function TConexao.New: TConexao;
begin
  Result := Self.Create(nil);
end;

function TConexao.Open: TConexao;
begin
  Result := Self;
  FDQuery.Open;
end;

function TConexao.Params(aParam: String; Value: Variant): TConexao;
begin
  Result := Self;
  FDQuery.Params.Add;
  FDQuery.ParamByName(aParam).Value := Value;
end;

function TConexao.Params(aIndex: Integer; Value: Variant): TConexao;
begin
  Result := Self;
  FDQuery.Params.Add;
  FDQuery.Params[aIndex].Value := Value;
end;

function TConexao.SQL(Value: String): TConexao;
begin
  Result := Self;
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(Value);
end;

end.
