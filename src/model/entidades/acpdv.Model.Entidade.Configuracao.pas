unit acpdv.Model.Entidade.Configuracao;

interface

type
  TConfiguracao = class
  private
    FNumeroCaixa :Integer;
    FLogomarca :String;
    FWebsite :String;
    FEmail :String;
    FPorta :Integer;
    FTipoAplicativo :String;
    FImpressora :String;
    FImpressoraFormato :Integer;
    FCertificadoNumero :String;
    FCertificadoSenha :String;
    FWsTipoAmbiente :String;
    FWsUfDestino :String;
    FWsProxyHost :String;
    FWsProxyPorta :Integer;
    FWsProxyUsuario :String;
    FWsProxySenha :String;
    FWsTimeout :Integer;
    FWsTentativas :Integer;
    FWsIntervaloTentativas :Integer;
    FWsTempoConsRet :Integer;
    FWsAjustaConsRet :String;
    FSmtpServidor :String;
    FSmtpPorta :Integer;
    FSmtpUsuario :String;
    FSmtpSenha :String;
    FSmtpSsl :String;
    FSmtpTls :String;
    FSmptAssunto :String;
    FSmtpMensagem :String;
    FNfceUltimoNumero :Integer;
    FNfceTokenId :String;
    FNfceTokenNumero :String;
    FImpModelo :String;
    FImpPorta :String;
    FImpVelocidade :Integer;
    FImpUmaLinha :String;
    FImpIgnoraFormatacao :String;
    FImpPaginaCodigo :String;
    FSatModelo :String;
    FSatGravarLog :String;
    FSatVersaoXml :String;
    FSatCodAtivacao :String;
    FSatShCnpj :String;
    FSatShAssinatura :String;
    FTefTipo :String;
    FSitefIp :String;
    FSitefLoja :String;
    FSitefTerminal :String;
    FSitefPortapinpad :Integer;
    FSitefParametros :String;
    FSitefMsgpinpad :String;
    FMfeChaveAcesso :String;
    FImpMargemSup :Integer;
    FImpMargemInf :Integer;
    FImpMargemDir :Integer;
    FImpMargemEsq :Integer;

  public
    function GetNumeroCaixa :Integer;
    function SetNumeroCaixa(const Value :Integer): TConfiguracao;
    function GetLogomarca :String;
    function SetLogomarca(const Value :String): TConfiguracao;
    function GetWebsite :String;
    function SetWebsite(const Value :String): TConfiguracao;
    function GetEmail :String;
    function SetEmail(const Value :String): TConfiguracao;
    function GetPorta :Integer;
    function SetPorta(const Value :Integer): TConfiguracao;
    function GetTipoAplicativo :String;
    function SetTipoAplicativo(const Value :String): TConfiguracao;
    function GetImpressora :String;
    function SetImpressora(const Value :String): TConfiguracao;
    function GetImpressoraFormato :Integer;
    function SetImpressoraFormato(const Value :Integer): TConfiguracao;
    function GetCertificadoNumero :String;
    function SetCertificadoNumero(const Value :String): TConfiguracao;
    function GetCertificadoSenha :String;
    function SetCertificadoSenha(const Value :String): TConfiguracao;
    function GetWsTipoAmbiente :String;
    function SetWsTipoAmbiente(const Value :String): TConfiguracao;
    function GetWsUfDestino :String;
    function SetWsUfDestino(const Value :String): TConfiguracao;
    function GetWsProxyHost :String;
    function SetWsProxyHost(const Value :String): TConfiguracao;
    function GetWsProxyPorta :Integer;
    function SetWsProxyPorta(const Value :Integer): TConfiguracao;
    function GetWsProxyUsuario :String;
    function SetWsProxyUsuario(const Value :String): TConfiguracao;
    function GetWsProxySenha :String;
    function SetWsProxySenha(const Value :String): TConfiguracao;
    function GetWsTimeout :Integer;
    function SetWsTimeout(const Value :Integer): TConfiguracao;
    function GetWsTentativas :Integer;
    function SetWsTentativas(const Value :Integer): TConfiguracao;
    function GetWsIntervaloTentativas :Integer;
    function SetWsIntervaloTentativas(const Value :Integer): TConfiguracao;
    function GetWsTempoConsRet :Integer;
    function SetWsTempoConsRet(const Value :Integer): TConfiguracao;
    function GetWsAjustaConsRet :String;
    function SetWsAjustaConsRet(const Value :String): TConfiguracao;
    function GetSmtpServidor :String;
    function SetSmtpServidor(const Value :String): TConfiguracao;
    function GetSmtpPorta :Integer;
    function SetSmtpPorta(const Value :Integer): TConfiguracao;
    function GetSmtpUsuario :String;
    function SetSmtpUsuario(const Value :String): TConfiguracao;
    function GetSmtpSenha :String;
    function SetSmtpSenha(const Value :String): TConfiguracao;
    function GetSmtpSsl :String;
    function SetSmtpSsl(const Value :String): TConfiguracao;
    function GetSmtpTls :String;
    function SetSmtpTls(const Value :String): TConfiguracao;
    function GetSmptAssunto :String;
    function SetSmptAssunto(const Value :String): TConfiguracao;
    function GetSmtpMensagem :String;
    function SetSmtpMensagem(const Value :String): TConfiguracao;
    function GetNfceUltimoNumero :Integer;
    function SetNfceUltimoNumero(const Value :Integer): TConfiguracao;
    function GetNfceTokenId :String;
    function SetNfceTokenId(const Value :String): TConfiguracao;
    function GetNfceTokenNumero :String;
    function SetNfceTokenNumero(const Value :String): TConfiguracao;
    function GetImpModelo :String;
    function SetImpModelo(const Value :String): TConfiguracao;
    function GetImpPorta :String;
    function SetImpPorta(const Value :String): TConfiguracao;
    function GetImpVelocidade :Integer;
    function SetImpVelocidade(const Value :Integer): TConfiguracao;
    function GetImpUmaLinha :String;
    function SetImpUmaLinha(const Value :String): TConfiguracao;
    function GetImpIgnoraFormatacao :String;
    function SetImpIgnoraFormatacao(const Value :String): TConfiguracao;
    function GetImpPaginaCodigo :String;
    function SetImpPaginaCodigo(const Value :String): TConfiguracao;
    function GetSatModelo :String;
    function SetSatModelo(const Value :String): TConfiguracao;
    function GetSatGravarLog :String;
    function SetSatGravarLog(const Value :String): TConfiguracao;
    function GetSatVersaoXml :String;
    function SetSatVersaoXml(const Value :String): TConfiguracao;
    function GetSatCodAtivacao :String;
    function SetSatCodAtivacao(const Value :String): TConfiguracao;
    function GetSatShCnpj :String;
    function SetSatShCnpj(const Value :String): TConfiguracao;
    function GetSatShAssinatura :String;
    function SetSatShAssinatura(const Value :String): TConfiguracao;
    function GetTefTipo :String;
    function SetTefTipo(const Value :String): TConfiguracao;
    function GetSitefIp :String;
    function SetSitefIp(const Value :String): TConfiguracao;
    function GetSitefLoja :String;
    function SetSitefLoja(const Value :String): TConfiguracao;
    function GetSitefTerminal :String;
    function SetSitefTerminal(const Value :String): TConfiguracao;
    function GetSitefPortapinpad :Integer;
    function SetSitefPortapinpad(const Value :Integer): TConfiguracao;
    function GetSitefParametros :String;
    function SetSitefParametros(const Value :String): TConfiguracao;
    function GetSitefMsgpinpad :String;
    function SetSitefMsgpinpad(const Value :String): TConfiguracao;
    function GetMfeChaveAcesso :String;
    function SetMfeChaveAcesso(const Value :String): TConfiguracao;
    function GetImpMargemSup :Integer;
    function SetImpMargemSup(const Value :Integer): TConfiguracao;
    function GetImpMargemInf :Integer;
    function SetImpMargemInf(const Value :Integer): TConfiguracao;
    function GetImpMargemDir :Integer;
    function SetImpMargemDir(const Value :Integer): TConfiguracao;
    function GetImpMargemEsq :Integer;
    function SetImpMargemEsq(const Value :Integer): TConfiguracao;

    class function New: TConfiguracao;
end;

implementation

class function TConfiguracao.New: TConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.SetNumeroCaixa(const Value :Integer): TConfiguracao;
begin
  FNumeroCaixa := Value;
end;

function TConfiguracao.GetNumeroCaixa :Integer;
begin
  Result := FNumeroCaixa;
end;

function TConfiguracao.SetLogomarca(const Value :String): TConfiguracao;
begin
  FLogomarca := Value;
end;

function TConfiguracao.GetLogomarca :String;
begin
  Result := FLogomarca;
end;

function TConfiguracao.SetWebsite(const Value :String): TConfiguracao;
begin
  FWebsite := Value;
end;

function TConfiguracao.GetWebsite :String;
begin
  Result := FWebsite;
end;

function TConfiguracao.SetEmail(const Value :String): TConfiguracao;
begin
  FEmail := Value;
end;

function TConfiguracao.GetEmail :String;
begin
  Result := FEmail;
end;

function TConfiguracao.SetPorta(const Value :Integer): TConfiguracao;
begin
  FPorta := Value;
end;

function TConfiguracao.GetPorta :Integer;
begin
  Result := FPorta;
end;

function TConfiguracao.SetTipoAplicativo(const Value :String): TConfiguracao;
begin
  FTipoAplicativo := Value;
end;

function TConfiguracao.GetTipoAplicativo :String;
begin
  Result := FTipoAplicativo;
end;

function TConfiguracao.SetImpressora(const Value :String): TConfiguracao;
begin
  FImpressora := Value;
end;

function TConfiguracao.GetImpressora :String;
begin
  Result := FImpressora;
end;

function TConfiguracao.SetImpressoraFormato(const Value :Integer): TConfiguracao;
begin
  FImpressoraFormato := Value;
end;

function TConfiguracao.GetImpressoraFormato :Integer;
begin
  Result := FImpressoraFormato;
end;

function TConfiguracao.SetCertificadoNumero(const Value :String): TConfiguracao;
begin
  FCertificadoNumero := Value;
end;

function TConfiguracao.GetCertificadoNumero :String;
begin
  Result := FCertificadoNumero;
end;

function TConfiguracao.SetCertificadoSenha(const Value :String): TConfiguracao;
begin
  FCertificadoSenha := Value;
end;

function TConfiguracao.GetCertificadoSenha :String;
begin
  Result := FCertificadoSenha;
end;

function TConfiguracao.SetWsTipoAmbiente(const Value :String): TConfiguracao;
begin
  FWsTipoAmbiente := Value;
end;

function TConfiguracao.GetWsTipoAmbiente :String;
begin
  Result := FWsTipoAmbiente;
end;

function TConfiguracao.SetWsUfDestino(const Value :String): TConfiguracao;
begin
  FWsUfDestino := Value;
end;

function TConfiguracao.GetWsUfDestino :String;
begin
  Result := FWsUfDestino;
end;

function TConfiguracao.SetWsProxyHost(const Value :String): TConfiguracao;
begin
  FWsProxyHost := Value;
end;

function TConfiguracao.GetWsProxyHost :String;
begin
  Result := FWsProxyHost;
end;

function TConfiguracao.SetWsProxyPorta(const Value :Integer): TConfiguracao;
begin
  FWsProxyPorta := Value;
end;

function TConfiguracao.GetWsProxyPorta :Integer;
begin
  Result := FWsProxyPorta;
end;

function TConfiguracao.SetWsProxyUsuario(const Value :String): TConfiguracao;
begin
  FWsProxyUsuario := Value;
end;

function TConfiguracao.GetWsProxyUsuario :String;
begin
  Result := FWsProxyUsuario;
end;

function TConfiguracao.SetWsProxySenha(const Value :String): TConfiguracao;
begin
  FWsProxySenha := Value;
end;

function TConfiguracao.GetWsProxySenha :String;
begin
  Result := FWsProxySenha;
end;

function TConfiguracao.SetWsTimeout(const Value :Integer): TConfiguracao;
begin
  FWsTimeout := Value;
end;

function TConfiguracao.GetWsTimeout :Integer;
begin
  Result := FWsTimeout;
end;

function TConfiguracao.SetWsTentativas(const Value :Integer): TConfiguracao;
begin
  FWsTentativas := Value;
end;

function TConfiguracao.GetWsTentativas :Integer;
begin
  Result := FWsTentativas;
end;

function TConfiguracao.SetWsIntervaloTentativas(const Value :Integer): TConfiguracao;
begin
  FWsIntervaloTentativas := Value;
end;

function TConfiguracao.GetWsIntervaloTentativas :Integer;
begin
  Result := FWsIntervaloTentativas;
end;

function TConfiguracao.SetWsTempoConsRet(const Value :Integer): TConfiguracao;
begin
  FWsTempoConsRet := Value;
end;

function TConfiguracao.GetWsTempoConsRet :Integer;
begin
  Result := FWsTempoConsRet;
end;

function TConfiguracao.SetWsAjustaConsRet(const Value :String): TConfiguracao;
begin
  FWsAjustaConsRet := Value;
end;

function TConfiguracao.GetWsAjustaConsRet :String;
begin
  Result := FWsAjustaConsRet;
end;

function TConfiguracao.SetSmtpServidor(const Value :String): TConfiguracao;
begin
  FSmtpServidor := Value;
end;

function TConfiguracao.GetSmtpServidor :String;
begin
  Result := FSmtpServidor;
end;

function TConfiguracao.SetSmtpPorta(const Value :Integer): TConfiguracao;
begin
  FSmtpPorta := Value;
end;

function TConfiguracao.GetSmtpPorta :Integer;
begin
  Result := FSmtpPorta;
end;

function TConfiguracao.SetSmtpUsuario(const Value :String): TConfiguracao;
begin
  FSmtpUsuario := Value;
end;

function TConfiguracao.GetSmtpUsuario :String;
begin
  Result := FSmtpUsuario;
end;

function TConfiguracao.SetSmtpSenha(const Value :String): TConfiguracao;
begin
  FSmtpSenha := Value;
end;

function TConfiguracao.GetSmtpSenha :String;
begin
  Result := FSmtpSenha;
end;

function TConfiguracao.SetSmtpSsl(const Value :String): TConfiguracao;
begin
  FSmtpSsl := Value;
end;

function TConfiguracao.GetSmtpSsl :String;
begin
  Result := FSmtpSsl;
end;

function TConfiguracao.SetSmtpTls(const Value :String): TConfiguracao;
begin
  FSmtpTls := Value;
end;

function TConfiguracao.GetSmtpTls :String;
begin
  Result := FSmtpTls;
end;

function TConfiguracao.SetSmptAssunto(const Value :String): TConfiguracao;
begin
  FSmptAssunto := Value;
end;

function TConfiguracao.GetSmptAssunto :String;
begin
  Result := FSmptAssunto;
end;

function TConfiguracao.SetSmtpMensagem(const Value :String): TConfiguracao;
begin
  FSmtpMensagem := Value;
end;

function TConfiguracao.GetSmtpMensagem :String;
begin
  Result := FSmtpMensagem;
end;

function TConfiguracao.SetNfceUltimoNumero(const Value :Integer): TConfiguracao;
begin
  FNfceUltimoNumero := Value;
end;

function TConfiguracao.GetNfceUltimoNumero :Integer;
begin
  Result := FNfceUltimoNumero;
end;

function TConfiguracao.SetNfceTokenId(const Value :String): TConfiguracao;
begin
  FNfceTokenId := Value;
end;

function TConfiguracao.GetNfceTokenId :String;
begin
  Result := FNfceTokenId;
end;

function TConfiguracao.SetNfceTokenNumero(const Value :String): TConfiguracao;
begin
  FNfceTokenNumero := Value;
end;

function TConfiguracao.GetNfceTokenNumero :String;
begin
  Result := FNfceTokenNumero;
end;

function TConfiguracao.SetImpModelo(const Value :String): TConfiguracao;
begin
  FImpModelo := Value;
end;

function TConfiguracao.GetImpModelo :String;
begin
  Result := FImpModelo;
end;

function TConfiguracao.SetImpPorta(const Value :String): TConfiguracao;
begin
  FImpPorta := Value;
end;

function TConfiguracao.GetImpPorta :String;
begin
  Result := FImpPorta;
end;

function TConfiguracao.SetImpVelocidade(const Value :Integer): TConfiguracao;
begin
  FImpVelocidade := Value;
end;

function TConfiguracao.GetImpVelocidade :Integer;
begin
  Result := FImpVelocidade;
end;

function TConfiguracao.SetImpUmaLinha(const Value :String): TConfiguracao;
begin
  FImpUmaLinha := Value;
end;

function TConfiguracao.GetImpUmaLinha :String;
begin
  Result := FImpUmaLinha;
end;

function TConfiguracao.SetImpIgnoraFormatacao(const Value :String): TConfiguracao;
begin
  FImpIgnoraFormatacao := Value;
end;

function TConfiguracao.GetImpIgnoraFormatacao :String;
begin
  Result := FImpIgnoraFormatacao;
end;

function TConfiguracao.SetImpPaginaCodigo(const Value :String): TConfiguracao;
begin
  FImpPaginaCodigo := Value;
end;

function TConfiguracao.GetImpPaginaCodigo :String;
begin
  Result := FImpPaginaCodigo;
end;

function TConfiguracao.SetSatModelo(const Value :String): TConfiguracao;
begin
  FSatModelo := Value;
end;

function TConfiguracao.GetSatModelo :String;
begin
  Result := FSatModelo;
end;

function TConfiguracao.SetSatGravarLog(const Value :String): TConfiguracao;
begin
  FSatGravarLog := Value;
end;

function TConfiguracao.GetSatGravarLog :String;
begin
  Result := FSatGravarLog;
end;

function TConfiguracao.SetSatVersaoXml(const Value :String): TConfiguracao;
begin
  FSatVersaoXml := Value;
end;

function TConfiguracao.GetSatVersaoXml :String;
begin
  Result := FSatVersaoXml;
end;

function TConfiguracao.SetSatCodAtivacao(const Value :String): TConfiguracao;
begin
  FSatCodAtivacao := Value;
end;

function TConfiguracao.GetSatCodAtivacao :String;
begin
  Result := FSatCodAtivacao;
end;

function TConfiguracao.SetSatShCnpj(const Value :String): TConfiguracao;
begin
  FSatShCnpj := Value;
end;

function TConfiguracao.GetSatShCnpj :String;
begin
  Result := FSatShCnpj;
end;

function TConfiguracao.SetSatShAssinatura(const Value :String): TConfiguracao;
begin
  FSatShAssinatura := Value;
end;

function TConfiguracao.GetSatShAssinatura :String;
begin
  Result := FSatShAssinatura;
end;

function TConfiguracao.SetTefTipo(const Value :String): TConfiguracao;
begin
  FTefTipo := Value;
end;

function TConfiguracao.GetTefTipo :String;
begin
  Result := FTefTipo;
end;

function TConfiguracao.SetSitefIp(const Value :String): TConfiguracao;
begin
  FSitefIp := Value;
end;

function TConfiguracao.GetSitefIp :String;
begin
  Result := FSitefIp;
end;

function TConfiguracao.SetSitefLoja(const Value :String): TConfiguracao;
begin
  FSitefLoja := Value;
end;

function TConfiguracao.GetSitefLoja :String;
begin
  Result := FSitefLoja;
end;

function TConfiguracao.SetSitefTerminal(const Value :String): TConfiguracao;
begin
  FSitefTerminal := Value;
end;

function TConfiguracao.GetSitefTerminal :String;
begin
  Result := FSitefTerminal;
end;

function TConfiguracao.SetSitefPortapinpad(const Value :Integer): TConfiguracao;
begin
  FSitefPortapinpad := Value;
end;

function TConfiguracao.GetSitefPortapinpad :Integer;
begin
  Result := FSitefPortapinpad;
end;

function TConfiguracao.SetSitefParametros(const Value :String): TConfiguracao;
begin
  FSitefParametros := Value;
end;

function TConfiguracao.GetSitefParametros :String;
begin
  Result := FSitefParametros;
end;

function TConfiguracao.SetSitefMsgpinpad(const Value :String): TConfiguracao;
begin
  FSitefMsgpinpad := Value;
end;

function TConfiguracao.GetSitefMsgpinpad :String;
begin
  Result := FSitefMsgpinpad;
end;

function TConfiguracao.SetMfeChaveAcesso(const Value :String): TConfiguracao;
begin
  FMfeChaveAcesso := Value;
end;

function TConfiguracao.GetMfeChaveAcesso :String;
begin
  Result := FMfeChaveAcesso;
end;

function TConfiguracao.SetImpMargemSup(const Value :Integer): TConfiguracao;
begin
  FImpMargemSup := Value;
end;

function TConfiguracao.GetImpMargemSup :Integer;
begin
  Result := FImpMargemSup;
end;

function TConfiguracao.SetImpMargemInf(const Value :Integer): TConfiguracao;
begin
  FImpMargemInf := Value;
end;

function TConfiguracao.GetImpMargemInf :Integer;
begin
  Result := FImpMargemInf;
end;

function TConfiguracao.SetImpMargemDir(const Value :Integer): TConfiguracao;
begin
  FImpMargemDir := Value;
end;

function TConfiguracao.GetImpMargemDir :Integer;
begin
  Result := FImpMargemDir;
end;

function TConfiguracao.SetImpMargemEsq(const Value :Integer): TConfiguracao;
begin
  FImpMargemEsq := Value;
end;

function TConfiguracao.GetImpMargemEsq :Integer;
begin
  Result := FImpMargemEsq;
end;

end.

