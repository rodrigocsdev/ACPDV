unit acpdv.model.dtos;

interface

uses
  System.Generics.Collections;

type
  TDTOItens = record
    Item: integer;
    Codigo: String;
    Descricao: String;
    ValorUnitario: Currency;
    Quantidade: Currency;
    ValorTotal: Currency;
  end;

  TDTOVenda = record
    Numero: Integer;
    Serie: Integer;
    COO: Integer;
    DataHoraVenda: TDateTime;
    DataHoraFechamento: TDateTime;
    QuantidadeItens: Integer;
    Desconto: Currency;
    Acrescimo: Currency;
    ValorTotal: Currency;
    FormaPagamento: String;
    Recebido: Currency;
    Troco: Currency;
    Itens: TList<TDTOItens>;
  end;

implementation

end.
