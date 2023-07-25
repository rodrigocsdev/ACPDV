unit GeradorSimpleORM.Model.Gerador.ModelGeradorClasse;

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
  TModelGeradorClasse = class(TInterfacedObject, iModelGeradorClasse)
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

{ TModelGeradorClasse }

constructor TModelGeradorClasse.Create;
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

destructor TModelGeradorClasse.Destroy;
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

function TModelGeradorClasse.&End: String;
var
  MPK: String;
  I: Integer;
begin
  (FMetaInfoQuery.Connection as TFDConnection).GetKeyFieldNames('', '',
    FTableName.Trim.ToUpper, '', FPK);

  while not(FMetaInfoQuery.Eof) do
  begin
    if (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper.Contains('INT')) then
      FTipoCampo := 'Integer'
    else if ((FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'NUMERIC') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DECIMAL') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'FLOAT') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DOUBLE PRECISION') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DOUBLE')) then
      FTipoCampo := 'Currency'
    else if (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BIGINT') then
      FTipoCampo := 'Int64'
    else if (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BLOB SUB_TYPE 1') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BLOB SUB_TYPE 2') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'BLOB SUB_TYPE 0') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'VARCHAR') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'CHAR') then
      FTipoCampo := 'String'
    else if (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'VARBINARY') then
      FTipoCampo := 'TMemoField'
    else if (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DATE') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'TIME') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'TIMESTAMP') or
      (FMetaInfoQuery.FieldByName('COLUMN_TYPENAME').AsString.Trim.ToUpper = 'DATETIME') then
      FTipoCampo := 'TDateTime';

    FProperty.Add('    function Get' + LowerCamelCase(FMetaInfoQuery.FieldByName('COLUMN_NAME')
      .AsString) + ' :' + FTipoCampo + ';');
    FProperty.Add('    function Set' + LowerCamelCase(FMetaInfoQuery.FieldByName('COLUMN_NAME')
      .AsString) + '(const Value :' + FTipoCampo + '): T' + FTableName + ';');

    FBody.Add(EmptyStr);
    FBody.Add('function T' + FTableName + '.Set' + LowerCamelCase(FMetaInfoQuery.FieldByName
      ('COLUMN_NAME').AsString) + '(const Value :' + FTipoCampo + '): T' +
      FTableName + ';');
    FBody.Add('begin');
    FBody.Add('  F' + LowerCamelCase(FMetaInfoQuery.FieldByName('COLUMN_NAME').AsString) +
      ' := Value;');
    FBody.Add('end;');

    FBody.Add(EmptyStr);
    FBody.Add('function T' + FTableName + '.Get' + LowerCamelCase(FMetaInfoQuery.FieldByName
      ('COLUMN_NAME').AsString) + ' :' + FTipoCampo + ';');
    FBody.Add('begin');
    FBody.Add('  Result := F' + LowerCamelCase(FMetaInfoQuery.FieldByName('COLUMN_NAME')
      .AsString) + ';');
    FBody.Add('end;');

    FPrivate.Add('    F' + LowerCamelCase(FMetaInfoQuery.FieldByName('COLUMN_NAME').AsString) +
      ' :' + FTipoCampo + ';');
    FMetaInfoQuery.Next;
  end;

  FClasse.Clear;
  FClasse.Add('unit ' + StringReplace(FUnitName, '.pas', ';',
    [rfReplaceAll, rfIgnoreCase]));
  FClasse.Add(EmptyStr);
  FClasse.Add('interface');
  FClasse.Add(EmptyStr);
  FClasse.Add('type');
  FClasse.Add('  T' + FTableName + ' = class');
  FClasse.Add('  private');
  FClasse.Add(FPrivate.Text);
  FClasse.Add('  public');
  FClasse.Add(FProperty.Text);
  FClasse.Add('    class function New: T' + FTableName + ';');
  FClasse.Add('end;');
  FClasse.Add(EmptyStr);
  FClasse.Add('implementation');
  FClasse.Add(EmptyStr);
  FClasse.Add('class function T' + FTableName + '.New: T' + FTableName + ';');
  FClasse.Add('begin');
  FClasse.Add('  Result := Self.Create;');
  FClasse.Add('end;');
  FClasse.Add(FBody.Text);
  FClasse.Add('end.');

  Result := FClasse.Text;
end;

function TModelGeradorClasse.Fields(AValue: iModelMetaInfoQuery)
  : iModelGeradorClasse;
begin
  Result := Self;
  FMetaInfoQuery := (AValue.&End as TFDMetaInfoQuery);
end;

function TModelGeradorClasse.LowerCamelCase(Value: String): String;
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

class function TModelGeradorClasse.New: iModelGeradorClasse;
begin
  Result := Self.Create;
end;

function TModelGeradorClasse.TableName(AValue: String): iModelGeradorClasse;
begin
  Result := Self;
  FTableName := LowerCamelCase(AValue);
end;

function TModelGeradorClasse.UnitName(AValue: String): iModelGeradorClasse;
begin
  Result := Self;
  FUnitName := AValue;
end;

end.
