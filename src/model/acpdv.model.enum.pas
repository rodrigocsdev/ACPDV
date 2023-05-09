unit acpdv.model.enum;

interface

uses
  System.SysUtils,
  System.TypInfo;

type
  TTipoPagamento = (DINHEIRO, CARTAO_DEBITO, CARTAO_CREDITO, PIX);

  TTipoPagamentoHelper = record helper for TTipoPagamento
    function ToString: String;
    function ToEnum(Value: String): TTipoPagamento;
  end;

implementation

{ TTipoPagamentoHelper }

function TTipoPagamentoHelper.ToEnum(Value: String): TTipoPagamento;
begin
  Result := TTipoPagamento(GetEnumValue(TypeInfo(TTipoPagamento),
    StringReplace(Value, ' ', '_', [rfReplaceAll, rfIgnoreCase])));
end;

function TTipoPagamentoHelper.ToString: String;
begin
  Result := StringReplace(GetEnumName(TypeInfo(TTipoPagamento), Integer(Self)), '_', ' ',
    [rfReplaceAll, rfIgnoreCase]);
end;

end.
