unit acpdv.model.conexao;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
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

    procedure PreencheQuery(Value: String);
    procedure PreencheParams(Value: Array of Variant);
  public
    class function New: TConexao;
    function SQL(Value: String): TConexao;
    function Params(aParam: String; Value: Variant): TConexao; overload;
    function Params(aIndex: Integer; Value: Variant): TConexao; overload;
    function DataSource(DataSource: TDataSource): TConexao;
    function DataSet: TDataSet;
    function ExecSQL: TConexao;
    function Open: TConexao;

    procedure Query(const Statement: String; const Params: Array of Variant); overload;
    function Query(const Statement: Variant; const Params: Array of VAriant): TDataSet; overload;
    function One(const Statement: Variant; const Prams: Array of VAriant): TDictionary<String, VAriant>;
    procedure Close;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TConexao }

procedure TConexao.Close;
begin
  FDConnection.Connected := False;
end;

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

function TConexao.One(const Statement: Variant;
  const Prams: array of VAriant): TDictionary<String, VAriant>;
begin

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

procedure TConexao.PreencheParams(Value: array of Variant);
begin
  for var I := Low(Value) to High(Value) do
  begin
    FDQuery.Params.Add;
    FDQuery.Params[I].Value := Value[I];
  end;
end;

procedure TConexao.PreencheQuery(Value: String);
begin
  if not FDConnection.Connected then
    FDConnection.Connected := True;

  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(Value);
end;

procedure TConexao.Query(const Statement: String;
  const Params: array of Variant);
begin
  PreencheQuery(Statement);
  PreencheParams(Params);
  FDQuery.ExecSQL;
end;

function TConexao.Query(const Statement: Variant;
  const Params: array of VAriant): TDataSet;
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FDQuery.Open();
  Result := FDQuery;
end;

function TConexao.SQL(Value: String): TConexao;
begin
  Result := Self;
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(Value);
end;

end.
