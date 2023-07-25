unit GeradorSimpleORM.Model.Gerador.ModelGeradorClasseDAO;

interface

uses
  GeradorSimpleORM.Model.Gerador.Interfaces,
  GeradorSimpleORM.Model.Conexoes.Interfaces,
  FireDAC.Comp.Client,
  System.SysUtils,
  System.Classes,
  System.Types,
  System.StrUtils;

Type
  TModelGeradorClasseDAO = class(TInterfacedObject, iModelGeradorClasse)
  private
    FMetaInfoQuery: TFDMetaInfoQuery;
    FClasse: TStringList;
    FPrivate: TStringList;
    FBody: TStringList;
    FInterface: TStringList;
    FProperty: TStringList;
    FPropertyInterface: TStringList;
    FProcedureLimpar: TStringList;
    FPK: TStringList;
    FTableName: String;
    FUnitName: String;
    FTipoCampo: String;

    function LowerCamelCase(Value: String): String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelGeradorClasse;
    function TableName(AValue: String): iModelGeradorClasse;
    function Fields(AValue: iModelMetaInfoQuery): iModelGeradorClasse;
    function UnitName(AValue: String): iModelGeradorClasse;
    function &End: String;
  end;

implementation

{ TModelGeradorClasseDAO }

constructor TModelGeradorClasseDAO.Create;
begin
  FPrivate := TStringList.Create;
  FBody := TStringList.Create;
  FInterface := TStringList.Create;
  FProperty := TStringList.Create;
  FPropertyInterface := TStringList.Create;
  FProcedureLimpar := TStringList.Create;
  FPK := TStringList.Create;
  FClasse := TStringList.Create;
  FTipoCampo := EmptyStr;
end;

destructor TModelGeradorClasseDAO.Destroy;
begin
  FPrivate.Free;
  FBody.Free;
  FInterface.Free;
  FProperty.Free;
  FPropertyInterface.Free;
  FProcedureLimpar.Free;
  FPK.Free;
  FClasse.Free;
  inherited;
end;

function TModelGeradorClasseDAO.&End: String;
var
  MPK: String;
  I: Integer;
begin
  (FMetaInfoQuery.Connection as TFDConnection).GetKeyFieldNames('', '',
    FTableName.Trim.ToUpper, '', FPK);

  FProperty.Add('    function Listar : iDAO<T'+ FTableName + '>;');
  FProperty.Add('    function ListarPorId(Id : Variant) : iDAO<T'+ FTableName + '>;');
  FProperty.Add('    function Excluir(aId : Variant) : iDAO<T'+ FTableName + '>; overload;');
  FProperty.Add('    function Excluir : iDAO<T'+ FTableName + '>; overload;');
  FProperty.Add('    function Atualizar : iDAO<T'+ FTableName + '>;');
  FProperty.Add('    function Inserir : iDAO<T'+ FTableName + '>;');
  FProperty.Add('    function DataSource(var DataSource : TDataSource) : iDAO<T'+ FTableName + '>;');
  FProperty.Add('    function This : T'+ FTableName + ';');
  FProperty.Add('    function These: TObjectList<T'+ FTableName + '>;');

  FPrivate.Add('    F'+ FTableName +': T'+ FTableName+';');
  FPrivate.Add('    F'+ FTableName +'s: TObjectList<T'+ FTableName+'>;');
  FPrivate.Add('    FConexao: TConexao;');
  FPrivate.Add('    FDataSet: TDataSet;');

  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.Listar : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('    FDataSet :=');
  FBody.Add('    FConexao.SQL('+QuotedStr('select * from '+FTableName)+')');
  FBody.Add('      .Open.DataSet;');
  FBody.Add(EmptyStr);
  FBody.Add('    FDataSet.First;');
  FBody.Add('    while not FDataSet.Eof do');
  FBody.Add('    begin');
  FBody.Add('      FDataSet.Next;');
  FBody.Add('    end;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.ListarPorId(Id : Variant) : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('    FDataSet :=');
  FBody.Add('      FConexao.SQL('+QuotedStr('select * from '+FTableName+' where id=:id')+')');
  FBody.Add('      .Params('+QuotedStr('id')+', id)');
  FBody.Add('      .Open.DataSet;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.Excluir(aId : Variant) : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('      FConexao');
  FBody.Add('      .SQL('+QuotedStr('Delete from '+FTableName+' where id=:id')+')');
  FBody.Add('      .Params('+QuotedStr('id')+',Id)');
  FBody.Add('      .ExecSQL;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.Excluir : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('      FConexao');
  FBody.Add('      .SQL('+QuotedStr('Delete from '+FTableName+' where id=:id')+')');
  FBody.Add('      .Params('+QuotedStr('id')+',F'+FTableName+'.GetId)');
  FBody.Add('      .ExecSQL;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.Atualizar : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('    FConexao');
  FBody.Add('     .SQL()');
  FBody.Add('     .Params()');
  FBody.Add('     .ExecSQL;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.Inserir : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('      FDataSet :=');
  FBody.Add('    FConexao.SQL()');
  FBody.Add('      .ExecSQL');
  FBody.Add('      .SQL()');
  FBody.Add('      .Open.DataSet;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.DataSource(var DataSource : TDataSource) : iDAO<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := Self;');
  FBody.Add('    DataSource.DataSet := FDataSet;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.This : T'+ FTableName + ';');
  FBody.Add('begin');
  FBody.Add('    Result := F'+ FTableName+';');
  FBody.Add('end;');
  FBody.Add(EmptyStr);
  FBody.Add('function TDAO' + FTableName + '.These: TObjectList<T'+ FTableName + '>;');
  FBody.Add('begin');
  FBody.Add('    Result := F'+ FTableName+'s;');
  FBody.Add('end;');
  FBody.Add(EmptyStr);

  FClasse.Clear;
  FClasse.Add('unit ' + StringReplace(FUnitName, '.pas', ';',
    [rfReplaceAll, rfIgnoreCase]));
  FClasse.Add(EmptyStr);
  FClasse.Add('interface');
  FClasse.Add(EmptyStr);
  FClasse.Add('uses');
  FClasse.Add('   system.Generics.Collections,');
  FClasse.Add('   Data.DB,');
  FClasse.Add('   acpdv.Model.dao.interfaces,');
  FClasse.Add('   acpdv.Model.conexao;');
  FClasse.Add(EmptyStr);
  FClasse.Add('type');
  FClasse.Add('  TDAO' + FTableName + ' = class(TInterfacedObject, iDAO<T' + FTableName + '>)');
  FClasse.Add('  private');
  FClasse.Add(FPrivate.Text);
  FClasse.Add('  public');
  FClasse.Add('    constructor Create;');
  FClasse.Add('    destructor Destroy; override;');
  FClasse.Add('    class function New: iDAO<T' + FTableName + '>;');
  FClasse.Add(FProperty.Text);
  FClasse.Add('end;');
  FClasse.Add(EmptyStr);
  FClasse.Add('implementation');
  FClasse.Add(EmptyStr);
  FClasse.Add('constructor TDAO'+FTableName+'.Create;');
  FClasse.Add('begin');
  FClasse.Add('    F'+ FTableName +':= T'+ FTableName+'.New;');
  FClasse.Add('    F'+ FTableName +'s:= TObjectList<T'+ FTableName+'>.Create;');
  FClasse.Add('    FConexao:= TConexao.New;');
  FClasse.Add('end;');
  FClasse.Add(EmptyStr);
  FClasse.Add('destructor TDAO'+FTableName+'.Destroy;');
  FClasse.Add('begin');
  FClasse.Add('    F'+ FTableName +'.Free;');
  FClasse.Add('    F'+ FTableName +'s.Free;');
  FClasse.Add('    FConexao.Free;');
  FClasse.Add('    inherited;');
  FClasse.Add('end;');
  FClasse.Add(EmptyStr);
  FClasse.Add('class function TDAO' + FTableName + '.New: iDAO<T' + FTableName + '>;');
  FClasse.Add('begin');
  FClasse.Add('  Result := Self.Create;');
  FClasse.Add('end;');
  FClasse.Add(FBody.Text);
  FClasse.Add('end.');

  Result := FClasse.Text;
end;

function TModelGeradorClasseDAO.Fields(AValue: iModelMetaInfoQuery)
  : iModelGeradorClasse;
begin
  Result := Self;
  FMetaInfoQuery := (AValue.&End as TFDMetaInfoQuery);
end;

function TModelGeradorClasseDAO.LowerCamelCase(Value: String): String;
var
  I,J: Integer;
  lAux: TStringDynArray;
  lAux1, lAux2: String;
begin
  lAux := SplitString(Value,'_');

  for I := Low(lAux) to High(lAux) do
  begin
    lAux1 := lAux[I];
    for J := Low(lAux1) to High(lAux1) do
    begin
      if J = 1 then
      begin
        lAux2 := lAux2 + UpperCase(lAux1[J]);
        Continue;
      end;
      lAux2 := lAux2 + LowerCase(lAux1[J]);
    end;
  end;
  Result := lAux2;
end;

class function TModelGeradorClasseDAO.New: iModelGeradorClasse;
begin
  Result := Self.Create;
end;

function TModelGeradorClasseDAO.TableName(AValue: String): iModelGeradorClasse;
begin
  Result := Self;
  FTableName := LowerCamelCase(AValue);
end;

function TModelGeradorClasseDAO.UnitName(AValue: String): iModelGeradorClasse;
begin
  Result := Self;
  FUnitName := AValue;
end;

end.
