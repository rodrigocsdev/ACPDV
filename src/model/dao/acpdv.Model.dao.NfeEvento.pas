unit acpdv.Model.dao.NfeEvento;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.NfeEvento;

type
  TDAONfeEvento = class(TInterfacedObject, iDAO<TNfeEvento>)
  private
    FNfeEvento: TNfeEvento;
    FNfeEventos: TObjectList<TNfeEvento>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TNfeEvento>;
    function Listar : iDAO<TNfeEvento>;
    function ListarPorId(Id : Variant) : iDAO<TNfeEvento>;
    function Excluir(aId : Variant) : iDAO<TNfeEvento>; overload;
    function Excluir : iDAO<TNfeEvento>; overload;
    function Atualizar : iDAO<TNfeEvento>;
    function Inserir : iDAO<TNfeEvento>;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfeEvento>;
    function DataSet: TDataSet;
    function This : TNfeEvento;
    function These: TObjectList<TNfeEvento>;

end;

implementation

constructor TDAONfeEvento.Create;
begin
    FNfeEvento:= TNfeEvento.New;
    FNfeEventos:= TObjectList<TNfeEvento>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAONfeEvento.Destroy;
begin
    FNfeEvento.Free;
    FNfeEventos.Free;
    FConexao.Free;
    inherited;
end;

class function TDAONfeEvento.New: iDAO<TNfeEvento>;
begin
  Result := Self.Create;
end;

function TDAONfeEvento.Listar : iDAO<TNfeEvento>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from NfeEvento')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAONfeEvento.ListarPorId(Id : Variant) : iDAO<TNfeEvento>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from NfeEvento where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAONfeEvento.Excluir(aId : Variant) : iDAO<TNfeEvento>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from NfeEvento where id=:id')
//      .Params('id',Id)
//      .ExecSQL;
end;

function TDAONfeEvento.Excluir : iDAO<TNfeEvento>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from NfeEvento where id=:id')
//      .Params('id',FNfeEvento.GetId)
//      .ExecSQL;
end;

function TDAONfeEvento.Atualizar : iDAO<TNfeEvento>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAONfeEvento.Inserir : iDAO<TNfeEvento>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAONfeEvento.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAONfeEvento.DataSource(var DataSource : TDataSource) : iDAO<TNfeEvento>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAONfeEvento.This : TNfeEvento;
begin
    Result := FNfeEvento;
end;

function TDAONfeEvento.These: TObjectList<TNfeEvento>;
begin
    Result := FNfeEventos;
end;


end.

