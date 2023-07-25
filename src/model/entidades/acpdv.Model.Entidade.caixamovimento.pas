unit acpdv.Model.Entidade.caixamovimento;

interface

uses
  System.SysUtils;

type
  TCaixaMovimento = class
  private
    FId :Integer;
    FIdOperador :Integer;
    FIdCaixa :Integer;
    FIdTurno :Integer;
    FDataAbertura :TDateTime;
    FDataFechamento :TDateTime;
    FSituacao :String;
    FValorTotal: Currency;
    FSaldoInicial: Currency;
  public
    function GetId :Integer;
    function SetId(const Value :Integer): TCaixaMovimento;
    function GetIdOperador :Integer;
    function SetIdOperador(const Value :Integer): TCaixaMovimento;
    function GetIdCaixa :Integer;
    function SetIdCaixa(const Value :Integer): TCaixaMovimento;
    function GetIdTurno :Integer;
    function SetIdTurno(const Value :Integer): TCaixaMovimento;
    function GetDataAbertura :TDateTime;
    function GetDataFechamento :TDateTime;
    function SetDataFechamento(const Value :TDateTime): TCaixaMovimento;
    function GetSituacao :String;
    function SetSituacao(const Value :String): TCaixaMovimento;
    function SetValorTotal(const Value :Currency): TCaixaMovimento;
    function GetValorTotal :Currency;
    function SetSaldoInicial(const Value :Currency): TCaixaMovimento;
    function GetSaldoInicial :Currency;


    class function New: TCaixaMovimento;
end;

implementation

class function TCaixaMovimento.New: TCaixaMovimento;
begin
  Result := Self.Create;
end;

function TCaixaMovimento.SetId(const Value :Integer): TCaixaMovimento;
begin
  Result := SElf;
  FId := Value;
end;

function TCaixaMovimento.GetId :Integer;
begin
  Result := FId;
end;

function TCaixaMovimento.SetIdOperador(const Value :Integer): TCaixaMovimento;
begin
  Result := SElf;
  FIdOperador := Value;
end;

function TCaixaMovimento.GetIdOperador :Integer;
begin
  Result := FIdOperador;
end;

function TCaixaMovimento.SetIdCaixa(const Value :Integer): TCaixaMovimento;
begin
  Result := SElf;
  FIdCaixa := Value;
end;

function TCaixaMovimento.GetIdCaixa :Integer;
begin
  Result := FIdCaixa;
end;

function TCaixaMovimento.SetIdTurno(const Value :Integer): TCaixaMovimento;
begin
  Result := SElf;
  FIdTurno := Value;
end;

function TCaixaMovimento.GetIdTurno :Integer;
begin
  Result := FIdTurno;
end;

function TCaixaMovimento.GetDataAbertura :TDateTime;
begin
  Result := now;
end;

function TCaixaMovimento.SetDataFechamento(const Value :TDateTime): TCaixaMovimento;
begin
  Result := SElf;
  FDataFechamento := Value;
end;

function TCaixaMovimento.GetDataFechamento :TDateTime;
begin
  Result := FDataFechamento;
end;

function TCaixaMovimento.SetSaldoInicial(
  const Value: Currency): TCaixaMovimento;
begin
  Result := Self;
  FSaldoInicial := Value;
end;

function TCaixaMovimento.SetSituacao(const Value :String): TCaixaMovimento;
begin
  Result := SElf;
  FSituacao := Value;
end;

function TCaixaMovimento.SetValorTotal(const Value: Currency): TCaixaMovimento;
begin
  Result := Self;
  FValorTotal := VAlue;
end;

function TCaixaMovimento.GetSaldoInicial: Currency;
begin
  Result := FSaldoInicial;
end;

function TCaixaMovimento.GetSituacao :String;
begin
  Result := FSituacao;
end;

function TCaixaMovimento.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

end.

