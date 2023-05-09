unit acpdv.Model.dao.Origem;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Origem;

type
  TDAOOrigem = class(TInterfacedObject, iDAO<TOrigem>)
  private
    FOrigem: TOrigem;
    FOrigems: TObjectList<TOrigem>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TOrigem>;
    function Listar : iDAO<TOrigem>;
    function ListarPorId(Id : Variant) : iDAO<TOrigem>;
    function Excluir(aId : Variant) : iDAO<TOrigem>; overload;
    function Excluir : iDAO<TOrigem>; overload;
    function Atualizar : iDAO<TOrigem>;
    function Inserir : iDAO<TOrigem>;
    function DataSource(var DataSource : TDataSource) : iDAO<TOrigem>;
    function DataSet: TDataSet;
    function This : TOrigem;
    function These: TObjectList<TOrigem>;

end;

implementation

constructor TDAOOrigem.Create;
begin
    FOrigem:= TOrigem.New;
    FOrigems:= TObjectList<TOrigem>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOOrigem.Destroy;
begin
    FOrigem.Free;
    FOrigems.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOOrigem.New: iDAO<TOrigem>;
begin
  Result := Self.Create;
end;

function TDAOOrigem.Listar : iDAO<TOrigem>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Origem')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOOrigem.ListarPorId(Id : Variant) : iDAO<TOrigem>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Origem where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOOrigem.Excluir(aId : Variant) : iDAO<TOrigem>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Origem where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOOrigem.Excluir : iDAO<TOrigem>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Origem where id=:id')
      .Params('id',FOrigem.GetId)
      .ExecSQL;
end;

function TDAOOrigem.Atualizar : iDAO<TOrigem>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOOrigem.Inserir : iDAO<TOrigem>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOOrigem.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOOrigem.DataSource(var DataSource : TDataSource) : iDAO<TOrigem>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOOrigem.This : TOrigem;
begin
    Result := FOrigem;
end;

function TDAOOrigem.These: TObjectList<TOrigem>;
begin
    Result := FOrigems;
end;


end.

