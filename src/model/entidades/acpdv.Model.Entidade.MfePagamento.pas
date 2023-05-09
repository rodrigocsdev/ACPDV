unit acpdv.Model.Entidade.MfePagamento;

interface

type
  TMfePagamento = class
  private
    FId :Integer;
    FIdRespostaFiscal :Integer;
    FIdAdquirente :Integer;
    FMensagem :String;
    FStatuspagamento :String;
    FMfeId :Integer;
    FMfeCodigo :String;
    FMfeValor :String;
    FCfeSerie :Integer;
    FCfeNumero :Integer;
    FCodigoautorizacao :String;
    FNsu :String;
    FBin :String;
    FDonocartao :String;
    FDataexpiracao :String;
    FInstituicaofinanceira :String;
    FParcelas :Integer;
    FUltimosquatrodigitos :Integer;
    FCodigopagamento :String;
    FValorpagamento :Currency;
    FIdfila :Integer;
    FTipo :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TMfePagamento;
    function GetIdRespostaFiscal :Integer;
    function SetIdRespostaFiscal(const Value :Integer): TMfePagamento;
    function GetIdAdquirente :Integer;
    function SetIdAdquirente(const Value :Integer): TMfePagamento;
    function GetMensagem :String;
    function SetMensagem(const Value :String): TMfePagamento;
    function GetStatuspagamento :String;
    function SetStatuspagamento(const Value :String): TMfePagamento;
    function GetMfeId :Integer;
    function SetMfeId(const Value :Integer): TMfePagamento;
    function GetMfeCodigo :String;
    function SetMfeCodigo(const Value :String): TMfePagamento;
    function GetMfeValor :String;
    function SetMfeValor(const Value :String): TMfePagamento;
    function GetCfeSerie :Integer;
    function SetCfeSerie(const Value :Integer): TMfePagamento;
    function GetCfeNumero :Integer;
    function SetCfeNumero(const Value :Integer): TMfePagamento;
    function GetCodigoautorizacao :String;
    function SetCodigoautorizacao(const Value :String): TMfePagamento;
    function GetNsu :String;
    function SetNsu(const Value :String): TMfePagamento;
    function GetBin :String;
    function SetBin(const Value :String): TMfePagamento;
    function GetDonocartao :String;
    function SetDonocartao(const Value :String): TMfePagamento;
    function GetDataexpiracao :String;
    function SetDataexpiracao(const Value :String): TMfePagamento;
    function GetInstituicaofinanceira :String;
    function SetInstituicaofinanceira(const Value :String): TMfePagamento;
    function GetParcelas :Integer;
    function SetParcelas(const Value :Integer): TMfePagamento;
    function GetUltimosquatrodigitos :Integer;
    function SetUltimosquatrodigitos(const Value :Integer): TMfePagamento;
    function GetCodigopagamento :String;
    function SetCodigopagamento(const Value :String): TMfePagamento;
    function GetValorpagamento :Currency;
    function SetValorpagamento(const Value :Currency): TMfePagamento;
    function GetIdfila :Integer;
    function SetIdfila(const Value :Integer): TMfePagamento;
    function GetTipo :String;
    function SetTipo(const Value :String): TMfePagamento;

    class function New: TMfePagamento;
end;

implementation

class function TMfePagamento.New: TMfePagamento;
begin
  Result := Self.Create;
end;

function TMfePagamento.SetId(const Value :Integer): TMfePagamento;
begin
  FId := Value;
end;

function TMfePagamento.GetId :Integer;
begin
  Result := FId;
end;

function TMfePagamento.SetIdRespostaFiscal(const Value :Integer): TMfePagamento;
begin
  FIdRespostaFiscal := Value;
end;

function TMfePagamento.GetIdRespostaFiscal :Integer;
begin
  Result := FIdRespostaFiscal;
end;

function TMfePagamento.SetIdAdquirente(const Value :Integer): TMfePagamento;
begin
  FIdAdquirente := Value;
end;

function TMfePagamento.GetIdAdquirente :Integer;
begin
  Result := FIdAdquirente;
end;

function TMfePagamento.SetMensagem(const Value :String): TMfePagamento;
begin
  FMensagem := Value;
end;

function TMfePagamento.GetMensagem :String;
begin
  Result := FMensagem;
end;

function TMfePagamento.SetStatuspagamento(const Value :String): TMfePagamento;
begin
  FStatuspagamento := Value;
end;

function TMfePagamento.GetStatuspagamento :String;
begin
  Result := FStatuspagamento;
end;

function TMfePagamento.SetMfeId(const Value :Integer): TMfePagamento;
begin
  FMfeId := Value;
end;

function TMfePagamento.GetMfeId :Integer;
begin
  Result := FMfeId;
end;

function TMfePagamento.SetMfeCodigo(const Value :String): TMfePagamento;
begin
  FMfeCodigo := Value;
end;

function TMfePagamento.GetMfeCodigo :String;
begin
  Result := FMfeCodigo;
end;

function TMfePagamento.SetMfeValor(const Value :String): TMfePagamento;
begin
  FMfeValor := Value;
end;

function TMfePagamento.GetMfeValor :String;
begin
  Result := FMfeValor;
end;

function TMfePagamento.SetCfeSerie(const Value :Integer): TMfePagamento;
begin
  FCfeSerie := Value;
end;

function TMfePagamento.GetCfeSerie :Integer;
begin
  Result := FCfeSerie;
end;

function TMfePagamento.SetCfeNumero(const Value :Integer): TMfePagamento;
begin
  FCfeNumero := Value;
end;

function TMfePagamento.GetCfeNumero :Integer;
begin
  Result := FCfeNumero;
end;

function TMfePagamento.SetCodigoautorizacao(const Value :String): TMfePagamento;
begin
  FCodigoautorizacao := Value;
end;

function TMfePagamento.GetCodigoautorizacao :String;
begin
  Result := FCodigoautorizacao;
end;

function TMfePagamento.SetNsu(const Value :String): TMfePagamento;
begin
  FNsu := Value;
end;

function TMfePagamento.GetNsu :String;
begin
  Result := FNsu;
end;

function TMfePagamento.SetBin(const Value :String): TMfePagamento;
begin
  FBin := Value;
end;

function TMfePagamento.GetBin :String;
begin
  Result := FBin;
end;

function TMfePagamento.SetDonocartao(const Value :String): TMfePagamento;
begin
  FDonocartao := Value;
end;

function TMfePagamento.GetDonocartao :String;
begin
  Result := FDonocartao;
end;

function TMfePagamento.SetDataexpiracao(const Value :String): TMfePagamento;
begin
  FDataexpiracao := Value;
end;

function TMfePagamento.GetDataexpiracao :String;
begin
  Result := FDataexpiracao;
end;

function TMfePagamento.SetInstituicaofinanceira(const Value :String): TMfePagamento;
begin
  FInstituicaofinanceira := Value;
end;

function TMfePagamento.GetInstituicaofinanceira :String;
begin
  Result := FInstituicaofinanceira;
end;

function TMfePagamento.SetParcelas(const Value :Integer): TMfePagamento;
begin
  FParcelas := Value;
end;

function TMfePagamento.GetParcelas :Integer;
begin
  Result := FParcelas;
end;

function TMfePagamento.SetUltimosquatrodigitos(const Value :Integer): TMfePagamento;
begin
  FUltimosquatrodigitos := Value;
end;

function TMfePagamento.GetUltimosquatrodigitos :Integer;
begin
  Result := FUltimosquatrodigitos;
end;

function TMfePagamento.SetCodigopagamento(const Value :String): TMfePagamento;
begin
  FCodigopagamento := Value;
end;

function TMfePagamento.GetCodigopagamento :String;
begin
  Result := FCodigopagamento;
end;

function TMfePagamento.SetValorpagamento(const Value :Currency): TMfePagamento;
begin
  FValorpagamento := Value;
end;

function TMfePagamento.GetValorpagamento :Currency;
begin
  Result := FValorpagamento;
end;

function TMfePagamento.SetIdfila(const Value :Integer): TMfePagamento;
begin
  FIdfila := Value;
end;

function TMfePagamento.GetIdfila :Integer;
begin
  Result := FIdfila;
end;

function TMfePagamento.SetTipo(const Value :String): TMfePagamento;
begin
  FTipo := Value;
end;

function TMfePagamento.GetTipo :String;
begin
  Result := FTipo;
end;

end.

