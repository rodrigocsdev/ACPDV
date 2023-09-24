unit acconcretecupomnaofiscal.dtos.interfaces;

interface

type
  iEmpresa = interface
    function Nome(Value: String): iEmpresa;
    function Logradouro(Value: String): iEmpresa;
    function Bairro(Value: String): iEmpresa;
    function Cidade(Value: String): iEmpresa;
    function Estado(Value: String): iEmpresa;
    function Cep(Value: String): iEmpresa;
    function CNPJ(Value: String): iEmpresa;
    function IE(Value: String): iEmpresa;
  end;

  iVenda = Interface
    function DataHora(Value: TDateTime): iVenda;
    function COO(Value: Integer): iVenda<T>;
    function QuantidadeTotal(Value: Integer): iVenda;
    function Total(Value: Currency): iVenda;
  end;

  iItens = Interface
    function Item(Value: Integer): iItens;
    function Codigo(Value: Integer): iItens;
    function Descricao(Value: String): iItens;
    function Valor(Value: Currency): iItens;
    function Quantidade(Value: Double): iItens;
    function Total(Value: Currency): iItens;
    function Conitue: iItens;
  end;

  iOperador = interface
    function Nome(Value: string): iOperador;
  end;

  iPagamentos = interface
    function TipoPagamento(Value: String): iPagamentos;
    function ValorPago(Value: Currency): iPagamentos;
  end;

  iDadosCabecalho = interface
    function Empresa(Value: iEmpresa): iDadosCabecalho;
    function Venda(Value: iVenda): iDadosCabecalho;
  end;

  iDadosCorpo = interface
    function Itens(Value: iItens): iDadosCorpo;
    function Venda(Value: iVenda): iDadosCorpo;
    function Pagamento(Value: iPagamentos): iDadosCorpo;
  end;

  iDadosRodape = interface
    function Operador(Value: iOperador): iDadosRodape;
    function Descricao(Value: String): iDadosRodape;
  end;

implementation

end.
