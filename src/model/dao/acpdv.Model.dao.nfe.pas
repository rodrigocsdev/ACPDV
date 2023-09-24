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
    class function New: TDAONfe;
    function Listar : iDAO<TNfe>;
    function ListarPorId(Id : Variant) : iDAO<TNfe>;
    function Excluir(aId : Variant) : iDAO<TNfe>; overload;
    function Excluir : iDAO<TNfe>; overload;
    function Atualizar : iDAO<TNfe>; overload;
    function Atualizar(Value: TNfe): TDAONfe; overload;
    function Inserir : iDAO<TNfe>; overload;
    function Inserir(Value: TNfe): TDAONfe; overload;
    function FindWhere(Campo: String; Value: Variant): TDAONfe;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfe>;
    function DataSet: TDataSet;
    function This : TNfe;
    function These: TObjectList<TNfe>;

end;

implementation

uses
  System.SysUtils;

function TDAONfe.Atualizar(Value: TNfe): TDAONfe;
begin
  Result := Self;
  FConexao
    .Query('UPDATE NFE SET ID_EMPRESA=?, SITUACAO=?, CHAVE_ACESSO=?, DT_EMISSAO=?, DTHR_SAIDA=?, TIPO_NFE=?,'+
          ' TIPO_EMISSAO=?, ID_PESSOA=?, DEST_NOME=?, DEST_CNPJ_CPF=?, DEST_FONE=?, DEST_ENDERECO=?, DEST_NUMERO=?,'+
          ' DEST_COMPLEMENTO=?, DEST_BAIRRO=?, DEST_CIDADE=?, DEST_CIDADE_DESCRICAO=?, DEST_UF=?, DEST_CEP=?, VL_BASE_ICMS=?,'+
          ' VL_ICMS=?, VL_DESCONTO=?, VL_PRODUTOS=?, VL_OUTRAS=?, VL_TOTAL_NF=?, VL_PIS=?, VL_COFINS=?, VL_TROCO=?, CSTAT=?, XMOTIVO=?,'+
          ' DHRECBTO=?, NPROT=?, PROTOCOLO=?, OBSERVACAO=?, XML=?, XML_CANCELAMENTO=?, SAT_NUMERO_CFE=?, SAT_NUMERO_SERIE=?,'+
          ' ID_CAIXA_MOVIMENTO=?, CNF=?, CARRO_KM=?, CARRO_PLACA=? WHERE SERIE=? AND NUMERO=?',
          [Value.GetIdEmpresa, Value.GetSituacao, Value.GetChaveAcesso, Value.GetDtEmissao, Value.GetDthrSaida,
          Value.GetTipoNfe, Value.GetTipoEmissao, Value.GetIdPessoa, Value.GetDestNome, Value.GetDestCnpjCpf,
          Value.GetDestFone, Value.GetDestEndereco, Value.GetDestNumero,
          Value.GetDestComplemento, Value.GetDestBairro, Value.GetDestCidade, Value.GetDestCidadeDescricao,
          Value.GetDestUf, Value.GetDestCep, Value.GetVlBaseIcms, Value.GetVlIcms, Value.GetVlDesconto,
          Value.GetVlProdutos, Value.GetVlOutras, Value.GetVlTotalNf, Value.GetVlPis, VAlue.GetVlCofins,
          Value.GetVlTroco, Value.GetCstat, Value.GetXmotivo, Value.GetDhrecbto, Value.GetNprot, Value.GetProtocolo,
          Value.GetObservacao,Value.GetXml, Value.GetXmlCancelamento, VAlue.GetSatNumeroCfe,
          Value.GetSatNumeroSerie,VAlue.GetIdCaixaMovimento, Value.GetCnf, Value.GetCarroKm, Value.GetCarroPlaca,
          Value.GetSerie, Value.GetNumero]);
end;

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

class function TDAONfe.New: TDAONfe;
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

function TDAONfe.FindWhere(Campo: String; Value: Variant): TDAONfe;
begin
  Result := Self;

  var lSQL: Variant := Format('SELECT * FROM NFE WHERE %s=?',[Campo]);

  FDataSet := FConexao.Query(lSQL,[Value]);
end;

function TDAONfe.Inserir(Value: TNfe): TDAONfe;
begin
  Result := Self;

  FConexao.Query('INSERT INTO NFE (SERIE, NUMERO, ID_EMPRESA, SITUACAO,'+
                                'DT_EMISSAO, TIPO_NFE, TIPO_EMISSAO,'+
                                'VL_BASE_ICMS, VL_ICMS, VL_DESCONTO,'+
                                'VL_PRODUTOS, VL_OUTRAS, VL_TOTAL_NF,'+
                                'VL_PIS, VL_COFINS, VL_TROCO) '+
               'VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
               [Value.GetSerie,Value.GetNumero, Value.GetIdEmpresa,Value.GetSituacao,
               Value.GetDtEmissao, Value.GetTipoNfe, VAlue.GetTipoEmissao,
               Value.GetVlBaseIcms, Value.GetVlIcms, VAlue.GetVlDesconto,
               Value.GetVlProdutos, Value.GetVlOutras, Value.GetVlTotalNf,
               Value.GetVlPis, Value.GetVlCofins, Value.GetVlTroco]);
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

