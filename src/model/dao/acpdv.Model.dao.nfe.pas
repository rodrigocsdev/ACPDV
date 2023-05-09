unit acpdv.Model.dao.nfe;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Nfe;

type
  TDAONfe = class(TInterfacedObject, iDAO<TNfe>)
  private
    FNfe: TNfe;
    FNfes: TObjectList<TNfe>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TNfe>;
    function Listar : iDAO<TNfe>;
    function ListarPorId(Id : Variant) : iDAO<TNfe>;
    function Excluir(aId : Variant) : iDAO<TNfe>; overload;
    function Excluir : iDAO<TNfe>; overload;
    function Atualizar : iDAO<TNfe>;
    function Inserir : iDAO<TNfe>;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfe>;
    function DataSet: TDataSet;
    function This : TNfe;
    function These: TObjectList<TNfe>;

end;

implementation

constructor TDAONfe.Create;
begin
    FNfe:= TNfe.New;
    FNfes:= TObjectList<TNfe>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAONfe.Destroy;
begin
    FNfe.Free;
    FNfes.Free;
    FConexao.Free;
    inherited;
end;

class function TDAONfe.New: iDAO<TNfe>;
begin
  Result := Self.Create;
end;

function TDAONfe.Listar : iDAO<TNfe>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Nfe')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAONfe.ListarPorId(Id : Variant) : iDAO<TNfe>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Nfe where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAONfe.Excluir(aId : Variant) : iDAO<TNfe>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from Nfe where id=:id')
//      .Params('id',Id)
//      .ExecSQL;
end;

function TDAONfe.Excluir : iDAO<TNfe>;
begin
    Result := Self;
//      FConexao
//      .SQL('Delete from Nfe where id=:id')
//      .Params('id',FNfe.GetId)
//      .ExecSQL;
end;

function TDAONfe.Atualizar : iDAO<TNfe>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAONfe.Inserir : iDAO<TNfe>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAONfe.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAONfe.DataSource(var DataSource : TDataSource) : iDAO<TNfe>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAONfe.This : TNfe;
begin
    Result := FNfe;
end;

function TDAONfe.These: TObjectList<TNfe>;
begin
    Result := FNfes;
end;


end.

