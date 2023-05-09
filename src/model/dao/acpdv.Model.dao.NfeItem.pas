unit acpdv.Model.dao.NfeItem;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.NfeItem;

type
  TDAONfeItem = class(TInterfacedObject, iDAO<TNfeItem>)
  private
    FNfeItem: TNfeItem;
    FNfeItems: TObjectList<TNfeItem>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TNfeItem>;
    function Listar : iDAO<TNfeItem>;
    function ListarPorId(Id : Variant) : iDAO<TNfeItem>;
    function Excluir(aId : Variant) : iDAO<TNfeItem>; overload;
    function Excluir : iDAO<TNfeItem>; overload;
    function Atualizar : iDAO<TNfeItem>;
    function Inserir : iDAO<TNfeItem>;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfeItem>;
    function DataSet: TDataSet;
    function This : TNfeItem;
    function These: TObjectList<TNfeItem>;

end;

implementation

constructor TDAONfeItem.Create;
begin
    FNfeItem:= TNfeItem.New;
    FNfeItems:= TObjectList<TNfeItem>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAONfeItem.Destroy;
begin
    FNfeItem.Free;
    FNfeItems.Free;
    FConexao.Free;
    inherited;
end;

class function TDAONfeItem.New: iDAO<TNfeItem>;
begin
  Result := Self.Create;
end;

function TDAONfeItem.Listar : iDAO<TNfeItem>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from NfeItem')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAONfeItem.ListarPorId(Id : Variant) : iDAO<TNfeItem>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from NfeItem where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAONfeItem.Excluir(aId : Variant) : iDAO<TNfeItem>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfeItem where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAONfeItem.Excluir : iDAO<TNfeItem>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfeItem where id=:id')
//      .Params('id',FNfeItem.GetId)
      .ExecSQL;
end;

function TDAONfeItem.Atualizar : iDAO<TNfeItem>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAONfeItem.Inserir : iDAO<TNfeItem>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAONfeItem.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAONfeItem.DataSource(var DataSource : TDataSource) : iDAO<TNfeItem>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAONfeItem.This : TNfeItem;
begin
    Result := FNfeItem;
end;

function TDAONfeItem.These: TObjectList<TNfeItem>;
begin
    Result := FNfeItems;
end;


end.

