unit acpdv.model.enum;

interface

uses
  System.SysUtils,
  System.DateUtils,
  System.TypInfo;

type
  TTipoPagamento = (DINHEIRO, CARTAO_DEBITO, CARTAO_CREDITO, PIX);

  TTipoTurno = (MANHA, TARDE, NOITE);

  TTipoTurnoHelper = record helper for TTipoTurno
    function ToString: String;
    function ToEnum(Value: String): TTipoTurno;
    function ToTurno(Value: TDateTime): TTipoTurno;
  end;

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

{ TTipoTurnoHelper }

function TTipoTurnoHelper.ToEnum(Value: String): TTipoTurno;
begin
  Result := TTipoTurno(GetEnumValue(TypeInfo(TTipoTurno), UpperCase(Value)));
end;

function TTipoTurnoHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoTurno), integer(Self));
end;

function TTipoTurnoHelper.ToTurno(Value: TDateTime): TTipoTurno;
begin
  if ((HourOf(Value) >= 6) and (HourOf(Value) <= 11)) then
    Result := MANHA;

  if ((HourOf(Value) >= 12) and (HourOf(Value) <= 17)) then
    Result := TARDE;

  if ((HourOf(Value) >= 18) and (HourOf(Value) <= 23)) then
    Result := NOITE;
end;

end.
