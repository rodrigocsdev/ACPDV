unit cupomnaofiscal.dto;

interface

uses
  System.Generics.Collections;

type
  TEmpresa = record
    Nome: String;
    Logradouro: String;
    Bairro: String;
    Cidade: String;
    Estado: String;
    Cep: String;
    CNPJ: String;
    IE: String;
  end;

  TVenda = record
    DataHora: TDateTime;
    COO: Integer;
    QuantidadeTotal: Integer;
    Total: Currency;
  end;

  TItens = record
    Item: Integer;
    Codigo: Integer;
    Descricao: String;
    Valor: Currency;
    Quantidade: Double;
    Total: Currency;
  end;

  TOperador = record
    Nome: string;
  end;

  TPagamentos = record
    TipoPagamento: String;
    ValorPago: Currency;
  end;

  TDadosCabecalho = record
    Empresa: TEmpresa;
    Venda: TVenda;
  end;

  TDadosCorpo = record
    Itens: TList<TItens>;
    Venda: TVenda;
    Pagamento: TPagamentos;
  end;

  TDadosRodape = record
    Operador: TOperador;
    Descricao: String;
  end;

implementation

end.
