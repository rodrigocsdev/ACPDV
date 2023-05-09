unit acpdv.Model.dao.CartaoBandeira;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.CartaoBandeira;

type
  TDAOCartaoBandeira = class(TInterfacedObject, iDAO<TCartaoBandeira>)
  private
    FCartaoBandeira: TCartaoBandeira;
    FCartaoBandeiras: TObjectList<TCartaoBandeira>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCartaoBandeira>;
    function Listar: iDAO<TCartaoBandeira>;
    function ListarPorId(Id: Variant): iDAO<TCartaoBandeira>;
    function Excluir(aId: Variant): iDAO<TCartaoBandeira>; overload;
    function Excluir: iDAO<TCartaoBandeira>; overload;
    function Atualizar: iDAO<TCartaoBandeira>;
    function Inserir: iDAO<TCartaoBandeira>;
    function DataSource(var DataSource: TDataSource): iDAO<TCartaoBandeira>;
    function DataSet: TDataSet;
    function This: TCartaoBandeira;
    function These: TObjectList<TCartaoBandeira>;
  end;

implementation

constructor TDAOCartaoBandeira.Create;
begin
  FCartaoBandeira := TCartaoBandeira.New;
  FCartaoBandeiras := TObjectList<TCartaoBandeira>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCartaoBandeira.Destroy;
begin
  FCartaoBandeira.Free;
  FCartaoBandeiras.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCartaoBandeira.New: iDAO<TCartaoBandeira>;
begin
  Result := Self.Create;
end;

function TDAOCartaoBandeira.Listar: iDAO<TCartaoBandeira>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from CartaoBandeira').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FCartaoBandeiras.Add(
      TCartaoBandeira.New
        .SetId(FDataSet.FieldByName('ID').AsInteger)
        .SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString));
    FDataSet.Next;
  end;
end;

function TDAOCartaoBandeira.ListarPorId(Id: Variant): iDAO<TCartaoBandeira>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from CartaoBandeira where id=:id')
    .Params('id', Id).Open.DataSet;

  FCartaoBandeira
    .SetId(FDataSet.FieldByName('ID').AsInteger)
    .SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString);
end;

function TDAOCartaoBandeira.Excluir(aId: Variant): iDAO<TCartaoBandeira>;
begin
  Result := Self;
  FConexao.SQL('Delete from CartaoBandeira where id=:id')
    .Params('id', aId).ExecSQL;
end;

function TDAOCartaoBandeira.Excluir: iDAO<TCartaoBandeira>;
begin
  Result := Self;
  FConexao.SQL('Delete from CartaoBandeira where id=:id')
    .Params('id', FCartaoBandeira.GetId).ExecSQL;
end;

function TDAOCartaoBandeira.Atualizar: iDAO<TCartaoBandeira>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CARTAO_BANDEIRA SET DESCRICAO=? WHERE ID=?')
    .Params(0,FCartaoBandeira.GetDescricao)
    .Params(1, FCartaoBandeira.GetId).ExecSQL;
end;

function TDAOCartaoBandeira.Inserir: iDAO<TCartaoBandeira>;
begin
  Result := Self;
  FDataSet := FConexao
    .SQL('INSERT INTO CARTAO_BANDEIRA (DESCRICAO) VALUES(?)')
    .Params(0,FCartaoBandeira.GetDescricao)
    .SQL('select * from cartao_bandeira where id=(select max(id) from cartao_bandeira')
    .Open.DataSet;

  FCartaoBandeira.SetId(FDataSet.FieldByName('ID').AsInteger);
end;

function TDAOCartaoBandeira.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCartaoBandeira.DataSource(var DataSource: TDataSource)
  : iDAO<TCartaoBandeira>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCartaoBandeira.This: TCartaoBandeira;
begin
  Result := FCartaoBandeira;
end;

function TDAOCartaoBandeira.These: TObjectList<TCartaoBandeira>;
begin
  Result := FCartaoBandeiras;
end;

end.
