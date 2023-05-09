unit acpdv.Model.Entidade.FormaPagamento;

interface

type
  TFormaPagamento = class
  private
    FId :Integer;
    FAtivo :String;
    FTipo :Integer;
    FTef :String;
    FDescricao :String;
    FIdNfe :Integer;
    FIdSat :Integer;
    FPos :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TFormaPagamento;
    function GetAtivo :String;
    function SetAtivo(const Value :String): TFormaPagamento;
    function GetTipo :Integer;
    function SetTipo(const Value :Integer): TFormaPagamento;
    function GetTef :String;
    function SetTef(const Value :String): TFormaPagamento;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TFormaPagamento;
    function GetIdNfe :Integer;
    function SetIdNfe(const Value :Integer): TFormaPagamento;
    function GetIdSat :Integer;
    function SetIdSat(const Value :Integer): TFormaPagamento;
    function GetPos :String;
    function SetPos(const Value :String): TFormaPagamento;

    class function New: TFormaPagamento;
end;

implementation

class function TFormaPagamento.New: TFormaPagamento;
begin
  Result := Self.Create;
end;

function TFormaPagamento.SetId(const Value :Integer): TFormaPagamento;
begin
  FId := Value;
end;

function TFormaPagamento.GetId :Integer;
begin
  Result := FId;
end;

function TFormaPagamento.SetAtivo(const Value :String): TFormaPagamento;
begin
  FAtivo := Value;
end;

function TFormaPagamento.GetAtivo :String;
begin
  Result := FAtivo;
end;

function TFormaPagamento.SetTipo(const Value :Integer): TFormaPagamento;
begin
  FTipo := Value;
end;

function TFormaPagamento.GetTipo :Integer;
begin
  Result := FTipo;
end;

function TFormaPagamento.SetTef(const Value :String): TFormaPagamento;
begin
  FTef := Value;
end;

function TFormaPagamento.GetTef :String;
begin
  Result := FTef;
end;

function TFormaPagamento.SetDescricao(const Value :String): TFormaPagamento;
begin
  FDescricao := Value;
end;

function TFormaPagamento.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TFormaPagamento.SetIdNfe(const Value :Integer): TFormaPagamento;
begin
  FIdNfe := Value;
end;

function TFormaPagamento.GetIdNfe :Integer;
begin
  Result := FIdNfe;
end;

function TFormaPagamento.SetIdSat(const Value :Integer): TFormaPagamento;
begin
  FIdSat := Value;
end;

function TFormaPagamento.GetIdSat :Integer;
begin
  Result := FIdSat;
end;

function TFormaPagamento.SetPos(const Value :String): TFormaPagamento;
begin
  FPos := Value;
end;

function TFormaPagamento.GetPos :String;
begin
  Result := FPos;
end;

end.

