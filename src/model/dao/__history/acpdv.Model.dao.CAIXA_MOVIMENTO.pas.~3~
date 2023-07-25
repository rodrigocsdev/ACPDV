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
    class function New: TDAOCaixaMovimento;
    function Listar: iDAO<TCaixaMovimento>;
    function ListarPorId(Id: Variant): iDAO<TCaixaMovimento>;
    function Excluir(aId: Variant): iDAO<TCaixaMovimento>; overload;
    function Excluir: iDAO<TCaixaMovimento>; overload;
    function Atualizar: iDAO<TCaixaMovimento>; overload;
    function Atualizar(Value: TCaixaMovimento): TDAOCaixaMovimento; overload;
    function Inserir: iDAO<TCaixaMovimento>; overload;
    function Inserir(Value: TCaixaMovimento):TDAOCaixaMovimento; overload;
    function DataSource(var DataSource: TDataSource): iDAO<TCaixaMovimento>;
    function DataSet: TDataSet;
    function FindWhere(aField: String; Value: Variant): iDAO<TCaixaMovimento>;
    function This: TCaixaMovimento;
    function These: TObjectList<TCaixaMovimento>;

  end;

implementation

function TDAOCaixaMovimento.Atualizar(
  Value: TCaixaMovimento): TDAOCaixaMovimento;
begin
  Result := Self;
  FConexao.SQL('UPDATE CAIXA_MOVIMENTO SET DATA_FECHAMENTO=?, SITUACAO=?, VALORTOTAL = ? WHERE ID=?')
  .Params(0, Value.GetDataFechamento)
  .Params(1, Value.GetSituacao)
  .Params(2, Value.GetValorTotal)
  .Params(3, Value.GetId)
  .ExecSQL;
end;

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

class function TDAOCaixaMovimento.New: TDAOCaixaMovimento;
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

function TDAOCaixaMovimento.FindWhere(aField: String;
  Value: Variant): iDAO<TCaixaMovimento>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from caixa_movimento where '+aField+'=?')
    .Params(0, Value).Open.DataSet;

  if not FDataSet.RecordCount > 1 then
  begin
    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FCaixaMovimentos.Add(
        TCaixaMovimento.New
          .SetId(FDataSet.FieldByName('id').AsInteger)
          .SetIdOperador(FDataSet.FieldByName('id_operador').AsInteger)
          .SetIdCaixa(FDataSet.FieldByName('id_caixa').AsInteger)
          .SetIdTurno(FDataSet.FieldByName('id_turno').AsInteger)
          .SetDataFechamento(FDataSet.FieldByName('data_fechamento').AsDateTime)
          .SetSituacao(FDataSet.FieldByName('situacao').AsString));
      FDataSet.Next;
    end;
    Exit;
  end;

  if not FDataSet.IsEmpty then
    FCaixaMovimento
          .SetId(FDataSet.FieldByName('id').AsInteger)
          .SetIdOperador(FDataSet.FieldByName('id_operador').AsInteger)
          .SetIdCaixa(FDataSet.FieldByName('id_caixa').AsInteger)
          .SetIdTurno(FDataSet.FieldByName('id_turno').AsInteger)
          .SetDataFechamento(FDataSet.FieldByName('data_fechamento').AsDateTime)
          .SetSituacao(FDataSet.FieldByName('situacao').AsString);
end;

function TDAOCaixaMovimento.Inserir(Value: TCaixaMovimento): TDAOCaixaMovimento;
begin
  Result := Self;
  FDataSet := FConexao.SQL('INSERT INTO CAIXA_MOVIMENTO (ID_OPERADOR, ID_CAIXA, '+
                           'ID_TURNO, SITUACAO) VALUES(?, ?, ?, ?)')
  .Params(0, Value.GetIdOperador)
  .Params(1, Value.GetIdCaixa)
  .Params(2, Value.GetIdTurno)
  .Params(3, Value.GetSituacao)
  .ExecSQL.SQL('select * from caixa_movimento where id=(select max(id) from caixa_movimento)')
  .Open.DataSet;

  FCaixaMovimento.SetId(FDataSet.FieldByName('ID').AsInteger);
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
