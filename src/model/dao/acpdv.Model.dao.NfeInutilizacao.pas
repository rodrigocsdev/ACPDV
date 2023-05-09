unit acpdv.Model.dao.NfeInutilizacao;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.NfeInutilizacao;

type
  TDAONfeInutilizacao = class(TInterfacedObject, iDAO<TNfeInutilizacao>)
  private
    FNfeInutilizacao: TNfeInutilizacao;
    FNfeInutilizacaos: TObjectList<TNfeInutilizacao>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TNfeInutilizacao>;
    function Listar : iDAO<TNfeInutilizacao>;
    function ListarPorId(Id : Variant) : iDAO<TNfeInutilizacao>;
    function Excluir(aId : Variant) : iDAO<TNfeInutilizacao>; overload;
    function Excluir : iDAO<TNfeInutilizacao>; overload;
    function Atualizar : iDAO<TNfeInutilizacao>;
    function Inserir : iDAO<TNfeInutilizacao>;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfeInutilizacao>;
    function DataSet: TDataSet;
    function This : TNfeInutilizacao;
    function These: TObjectList<TNfeInutilizacao>;

end;

implementation

constructor TDAONfeInutilizacao.Create;
begin
    FNfeInutilizacao:= TNfeInutilizacao.New;
    FNfeInutilizacaos:= TObjectList<TNfeInutilizacao>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAONfeInutilizacao.Destroy;
begin
    FNfeInutilizacao.Free;
    FNfeInutilizacaos.Free;
    FConexao.Free;
    inherited;
end;

class function TDAONfeInutilizacao.New: iDAO<TNfeInutilizacao>;
begin
  Result := Self.Create;
end;

function TDAONfeInutilizacao.Listar : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from NfeInutilizacao')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAONfeInutilizacao.ListarPorId(Id : Variant) : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from NfeInutilizacao where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAONfeInutilizacao.Excluir(aId : Variant) : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfeInutilizacao where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAONfeInutilizacao.Excluir : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfeInutilizacao where id=:id')
//      .Params('id',FNfeInutilizacao.GetId)
      .ExecSQL;
end;

function TDAONfeInutilizacao.Atualizar : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAONfeInutilizacao.Inserir : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAONfeInutilizacao.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAONfeInutilizacao.DataSource(var DataSource : TDataSource) : iDAO<TNfeInutilizacao>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAONfeInutilizacao.This : TNfeInutilizacao;
begin
    Result := FNfeInutilizacao;
end;

function TDAONfeInutilizacao.These: TObjectList<TNfeInutilizacao>;
begin
    Result := FNfeInutilizacaos;
end;


end.

