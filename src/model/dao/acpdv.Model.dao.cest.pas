unit acpdv.Model.dao.cest;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.CEST;

type
  TDAOCest = class(TInterfacedObject, iDAO<TCest>)
  private
    FCest: TCest;
    FCests: TObjectList<TCest>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCest>;
    function Listar: iDAO<TCest>;
    function ListarPorId(Id: Variant): iDAO<TCest>;
    function Excluir(aId: Variant): iDAO<TCest>; overload;
    function Excluir: iDAO<TCest>; overload;
    function Atualizar: iDAO<TCest>;
    function Inserir: iDAO<TCest>;
    function DataSource(var DataSource: TDataSource): iDAO<TCest>;
    function DataSet: TDataSet;
    function This: TCest;
    function These: TObjectList<TCest>;
  end;

implementation

constructor TDAOCest.Create;
begin
  FCest := TCest.New;
  FCests := TObjectList<TCest>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCest.Destroy;
begin
  FCest.Free;
  FCests.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCest.New: iDAO<TCest>;
begin
  Result := Self.Create;
end;

function TDAOCest.Listar: iDAO<TCest>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cest').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCests.Add(
      TCest.New.SetId(FDataSet.FieldByName('ID').AsString)
      .SetNcm(FDataSet.FieldByName('NCM').AsString)
      .SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCest.ListarPorId(Id: Variant): iDAO<TCest>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cest where id=?').Params(0, Id)
    .Open.DataSet;

  FCest.SetId(FDataSet.FieldByName('ID').AsString)
  .SetNcm(FDataSet.FieldByName('NCM').AsString)
  .SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString);
end;

function TDAOCest.Excluir(aId: Variant): iDAO<TCest>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cest where id=?').Params(0, aId).ExecSQL;
end;

function TDAOCest.Excluir: iDAO<TCest>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cest where id=?')
    .Params(0, FCest.GetId).ExecSQL;
end;

function TDAOCest.Atualizar: iDAO<TCest>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CEST SET DESCRICAO=? WHERE ID=? AND NCM=?')
    .Params(0, FCest.GetDescricao)
    .Params(1, FCest.GetId)
    .Params(2, FCest.GetNcm).ExecSQL;
end;

function TDAOCest.Inserir: iDAO<TCest>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CEST (ID, NCM, DESCRICAO) VALUES(?, ?, ?)')
    .Params(0,FCest.GetId)
    .Params(1,FCest.GetNcm)
    .Params(2,FCest.GetDescricao)
  .ExecSQL;
end;

function TDAOCest.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCest.DataSource(var DataSource: TDataSource): iDAO<TCest>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCest.This: TCest;
begin
  Result := FCest;
end;

function TDAOCest.These: TObjectList<TCest>;
begin
  Result := FCests;
end;

end.
