unit acpdv.Model.Entidade.Nfe;

interface

type
  TNfe = class
  private
    FSerie :Integer;
    FNumero :Integer;
    FIdEmpresa :Integer;
    FSituacao :String;
    FChaveAcesso :String;
    FDtEmissao :TDateTime;
    FDthrSaida :TDateTime;
    FTipoNfe :Integer;
    FTipoEmissao :Integer;
    FIdPessoa :Integer;
    FDestNome :String;
    FDestCnpjCpf :String;
    FDestFone :String;
    FDestEndereco :String;
    FDestNumero :String;
    FDestComplemento :String;
    FDestBairro :String;
    FDestCidade :Integer;
    FDestCidadeDescricao :String;
    FDestUf :String;
    FDestCep :String;
    FVlBaseIcms :Currency;
    FVlIcms :Currency;
    FVlDesconto :Currency;
    FVlProdutos :Currency;
    FVlOutras :Currency;
    FVlTotalNf :Currency;
    FVlPis :Currency;
    FVlCofins :Currency;
    FVlTroco :Currency;
    FCstat :Integer;
    FXmotivo :String;
    FDhrecbto :TDateTime;
    FNprot :String;
    FProtocolo :Integer;
    FObservacao :Integer;
    FXml :Integer;
    FXmlCancelamento :Integer;
    FSatNumeroCfe :Integer;
    FSatNumeroSerie :Integer;
    FIdCaixaMovimento :Integer;
    FCnf :Integer;
    FCarroKm :Integer;
    FCarroPlaca :String;

  public
    function GetSerie :Integer;
    function SetSerie(const Value :Integer): TNfe;
    function GetNumero :Integer;
    function SetNumero(const Value :Integer): TNfe;
    function GetIdEmpresa :Integer;
    function SetIdEmpresa(const Value :Integer): TNfe;
    function GetSituacao :String;
    function SetSituacao(const Value :String): TNfe;
    function GetChaveAcesso :String;
    function SetChaveAcesso(const Value :String): TNfe;
    function GetDtEmissao :TDateTime;
    function SetDtEmissao(const Value :TDateTime): TNfe;
    function GetDthrSaida :TDateTime;
    function SetDthrSaida(const Value :TDateTime): TNfe;
    function GetTipoNfe :Integer;
    function SetTipoNfe(const Value :Integer): TNfe;
    function GetTipoEmissao :Integer;
    function SetTipoEmissao(const Value :Integer): TNfe;
    function GetIdPessoa :Integer;
    function SetIdPessoa(const Value :Integer): TNfe;
    function GetDestNome :String;
    function SetDestNome(const Value :String): TNfe;
    function GetDestCnpjCpf :String;
    function SetDestCnpjCpf(const Value :String): TNfe;
    function GetDestFone :String;
    function SetDestFone(const Value :String): TNfe;
    function GetDestEndereco :String;
    function SetDestEndereco(const Value :String): TNfe;
    function GetDestNumero :String;
    function SetDestNumero(const Value :String): TNfe;
    function GetDestComplemento :String;
    function SetDestComplemento(const Value :String): TNfe;
    function GetDestBairro :String;
    function SetDestBairro(const Value :String): TNfe;
    function GetDestCidade :Integer;
    function SetDestCidade(const Value :Integer): TNfe;
    function GetDestCidadeDescricao :String;
    function SetDestCidadeDescricao(const Value :String): TNfe;
    function GetDestUf :String;
    function SetDestUf(const Value :String): TNfe;
    function GetDestCep :String;
    function SetDestCep(const Value :String): TNfe;
    function GetVlBaseIcms :Currency;
    function SetVlBaseIcms(const Value :Currency): TNfe;
    function GetVlIcms :Currency;
    function SetVlIcms(const Value :Currency): TNfe;
    function GetVlDesconto :Currency;
    function SetVlDesconto(const Value :Currency): TNfe;
    function GetVlProdutos :Currency;
    function SetVlProdutos(const Value :Currency): TNfe;
    function GetVlOutras :Currency;
    function SetVlOutras(const Value :Currency): TNfe;
    function GetVlTotalNf :Currency;
    function SetVlTotalNf(const Value :Currency): TNfe;
    function GetVlPis :Currency;
    function SetVlPis(const Value :Currency): TNfe;
    function GetVlCofins :Currency;
    function SetVlCofins(const Value :Currency): TNfe;
    function GetVlTroco :Currency;
    function SetVlTroco(const Value :Currency): TNfe;
    function GetCstat :Integer;
    function SetCstat(const Value :Integer): TNfe;
    function GetXmotivo :String;
    function SetXmotivo(const Value :String): TNfe;
    function GetDhrecbto :TDateTime;
    function SetDhrecbto(const Value :TDateTime): TNfe;
    function GetNprot :String;
    function SetNprot(const Value :String): TNfe;
    function GetProtocolo :Integer;
    function SetProtocolo(const Value :Integer): TNfe;
    function GetObservacao :Integer;
    function SetObservacao(const Value :Integer): TNfe;
    function GetXml :Integer;
    function SetXml(const Value :Integer): TNfe;
    function GetXmlCancelamento :Integer;
    function SetXmlCancelamento(const Value :Integer): TNfe;
    function GetSatNumeroCfe :Integer;
    function SetSatNumeroCfe(const Value :Integer): TNfe;
    function GetSatNumeroSerie :Integer;
    function SetSatNumeroSerie(const Value :Integer): TNfe;
    function GetIdCaixaMovimento :Integer;
    function SetIdCaixaMovimento(const Value :Integer): TNfe;
    function GetCnf :Integer;
    function SetCnf(const Value :Integer): TNfe;
    function GetCarroKm :Integer;
    function SetCarroKm(const Value :Integer): TNfe;
    function GetCarroPlaca :String;
    function SetCarroPlaca(const Value :String): TNfe;

    class function New: TNfe;
end;

implementation

class function TNfe.New: TNfe;
begin
  Result := Self.Create;
end;

function TNfe.SetSerie(const Value :Integer): TNfe;
begin
  FSerie := Value;
end;

function TNfe.GetSerie :Integer;
begin
  Result := FSerie;
end;

function TNfe.SetNumero(const Value :Integer): TNfe;
begin
  FNumero := Value;
end;

function TNfe.GetNumero :Integer;
begin
  Result := FNumero;
end;

function TNfe.SetIdEmpresa(const Value :Integer): TNfe;
begin
  FIdEmpresa := Value;
end;

function TNfe.GetIdEmpresa :Integer;
begin
  Result := FIdEmpresa;
end;

function TNfe.SetSituacao(const Value :String): TNfe;
begin
  FSituacao := Value;
end;

function TNfe.GetSituacao :String;
begin
  Result := FSituacao;
end;

function TNfe.SetChaveAcesso(const Value :String): TNfe;
begin
  FChaveAcesso := Value;
end;

function TNfe.GetChaveAcesso :String;
begin
  Result := FChaveAcesso;
end;

function TNfe.SetDtEmissao(const Value :TDateTime): TNfe;
begin
  FDtEmissao := Value;
end;

function TNfe.GetDtEmissao :TDateTime;
begin
  Result := FDtEmissao;
end;

function TNfe.SetDthrSaida(const Value :TDateTime): TNfe;
begin
  FDthrSaida := Value;
end;

function TNfe.GetDthrSaida :TDateTime;
begin
  Result := FDthrSaida;
end;

function TNfe.SetTipoNfe(const Value :Integer): TNfe;
begin
  FTipoNfe := Value;
end;

function TNfe.GetTipoNfe :Integer;
begin
  Result := FTipoNfe;
end;

function TNfe.SetTipoEmissao(const Value :Integer): TNfe;
begin
  FTipoEmissao := Value;
end;

function TNfe.GetTipoEmissao :Integer;
begin
  Result := FTipoEmissao;
end;

function TNfe.SetIdPessoa(const Value :Integer): TNfe;
begin
  FIdPessoa := Value;
end;

function TNfe.GetIdPessoa :Integer;
begin
  Result := FIdPessoa;
end;

function TNfe.SetDestNome(const Value :String): TNfe;
begin
  FDestNome := Value;
end;

function TNfe.GetDestNome :String;
begin
  Result := FDestNome;
end;

function TNfe.SetDestCnpjCpf(const Value :String): TNfe;
begin
  FDestCnpjCpf := Value;
end;

function TNfe.GetDestCnpjCpf :String;
begin
  Result := FDestCnpjCpf;
end;

function TNfe.SetDestFone(const Value :String): TNfe;
begin
  FDestFone := Value;
end;

function TNfe.GetDestFone :String;
begin
  Result := FDestFone;
end;

function TNfe.SetDestEndereco(const Value :String): TNfe;
begin
  FDestEndereco := Value;
end;

function TNfe.GetDestEndereco :String;
begin
  Result := FDestEndereco;
end;

function TNfe.SetDestNumero(const Value :String): TNfe;
begin
  FDestNumero := Value;
end;

function TNfe.GetDestNumero :String;
begin
  Result := FDestNumero;
end;

function TNfe.SetDestComplemento(const Value :String): TNfe;
begin
  FDestComplemento := Value;
end;

function TNfe.GetDestComplemento :String;
begin
  Result := FDestComplemento;
end;

function TNfe.SetDestBairro(const Value :String): TNfe;
begin
  FDestBairro := Value;
end;

function TNfe.GetDestBairro :String;
begin
  Result := FDestBairro;
end;

function TNfe.SetDestCidade(const Value :Integer): TNfe;
begin
  FDestCidade := Value;
end;

function TNfe.GetDestCidade :Integer;
begin
  Result := FDestCidade;
end;

function TNfe.SetDestCidadeDescricao(const Value :String): TNfe;
begin
  FDestCidadeDescricao := Value;
end;

function TNfe.GetDestCidadeDescricao :String;
begin
  Result := FDestCidadeDescricao;
end;

function TNfe.SetDestUf(const Value :String): TNfe;
begin
  FDestUf := Value;
end;

function TNfe.GetDestUf :String;
begin
  Result := FDestUf;
end;

function TNfe.SetDestCep(const Value :String): TNfe;
begin
  FDestCep := Value;
end;

function TNfe.GetDestCep :String;
begin
  Result := FDestCep;
end;

function TNfe.SetVlBaseIcms(const Value :Currency): TNfe;
begin
  FVlBaseIcms := Value;
end;

function TNfe.GetVlBaseIcms :Currency;
begin
  Result := FVlBaseIcms;
end;

function TNfe.SetVlIcms(const Value :Currency): TNfe;
begin
  FVlIcms := Value;
end;

function TNfe.GetVlIcms :Currency;
begin
  Result := FVlIcms;
end;

function TNfe.SetVlDesconto(const Value :Currency): TNfe;
begin
  FVlDesconto := Value;
end;

function TNfe.GetVlDesconto :Currency;
begin
  Result := FVlDesconto;
end;

function TNfe.SetVlProdutos(const Value :Currency): TNfe;
begin
  FVlProdutos := Value;
end;

function TNfe.GetVlProdutos :Currency;
begin
  Result := FVlProdutos;
end;

function TNfe.SetVlOutras(const Value :Currency): TNfe;
begin
  FVlOutras := Value;
end;

function TNfe.GetVlOutras :Currency;
begin
  Result := FVlOutras;
end;

function TNfe.SetVlTotalNf(const Value :Currency): TNfe;
begin
  FVlTotalNf := Value;
end;

function TNfe.GetVlTotalNf :Currency;
begin
  Result := FVlTotalNf;
end;

function TNfe.SetVlPis(const Value :Currency): TNfe;
begin
  FVlPis := Value;
end;

function TNfe.GetVlPis :Currency;
begin
  Result := FVlPis;
end;

function TNfe.SetVlCofins(const Value :Currency): TNfe;
begin
  FVlCofins := Value;
end;

function TNfe.GetVlCofins :Currency;
begin
  Result := FVlCofins;
end;

function TNfe.SetVlTroco(const Value :Currency): TNfe;
begin
  FVlTroco := Value;
end;

function TNfe.GetVlTroco :Currency;
begin
  Result := FVlTroco;
end;

function TNfe.SetCstat(const Value :Integer): TNfe;
begin
  FCstat := Value;
end;

function TNfe.GetCstat :Integer;
begin
  Result := FCstat;
end;

function TNfe.SetXmotivo(const Value :String): TNfe;
begin
  FXmotivo := Value;
end;

function TNfe.GetXmotivo :String;
begin
  Result := FXmotivo;
end;

function TNfe.SetDhrecbto(const Value :TDateTime): TNfe;
begin
  FDhrecbto := Value;
end;

function TNfe.GetDhrecbto :TDateTime;
begin
  Result := FDhrecbto;
end;

function TNfe.SetNprot(const Value :String): TNfe;
begin
  FNprot := Value;
end;

function TNfe.GetNprot :String;
begin
  Result := FNprot;
end;

function TNfe.SetProtocolo(const Value :Integer): TNfe;
begin
  FProtocolo := Value;
end;

function TNfe.GetProtocolo :Integer;
begin
  Result := FProtocolo;
end;

function TNfe.SetObservacao(const Value :Integer): TNfe;
begin
  FObservacao := Value;
end;

function TNfe.GetObservacao :Integer;
begin
  Result := FObservacao;
end;

function TNfe.SetXml(const Value :Integer): TNfe;
begin
  FXml := Value;
end;

function TNfe.GetXml :Integer;
begin
  Result := FXml;
end;

function TNfe.SetXmlCancelamento(const Value :Integer): TNfe;
begin
  FXmlCancelamento := Value;
end;

function TNfe.GetXmlCancelamento :Integer;
begin
  Result := FXmlCancelamento;
end;

function TNfe.SetSatNumeroCfe(const Value :Integer): TNfe;
begin
  FSatNumeroCfe := Value;
end;

function TNfe.GetSatNumeroCfe :Integer;
begin
  Result := FSatNumeroCfe;
end;

function TNfe.SetSatNumeroSerie(const Value :Integer): TNfe;
begin
  FSatNumeroSerie := Value;
end;

function TNfe.GetSatNumeroSerie :Integer;
begin
  Result := FSatNumeroSerie;
end;

function TNfe.SetIdCaixaMovimento(const Value :Integer): TNfe;
begin
  FIdCaixaMovimento := Value;
end;

function TNfe.GetIdCaixaMovimento :Integer;
begin
  Result := FIdCaixaMovimento;
end;

function TNfe.SetCnf(const Value :Integer): TNfe;
begin
  FCnf := Value;
end;

function TNfe.GetCnf :Integer;
begin
  Result := FCnf;
end;

function TNfe.SetCarroKm(const Value :Integer): TNfe;
begin
  FCarroKm := Value;
end;

function TNfe.GetCarroKm :Integer;
begin
  Result := FCarroKm;
end;

function TNfe.SetCarroPlaca(const Value :String): TNfe;
begin
  FCarroPlaca := Value;
end;

function TNfe.GetCarroPlaca :String;
begin
  Result := FCarroPlaca;
end;

end.

