unit acpdv.Model.dao.produto;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Produto;

type
  TDAOProduto = class(TInterfacedObject, iDAO<TProduto>)
  private
    FProduto: TProduto;
    FProdutos: TObjectList<TProduto>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TProduto>;
    function Listar : iDAO<TProduto>;
    function ListarPorId(Id : Variant) : iDAO<TProduto>;
    function Excluir(aId : Variant) : iDAO<TProduto>; overload;
    function Excluir : iDAO<TProduto>; overload;
    function Atualizar : iDAO<TProduto>;
    function Inserir : iDAO<TProduto>;
    function DataSource(var DataSource : TDataSource) : iDAO<TProduto>;
    function DataSet: TDataSet;
    function This : TProduto;
    function These: TObjectList<TProduto>;

end;

implementation

constructor TDAOProduto.Create;
begin
    FProduto:= TProduto.New;
    FProdutos:= TObjectList<TProduto>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOProduto.Destroy;
begin
    FProduto.Free;
    FProdutos.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOProduto.New: iDAO<TProduto>;
begin
  Result := Self.Create;
end;

function TDAOProduto.Listar : iDAO<TProduto>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Produto')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOProduto.ListarPorId(Id : Variant) : iDAO<TProduto>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Produto where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOProduto.Excluir(aId : Variant) : iDAO<TProduto>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Produto where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOProduto.Excluir : iDAO<TProduto>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Produto where id=:id')
      .Params('id',FProduto.GetId)
      .ExecSQL;
end;

function TDAOProduto.Atualizar : iDAO<TProduto>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOProduto.Inserir : iDAO<TProduto>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOProduto.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOProduto.DataSource(var DataSource : TDataSource) : iDAO<TProduto>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOProduto.This : TProduto;
begin
    Result := FProduto;
end;

function TDAOProduto.These: TObjectList<TProduto>;
begin
    Result := FProdutos;
end;


end.

