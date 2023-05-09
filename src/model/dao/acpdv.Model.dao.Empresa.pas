unit acpdv.Model.dao.Empresa;

interface

uses
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.Empresa;

type
  TDAOEmpresa = class(TInterfacedObject, iDAO<TEmpresa>)
  private
    FEmpresa: TEmpresa;
    FEmpresas: TObjectList<TEmpresa>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TEmpresa>;
    function Listar: iDAO<TEmpresa>;
    function ListarPorId(Id: Variant): iDAO<TEmpresa>;
    function Excluir(aId: Variant): iDAO<TEmpresa>; overload;
    function Excluir: iDAO<TEmpresa>; overload;
    function Atualizar: iDAO<TEmpresa>;
    function Inserir: iDAO<TEmpresa>;
    function DataSource(var DataSource: TDataSource): iDAO<TEmpresa>;
    function DataSet: TDataSet;
    function This: TEmpresa;
    function These: TObjectList<TEmpresa>;
  end;

implementation

constructor TDAOEmpresa.Create;
begin
  FEmpresa := TEmpresa.New;
  FEmpresas := TObjectList<TEmpresa>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOEmpresa.Destroy;
begin
  FEmpresa.Free;
  FEmpresas.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOEmpresa.New: iDAO<TEmpresa>;
begin
  Result := Self.Create;
end;

function TDAOEmpresa.Listar: iDAO<TEmpresa>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Empresa').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FEmpresas.Add(
      TEmpresa.New
        .SetId(0)
//        .SetCrt(const Value :Integer)
//        .SetRazaoSocial(const Value :String)
//        .SetNomeFantasia(const Value :String)
//        .SetCnpj(const Value :String)
//        .SetIe(const Value :String)
//        .SetIm(const Value :String)
//        .SetCnae(const Value :String)
//        .SetFone(const Value :String)
//        .GetId (const Value :String): TEmpresa;
//    function GetNumero :String;
//    function SetNumero(const Value :String): TEmpresa;
//    function GetComplemento :String;
//    function SetComplemento(const Value :String): TEmpresa;
//    function GetBairro :String;
//    function SetBairro(const Value :String): TEmpresa;
//    function GetCidade :Integer;
//    function SetCidade(const Value :Integer): TEmpresa;
//    function GetCep :Integer;
//    function SetCep(const Value :Integer): TEmpresa;
    );
    FDataSet.Next;
  end;
end;

function TDAOEmpresa.ListarPorId(Id: Variant): iDAO<TEmpresa>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Empresa where id=:id')
    .Params('id', Id).Open.DataSet;
end;

function TDAOEmpresa.Excluir(aId: Variant): iDAO<TEmpresa>;
begin
  Result := Self;
//  FConexao.SQL('Delete from Empresa where id=:id').Params('id', Id).ExecSQL;
end;

function TDAOEmpresa.Excluir: iDAO<TEmpresa>;
begin
  Result := Self;
  FConexao.SQL('Delete from Empresa where id=:id')
    .Params('id', FEmpresa.GetId).ExecSQL;
end;

function TDAOEmpresa.Atualizar: iDAO<TEmpresa>;
begin
  Result := Self;
//  FConexao.SQL().Params().ExecSQL;
end;

function TDAOEmpresa.Inserir: iDAO<TEmpresa>;
begin
  Result := Self;
//  FDataSet := FConexao.SQL().ExecSQL.SQL().Open.DataSet;
end;

function TDAOEmpresa.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOEmpresa.DataSource(var DataSource: TDataSource): iDAO<TEmpresa>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOEmpresa.This: TEmpresa;
begin
  Result := FEmpresa;
end;

function TDAOEmpresa.These: TObjectList<TEmpresa>;
begin
  Result := FEmpresas;
end;

end.
