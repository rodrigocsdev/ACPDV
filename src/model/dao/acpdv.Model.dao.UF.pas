unit acpdv.Model.dao.UF;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.uf;

type
  TDAOUf = class(TInterfacedObject, iDAO<TUf>)
  private
    FUf: TUf;
    FUfs: TObjectList<TUf>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TUf>;
    function Listar : iDAO<TUf>;
    function ListarPorId(Id : Variant) : iDAO<TUf>;
    function Excluir(aId : Variant) : iDAO<TUf>; overload;
    function Excluir : iDAO<TUf>; overload;
    function Atualizar : iDAO<TUf>;
    function Inserir : iDAO<TUf>;
    function DataSource(var DataSource : TDataSource) : iDAO<TUf>;
    function DataSet: TDataSet;
    function This : TUf;
    function These: TObjectList<TUf>;

end;

implementation

constructor TDAOUf.Create;
begin
    FUf:= TUf.New;
    FUfs:= TObjectList<TUf>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOUf.Destroy;
begin
    FUf.Free;
    FUfs.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOUf.New: iDAO<TUf>;
begin
  Result := Self.Create;
end;

function TDAOUf.Listar : iDAO<TUf>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Uf')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOUf.ListarPorId(Id : Variant) : iDAO<TUf>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Uf where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOUf.Excluir(aId : Variant) : iDAO<TUf>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Uf where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOUf.Excluir : iDAO<TUf>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Uf where id=:id')
      .Params('id',FUf.GetId)
      .ExecSQL;
end;

function TDAOUf.Atualizar : iDAO<TUf>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOUf.Inserir : iDAO<TUf>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOUf.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOUf.DataSource(var DataSource : TDataSource) : iDAO<TUf>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOUf.This : TUf;
begin
    Result := FUf;
end;

function TDAOUf.These: TObjectList<TUf>;
begin
    Result := FUfs;
end;


end.

