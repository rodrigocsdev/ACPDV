unit acpdv.Model.dao.Cfop;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.CFOP;

type
  TDAOCfop = class(TInterfacedObject, iDAO<TCfop>)
  private
    FCfop: TCfop;
    FCfops: TObjectList<TCfop>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCfop>;
    function Listar: iDAO<TCfop>;
    function ListarPorId(Id: Variant): iDAO<TCfop>;
    function Excluir(aId: Variant): iDAO<TCfop>; overload;
    function Excluir: iDAO<TCfop>; overload;
    function Atualizar: iDAO<TCfop>;
    function Inserir: iDAO<TCfop>;
    function DataSource(var DataSource: TDataSource): iDAO<TCfop>;
    function DataSet: TDataSet;
    function This: TCfop;
    function These: TObjectList<TCfop>;
  end;

implementation

constructor TDAOCfop.Create;
begin
  FCfop := TCfop.New;
  FCfops := TObjectList<TCfop>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCfop.Destroy;
begin
  FCfop.Free;
  FCfops.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCfop.New: iDAO<TCfop>;
begin
  Result := Self.Create;
end;

function TDAOCfop.Listar: iDAO<TCfop>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cfop').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCfops.Add(
      TCfop.New.SetId(FDataSet.FieldByName('ID').AsInteger)
      .SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCfop.ListarPorId(Id: Variant): iDAO<TCfop>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cfop where id=?')
  .Params(0, Id)
    .Open.DataSet;

  FCfop.SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString);
end;

function TDAOCfop.Excluir(aId: Variant): iDAO<TCfop>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cfop where id=?').Params(0, aId).ExecSQL;
end;

function TDAOCfop.Excluir: iDAO<TCfop>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cfop where id=?')
    .Params(0, FCfop.GetId).ExecSQL;
end;

function TDAOCfop.Atualizar: iDAO<TCfop>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CFOP SET DESCRICAO=? WHERE ID=?')
    .Params(0, FCfop.GetDescricao)
    .Params(1, FCfop.GetId).ExecSQL;
end;

function TDAOCfop.Inserir: iDAO<TCfop>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CFOP (ID, DESCRICAO) VALUES(?, ?)')
  .Params(0, FCfop.GetId)
  .Params(1, FCfop.GetDescricao)
  .ExecSQL;
end;

function TDAOCfop.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCfop.DataSource(var DataSource: TDataSource): iDAO<TCfop>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCfop.This: TCfop;
begin
  Result := FCfop;
end;

function TDAOCfop.These: TObjectList<TCfop>;
begin
  Result := FCfops;
end;

end.
