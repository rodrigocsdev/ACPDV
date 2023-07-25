unit acpdv.Model.dao.turno;

interface

uses
  System.SysUtils,
  System.Variants,
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.Turno;

type
  TDAOTurno = class(TInterfacedObject, iDAO<TTurno>)
  private
    FTurno: TTurno;
    FTurnos: TObjectList<TTurno>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: TDAOTurno;
    function Listar : iDAO<TTurno>;
    function ListarPorId(Id : Variant) : iDAO<TTurno>;
    function Excluir(aId : Variant) : iDAO<TTurno>; overload;
    function Excluir : iDAO<TTurno>; overload;
    function Atualizar : iDAO<TTurno>;
    function Inserir : iDAO<TTurno>;
    function DataSource(var DataSource : TDataSource) : iDAO<TTurno>;
    function DataSet: TDataSet;
    function This : TTurno;
    function These: TObjectList<TTurno>;

    function FindWhere(aField: String; Value: Variant): TDAOTurno;
end;

implementation

constructor TDAOTurno.Create;
begin
    FTurno:= TTurno.New;
    FTurnos:= TObjectList<TTurno>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAOTurno.Destroy;
begin
    FTurno.Free;
    FTurnos.Free;
    FConexao.Free;
    inherited;
end;

function TDAOTurno.Listar : iDAO<TTurno>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from Turno')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAOTurno.ListarPorId(Id : Variant) : iDAO<TTurno>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from Turno where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

class function TDAOTurno.New: TDAOTurno;
begin
  Result := Self.Create;
end;

function TDAOTurno.Excluir(aId : Variant) : iDAO<TTurno>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Turno where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAOTurno.Excluir : iDAO<TTurno>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from Turno where id=:id')
//      .Params('id',FTurno.GetId)
      .ExecSQL;
end;

function TDAOTurno.FindWhere(aField: String; Value: Variant): TDAOTurno;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from turno where '+aField+'=?')
  .Params(0,Value)
  .Open.DataSet;
end;

function TDAOTurno.Atualizar : iDAO<TTurno>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAOTurno.Inserir : iDAO<TTurno>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAOTurno.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOTurno.DataSource(var DataSource : TDataSource) : iDAO<TTurno>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAOTurno.This : TTurno;
begin
    Result := FTurno;
end;

function TDAOTurno.These: TObjectList<TTurno>;
begin
    Result := FTurnos;
end;


end.

