unit acpdv.Model.dao.crt;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.crt;

type
  TDAOCrt = class(TInterfacedObject, iDAO<TCrt>)
  private
    FCrt: TCrt;
    FCrts: TObjectList<TCrt>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCrt>;
    function Listar: iDAO<TCrt>;
    function ListarPorId(Id: Variant): iDAO<TCrt>;
    function Excluir(aId: Variant): iDAO<TCrt>; overload;
    function Excluir: iDAO<TCrt>; overload;
    function Atualizar: iDAO<TCrt>;
    function Inserir: iDAO<TCrt>;
    function DataSource(var DataSource: TDataSource): iDAO<TCrt>;
    function DataSet: TDataSet;
    function This: TCrt;
    function These: TObjectList<TCrt>;
  end;

implementation

constructor TDAOCrt.Create;
begin
  FCrt := TCrt.New;
  FCrts := TObjectList<TCrt>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCrt.Destroy;
begin
  FCrt.Free;
  FCrts.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCrt.New: iDAO<TCrt>;
begin
  Result := Self.Create;
end;

function TDAOCrt.Listar: iDAO<TCrt>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Crt').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCrts.Add(TCrt.New.SetId(FDataSet.FieldByName('id').AsInteger)
    .SetDescricao(FDataSet.FieldByName('descricao').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCrt.ListarPorId(Id: Variant): iDAO<TCrt>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Crt where id=?').Params(0, Id)
    .Open.DataSet;

  FCrt.SetId(FDataSet.FieldByName('id').AsInteger)
    .SetDescricao(FDataSet.FieldByName('descricao').AsString)
end;

function TDAOCrt.Excluir(aId: Variant): iDAO<TCrt>;
begin
  Result := Self;
  FConexao.SQL('Delete from Crt where id=?').Params(0, aId).ExecSQL;
end;

function TDAOCrt.Excluir: iDAO<TCrt>;
begin
  Result := Self;
  FConexao.SQL('Delete from Crt where id=?').Params(0, FCrt.GetId).ExecSQL;
end;

function TDAOCrt.Atualizar: iDAO<TCrt>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CRT SET DESCRICAO=? WHERE ID=?')
    .Params(0, FCrt.GetDescricao)
    .Params(1, FCrt.GetId).ExecSQL;
end;

function TDAOCrt.Inserir: iDAO<TCrt>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CRT (DESCRICAO) VALUES(?)')
  .Params(0,FCrt.GetId)
  .ExecSQL;
end;

function TDAOCrt.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCrt.DataSource(var DataSource: TDataSource): iDAO<TCrt>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCrt.This: TCrt;
begin
  Result := FCrt;
end;

function TDAOCrt.These: TObjectList<TCrt>;
begin
  Result := FCrts;
end;

end.
