unit acpdv.model.dao.adquirente;

interface

uses
  System.Generics.Collections,
  Data.DB,
  acpdv.model.dao.interfaces,
  acpdv.model.dao.entidade.adquirente,
  acpdv.model.conexao;

type
  TDAOAdquirente = class(TInterfacedObject, iDAO<TAdquirente>)
  private
    FAdquirente: TAdquirente;
    FAdquirentes: TObjectList<TAdquirente>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TAdquirente>;
    function Listar: iDAO<TAdquirente>;
    function ListarPorId(aId: Variant): iDAO<TAdquirente>;
    function Excluir(aId: Variant): iDAO<TAdquirente>; overload;
    function Excluir: iDAO<TAdquirente>; overload;
    function Atualizar: iDAO<TAdquirente>;
    function Inserir: iDAO<TAdquirente>;
    function DataSource(var DataSource: TDataSource): iDAO<TAdquirente>;
    function DataSet: TDataSet;
    function This: TAdquirente;
    function These: TObjectList<TAdquirente>;
  end;

implementation

function TDAOAdquirente.Atualizar: iDAO<TAdquirente>;
begin
  Result := Self;
  FConexao.SQL('UPDATE ADQUIRENTE SET ID_POS=?, DESCRICAO=?, CNPJ=?, MERCHANTID=?'+
    ', CHAVE_REQUISICAO=? WHERE ID=?')
    .Params(0,FAdquirente.GetIdPos)
    .Params(1,FAdquirente.GetDescricao)
    .Params(2,FAdquirente.GetCnpj)
    .Params(3,FAdquirente.GetMerchantId)
    .Params(4,FAdquirente.GetChaveRequisicao)
    .Params(5,FAdquirente.GetId)
    .ExecSQL;
end;

constructor TDAOAdquirente.Create;
begin
  FAdquirente:= TAdquirente.New;
  FAdquirentes:= TObjectList<TAdquirente>.Create;
  FConexao:= TConexao.New;
end;

function TDAOAdquirente.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TDAOAdquirente.DataSource(var DataSource: TDataSource)
  : iDAO<TAdquirente>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

destructor TDAOAdquirente.Destroy;
begin
  FAdquirente.Free;
  FAdquirentes.Free;
  FConexao.Free;
  inherited;
end;

function TDAOAdquirente.Excluir: iDAO<TAdquirente>;
begin
  Result := Self;
  FConexao.SQL('DELETE FROM ADQUIRENTE WHERE ID=:ID')
    .Params('ID', FAdquirente.GetId)
    .ExecSQL;
end;

function TDAOAdquirente.Excluir(aId: Variant): iDAO<TAdquirente>;
begin
  Result := Self;
  FConexao.SQL('DELETE FROM ADQUIRENTE WHERE ID=:ID')
    .Params('ID', aId)
    .ExecSQL;
end;

function TDAOAdquirente.Inserir: iDAO<TAdquirente>;
begin
  Result := Self;
  FDataSet :=
  FConexao.SQL('INSERT INTO ADQUIRENTE '+
          '(ID_POS, DESCRICAO, CNPJ, MERCHANTID, CHAVE_REQUISICAO) '+
          'VALUES(:ID_POS, :DESCRICAO, :CNPJ, :MERCHANTID, :CHAVE_REQUISICAO)')
    .Params('ID_POS',FAdquirente.GetIdPos)
    .Params('DESCRICAO',FAdquirente.GetDescricao)
    .Params('CNPJ',FAdquirente.GetCnpj)
    .Params('MERCHANTID',FAdquirente.GetMerchantId)
    .Params('CHAVE_REQUISICAO',FAdquirente.GetChaveRequisicao)
    .ExecSQL
    .SQL('select * from ADQUIRENTE where id=(select max(id) from ADQUIRENTE)')
    .Open.DataSet;

  FAdquirente.SetId(FDataSet.FieldByName('id').AsInteger);
end;

function TDAOAdquirente.Listar: iDAO<TAdquirente>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from ADQUIRENTE').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FAdquirentes.Add(
      TAdquirente.New
        .SetId(FDataSet.FieldByName('id').AsInteger)
        .SetIdPos(FDataSet.FieldByName('id_pos').AsInteger)
        .SetDescricao(FDataSet.FieldByName('descricao').AsString)
        .SetCnpj(FDataSet.FieldByName('cnpj').AsString)
        .SetMerchantId(FDataSet.FieldByName('merchantid').AsString)
        .SetChaveRequisicao(FDataSet.FieldByName('chave_requisicao').AsString));
    FDataSet.Next;
  end;
end;

function TDAOAdquirente.ListarPorId(aId: Variant): iDAO<TAdquirente>;
begin
  Result := Self;
  FDataSet :=
  FConexao.SQL('select * from ADQUIRENTE where id=:id')
  .Params('id', aId).Open.DataSet;

  FAdquirente
    .SetId(FDataSet.FieldByName('id').AsInteger)
    .SetIdPos(FDataSet.FieldByName('id_pos').AsInteger)
    .SetDescricao(FDataSet.FieldByName('descricao').AsString)
    .SetCnpj(FDataSet.FieldByName('cnpj').AsString)
    .SetMerchantId(FDataSet.FieldByName('merchantid').AsString)
    .SetChaveRequisicao(FDataSet.FieldByName('chave_requisicao').AsString);
end;

class function TDAOAdquirente.New: iDAO<TAdquirente>;
begin
  Result := Self.Create;
end;

function TDAOAdquirente.These: TObjectList<TAdquirente>;
begin
  Result := FAdquirentes;
end;

function TDAOAdquirente.This: TAdquirente;
begin
  Result := FAdquirente;
end;

end.
