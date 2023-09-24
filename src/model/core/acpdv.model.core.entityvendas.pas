unit acpdv.model.core.entityvendas;

interface

uses
  System.Generics.Collections,
  System.Variants,
  Data.DB,
  acpdv.model.dao.nfe,
  acpdv.model.dao.NfeItem,
  acpdv.model.dao.Cidade,
  acpdv.model.Entidade.nfe,
  acpdv.model.core.entityproduto,
  acpdv.Model.Entidade.NfeItem,
  acpdv.model.dtos
  ,vcl.Forms;

type
  TEntityVendas = class
  private
    FLista: TDictionary<String, Variant>;

    procedure PreencheLista(Value: TDictionary<String, Variant>);

    // Atualiza o corpo da nota
    procedure AtualizarCorpoNota(Value: TNfeItem);

    // Somente NFCe adiciona o valor restante já faz o rateio automatico
    procedure AdicionarRateio(Value: TNFeItem);

    function GerarProximoNFC(const Serie: Integer): Integer;

    procedure Imprimir(Venda: TDTOVenda);

    constructor Create;
    destructor Destroy; override;
  public
    class function New: TEntityVendas;
    function AbrirVenda(var Lista: TDictionary<String, Variant>): TEntityVendas;
    function FechaVenda(Venda: TDTOVenda): TEntityVendas;
    function RegistraItensVenda(Itens: TDictionary<String, Variant>): TEntityVendas;
    function TotaisVenda: TDictionary<String,Variant>;
    function isVendaAberta: Boolean;
  end;

implementation

uses
  System.SysUtils,
  ACBrUtil,
  acpdv.Model.dao.Empresa,
  acpdv.Model.dao.Configuracao,
  acpdv.Model.dao.CAIXA_MOVIMENTO,
  acpdv.Model.dao.produto,
  concretecupomnaofiscal,
  cupomnaofiscal.dto,
  cupomnaofiscal.interfaces;

{ TEntityVendas }

function TEntityVendas.AbrirVenda(var Lista: TDictionary<String, Variant>): TEntityVendas;
begin
  Result := Self;

  var lDataSet := TDAOEmpresa.New.Listar.DataSet;
  var lCaixaMovimento := TDAOCaixaMovimento.New.FindWhere('situacao','A').DataSet;

  Lista.AddOrSetValue('NUMERO',GerarProximoNFC(Lista['ID_CAIXA']));
  Lista.AddOrSetValue('EMPRESA', lDataSet.FieldByName('ID').AsInteger);
  Lista.AddOrSetValue('CAIXA_MOVIMENTO', lCaixaMovimento.FieldByName('ID').AsInteger);
  try
    var lNFE := TNfe.New
      .SetSerie(Lista['ID_CAIXA'])
      .SetNumero(Lista['NUMERO'])
      .SetIdEmpresa(Lista['EMPRESA'])
      .SetIdCaixaMovimento(Lista['CAIXA_MOVIMENTO'])
      .SetSituacao('A')
      .SetDtEmissao(now)
      .SetTipoNfe(1)
      .SetTipoEmissao(9)
      .SetVlBaseIcms(0)
      .SetVlIcms(0)
      .SetVlDesconto(0)
      .SetVlProdutos(0)
      .SetVlOutras(0)
      .SetVlTotalNf(0)
      .SetVlPis(0)
      .SetVlCofins(0)
      .SetVlTroco(0);

    PreencheLista(Lista);
    Lista := FLista;
    try
      TDAONfe.New.Inserir(lNfe);
    finally
      lNFE.Free;
      lCaixaMovimento.Free;
    end;
  finally
    lDataSet.DisposeOf;
  end;
end;

procedure TEntityVendas.AdicionarRateio(Value: TNFeItem);
begin
  var lNfe := TDAONfe.New.Listar.DataSet;

  lNfe.Locate('SERIE;NUMERO', VarArrayOf([Value.GetSerie, Value.GetNumero]),[]);

  var lNfeObj :=
    TNfe.New
    .SetIdEmpresa(lNfe.FieldByName('ID_EMPRESA').AsInteger)
    .SetSituacao(lNfe.FieldByName('SITUACAO').AsString)
    .SetChaveAcesso(lNfe.FieldByName('CHAVE_ACESSO').AsString)
    .SetDtEmissao(lNfe.FieldByName('DT_EMISSAO').AsDateTime)
    .SetDthrSaida(lNfe.FieldByName('DTHR_SAIDA').AsDateTime)
    .SetTipoNfe(lNfe.FieldByName('TIPO_NFE').AsInteger)
    .SetTipoEmissao(lNfe.FieldByName('TIPO_EMISSAO').AsInteger)
    .SetIdPessoa(lNfe.FieldByName('ID_PESSOA').AsInteger)
    .SetDestNome(lNfe.FieldByName('SITUACAO').AsString)
    .SetDestCnpjCpf(lNfe.FieldByName('DEST_CNPJ_CPF').AsString)
    .SetDestFone(lNfe.FieldByName('DEST_FONE').AsString)
    .SetDestEndereco(lNfe.FieldByName('DEST_ENDERECO').AsString)
    .SetDestNumero(lNfe.FieldByName('DEST_NUMERO').AsString)
    .SetDestComplemento(lNfe.FieldByName('DEST_COMPLEMENTO').AsString)
    .SetDestBairro(lNfe.FieldByName('DEST_BAIRRO').AsString)
    .SetDestCidade(lNfe.FieldByName('DEST_CIDADE').AsInteger)
    .SetDestCidadeDescricao(lNfe.FieldByName('DEST_CIDADE_DESCRICAO').AsString)
    .SetDestUf(lNfe.FieldByName('DEST_UF').AsString)
    .SetDestCep(lNfe.FieldByName('DEST_CEP').AsString)
    .SetVlBaseIcms(lNfe.FieldByName('VL_BASE_ICMS').AsCurrency+Value.GetIcmsVbase)
    .SetVlIcms(lNfe.FieldByName('VL_ICMS').AsCurrency+Value.GetIcmsVimposto)
    .SetVlDesconto(lNfe.FieldByName('VL_DESCONTO').AsCurrency +
        (Value.GetVlDesconto + Value.GetVlDescontoRateio))
    .SetVlProdutos(lNfe.FieldByName('VL_PRODUTOS').AsCurrency+Value.GetVlProduto)
    .SetVlOutras(lNfe.FieldByName('VL_OUTRAS').AsCurrency +
        (Value.GetVlOutros + Value.GetVlOutrosRateio))
    .SetVlTotalNf(lNfe.FieldByName('VL_TOTAL_NF').AsCurrency+Value.GetVlTotal)
    .SetVlPis(lNfe.FieldByName('VL_PIS').AsCurrency+Value.GetPisVimposto)
    .SetVlCofins(lNfe.FieldByName('VL_COFINS').AsCurrency+Value.GetCofinsVimposto)
    .SetVlTroco(lNfe.FieldByName('VL_TROCO').AsCurrency)
    .SetCstat(lNfe.FieldByName('CSTAT').AsInteger)
    .SetXmotivo(lNfe.FieldByName('XMOTIVO').AsString)
    .SetDhrecbto(lNfe.FieldByName('DHRECBTO').AsDateTime)
    .SetNprot(lNfe.FieldByName('NPROT').AsString)
    .SetProtocolo(lNfe.FieldByName('PROTOCOLO').AsInteger)
    .SetObservacao(lNfe.FieldByName('OBSERVACAO').AsString)
    .SetXml(lNfe.FieldByName('XML').AsString)
    .SetXmlCancelamento(lNfe.FieldByName('XML_CANCELAMENTO').AsString)
    .SetSatNumeroCfe(lNfe.FieldByName('SAT_NUMERO_CFE').AsInteger)
    .SetSatNumeroSerie(lNfe.FieldByName('SAT_NUMERO_SERIE').AsInteger)
    .SetIdCaixaMovimento(lNfe.FieldByName('ID_CAIXA_MOVIMENTO').AsInteger)
    .SetCnf(lNfe.FieldByName('CNF').AsInteger)
    .SetCarroKm(lNfe.FieldByName('CARRO_KM').AsInteger)
    .SetCarroPlaca(lNfe.FieldByName('CARRO_PLACA').AsString)
    .SetSerie(lNfe.FieldByName('SERIE').AsInteger)
    .SetNumero(lNfe.FieldByName('NUMERO').AsInteger);

  TDAONfe.new.Atualizar(lNfeObj);
end;

procedure TEntityVendas.AtualizarCorpoNota(Value: TNfeItem);
begin
  var lNfe := TDAONfe.New.Listar.DataSet;

  lNfe.Locate('SERIE;NUMERO;SITUACAO', VarArrayOf([Value.GetSerie, Value.GetNumero, 'A']),[]);

  var lNfeObj :=
  TNfe.New
    .SetIdEmpresa(lNfe.FieldByName('ID_EMPRESA').AsInteger)
    .SetSituacao(lNfe.FieldByName('SITUACAO').AsString)
    .SetChaveAcesso(lNfe.FieldByName('CHAVE_ACESSO').AsString)
    .SetDtEmissao(lNfe.FieldByName('DT_EMISSAO').AsDateTime)
    .SetDthrSaida(lNfe.FieldByName('DTHR_SAIDA').AsDateTime)
    .SetTipoNfe(lNfe.FieldByName('TIPO_NFE').AsInteger)
    .SetTipoEmissao(lNfe.FieldByName('TIPO_EMISSAO').AsInteger)
    .SetIdPessoa(lNfe.FieldByName('ID_PESSOA').AsInteger)
    .SetDestNome(lNfe.FieldByName('SITUACAO').AsString)
    .SetDestCnpjCpf(lNfe.FieldByName('DEST_CNPJ_CPF').AsString)
    .SetDestFone(lNfe.FieldByName('DEST_FONE').AsString)
    .SetDestEndereco(lNfe.FieldByName('DEST_ENDERECO').AsString)
    .SetDestNumero(lNfe.FieldByName('DEST_NUMERO').AsString)
    .SetDestComplemento(lNfe.FieldByName('DEST_COMPLEMENTO').AsString)
    .SetDestBairro(lNfe.FieldByName('DEST_BAIRRO').AsString)
    .SetDestCidade(lNfe.FieldByName('DEST_CIDADE').AsInteger)
    .SetDestCidadeDescricao(lNfe.FieldByName('DEST_CIDADE_DESCRICAO').AsString)
    .SetDestUf(lNfe.FieldByName('DEST_UF').AsString)
    .SetDestCep(lNfe.FieldByName('DEST_CEP').AsString)
    .SetVlBaseIcms(lNfe.FieldByName('VL_BASE_ICMS').AsCurrency+Value.GetIcmsVbase)
    .SetVlIcms(lNfe.FieldByName('VL_ICMS').AsCurrency+Value.GetIcmsVimposto)
    .SetVlDesconto(lNfe.FieldByName('VL_DESCONTO').AsCurrency)
    .SetVlProdutos(lNfe.FieldByName('VL_PRODUTOS').AsCurrency+Value.GetVlProduto)
    .SetVlOutras(lNfe.FieldByName('VL_OUTRAS').AsCurrency)
    .SetVlTotalNf(lNfe.FieldByName('VL_TOTAL_NF').AsCurrency+Value.GetVlTotal)
    .SetVlPis(lNfe.FieldByName('VL_PIS').AsCurrency+Value.GetPisVimposto)
    .SetVlCofins(lNfe.FieldByName('VL_COFINS').AsCurrency+Value.GetCofinsVimposto)
    .SetVlTroco(lNfe.FieldByName('VL_TROCO').AsCurrency)
    .SetCstat(lNfe.FieldByName('CSTAT').AsInteger)
    .SetXmotivo(lNfe.FieldByName('XMOTIVO').AsString)
    .SetDhrecbto(lNfe.FieldByName('DHRECBTO').AsDateTime)
    .SetNprot(lNfe.FieldByName('NPROT').AsString)
    .SetProtocolo(lNfe.FieldByName('PROTOCOLO').AsInteger)
    .SetObservacao(lNfe.FieldByName('OBSERVACAO').AsString)
    .SetXml(lNfe.FieldByName('XML').AsString)
    .SetXmlCancelamento(lNfe.FieldByName('XML_CANCELAMENTO').AsString)
    .SetSatNumeroCfe(lNfe.FieldByName('SAT_NUMERO_CFE').AsInteger)
    .SetSatNumeroSerie(lNfe.FieldByName('SAT_NUMERO_SERIE').AsInteger)
    .SetIdCaixaMovimento(lNfe.FieldByName('ID_CAIXA_MOVIMENTO').AsInteger)
    .SetCnf(lNfe.FieldByName('CNF').AsInteger)
    .SetCarroKm(lNfe.FieldByName('CARRO_KM').AsInteger)
    .SetCarroPlaca(lNfe.FieldByName('CARRO_PLACA').AsString)
    .SetSerie(lNfe.FieldByName('SERIE').AsInteger)
    .SetNumero(lNfe.FieldByName('NUMERO').AsInteger);

  TDAONfe.New.Atualizar(lNfeObj);
end;

constructor TEntityVendas.Create;
begin
  FLista:= TDictionary<String, Variant>.Create;
end;

destructor TEntityVendas.Destroy;
begin
  FLista.DisposeOf;
  inherited;
end;

function TEntityVendas.FechaVenda(Venda: TDTOVenda): TEntityVendas;
begin
  Result := Self;
  var lNfe := TDAONfe.New.Listar.DataSet;
  var lNfeItens := TDAONfeItem.new.FindWhere('NUMERO', Venda.Numero).Dataset;
  var lProduto := TDAOProduto.New.Listar.DataSet;
  try
    lNfeItens.Locate('SERIE', Venda.Serie,[]);
    lNfe.Locate('SERIE;NUMERO;SITUACAO', VarArrayOf([Venda.Serie,Venda.Numero, 'A']),[]);

    Venda.COO := lNfe.FieldByName('NUMERO').AsInteger;
    Venda.DataHoraFechamento := Now;

    lNfeItens.First;
    var lItem: TDTOItens;
    var lItens := TList<TDTOItens>.Create;
    while not lNfeItens.Eof do
    begin
      lProduto.Locate('ID',lNfeItens.FieldByName('ID_PRODUTO').AsInteger,[]);
      lItem.Item := lNfeItens.FieldByName('ITEM').AsInteger;
      lItem.Codigo := lProduto.FieldByName('ID').AsInteger.ToString;
      lItem.Descricao := lProduto.FieldByName('DESCRICAO').AsString;
      lItem.ValorUnitario := lProduto.FieldByName('VL_UNITARIO').AsCurrency;
      lItem.Quantidade := lNfeItens.FieldByName('QUANTIDADE').AsCurrency;
      lItem.ValorTotal := lNfeItens.FieldByName('VL_TOTAL').AsCurrency;
      lItens.Add(lItem);
      lNfeItens.Next;
    end;

    Venda.Itens := lItens;

    TDAONfe.New.Atualizar(
      TNfe.New
      .SetIdEmpresa(lNfe.FieldByName('ID_EMPRESA').AsInteger)
      .SetSituacao('F')
      .SetChaveAcesso(lNfe.FieldByName('CHAVE_ACESSO').AsString)
      .SetDtEmissao(lNfe.FieldByName('DT_EMISSAO').AsDateTime)
      .SetDthrSaida(Venda.DataHoraFechamento)
      .SetTipoNfe(lNfe.FieldByName('TIPO_NFE').AsInteger)
      .SetTipoEmissao(lNfe.FieldByName('TIPO_EMISSAO').AsInteger)
      .SetIdPessoa(lNfe.FieldByName('ID_PESSOA').AsInteger)
      .SetDestNome(lNfe.FieldByName('SITUACAO').AsString)
      .SetDestCnpjCpf(lNfe.FieldByName('DEST_CNPJ_CPF').AsString)
      .SetDestFone(lNfe.FieldByName('DEST_FONE').AsString)
      .SetDestEndereco(lNfe.FieldByName('DEST_ENDERECO').AsString)
      .SetDestNumero(lNfe.FieldByName('DEST_NUMERO').AsString)
      .SetDestComplemento(lNfe.FieldByName('DEST_COMPLEMENTO').AsString)
      .SetDestBairro(lNfe.FieldByName('DEST_BAIRRO').AsString)
      .SetDestCidade(lNfe.FieldByName('DEST_CIDADE').AsInteger)
      .SetDestCidadeDescricao(lNfe.FieldByName('DEST_CIDADE_DESCRICAO').AsString)
      .SetDestUf(lNfe.FieldByName('DEST_UF').AsString)
      .SetDestCep(lNfe.FieldByName('DEST_CEP').AsString)
      .SetVlBaseIcms(lNfe.FieldByName('VL_BASE_ICMS').AsCurrency)
      .SetVlIcms(lNfe.FieldByName('VL_ICMS').AsCurrency)
      .SetVlDesconto(Venda.Desconto)
      .SetVlProdutos(Venda.ValorTotal)
      .SetVlOutras(lNfe.FieldByName('VL_OUTRAS').AsCurrency)
      .SetVlTotalNf(Venda.ValorTotal)
      .SetVlPis(lNfe.FieldByName('VL_PIS').AsCurrency)
      .SetVlCofins(lNfe.FieldByName('VL_COFINS').AsCurrency)
      .SetVlTroco(Venda.Troco)
      .SetCstat(lNfe.FieldByName('CSTAT').AsInteger)
      .SetXmotivo(lNfe.FieldByName('XMOTIVO').AsString)
      .SetDhrecbto(lNfe.FieldByName('DHRECBTO').AsCurrency)
      .SetNprot(lNfe.FieldByName('NPROT').AsString)
      .SetProtocolo(lNfe.FieldByName('PROTOCOLO').AsInteger)
      .SetObservacao(lNfe.FieldByName('OBSERVACAO').AsString)
      .SetXml(lNfe.FieldByName('XML').AsString)
      .SetXmlCancelamento(lNfe.FieldByName('XML_CANCELAMENTO').AsString)
      .SetSatNumeroCfe(lNfe.FieldByName('SAT_NUMERO_CFE').AsInteger)
      .SetSatNumeroSerie(lNfe.FieldByName('SAT_NUMERO_SERIE').AsInteger)
      .SetIdCaixaMovimento(lNfe.FieldByName('ID_CAIXA_MOVIMENTO').AsInteger)
      .SetCnf(lNfe.FieldByName('CNF').AsInteger)
      .SetCarroKm(lNfe.FieldByName('CARRO_KM').AsInteger)
      .SetCarroPlaca(lNfe.FieldByName('CARRO_PLACA').AsString)
      .SetSerie(lNfe.FieldByName('SERIE').AsInteger)
      .SetNumero(lNfe.FieldByName('NUMERO').AsInteger));

      Imprimir(Venda);
  finally
    lNfe.DisposeOf;
    lNfeItens.DisposeOf;
    lProduto.DisposeOf;
  end;
end;

function TEntityVendas.GerarProximoNFC(const Serie: Integer): Integer;
begin
  var lDataSetLista := TDAONfe.New.FindWhere('serie', Serie).DataSet;
  var lDataSetUltimo := TDAOConfiguracao.New.FindWhere('numero_caixa', Serie).DataSet;
  try
    lDataSetUltimo.Last;
    var lUltimoNumeroCaixa := lDataSetUltimo.FieldByName('NFCE_ULTIMO_NUMERO').AsInteger;

    lDataSetLista.Last;
    var lUltimoNumeroLista := lDataSetLista.FieldByName('NUMERO').AsInteger;

    if not (lUltimoNumeroCaixa > lUltimoNumeroLista) then
    begin
      Inc(lUltimoNumeroLista);
      Result := lUltimoNumeroLista;
      Exit;
    end;

    Inc(lUltimoNumeroCaixa);
    Result := lUltimoNumeroCaixa;
  finally
    lDataSetLista.DisposeOf;
    lDataSetUltimo.DisposeOf;
  end;
end;

procedure TEntityVendas.Imprimir(Venda: TDTOVenda);
begin
  var lCabecalho: TDadosCabecalho;
  var lCorpo: TDadosCorpo;
  var lRodaPe: TDadosRodape;

  var lEmpresa := TDAOEmpresa.New.Listar.DataSet;
  var lCidade := TDAOCidade.New.FindWhere('COD_IBGE', lEmpresa.FieldByName('CIDADE').AsInteger).DataSet;
  lCabecalho.Empresa.Nome := lEmpresa.FieldByName('RAZAO_SOCIAL').AsString;
  lCabecalho.Empresa.Logradouro := lEmpresa.FieldByName('ENDERECO').AsString;
  lCabecalho.Empresa.Bairro := lEmpresa.FieldByName('BAIRRO').AsString;
  lCabecalho.Empresa.Cidade := lCidade.FieldByName('DESCRICAO').AsString;
  lCabecalho.Empresa.Estado := lCidade.FieldByName('ID_UF').AsString;
  lCabecalho.Empresa.Cep := lEmpresa.FieldByName('CEP').AsString;
  lCabecalho.Empresa.CNPJ := lEmpresa.FieldByName('CNPJ').AsString;
  lCabecalho.Empresa.IE := lEmpresa.FieldByName('IE').AsString;

  lCorpo.Venda.DataHora := Venda.DataHoraVenda;
  lCorpo.Venda.COO := Venda.COO;
  lCorpo.Venda.QuantidadeTotal := Venda.QuantidadeItens;
  lCorpo.Venda.Total := Venda.ValorTotal;
  lCorpo.Pagamento.TipoPagamento := Venda.FormaPagamento;
  lCorpo.Pagamento.ValorPago := Venda.Recebido;

  var lItem: TItens;
  var lItens := TList<TItens>.Create;
  for var lItensVenda in Venda.Itens do
  begin
    lItem.Item := lItensVenda.Item;
    lItem.Codigo := lItensVenda.Codigo.ToInteger;
    lItem.Descricao := lItensVenda.Descricao;
    lItem.Valor := lItensVenda.ValorUnitario;
    lItem.Quantidade := lItensVenda.Quantidade;
    lItem.Total := lItensVenda.ValorTotal;
    lItens.Add(lItem);
  end;

  lCorpo.Itens := lItens;

  TCupomNaoFiscal.New
    .MontaCabecalho(lCabecalho)
    .MontaCoporNota(lCorpo)
    .MontaRodaPe(lRodaPe)
    .Gravar(ExtractFilePath(Application.ExeName) + 'Cupom.txt')
    .Imprimir;
end;

function TEntityVendas.isVendaAberta: Boolean;
begin
  Result := TDAONfe.New.Listar.DataSet.Locate('SITUACAO', 'A', []);
end;

class function TEntityVendas.New: TEntityVendas;
begin
  Result := Self.Create;
end;

procedure TEntityVendas.PreencheLista(Value: TDictionary<String, Variant>);
begin
  for var lKey in Value.Keys do
    FLista.AddOrSetValue(lKey,Value[lKey]);
end;

function TEntityVendas.RegistraItensVenda(Itens: TDictionary<String, Variant>): TEntityVendas;
begin
  Result := Self;

  var lNfeItem := TNfeItem.New;
  TEntityProduto.New.GetProdutoById(Itens['ID_PRODUTO'], FLista);

  lNfeItem
        .SetSerie(FLista['ID_CAIXA'])
        .SetNumero(FLista['NUMERO'])
        .SetItem(Itens['ITEM'])
        .SetIdProduto(FLista['ID_PRODUTO'])
        .SetGtin(VarToStrDef(FLista['GTIN_PRODUTO'],''))
        .SetDescricao(FLista['DESCRICAO_PRODUTO'])
        .SetCfop(FLista['CFOP_PRODUTO'])
        .SetUnd(FLista['UND_PRODUTO'])
        .SetQuantidade(Itens['QUANTIDADE'])
        .SetVlUnitario(FLista['VL_UNITARIO_PRODUTO'])
        .SetVlProduto(RoundABNT(FLista['VL_UNITARIO_PRODUTO']*Itens['QUANTIDADE'],2))
        .SetVlDescontoRateio(0)
        .SetVlOutrosRateio(0)
        .SetVlTotal(RoundABNT(lNfeItem.GetVlUnitario -
          (lNfeItem.GetVlDesconto + lNfeItem.GetVlDescontoRateio) +
          (lNfeItem.GetVlOutros + lNfeItem.GetVlOutrosRateio),2))
        .SetOrigem(FLista['ORIGEM_PRODUTO'])
        .SetCst(FLista['CST_PRODUTO'])
        .SetExtipi(FLista['EXTIPI_PRODUTO'])
        .SetSnVbase(0)
        .SetSnAliqcredito(0)
        .SetSnVcredito(0)
        .SetIcmsVbase(0)
        .SetIcmsAliquota(0)
        .SetIcmsVimposto(0)
        // pis
        .SetPisCst(FLista['ID_CSTPIS_PRODUTO'])
        .SetPisVbase(lNfeItem.GetVlTotal)
        .SetPisAliquota(FLista['PIS_ALIQUOTA_PRODUTO'])
        .SetPisVimposto(RoundABNT(lNfeItem.GetVlTotal *
          (lNfeItem.GetPisAliquota / 100),2))
        // cofins
        .SetCofinsCst(FLista['ID_CSTCOFINS_PRODUTO'])
        .SetCofinsVbase(lNfeItem.GetVlTotal)
        .SetCofinsAliquota(FLista['COFINS_ALIQUOTA_PRODUTO'])
        .SetCofinsVimposto(RoundABNT(lNfeItem.GetVlTotal *
          (lNfeItem.GetCofinsAliquota / 100),2))
        // imposto na nota (IBPT)
        .SetInAliqEstadual(FLista['ALIQ_ESTADUAL_PRODUTO'])
        .SetInVlEstadual(RoundABNT(lNfeItem.GetVlTotal *
          (lNfeItem.GetInAliqEstadual / 100),2))
        .SetInAliqMunicipal(FLista['ALIQ_MUNICIPAL_PRODUTO'])
        .SetInVlMunicipal(RoundABNT(lNfeItem.GetVlTotal *
          (lNfeItem.GetInAliqMunicipal / 100),2));


  TDAONfeItem.New.Inserir(lNfeItem);

  AtualizarCorpoNota(lNfeItem);
  AdicionarRateio(lNfeItem);
end;

function TEntityVendas.TotaisVenda: TDictionary<String, Variant>;
begin
  Result := TDictionary<String,VAriant>.Create;
end;

end.
