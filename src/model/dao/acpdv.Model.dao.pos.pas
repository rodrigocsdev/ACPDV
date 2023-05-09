unit acpdv.Model.dao.pos;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Pos;

type
  TDAOPos = class(TInterfacedObject, iDAO<TPos>)
  private
    FPos: TPos;
    FPoss: TObjectList<TPos>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TPos>;
    function Listar : iDAO<TPos>;
    function ListarPorId(Id : Variant) : iDAO<TPos>;
    function Excluir(aId : Variant) : iDAO<TPos>; overload;
    function Excluir : iDAO<TPos>; overload;
    function Atualizar : iDAO<TPos>;
    function Inserir : iDAO<TPos>;
    function DataSource(var DataSource : TDataSource) : iDAO<TPos>;
    function DataSet: TDataSet;
    function This : TPos;
    function These: TObjectList<TPos>;

end;

implementation

constructor TDAOPos.Create;
begin
    FPos:= TPos.New;
    FPoss:= TObjectList<TPos>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOPos.Destroy;
begin
    FPos.Free;
    FPoss.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOPos.New: iDAO<TPos>;
begin
  Result := Self.Create;
end;

function TDAOPos.Listar : iDAO<TPos>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Pos')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOPos.ListarPorId(Id : Variant) : iDAO<TPos>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Pos where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOPos.Excluir(aId : Variant) : iDAO<TPos>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Pos where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOPos.Excluir : iDAO<TPos>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Pos where id=:id')
      .Params('id',FPos.GetId)
      .ExecSQL;
end;

function TDAOPos.Atualizar : iDAO<TPos>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOPos.Inserir : iDAO<TPos>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOPos.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOPos.DataSource(var DataSource : TDataSource) : iDAO<TPos>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOPos.This : TPos;
begin
    Result := FPos;
end;

function TDAOPos.These: TObjectList<TPos>;
begin
    Result := FPoss;
end;


end.

