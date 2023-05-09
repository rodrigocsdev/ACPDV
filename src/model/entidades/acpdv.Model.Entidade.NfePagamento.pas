unit acpdv.Model.Entidade.NfePagamento;

interface

type
  TNfePagamento = class
  private
    FSerie :Integer;
    FNumero :Integer;
    FFormaPagamento :Integer;
    FValor :Currency;

  public
    function GetSerie :Integer;
    function SetSerie(const Value :Integer): TNfePagamento;
    function GetNumero :Integer;
    function SetNumero(const Value :Integer): TNfePagamento;
    function GetFormaPagamento :Integer;
    function SetFormaPagamento(const Value :Integer): TNfePagamento;
    function GetValor :Currency;
    function SetValor(const Value :Currency): TNfePagamento;

    class function New: TNfePagamento;
end;

implementation

class function TNfePagamento.New: TNfePagamento;
begin
  Result := Self.Create;
end;

function TNfePagamento.SetSerie(const Value :Integer): TNfePagamento;
begin
  FSerie := Value;
end;

function TNfePagamento.GetSerie :Integer;
begin
  Result := FSerie;
end;

function TNfePagamento.SetNumero(const Value :Integer): TNfePagamento;
begin
  FNumero := Value;
end;

function TNfePagamento.GetNumero :Integer;
begin
  Result := FNumero;
end;

function TNfePagamento.SetFormaPagamento(const Value :Integer): TNfePagamento;
begin
  FFormaPagamento := Value;
end;

function TNfePagamento.GetFormaPagamento :Integer;
begin
  Result := FFormaPagamento;
end;

function TNfePagamento.SetValor(const Value :Currency): TNfePagamento;
begin
  FValor := Value;
end;

function TNfePagamento.GetValor :Currency;
begin
  Result := FValor;
end;

end.

