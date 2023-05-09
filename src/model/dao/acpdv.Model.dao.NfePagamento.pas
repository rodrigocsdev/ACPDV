unit acpdv.Model.dao.NfePagamento;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.NfePagamento;

type
  TDAONfePagamento = class(TInterfacedObject, iDAO<TNfePagamento>)
  private
    FNfePagamento: TNfePagamento;
    FNfePagamentos: TObjectList<TNfePagamento>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TNfePagamento>;
    function Listar : iDAO<TNfePagamento>;
    function ListarPorId(Id : Variant) : iDAO<TNfePagamento>;
    function Excluir(aId : Variant) : iDAO<TNfePagamento>; overload;
    function Excluir : iDAO<TNfePagamento>; overload;
    function Atualizar : iDAO<TNfePagamento>;
    function Inserir : iDAO<TNfePagamento>;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfePagamento>;
    function DataSet: TDataSet;
    function This : TNfePagamento;
    function These: TObjectList<TNfePagamento>;

end;

implementation

constructor TDAONfePagamento.Create;
begin
    FNfePagamento:= TNfePagamento.New;
    FNfePagamentos:= TObjectList<TNfePagamento>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAONfePagamento.Destroy;
begin
    FNfePagamento.Free;
    FNfePagamentos.Free;
    FConexao.Free;
    inherited;
end;

class function TDAONfePagamento.New: iDAO<TNfePagamento>;
begin
  Result := Self.Create;
end;

function TDAONfePagamento.Listar : iDAO<TNfePagamento>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from NfePagamento')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAONfePagamento.ListarPorId(Id : Variant) : iDAO<TNfePagamento>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from NfePagamento where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAONfePagamento.Excluir(aId : Variant) : iDAO<TNfePagamento>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfePagamento where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAONfePagamento.Excluir : iDAO<TNfePagamento>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfePagamento where id=:id')
//      .Params('id',FNfePagamento.GetId)
      .ExecSQL;
end;

function TDAONfePagamento.Atualizar : iDAO<TNfePagamento>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAONfePagamento.Inserir : iDAO<TNfePagamento>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAONfePagamento.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAONfePagamento.DataSource(var DataSource : TDataSource) : iDAO<TNfePagamento>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAONfePagamento.This : TNfePagamento;
begin
    Result := FNfePagamento;
end;

function TDAONfePagamento.These: TObjectList<TNfePagamento>;
begin
    Result := FNfePagamentos;
end;


end.

