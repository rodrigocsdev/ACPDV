unit acpdv.Model.dao.cst;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.cst;

type
  TDAOCst = class(TInterfacedObject, iDAO<TCst>)
  private
    FCst: TCst;
    FCsts: TObjectList<TCst>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCst>;
    function Listar: iDAO<TCst>;
    function ListarPorId(Id: Variant): iDAO<TCst>;
    function Excluir(aId: Variant): iDAO<TCst>; overload;
    function Excluir: iDAO<TCst>; overload;
    function Atualizar: iDAO<TCst>;
    function Inserir: iDAO<TCst>;
    function DataSource(var DataSource: TDataSource): iDAO<TCst>;
    function DataSet: TDataSet;
    function This: TCst;
    function These: TObjectList<TCst>;
  end;

implementation

constructor TDAOCst.Create;
begin
  FCst := TCst.New;
  FCsts := TObjectList<TCst>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCst.Destroy;
begin
  FCst.Free;
  FCsts.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCst.New: iDAO<TCst>;
begin
  Result := Self.Create;
end;

function TDAOCst.Listar: iDAO<TCst>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cst').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCsts.Add(
      TCst.New.SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString)
      .SetSimplesNacional(FDataSet.FieldByName('simples_nacional').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCst.ListarPorId(Id: Variant): iDAO<TCst>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cst where id=?').Params(0, Id)
    .Open.DataSet;

  FCst.
  SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString)
      .SetSimplesNacional(FDataSet.FieldByName('simples_nacional').AsString)
end;

function TDAOCst.Excluir(aId: Variant): iDAO<TCst>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cst where id=?').Params(0, aId).ExecSQL;
end;

function TDAOCst.Excluir: iDAO<TCst>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cst where id=?').Params(0, FCst.GetId).ExecSQL;
end;

function TDAOCst.Atualizar: iDAO<TCst>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CST SET DESCRICAO=?, SIMPLES_NACIONAL=? WHERE ID=?')
  .Params(0, FCst.GetDescricao)
  .Params(1, FCst.GetSimplesNacional)
  .Params(2, FCst.GetId).ExecSQL;
end;

function TDAOCst.Inserir: iDAO<TCst>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CST (ID, DESCRICAO, SIMPLES_NACIONAL) VALUES(?, ?, ?)')
  .Params(0, FCst.GetId)
  .Params(1, FCst.GetDescricao)
  .Params(2, FCst.GetSimplesNacional).ExecSQL;
end;

function TDAOCst.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCst.DataSource(var DataSource: TDataSource): iDAO<TCst>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCst.This: TCst;
begin
  Result := FCst;
end;

function TDAOCst.These: TObjectList<TCst>;
begin
  Result := FCsts;
end;

end.
