unit acpdv.Model.dao.Operador;

interface

uses
  System.SysUtils,
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.Operador;

type
  TDAOOperador = class(TInterfacedObject, iDAO<TOperador>)
  private
    FOperador: TOperador;
    FOperadors: TObjectList<TOperador>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: TDAOOperador;
    function Listar: iDAO<TOperador>;
    function ListarPorId(Id: Variant): iDAO<TOperador>;
    function Excluir(aId: Variant): iDAO<TOperador>; overload;
    function Excluir: iDAO<TOperador>; overload;
    function Atualizar: iDAO<TOperador>;
    function Inserir: iDAO<TOperador>;
    function DataSource(var DataSource: TDataSource): iDAO<TOperador>;
    function DataSet: TDataSet;
    function This: TOperador;
    function These: TObjectList<TOperador>;

    function FindWhere(aField: String; Value: Variant): iDAO<TOperador>;
  end;

implementation

constructor TDAOOperador.Create;
begin
  FOperador := TOperador.New;
  FOperadors := TObjectList<TOperador>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOOperador.Destroy;
begin
  FOperador.Free;
  FOperadors.Free;
  FConexao.Free;
  inherited;
end;

function TDAOOperador.Listar: iDAO<TOperador>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Operador').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FOperador.SetId(FDataSet.FieldByName('ID').AsInteger)
      .SetNome(FDataSet.FieldByName('nome').AsString);
    FDataSet.Next;
  end;
end;

function TDAOOperador.ListarPorId(Id: Variant): iDAO<TOperador>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Operador where id=?')
  .Params(0, Id)
    .Open.DataSet;

  FOperador.SetId(FDataSet.FieldByName('ID').AsInteger)
    .SetNome(FDataSet.FieldByName('nome').AsString)
    .SetSenha(FDataSet.FieldByName('senha').AsString);
end;

class function TDAOOperador.New: TDAOOperador;
begin
  Result := Self.Create;
end;

function TDAOOperador.Excluir(aId: Variant): iDAO<TOperador>;
begin
  Result := Self;
  FConexao.SQL('Delete from Operador where id=?').Params(0, aId).ExecSQL;
end;

function TDAOOperador.Excluir: iDAO<TOperador>;
begin
  Result := Self;
  FConexao.SQL('Delete from Operador where id=?')
    .Params(0, FOperador.GetId).ExecSQL;
end;

function TDAOOperador.FindWhere(aField: String;
  Value: Variant): iDAO<TOperador>;
begin
  Result := Self;
  FDataSet :=
  FConexao.SQL('select * from operador where '+aField+'=?')
  .Params(0,Value).Open.DataSet;
end;

function TDAOOperador.Atualizar: iDAO<TOperador>;
begin
  Result := Self;
  FConexao.SQL('update operador set nome=?, senha=? where id=?')
    .Params(0, FOperador.GetNome)
    .Params(1, FOperador.GetSenha)
    .Params(2, FOperador.GetId)
    .ExecSQL;
end;

function TDAOOperador.Inserir: iDAO<TOperador>;
begin
  Result := Self;
  FDataSet :=
   FConexao.SQL('insert into operador (nome,senha) value (?,?)')
   .ExecSQL
   .SQL('select * from operador where id=(select max(id) from operador)')
   .Open.DataSet;

  FOperador.SetId(FDataSet.FieldByName('id').AsInteger)
  .SetNome(FDataSet.FieldByName('nome').AsString)
  .SetSenha(FDataSet.FieldByName('senha').AsString);
end;

function TDAOOperador.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TDAOOperador.DataSource(var DataSource: TDataSource): iDAO<TOperador>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOOperador.This: TOperador;
begin
  Result := FOperador;
end;

function TDAOOperador.These: TObjectList<TOperador>;
begin
  Result := FOperadors;
end;

end.
