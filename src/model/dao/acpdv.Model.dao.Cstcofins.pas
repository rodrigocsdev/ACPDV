unit acpdv.Model.dao.Cstcofins;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.Cstcofins;

type
  TDAOCstcofins = class(TInterfacedObject, iDAO<TCstcofins>)
  private
    FCstcofins: TCstcofins;
    FCstcofinss: TObjectList<TCstcofins>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCstcofins>;
    function Listar: iDAO<TCstcofins>;
    function ListarPorId(Id: Variant): iDAO<TCstcofins>;
    function Excluir(aId: Variant): iDAO<TCstcofins>; overload;
    function Excluir: iDAO<TCstcofins>; overload;
    function Atualizar: iDAO<TCstcofins>;
    function Inserir: iDAO<TCstcofins>;
    function DataSource(var DataSource: TDataSource): iDAO<TCstcofins>;
    function DataSet: TDataSet;
    function This: TCstcofins;
    function These: TObjectList<TCstcofins>;
  end;

implementation

constructor TDAOCstcofins.Create;
begin
  FCstcofins := TCstcofins.New;
  FCstcofinss := TObjectList<TCstcofins>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCstcofins.Destroy;
begin
  FCstcofins.Free;
  FCstcofinss.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCstcofins.New: iDAO<TCstcofins>;
begin
  Result := Self.Create;
end;

function TDAOCstcofins.Listar: iDAO<TCstcofins>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cstcofins').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCstcofinss.Add(
      TCstcofins.New.SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCstcofins.ListarPorId(Id: Variant): iDAO<TCstcofins>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Cstcofins where id=:id')
    .Params('id', Id).Open.DataSet;

  FCstcofins.SetId(FDataSet.FieldByName('id').AsString)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString)
end;

function TDAOCstcofins.Excluir(aId: Variant): iDAO<TCstcofins>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cstcofins where id=:id').Params('id', aId).ExecSQL;
end;

function TDAOCstcofins.Excluir: iDAO<TCstcofins>;
begin
  Result := Self;
  FConexao.SQL('Delete from Cstcofins where id=:id')
    .Params('id', FCstcofins.GetId).ExecSQL;
end;

function TDAOCstcofins.Atualizar: iDAO<TCstcofins>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CSTCOFINS SET DESCRICAO=? WHERE ID=?')
  .Params(0, FCstcofins.GetDescricao)
  .Params(1, FCstcofins.GetId).ExecSQL;
end;

function TDAOCstcofins.Inserir: iDAO<TCstcofins>;
begin
  Result := Self;
  FConexao.SQL('INSERT INTO CSTCOFINS (ID, DESCRICAO) VALUES(?, ?)')
  .Params(0, FCstcofins.GetId)
  .Params(1, FCstcofins.GetDescricao)
  .ExecSQL;
end;

function TDAOCstcofins.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCstcofins.DataSource(var DataSource: TDataSource)
  : iDAO<TCstcofins>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCstcofins.This: TCstcofins;
begin
  Result := FCstcofins;
end;

function TDAOCstcofins.These: TObjectList<TCstcofins>;
begin
  Result := FCstcofinss;
end;

end.
