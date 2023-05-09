unit acpdv.Model.dao.Cidade;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Cidade;

type
  TDAOCidade = class(TInterfacedObject, iDAO<TCidade>)
  private
    FCidade: TCidade;
    FCidades: TObjectList<TCidade>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TCidade>;
    function Listar : iDAO<TCidade>;
    function ListarPorId(Id : Variant) : iDAO<TCidade>;
    function Excluir(aId : Variant) : iDAO<TCidade>; overload;
    function Excluir : iDAO<TCidade>; overload;
    function Atualizar : iDAO<TCidade>;
    function Inserir : iDAO<TCidade>;
    function DataSource(var DataSource : TDataSource) : iDAO<TCidade>;
    function DataSet: TDataSet;
    function This : TCidade;
    function These: TObjectList<TCidade>;

end;

implementation

constructor TDAOCidade.Create;
begin
    FCidade:= TCidade.New;
    FCidades:= TObjectList<TCidade>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOCidade.Destroy;
begin
    FCidade.Free;
    FCidades.Free;
    FConexao.Free;
    inherited;
end;

class function TDAOCidade.New: iDAO<TCidade>;
begin
  Result := Self.Create;
end;

function TDAOCidade.Listar : iDAO<TCidade>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Cidade')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FCidades.Add(
      TCidade.New.SetCodIbge(FDataSet.FieldByName('COD_IBGE').AsInteger)
      .SetDescricao(FDataSet.FieldByName('DESCRICAO').AsString)
      .SetIdUf(FDataSet.FieldByName('ID_UF').AsString));
      FDataSet.Next;
    end;
end;

function TDAOCidade.ListarPorId(Id : Variant) : iDAO<TCidade>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Cidade where cod_ibge=?')
      .Params(0, id)
      .Open.DataSet;

    FCidade
      .SetCodIbge(id)
      .SetDescricao(FDataSet.FieldByName('descricao').AsString)
      .SetIdUf(FDataSet.FieldByName('id_uf').AsString);
end;

function TDAOCidade.Excluir(aId : Variant) : iDAO<TCidade>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Cidade where cod_ibge=?')
      .Params(0,aId)
      .ExecSQL;
end;

function TDAOCidade.Excluir : iDAO<TCidade>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Cidade where cod_ibge=?')
      .Params(0,FCidade.GetCodIbge)
      .ExecSQL;
end;

function TDAOCidade.Atualizar : iDAO<TCidade>;
begin
    Result := Self;
    FConexao
     .SQL('UPDATE CIDADE SET DESCRICAO=?, ID_UF=? WHERE COD_IBGE=?')
     .Params(0, FCidade.GetDescricao)
     .Params(1, FCidade.GetIdUf)
     .Params(2, FCidade.GetCodIbge)
     .ExecSQL;
end;

function TDAOCidade.Inserir : iDAO<TCidade>;
begin
    Result := Self;
    FConexao.SQL('INSERT INTO CIDADE (COD_IBGE, DESCRICAO, ID_UF) VALUES(?, ?, ?)')
      .Params(0, FCidade.GetCodIbge)
      .Params(1, FCidade.GetDescricao)
      .Params(2, FCidade.GetIdUf)
      .ExecSQL;
end;

function TDAOCidade.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOCidade.DataSource(var DataSource : TDataSource) : iDAO<TCidade>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOCidade.This : TCidade;
begin
    Result := FCidade;
end;

function TDAOCidade.These: TObjectList<TCidade>;
begin
    Result := FCidades;
end;


end.

