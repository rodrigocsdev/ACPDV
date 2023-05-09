unit acpdv.Model.dao.MfePagamento;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.MfePagamento;

type
  TDAOMfePagamento = class(TInterfacedObject, iDAO<TMfePagamento>)
  private
    FMfePagamento: TMfePagamento;
    FMfePagamentos: TObjectList<TMfePagamento>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TMfePagamento>;
    function Listar : iDAO<TMfePagamento>;
    function ListarPorId(Id : Variant) : iDAO<TMfePagamento>;
    function Excluir(aId : Variant) : iDAO<TMfePagamento>; overload;
    function Excluir : iDAO<TMfePagamento>; overload;
    function Atualizar : iDAO<TMfePagamento>;
    function Inserir : iDAO<TMfePagamento>;
    function DataSource(var DataSource : TDataSource) : iDAO<TMfePagamento>;
    function DataSet: TDataSet;
    function This : TMfePagamento;
    function These: TObjectList<TMfePagamento>;

end;

implementation

constructor TDAOMfePagamento.Create;
begin
    FMfePagamento:= TMfePagamento.New;
    FMfePagamentos:= TObjectList<TMfePagamento>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOMfePagamento.Destroy;
begin
    FMfePagamento.Free;
    FMfePagamentos.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOMfePagamento.New: iDAO<TMfePagamento>;
begin
  Result := Self.Create;
end;

function TDAOMfePagamento.Listar : iDAO<TMfePagamento>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from MfePagamento')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOMfePagamento.ListarPorId(Id : Variant) : iDAO<TMfePagamento>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from MfePagamento where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOMfePagamento.Excluir(aId : Variant) : iDAO<TMfePagamento>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from MfePagamento where id=:id')
//      .Params('id',Id)
//      .ExecSQL;
end;

function TDAOMfePagamento.Excluir : iDAO<TMfePagamento>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from MfePagamento where id=:id')
      .Params('id',FMfePagamento.GetId)
      .ExecSQL;
end;

function TDAOMfePagamento.Atualizar : iDAO<TMfePagamento>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOMfePagamento.Inserir : iDAO<TMfePagamento>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOMfePagamento.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOMfePagamento.DataSource(var DataSource : TDataSource) : iDAO<TMfePagamento>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOMfePagamento.This : TMfePagamento;
begin
    Result := FMfePagamento;
end;

function TDAOMfePagamento.These: TObjectList<TMfePagamento>;
begin
    Result := FMfePagamentos;
end;


end.

