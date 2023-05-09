unit acpdv.Model.dao.FormaPagamento;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.FormaPagamento;

type
  TDAOFormaPagamento = class(TInterfacedObject, iDAO<TFormaPagamento>)
  private
    FFormaPagamento: TFormaPagamento;
    FFormaPagamentos: TObjectList<TFormaPagamento>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TFormaPagamento>;
    function Listar : iDAO<TFormaPagamento>;
    function ListarPorId(Id : Variant) : iDAO<TFormaPagamento>;
    function Excluir(aId : Variant) : iDAO<TFormaPagamento>; overload;
    function Excluir : iDAO<TFormaPagamento>; overload;
    function Atualizar : iDAO<TFormaPagamento>;
    function Inserir : iDAO<TFormaPagamento>;
    function DataSource(var DataSource : TDataSource) : iDAO<TFormaPagamento>;
    function DataSet: TDataSet;
    function This : TFormaPagamento;
    function These: TObjectList<TFormaPagamento>;

end;

implementation

constructor TDAOFormaPagamento.Create;
begin
    FFormaPagamento:= TFormaPagamento.New;
    FFormaPagamentos:= TObjectList<TFormaPagamento>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOFormaPagamento.Destroy;
begin
    FFormaPagamento.Free;
    FFormaPagamentos.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOFormaPagamento.New: iDAO<TFormaPagamento>;
begin
  Result := Self.Create;
end;

function TDAOFormaPagamento.Listar : iDAO<TFormaPagamento>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from FormaPagamento')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOFormaPagamento.ListarPorId(Id : Variant) : iDAO<TFormaPagamento>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from FormaPagamento where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAOFormaPagamento.Excluir(aId : Variant) : iDAO<TFormaPagamento>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from FormaPagamento where id=:id')
//      .Params('id',Id)
//      .ExecSQL;
end;

function TDAOFormaPagamento.Excluir : iDAO<TFormaPagamento>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from FormaPagamento where id=:id')
      .Params('id',FFormaPagamento.GetId)
      .ExecSQL;
end;

function TDAOFormaPagamento.Atualizar : iDAO<TFormaPagamento>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOFormaPagamento.Inserir : iDAO<TFormaPagamento>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOFormaPagamento.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOFormaPagamento.DataSource(var DataSource : TDataSource) : iDAO<TFormaPagamento>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOFormaPagamento.This : TFormaPagamento;
begin
    Result := FFormaPagamento;
end;

function TDAOFormaPagamento.These: TObjectList<TFormaPagamento>;
begin
    Result := FFormaPagamentos;
end;


end.

