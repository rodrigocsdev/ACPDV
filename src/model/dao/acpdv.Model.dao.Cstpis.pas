unit acpdv.Model.dao.Cstpis;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.Cstpis;

type
  TDAOCstpis = class(TInterfacedObject, iDAO<TCstpis>)
  private
    FCstpis: TCstpis;
    FCstpiss: TObjectList<TCstpis>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCstpis>;
    function Listar: iDAO<TCstpis>;
    function ListarPorId(Id: Variant): iDAO<TCstpis>;
    function Excluir(aId: Variant): iDAO<TCstpis>; overload;
    function Excluir: iDAO<TCstpis>; overload;
    function Atualizar: iDAO<TCstpis>;
    function Inserir: iDAO<TCstpis>;
    function DataSource(var DataSource: TDataSource): iDAO<TCstpis>;
    function DataSet: TDataSet;
    function This: TCstpis;
    function These: TObjectList<TCstpis>;
  end;

implementation

constructor TDAOCstpis.Create;
begin
  FCstpis := TCstpis.New;
  FCstpiss := TObjectList<TCstpis>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCstpis.Destroy;
begin
  FCstpis.Free;
  FCstpiss.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCstpis.New: iDAO<TCstpis>;
begin
  Result := Self.Create;
end;

function TDAOCstpis.Listar: iDAO<TCstpis>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cstpis').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCstpiss.Add(TCstpis.New
      .SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCstpis.ListarPorId(Id: Variant): iDAO<TCstpis>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cstpis where id=:id').Params('id', Id)
    .Open.DataSet;

  FCstpis
  .SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString);
end;

function TDAOCstpis.Excluir(aId: Variant): iDAO<TCstpis>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cstpis where id=:id').Params('id', aId).ExecSQL;
end;

function TDAOCstpis.Excluir: iDAO<TCstpis>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cstpis where id=:id')
    .Params('id', FCstpis.GetId).ExecSQL;
end;

function TDAOCstpis.Atualizar: iDAO<TCstpis>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CSTPIS SET DESCRICAO=? WHERE ID=?')
  .Params(0, FCstpis.GetDescricao)
  .Params(1, FCstpis.GetId).ExecSQL;
end;

function TDAOCstpis.Inserir: iDAO<TCstpis>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CSTPIS (ID, DESCRICAO) VALUES(?, ?)')
    .Params(0, FCstpis.GetId)
    .Params(1, FCstpis.GetDescricao)
  .ExecSQL;
end;

function TDAOCstpis.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCstpis.DataSource(var DataSource: TDataSource): iDAO<TCstpis>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCstpis.This: TCstpis;
begin
  Result := FCstpis;
end;

function TDAOCstpis.These: TObjectList<TCstpis>;
begin
  Result := FCstpiss;
end;

end.
