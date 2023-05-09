unit acpdv.Model.dao.unidade;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Unidade;

type
  TDAOUnidade = class(TInterfacedObject, iDAO<TUnidade>)
  private
    FUnidade: TUnidade;
    FUnidades: TObjectList<TUnidade>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TUnidade>;
    function Listar : iDAO<TUnidade>;
    function ListarPorId(Id : Variant) : iDAO<TUnidade>;
    function Excluir(aId : Variant) : iDAO<TUnidade>; overload;
    function Excluir : iDAO<TUnidade>; overload;
    function Atualizar : iDAO<TUnidade>;
    function Inserir : iDAO<TUnidade>;
    function DataSource(var DataSource : TDataSource) : iDAO<TUnidade>;
    function DataSet: TDataSet;
    function This : TUnidade;
    function These: TObjectList<TUnidade>;

end;

implementation

constructor TDAOUnidade.Create;
begin
    FUnidade:= TUnidade.New;
    FUnidades:= TObjectList<TUnidade>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOUnidade.Destroy;
begin
    FUnidade.Free;
    FUnidades.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOUnidade.New: iDAO<TUnidade>;
begin
  Result := Self.Create;
end;

function TDAOUnidade.Listar : iDAO<TUnidade>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Unidade')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOUnidade.ListarPorId(Id : Variant) : iDAO<TUnidade>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Unidade where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOUnidade.Excluir(aId : Variant) : iDAO<TUnidade>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Unidade where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOUnidade.Excluir : iDAO<TUnidade>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Unidade where id=:id')
      .Params('id',FUnidade.GetId)
      .ExecSQL;
end;

function TDAOUnidade.Atualizar : iDAO<TUnidade>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOUnidade.Inserir : iDAO<TUnidade>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOUnidade.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOUnidade.DataSource(var DataSource : TDataSource) : iDAO<TUnidade>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOUnidade.This : TUnidade;
begin
    Result := FUnidade;
end;

function TDAOUnidade.These: TObjectList<TUnidade>;
begin
    Result := FUnidades;
end;


end.

