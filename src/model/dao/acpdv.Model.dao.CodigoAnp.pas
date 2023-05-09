unit acpdv.Model.dao.CodigoAnp;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.CodigoAnp;

type
  TDAOCodigoAnp = class(TInterfacedObject, iDAO<TCodigoAnp>)
  private
    FCodigoAnp: TCodigoAnp;
    FCodigoAnps: TObjectList<TCodigoAnp>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCodigoAnp>;
    function Listar: iDAO<TCodigoAnp>;
    function ListarPorId(Id: Variant): iDAO<TCodigoAnp>;
    function Excluir(aId: Variant): iDAO<TCodigoAnp>; overload;
    function Excluir: iDAO<TCodigoAnp>; overload;
    function Atualizar: iDAO<TCodigoAnp>;
    function Inserir: iDAO<TCodigoAnp>;
    function DataSource(var DataSource: TDataSource): iDAO<TCodigoAnp>;
    function DataSet: TDataSet;
    function This: TCodigoAnp;
    function These: TObjectList<TCodigoAnp>;

  end;

implementation

constructor TDAOCodigoAnp.Create;
begin
  FCodigoAnp := TCodigoAnp.New;
  FCodigoAnps := TObjectList<TCodigoAnp>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCodigoAnp.Destroy;
begin
  FCodigoAnp.Free;
  FCodigoAnps.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCodigoAnp.New: iDAO<TCodigoAnp>;
begin
  Result := Self.Create;
end;

function TDAOCodigoAnp.Listar: iDAO<TCodigoAnp>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from CodigoAnp').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FDataSet.Next;
  end;
end;

function TDAOCodigoAnp.ListarPorId(Id: Variant): iDAO<TCodigoAnp>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from CodigoAnp where id=:id')
    .Params('id', Id).Open.DataSet;

  FCodigoAnp.SetId(FDataSet.FieldByName('ID').AsInteger)
    .SetFamilia(FDataSet.FieldByName('FAMILIA').AsString)
    .SetGrupo(FDataSet.FieldByName('GRUPO').AsString)
    .SetSubGrupo(FDataSet.FieldByName('SUB_GRUPO').AsString)
    .SetSubSubGrupo(FDataSet.FieldByName('SUB_SUB_GRUPO').AsString)
    .SetProduto(FDataSet.FieldByName('PRODUTO').AsString);
end;

function TDAOCodigoAnp.Excluir(aId: Variant): iDAO<TCodigoAnp>;
begin
  Result := Self;
  FConexao.SQL('Delete from CodigoAnp where id=:id').Params('id', aId).ExecSQL;
end;

function TDAOCodigoAnp.Excluir: iDAO<TCodigoAnp>;
begin
  Result := Self;
  FConexao.SQL('Delete from CodigoAnp where id=:id')
    .Params('id', FCodigoAnp.GetId).ExecSQL;
end;

function TDAOCodigoAnp.Atualizar: iDAO<TCodigoAnp>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CODIGO_ANP SET FAMILIA=?, GRUPO=?, SUB_GRUPO=?, SUB_SUB_GRUPO=?, PRODUTO=?'+
               ' WHERE ID=?')
  .Params(0, FCodigoAnp.GetFamilia)
  .Params(1, FCodigoAnp.GetGrupo)
  .Params(2, FCodigoAnp.GetSubGrupo)
  .Params(3, FCodigoAnp.GetSubSubGrupo)
  .Params(4, FCodigoAnp.GetProduto)
  .Params(5, FCodigoAnp.GetId).ExecSQL;
end;

function TDAOCodigoAnp.Inserir: iDAO<TCodigoAnp>;
begin
  Result := Self;
  FDataSet :=
    FConexao.SQL('INSERT INTO CODIGO_ANP (FAMILIA, GRUPO, SUB_GRUPO, SUB_SUB_GRUPO, PRODUTO) '+
                 'VALUES(?, ?, ?, ?, ?)')
    .Params(0, FCodigoAnp.GetFamilia)
    .Params(1, FCodigoAnp.GetGrupo)
    .Params(2, FCodigoAnp.GetSubGrupo)
    .Params(3, FCodigoAnp.GetSubSubGrupo)
    .Params(4, FCodigoAnp.GetProduto)
    .ExecSQL.SQL('select * from codigo_anp where id=(select max(id) from codigo_anp)')
    .Open.DataSet;

  FCodigoAnp.SetId(FDataSet.FieldByName('ID').AsInteger);
end;

function TDAOCodigoAnp.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCodigoAnp.DataSource(var DataSource: TDataSource)
  : iDAO<TCodigoAnp>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCodigoAnp.This: TCodigoAnp;
begin
  Result := FCodigoAnp;
end;

function TDAOCodigoAnp.These: TObjectList<TCodigoAnp>;
begin
  Result := FCodigoAnps;
end;

end.
