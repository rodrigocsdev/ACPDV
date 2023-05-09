unit acpdv.Model.Entidade.SuprimentoSangria;

interface

type
  TSuprimentoSangria = class
  private
    FId :Integer;
    FIdCaixaMovimento :Integer;
    FTipoEmissao :String;
    FVlEmissao :Currency;
    FAnotacao :Currency;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TSuprimentoSangria;
    function GetIdCaixaMovimento :Integer;
    function SetIdCaixaMovimento(const Value :Integer): TSuprimentoSangria;
    function GetTipoEmissao :String;
    function SetTipoEmissao(const Value :String): TSuprimentoSangria;
    function GetVlEmissao :Currency;
    function SetVlEmissao(const Value :Currency): TSuprimentoSangria;
    function GetAnotacao :Currency;
    function SetAnotacao(const Value :Currency): TSuprimentoSangria;

    class function New: TSuprimentoSangria;
end;

implementation

class function TSuprimentoSangria.New: TSuprimentoSangria;
begin
  Result := Self.Create;
end;

function TSuprimentoSangria.SetId(const Value :Integer): TSuprimentoSangria;
begin
  FId := Value;
end;

function TSuprimentoSangria.GetId :Integer;
begin
  Result := FId;
end;

function TSuprimentoSangria.SetIdCaixaMovimento(const Value :Integer): TSuprimentoSangria;
begin
  FIdCaixaMovimento := Value;
end;

function TSuprimentoSangria.GetIdCaixaMovimento :Integer;
begin
  Result := FIdCaixaMovimento;
end;

function TSuprimentoSangria.SetTipoEmissao(const Value :String): TSuprimentoSangria;
begin
  FTipoEmissao := Value;
end;

function TSuprimentoSangria.GetTipoEmissao :String;
begin
  Result := FTipoEmissao;
end;

function TSuprimentoSangria.SetVlEmissao(const Value :Currency): TSuprimentoSangria;
begin
  FVlEmissao := Value;
end;

function TSuprimentoSangria.GetVlEmissao :Currency;
begin
  Result := FVlEmissao;
end;

function TSuprimentoSangria.SetAnotacao(const Value :Currency): TSuprimentoSangria;
begin
  FAnotacao := Value;
end;

function TSuprimentoSangria.GetAnotacao :Currency;
begin
  Result := FAnotacao;
end;

end.

