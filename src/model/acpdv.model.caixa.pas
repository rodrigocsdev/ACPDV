unit acpdv.model.caixa;

interface

uses
  System.DateUtils,
  System.SysUtils,
  System.TypInfo,
  system.Generics.Collections;

type
  TTurno = (MANHA, TARDE, NOITE);

  TTurnoHelper = record helper for TTurno
    function ToString: String;
    function TEnum(Value: String): TTurno;
    function RetornaTurno(Value: TDateTime): TTurno;
  end;

  TCaixaMovimento = class

  end;

  TCaixaDefaul = class
  private
    FId: Integer;
    FNome: String;
    FCaixaMovimento: TObjectList<TCaixaMovimento>;
  public
    class function New: TCaixaDefaul;
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property CaixaMovimento: TObjectList<TCaixaMovimento> read FCaixaMovimento write FCaixaMovimento;
  end;

  TCaixa = class
  private
    FId: Integer;
    FCaixa: Integer;
    FTurno: TTurno;
    FOperador: String;
    FSupervisor: String;
    FAberto: Boolean;
    FDataHoraAbertura: TDateTime;
    FSaldoInicial: Currency;
    FDataHoraFechamento: TDateTime;
  public
    property Id: Integer read FId write FId;
    property Caixa: Integer read FCaixa write FCaixa;
    property Turno: TTurno read FTurno write FTurno;
    property Operador: String read FOperador write FOperador;
    property Supervisor: String read FSupervisor write FSupervisor;
    property Aberto: Boolean read FAberto write FAberto;
    property DataHoraAbertura: TDateTime read FDataHoraAbertura write FDataHoraAbertura;
    property DataHoraFechamento: TDateTime read FDataHoraFechamento write FDataHoraFechamento;
    property SaldoInicial: Currency read FSaldoInicial write FSaldoInicial;
    class function New: TCaixa;
  end;

implementation

{ TCaixa }

class function TCaixa.New: TCaixa;
begin
  Result := Self.Create;
end;

{ TTurnoHelper }

function TTurnoHelper.RetornaTurno(Value: TDateTime): TTurno;
begin
  if (HourOf(Value) >= 6) and
    (HourOf(Value) <= 11) then
    Result := MANHA;

  if (HourOf(Value) >= 12) and
    (HourOf(Value) <= 17) then
    Result := TARDE;

  if (HourOf(Value) >= 18) and
    (HourOf(Value) <= 23) then
    Result := NOITE;
end;

function TTurnoHelper.TEnum(Value: String): TTurno;
begin
  Result := TTurno(GetEnumValue(TypeInfo(TTurno), Value));
end;

function TTurnoHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTurno), Integer(Self));
end;

{ TCaixaDefaul }

class function TCaixaDefaul.New: TCaixaDefaul;
begin
  Result := Self.Create;
end;

end.
