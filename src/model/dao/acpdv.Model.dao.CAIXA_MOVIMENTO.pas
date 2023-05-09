unit acpdv.Model.dao.CAIXA_MOVIMENTO;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.caixamovimento;

type
  TDAOCaixaMovimento = class(TInterfacedObject, iDAO<TCaixaMovimento>)
  private
    FCaixaMovimento: TCaixaMovimento;
    FCaixaMovimentos: TObjectList<TCaixaMovimento>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCaixaMovimento>;
    function Listar: iDAO<TCaixaMovimento>;
    function ListarPorId(Id: Variant): iDAO<TCaixaMovimento>;
    function Excluir(aId: Variant): iDAO<TCaixaMovimento>; overload;
    function Excluir: iDAO<TCaixaMovimento>; overload;
    function Atualizar: iDAO<TCaixaMovimento>;
    function Inserir: iDAO<TCaixaMovimento>;
    function DataSource(var DataSource: TDataSource): iDAO<TCaixaMovimento>;
    function DataSet: TDataSet;
    function This: TCaixaMovimento;
    function These: TObjectList<TCaixaMovimento>;

  end;

implementation

constructor TDAOCaixaMovimento.Create;
begin
  FCaixaMovimento := TCaixaMovimento.New;
  FCaixaMovimentos := TObjectList<TCaixaMovimento>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOCaixaMovimento.Destroy;
begin
  FCaixaMovimento.Free;
  FCaixaMovimentos.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOCaixaMovimento.New: iDAO<TCaixaMovimento>;
begin
  Result := Self.Create;
end;

function TDAOCaixaMovimento.Listar: iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from CaixaMovimento').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FDataSet.Next;
  end;
end;

function TDAOCaixaMovimento.ListarPorId(Id: Variant): iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from CaixaMovimento where id=:id')
    .Params('id', Id).Open.DataSet;
end;

function TDAOCaixaMovimento.Excluir(aId: Variant): iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FConexao.SQL('Delete from CaixaMovimento where id=:id')
    .Params('id', aId).ExecSQL;
end;

function TDAOCaixaMovimento.Excluir: iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FConexao.SQL('Delete from CaixaMovimento where id=:id')
    .Params('id', FCaixaMovimento.GetId).ExecSQL;
end;

function TDAOCaixaMovimento.Atualizar: iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FConexao.SQL('UPDATE CAIXA_MOVIMENTO SET DATA_FECHAMENTO=?, SITUACAO=? WHERE ID=?')
  .Params(0, FCaixaMovimento.GetDataFechamento)
  .Params(1, FCaixaMovimento.GetSituacao)
  .Params(2, FCaixaMovimento.GetId)
  .ExecSQL;
end;

function TDAOCaixaMovimento.Inserir: iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('INSERT INTO CAIXA_MOVIMENTO (ID_OPERADOR, ID_CAIXA, '+
                           'ID_TURNO, SITUACAO) '+
                           'VALUES(?, ?, ?, ?)')
  .Params(0, FCaixaMovimento.GetIdOperador)
  .Params(1, FCaixaMovimento.GetIdCaixa)
  .Params(2, FCaixaMovimento.GetIdTurno)
  .Params(3, FCaixaMovimento.GetSituacao)
  .ExecSQL.SQL('select * from caixa_movimento where id=(select max(id) from caixa_movimento)')
  .Open.DataSet;

  FCaixaMovimento.SetId(FDataSet.FieldByName('ID').AsInteger);
end;

function TDAOCaixaMovimento.DataSet: TDataSet;
begin
  result := FDataSet;
end;

function TDAOCaixaMovimento.DataSource(var DataSource: TDataSource)
  : iDAO<TCaixaMovimento>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOCaixaMovimento.This: TCaixaMovimento;
begin
  Result := FCaixaMovimento;
end;

function TDAOCaixaMovimento.These: TObjectList<TCaixaMovimento>;
begin
  Result := FCaixaMovimentos;
end;

end.
