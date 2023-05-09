unit acpdv.Model.dao.Cstipi;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.Cstipi;

type
  TDAOCstipi = class(TInterfacedObject, iDAO<TCstipi>)
  private
    FCstipi: TCstipi;
    FCstipis: TObjectList<TCstipi>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCstipi>;
    function Listar: iDAO<TCstipi>;
    function ListarPorId(Id: Variant): iDAO<TCstipi>;
    function Excluir(aId: Variant): iDAO<TCstipi>; overload;
    function Excluir: iDAO<TCstipi>; overload;
    function Atualizar: iDAO<TCstipi>;
    function Inserir: iDAO<TCstipi>;
    function DataSource(var DataSource: TDataSource): iDAO<TCstipi>;
    function DataSet: TDataSet;
    function This: TCstipi;
    function These: TObjectList<TCstipi>;
  end;

implementation

constructor TDAOCstipi.Create;
begin
  FCstipi := TCstipi.New;
  FCstipis := TObjectList<TCstipi>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCstipi.Destroy;
begin
  FCstipi.Free;
  FCstipis.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCstipi.New: iDAO<TCstipi>;
begin
  Result := Self.Create;
end;

function TDAOCstipi.Listar: iDAO<TCstipi>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cstipi').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCstipis.Add(
      TCstipi.New.SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCstipi.ListarPorId(Id: Variant): iDAO<TCstipi>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cstipi where id=:id').Params('id', Id)
    .Open.DataSet;

  FCstipi.SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString);
end;

function TDAOCstipi.Excluir(aId: Variant): iDAO<TCstipi>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cstipi where id=:id').Params('id', aId).ExecSQL;
end;

function TDAOCstipi.Excluir: iDAO<TCstipi>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cstipi where id=:id')
    .Params('id', FCstipi.GetId).ExecSQL;
end;

function TDAOCstipi.Atualizar: iDAO<TCstipi>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CSTIPI SET DESCRICAO=? WHERE ID=?')
  .Params(0, FCstipi.GetDescricao)
  .Params(1, FCstipi.GetId).ExecSQL;
end;

function TDAOCstipi.Inserir: iDAO<TCstipi>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CSTIPI (ID, DESCRICAO) VALUES(?, ?)')
  .Params(0, FCstipi.GetId)
  .Params(1, FCstipi.GetDescricao)
  .ExecSQL;
end;

function TDAOCstipi.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCstipi.DataSource(var DataSource: TDataSource): iDAO<TCstipi>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCstipi.This: TCstipi;
begin
  Result := FCstipi;
end;

function TDAOCstipi.These: TObjectList<TCstipi>;
begin
  Result := FCstipis;
end;

end.
