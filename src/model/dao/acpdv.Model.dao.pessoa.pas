unit acpdv.Model.dao.pessoa;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Pessoa;

type
  TDAOPessoa = class(TInterfacedObject, iDAO<TPessoa>)
  private
    FPessoa: TPessoa;
    FPessoas: TObjectList<TPessoa>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TPessoa>;
    function Listar : iDAO<TPessoa>;
    function ListarPorId(Id : Variant) : iDAO<TPessoa>;
    function Excluir(aId : Variant) : iDAO<TPessoa>; overload;
    function Excluir : iDAO<TPessoa>; overload;
    function Atualizar : iDAO<TPessoa>;
    function Inserir : iDAO<TPessoa>;
    function DataSource(var DataSource : TDataSource) : iDAO<TPessoa>;
    function DataSet: TDataSet;
    function This : TPessoa;
    function These: TObjectList<TPessoa>;

end;

implementation

constructor TDAOPessoa.Create;
begin
    FPessoa:= TPessoa.New;
    FPessoas:= TObjectList<TPessoa>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOPessoa.Destroy;
begin
    FPessoa.Free;
    FPessoas.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOPessoa.New: iDAO<TPessoa>;
begin
  Result := Self.Create;
end;

function TDAOPessoa.Listar : iDAO<TPessoa>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Pessoa')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOPessoa.ListarPorId(Id : Variant) : iDAO<TPessoa>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Pessoa where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOPessoa.Excluir(aId : Variant) : iDAO<TPessoa>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Pessoa where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOPessoa.Excluir : iDAO<TPessoa>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Pessoa where id=:id')
      .Params('id',FPessoa.GetId)
      .ExecSQL;
end;

function TDAOPessoa.Atualizar : iDAO<TPessoa>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOPessoa.Inserir : iDAO<TPessoa>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOPessoa.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOPessoa.DataSource(var DataSource : TDataSource) : iDAO<TPessoa>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOPessoa.This : TPessoa;
begin
    Result := FPessoa;
end;

function TDAOPessoa.These: TObjectList<TPessoa>;
begin
    Result := FPessoas;
end;


end.

