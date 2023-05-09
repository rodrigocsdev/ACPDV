unit acpdv.Model.dao.SuprimentoSangria;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.SuprimentoSangria;

type
  TDAOSuprimentoSangria = class(TInterfacedObject, iDAO<TSuprimentoSangria>)
  private
    FSuprimentoSangria: TSuprimentoSangria;
    FSuprimentoSangrias: TObjectList<TSuprimentoSangria>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TSuprimentoSangria>;
    function Listar : iDAO<TSuprimentoSangria>;
    function ListarPorId(Id : Variant) : iDAO<TSuprimentoSangria>;
    function Excluir(aId : Variant) : iDAO<TSuprimentoSangria>; overload;
    function Excluir : iDAO<TSuprimentoSangria>; overload;
    function Atualizar : iDAO<TSuprimentoSangria>;
    function Inserir : iDAO<TSuprimentoSangria>;
    function DataSource(var DataSource : TDataSource) : iDAO<TSuprimentoSangria>;
    function DataSet: TDataSet;
    function This : TSuprimentoSangria;
    function These: TObjectList<TSuprimentoSangria>;

end;

implementation

constructor TDAOSuprimentoSangria.Create;
begin
    FSuprimentoSangria:= TSuprimentoSangria.New;
    FSuprimentoSangrias:= TObjectList<TSuprimentoSangria>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOSuprimentoSangria.Destroy;
begin
    FSuprimentoSangria.Free;
    FSuprimentoSangrias.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOSuprimentoSangria.New: iDAO<TSuprimentoSangria>;
begin
  Result := Self.Create;
end;

function TDAOSuprimentoSangria.Listar : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from SuprimentoSangria')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOSuprimentoSangria.ListarPorId(Id : Variant) : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from SuprimentoSangria where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOSuprimentoSangria.Excluir(aId : Variant) : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from SuprimentoSangria where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOSuprimentoSangria.Excluir : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from SuprimentoSangria where id=:id')
      .Params('id',FSuprimentoSangria.GetId)
      .ExecSQL;
end;

function TDAOSuprimentoSangria.Atualizar : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOSuprimentoSangria.Inserir : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOSuprimentoSangria.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOSuprimentoSangria.DataSource(var DataSource : TDataSource) : iDAO<TSuprimentoSangria>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOSuprimentoSangria.This : TSuprimentoSangria;
begin
    Result := FSuprimentoSangria;
end;

function TDAOSuprimentoSangria.These: TObjectList<TSuprimentoSangria>;
begin
    Result := FSuprimentoSangrias;
end;


end.

