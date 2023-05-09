unit acpdv.Model.dao.Ibpt;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Ibpt;

type
  TDAOIbpt = class(TInterfacedObject, iDAO<TIbpt>)
  private
    FIbpt: TIbpt;
    FIbpts: TObjectList<TIbpt>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TIbpt>;
    function Listar : iDAO<TIbpt>;
    function ListarPorId(Id : Variant) : iDAO<TIbpt>;
    function Excluir(aId : Variant) : iDAO<TIbpt>; overload;
    function Excluir : iDAO<TIbpt>; overload;
    function Atualizar : iDAO<TIbpt>;
    function Inserir : iDAO<TIbpt>;
    function DataSource(var DataSource : TDataSource) : iDAO<TIbpt>;
    function DataSet: TDataSet;
    function This : TIbpt;
    function These: TObjectList<TIbpt>;

end;

implementation

constructor TDAOIbpt.Create;
begin
    FIbpt:= TIbpt.New;
    FIbpts:= TObjectList<TIbpt>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOIbpt.Destroy;
begin
    FIbpt.Free;
    FIbpts.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOIbpt.New: iDAO<TIbpt>;
begin
  Result := Self.Create;
end;

function TDAOIbpt.Listar : iDAO<TIbpt>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Ibpt')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOIbpt.ListarPorId(Id : Variant) : iDAO<TIbpt>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Ibpt where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOIbpt.Excluir(aId : Variant) : iDAO<TIbpt>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from Ibpt where id=:id')
//      .Params('id',Id)
//      .ExecSQL;
end;

function TDAOIbpt.Excluir : iDAO<TIbpt>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Ibpt where id=:id')
      .Params('id',FIbpt.GetId)
      .ExecSQL;
end;

function TDAOIbpt.Atualizar : iDAO<TIbpt>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOIbpt.Inserir : iDAO<TIbpt>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOIbpt.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOIbpt.DataSource(var DataSource : TDataSource) : iDAO<TIbpt>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOIbpt.This : TIbpt;
begin
    Result := FIbpt;
end;

function TDAOIbpt.These: TObjectList<TIbpt>;
begin
    Result := FIbpts;
end;


end.

