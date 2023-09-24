unit acpdv.Model.dao.NfeItem;

interface

uses
   system.Generics.Collections,
   Data.DB,
   acpdv.Model.dao.interfaces,
   acpdv.Model.conexao, acpdv.Model.Entidade.NfeItem;

type
  TDAONfeItem = class(TInterfacedObject, iDAO<TNfeItem>)
  private
    FNfeItem: TNfeItem;
    FNfeItems: TObjectList<TNfeItem>;
    FConexao: TConexao;
    FDataSet: TDataSet;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: TDAONfeItem;
    function Listar : iDAO<TNfeItem>;
    function ListarPorId(Id : Variant) : iDAO<TNfeItem>;
    function FindWhere(const Campo: String; const Value: Variant): TDAONfeItem;
    function Excluir(aId : Variant) : iDAO<TNfeItem>; overload;
    function Excluir : iDAO<TNfeItem>; overload;
    function Atualizar : iDAO<TNfeItem>;
    function Inserir : iDAO<TNfeItem>; overload;
    function Inserir(Value: TNfeItem): TDAONfeItem; overload;
    function DataSource(var DataSource : TDataSource) : iDAO<TNfeItem>;
    function DataSet: TDataSet;
    function This : TNfeItem;
    function These: TObjectList<TNfeItem>;

end;

implementation

constructor TDAONfeItem.Create;
begin
    FNfeItem:= TNfeItem.New;
    FNfeItems:= TObjectList<TNfeItem>.Create;
    FConexao:= TConexao.New;
end;

destructor TDAONfeItem.Destroy;
begin
    FNfeItem.Free;
    FNfeItems.Free;
    FConexao.Free;
    inherited;
end;

class function TDAONfeItem.New: TDAONfeItem;
begin
  Result := Self.Create;
end;

function TDAONfeItem.Listar : iDAO<TNfeItem>;
begin
    Result := Self;
    FDataSet :=
    FConexao.SQL('select * from NfeItem')
      .Open.DataSet;

    FDataSet.First;
    while not FDataSet.Eof do
    begin
      FDataSet.Next;
    end;
end;

function TDAONfeItem.ListarPorId(Id : Variant) : iDAO<TNfeItem>;
begin
    Result := Self;
    FDataSet :=
      FConexao.SQL('select * from NfeItem where id=:id')
      .Params('id', id)
      .Open.DataSet;
end;

function TDAONfeItem.Excluir(aId : Variant) : iDAO<TNfeItem>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfeItem where id=:id')
      .Params('id',aId)
      .ExecSQL;
end;

function TDAONfeItem.Excluir : iDAO<TNfeItem>;
begin
    Result := Self;
      FConexao
      .SQL('Delete from NfeItem where id=:id')
//      .Params('id',FNfeItem.GetId)
      .ExecSQL;
end;

function TDAONfeItem.FindWhere(const Campo: String;
  const Value: Variant): TDAONfeItem;
begin
  Result := Self;
  var lSQL: VAriant := 'select * from NFE_ITEM where '+Campo+'=?';
  FDataSet := FConexao.Query(lSQL,[Value]);
end;

function TDAONfeItem.Inserir(Value: TNfeItem): TDAONfeItem;
begin
  Result := Self;

  FConexao.Query('INSERT INTO NFE_ITEM (SERIE, NUMERO, ITEM, ID_PRODUTO, GTIN, DESCRICAO, '+
                 'CFOP, UND, QUANTIDADE, VL_UNITARIO, VL_DESCONTO, VL_DESCONTO_RATEIO, VL_OUTROS, '+
                 'VL_OUTROS_RATEIO, VL_PRODUTO, VL_TOTAL, ORIGEM, CST, NCM, EXTIPI, SN_VBASE, '+
                 'SN_ALIQCREDITO, SN_VCREDITO, ICMS_VBASE, ICMS_ALIQUOTA, ICMS_VIMPOSTO, PIS_CST, '+
                 'PIS_VBASE, PIS_ALIQUOTA, PIS_VIMPOSTO, COFINS_CST, COFINS_VBASE, COFINS_ALIQUOTA, '+
                 'COFINS_VIMPOSTO, IN_ALIQ_FEDERAL, IN_VL_FEDERAL, IN_ALIQ_ESTADUAL, IN_VL_ESTADUAL, '+
                 'IN_ALIQ_MUNICIPAL, IN_VL_MUNICIPAL, INF_ADICIONAL, CEST, ID_CODIGO_ANP) '+
                 'VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                 [Value.GetSerie, Value.GetNumero, Value.GetItem, Value.GetIdProduto, Value.GetGtin,
                 Value.GetDescricao, Value.GetCfop, Value.GetUnd, Value.GetQuantidade, Value.GetVlUnitario,
                 Value.GetVlDesconto, Value.GetVlDescontoRateio, Value.GetVlOutros, Value.GetVlOutrosRateio,
                 Value.GetVlProduto, Value.GetVlTotal, Value.GetOrigem, Value.GetCst, Value.GetNcm,
                 Value.GetExtipi, Value.GetSnVbase, Value.GetSnAliqcredito, Value.GetSnVcredito, Value.GetIcmsVbase,
                 Value.GetIcmsAliquota, Value.GetIcmsVimposto, Value.GetPisCst, Value.GetPisVbase, Value.GetPisAliquota,
                 Value.GetPisVimposto, Value.GetCofinsCst, Value.GetCofinsVbase, Value.GetCofinsAliquota,
                 Value.GetCofinsVimposto, Value.GetInAliqFederal, Value.GetInVlFederal, Value.GetInAliqEstadual,
                 Value.GetInVlEstadual, Value.GetInAliqMunicipal, Value.GetInVlMunicipal, Value.GetInfAdicional,
                 Value.GetCest, Value.GetIdCodigoAnp]);
end;

function TDAONfeItem.Atualizar : iDAO<TNfeItem>;
begin
    Result := Self;
//    FConexao
//     .SQL()
//     .Params()
//     .ExecSQL;
end;

function TDAONfeItem.Inserir : iDAO<TNfeItem>;
begin
    Result := Self;
//      FDataSet :=
//    FConexao.SQL()
//      .ExecSQL
//      .SQL()
//      .Open.DataSet;
end;

function TDAONfeItem.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAONfeItem.DataSource(var DataSource : TDataSource) : iDAO<TNfeItem>;
begin
    Result := Self;
    DataSource.DataSet := FDataSet;
end;

function TDAONfeItem.This : TNfeItem;
begin
    Result := FNfeItem;
end;

function TDAONfeItem.These: TObjectList<TNfeItem>;
begin
    Result := FNfeItems;
end;


end.

