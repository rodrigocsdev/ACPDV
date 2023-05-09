unit acpdv.Model.dao.Configuracao;

interface

uses
  System.SysUtils,
  system.Generics.Collections,
  Data.DB,
  acpdv.Model.dao.interfaces,
  acpdv.Model.conexao,
  acpdv.Model.Entidade.Configuracao;

type
  TDAOConfiguracao = class(TInterfacedObject, iDAO<TConfiguracao>)
  private
    FConfiguracao: TConfiguracao;
    FConfiguracaos: TObjectList<TConfiguracao>;
    FConexao: TConexao;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<TConfiguracao>;
    function Listar: iDAO<TConfiguracao>;
    function ListarPorId(Id: Variant): iDAO<TConfiguracao>;
    function Excluir(aId: Variant): iDAO<TConfiguracao>; overload;
    function Excluir: iDAO<TConfiguracao>; overload;
    function Atualizar: iDAO<TConfiguracao>;
    function Inserir: iDAO<TConfiguracao>;
    function DataSource(var DataSource: TDataSource): iDAO<TConfiguracao>;
    function DataSet: TDataSet;
    function This: TConfiguracao;
    function These: TObjectList<TConfiguracao>;
  end;

implementation

constructor TDAOConfiguracao.Create;
begin
  FConfiguracao := TConfiguracao.New;
  FConfiguracaos := TObjectList<TConfiguracao>.Create;
  FConexao := TConexao.New;
end;

destructor TDAOConfiguracao.Destroy;
begin
  FConfiguracao.Free;
  FConfiguracaos.Free;
  FConexao.Free;
  inherited;
end;

class function TDAOConfiguracao.New: iDAO<TConfiguracao>;
begin
  Result := Self.Create;
end;

function TDAOConfiguracao.Listar: iDAO<TConfiguracao>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Configuracao').Open.DataSet;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FConfiguracaos.Add(TConfiguracao.New.SetNumeroCaixa
      (FDataSet.FieldByName('NUMERO_CAIXA').AsInteger)
      .SetLogomarca(FDataSet.FieldByName('LOGOMARCA').AsString)
      .SetWebsite(FDataSet.FieldByName('website').AsString)
      .SetEmail(FDataSet.FieldByName('email').AsString)
      .SetPorta(FDataSet.FieldByName('porta').AsInteger)
      .SetTipoAplicativo(FDataSet.FieldByName('tipo_aplicativo').AsString)
      .SetImpressora(FDataSet.FieldByName('impressora').AsString)
      .SetImpressoraFormato(FDataSet.FieldByName('impressora_formato').AsInteger)
      .SetCertificadoNumero(FDataSet.FieldByName('certificado_numero').AsString)
      .SetCertificadoSenha(FDataSet.FieldByName('certificado_senha').AsString)
      .SetWsTipoAmbiente(FDataSet.FieldByName('ws_tipo_ambiente').AsString)
      .SetWsUfDestino(FDataSet.FieldByName('ws_uf_destino').AsString)
      .SetWsProxyHost(FDataSet.FieldByName('ws_proxy_host').AsString)
      .SetWsProxyPorta(FDataSet.FieldByName('Ws_Proxy_Porta').AsInteger)
      .SetWsProxyUsuario(FDataSet.FieldByName('Ws_Proxy_Usuario').AsString)
      .SetWsProxySenha(FDataSet.FieldByName('Ws_Proxy_Senha').AsString)
      .SetWsTimeout(FDataSet.FieldByName('Ws_Timeout').AsInteger)
      .SetWsTentativas(FDataSet.FieldByName('Ws_Tentativas').AsInteger)
      .SetWsIntervaloTentativas(FDataSet.FieldByName('Ws_Intervalo_Tentativas').AsInteger)
      .SetWsTempoConsRet(FDataSet.FieldByName('Ws_Tempo_Cons_Ret').AsInteger)
      .SetWsAjustaConsRet(FDataSet.FieldByName('Ws_Ajusta_Cons_Ret').AsString)
      .SetSmtpServidor(FDataSet.FieldByName('Smtp_Servidor').AsString)
      .SetSmtpPorta(FDataSet.FieldByName('Smtp_Porta').AsInteger)
      .SetSmtpUsuario(FDataSet.FieldByName('Smtp_Usuario').AsString)
      .SetSmtpSenha(FDataSet.FieldByName('Smtp_Senha').AsString)
      .SetSmtpSsl(FDataSet.FieldByName('Smtp_Ssl').AsString)
      .SetSmtpTls(FDataSet.FieldByName('Smtp_Tls').AsString)
      .SetSmptAssunto(FDataSet.FieldByName('Smpt_Assunto').AsString)
      .SetSmtpMensagem(FDataSet.FieldByName('Smtp_Mensagem').AsString)
      .SetNfceUltimoNumero(FDataSet.FieldByName('Nfce_Ultimo_Numero').AsInteger)
      .SetNfceTokenId(FDataSet.FieldByName('Nfce_Token_Id').AsString)
      .SetNfceTokenNumero(FDataSet.FieldByName('Nfce_Token_Numero').AsString)
      .SetImpModelo(FDataSet.FieldByName('Imp_Modelo').AsString)
      .SetImpPorta(FDataSet.FieldByName('Imp_Porta').AsString)
      .SetImpVelocidade(FDataSet.FieldByName('Imp_Velocidade').AsInteger)
      .SetImpUmaLinha(FDataSet.FieldByName('Imp_Uma_Linha').AsString)
      .SetImpIgnoraFormatacao(FDataSet.FieldByName('Imp_Ignora_Formatacao').AsString)
      .SetImpPaginaCodigo(FDataSet.FieldByName('Imp_Pagina_Codigo').AsString)
      .SetSatModelo(FDataSet.FieldByName('Sat_Modelo').AsString)
      .SetSatGravarLog(FDataSet.FieldByName('Sat_Gravar_Log').AsString)
      .SetSatVersaoXml(FDataSet.FieldByName('Sat_Versao_Xml').AsString)
      .SetSatCodAtivacao(FDataSet.FieldByName('Sat_Cod_Ativacao').AsString)
      .SetSatShCnpj(FDataSet.FieldByName('Sat_Sh_Cnpj').AsString)
      .SetSatShAssinatura(FDataSet.FieldByName('Sat_Sh_Assinatura').AsString)
      .SetTefTipo(FDataSet.FieldByName('Tef_Tipo').AsString)
      .SetSitefIp(FDataSet.FieldByName('Sitef_Ip').AsString)
      .SetSitefLoja(FDataSet.FieldByName('Sitef_Loja').AsString)
      .SetSitefTerminal(FDataSet.FieldByName('Sitef_Terminal').AsString)
      .SetSitefPortapinpad(FDataSet.FieldByName('Sitef_Portapinpad').AsInteger)
      .SetSitefParametros(FDataSet.FieldByName('Sitef_Parametros').AsString)
      .SetSitefMsgpinpad(FDataSet.FieldByName('Sitef_Msgpinpad').AsString)
      .SetMfeChaveAcesso(FDataSet.FieldByName('Mfe_Chave_Acesso').AsString)
      .SetImpMargemSup(FDataSet.FieldByName('Imp_Margem_Sup').AsInteger)
      .SetImpMargemInf(FDataSet.FieldByName('Imp_Margem_Inf').AsInteger)
      .SetImpMargemDir(FDataSet.FieldByName('Imp_Margem_Dir').AsInteger)
      .SetImpMargemEsq(FDataSet.FieldByName('Imp_Margem_Esq').AsInteger));
    FDataSet.Next;
  end;
end;

function TDAOConfiguracao.ListarPorId(Id: Variant): iDAO<TConfiguracao>;
begin
  Result := Self;
  FDataSet := FConexao.SQL('select * from Configuracao where numer_caixa=?')
    .Params(0, Id).Open.DataSet;

  FConfiguracao.SetNumeroCaixa
      (FDataSet.FieldByName('NUMERO_CAIXA').AsInteger)
      .SetLogomarca(FDataSet.FieldByName('LOGOMARCA').AsString)
      .SetWebsite(FDataSet.FieldByName('website').AsString)
      .SetEmail(FDataSet.FieldByName('email').AsString)
      .SetPorta(FDataSet.FieldByName('porta').AsInteger)
      .SetTipoAplicativo(FDataSet.FieldByName('tipo_aplicativo').AsString)
      .SetImpressora(FDataSet.FieldByName('impressora').AsString)
      .SetImpressoraFormato(FDataSet.FieldByName('impressora_formato').AsInteger)
      .SetCertificadoNumero(FDataSet.FieldByName('certificado_numero').AsString)
      .SetCertificadoSenha(FDataSet.FieldByName('certificado_senha').AsString)
      .SetWsTipoAmbiente(FDataSet.FieldByName('ws_tipo_ambiente').AsString)
      .SetWsUfDestino(FDataSet.FieldByName('ws_uf_destino').AsString)
      .SetWsProxyHost(FDataSet.FieldByName('ws_proxy_host').AsString)
      .SetWsProxyPorta(FDataSet.FieldByName('Ws_Proxy_Porta').AsInteger)
      .SetWsProxyUsuario(FDataSet.FieldByName('Ws_Proxy_Usuario').AsString)
      .SetWsProxySenha(FDataSet.FieldByName('Ws_Proxy_Senha').AsString)
      .SetWsTimeout(FDataSet.FieldByName('Ws_Timeout').AsInteger)
      .SetWsTentativas(FDataSet.FieldByName('Ws_Tentativas').AsInteger)
      .SetWsIntervaloTentativas(FDataSet.FieldByName('Ws_Intervalo_Tentativas').AsInteger)
      .SetWsTempoConsRet(FDataSet.FieldByName('Ws_Tempo_Cons_Ret').AsInteger)
      .SetWsAjustaConsRet(FDataSet.FieldByName('Ws_Ajusta_Cons_Ret').AsString)
      .SetSmtpServidor(FDataSet.FieldByName('Smtp_Servidor').AsString)
      .SetSmtpPorta(FDataSet.FieldByName('Smtp_Porta').AsInteger)
      .SetSmtpUsuario(FDataSet.FieldByName('Smtp_Usuario').AsString)
      .SetSmtpSenha(FDataSet.FieldByName('Smtp_Senha').AsString)
      .SetSmtpSsl(FDataSet.FieldByName('Smtp_Ssl').AsString)
      .SetSmtpTls(FDataSet.FieldByName('Smtp_Tls').AsString)
      .SetSmptAssunto(FDataSet.FieldByName('Smpt_Assunto').AsString)
      .SetSmtpMensagem(FDataSet.FieldByName('Smtp_Mensagem').AsString)
      .SetNfceUltimoNumero(FDataSet.FieldByName('Nfce_Ultimo_Numero').AsInteger)
      .SetNfceTokenId(FDataSet.FieldByName('Nfce_Token_Id').AsString)
      .SetNfceTokenNumero(FDataSet.FieldByName('Nfce_Token_Numero').AsString)
      .SetImpModelo(FDataSet.FieldByName('Imp_Modelo').AsString)
      .SetImpPorta(FDataSet.FieldByName('Imp_Porta').AsString)
      .SetImpVelocidade(FDataSet.FieldByName('Imp_Velocidade').AsInteger)
      .SetImpUmaLinha(FDataSet.FieldByName('Imp_Uma_Linha').AsString)
      .SetImpIgnoraFormatacao(FDataSet.FieldByName('Imp_Ignora_Formatacao').AsString)
      .SetImpPaginaCodigo(FDataSet.FieldByName('Imp_Pagina_Codigo').AsString)
      .SetSatModelo(FDataSet.FieldByName('Sat_Modelo').AsString)
      .SetSatGravarLog(FDataSet.FieldByName('Sat_Gravar_Log').AsString)
      .SetSatVersaoXml(FDataSet.FieldByName('Sat_Versao_Xml').AsString)
      .SetSatCodAtivacao(FDataSet.FieldByName('Sat_Cod_Ativacao').AsString)
      .SetSatShCnpj(FDataSet.FieldByName('Sat_Sh_Cnpj').AsString)
      .SetSatShAssinatura(FDataSet.FieldByName('Sat_Sh_Assinatura').AsString)
      .SetTefTipo(FDataSet.FieldByName('Tef_Tipo').AsString)
      .SetSitefIp(FDataSet.FieldByName('Sitef_Ip').AsString)
      .SetSitefLoja(FDataSet.FieldByName('Sitef_Loja').AsString)
      .SetSitefTerminal(FDataSet.FieldByName('Sitef_Terminal').AsString)
      .SetSitefPortapinpad(FDataSet.FieldByName('Sitef_Portapinpad').AsInteger)
      .SetSitefParametros(FDataSet.FieldByName('Sitef_Parametros').AsString)
      .SetSitefMsgpinpad(FDataSet.FieldByName('Sitef_Msgpinpad').AsString)
      .SetMfeChaveAcesso(FDataSet.FieldByName('Mfe_Chave_Acesso').AsString)
      .SetImpMargemSup(FDataSet.FieldByName('Imp_Margem_Sup').AsInteger)
      .SetImpMargemInf(FDataSet.FieldByName('Imp_Margem_Inf').AsInteger)
      .SetImpMargemDir(FDataSet.FieldByName('Imp_Margem_Dir').AsInteger)
      .SetImpMargemEsq(FDataSet.FieldByName('Imp_Margem_Esq').AsInteger);
end;

function TDAOConfiguracao.Excluir(aId: Variant): iDAO<TConfiguracao>;
begin
  Result := Self;
  FConexao.SQL('Delete from Configuracao where numero_caixa=?')
    .Params(0, aId).ExecSQL;
end;

function TDAOConfiguracao.Excluir: iDAO<TConfiguracao>;
begin
  Result := Self;
  FConexao.SQL('Delete from Configuracao where numero_caixa=?')
    .Params(0, FConfiguracao.GetNumeroCaixa).ExecSQL;
end;

function TDAOConfiguracao.Atualizar: iDAO<TConfiguracao>;
var
  lSQL: String;
begin
  Result := Self;
  lSQL := '';
  lSQL := lSQL + 'UPDATE CONFIGURACAO SET LOGOMARCA=?, WEBSITE=?, EMAIL=?, PORTA=?, ';
  lSQL := lSQL + 'TIPO_APLICATIVO=?, IMPRESSORA=?, IMPRESSORA_FORMATO=?';
  lSQL := lSQL + ', CERTIFICADO_NUMERO=?, CERTIFICADO_SENHA=?, WS_TIPO_AMBIENTE=?, WS_UF_DESTINO=?';
  lSQL := lSQL + ', WS_PROXY_HOST=?, WS_PROXY_PORTA=?, WS_PROXY_USUARIO=?, WS_PROXY_SENHA=?';
  lSQL := lSQL + ', WS_TIMEOUT=?, WS_TENTATIVAS=?, WS_INTERVALO_TENTATIVAS=?, WS_TEMPO_CONS_RET=?';
  lSQL := lSQL + ', WS_AJUSTA_CONS_RET=?, SMTP_SERVIDOR=?, SMTP_PORTA=?, SMTP_USUARIO=?, SMTP_SENHA=?';
  lSQL := lSQL + ', SMTP_SSL=?, SMTP_TLS=?, SMPT_ASSUNTO=?, SMTP_MENSAGEM=?, NFCE_ULTIMO_NUMERO=?,';
  lSQL := lSQL + ' NFCE_TOKEN_ID=?, NFCE_TOKEN_NUMERO=?, IMP_MODELO=?, IMP_PORTA=?, IMP_VELOCIDADE=?,';
  lSQL := lSQL + ' IMP_UMA_LINHA=?, IMP_IGNORA_FORMATACAO=?, IMP_PAGINA_CODIGO=?, SAT_MODELO=?,';
  lSQL := lSQL + ' SAT_GRAVAR_LOG=?, SAT_VERSAO_XML=?, SAT_COD_ATIVACAO=?, SAT_SH_CNPJ=?, SAT_SH_ASSINATURA=?,';
  lSQL := lSQL + ' TEF_TIPO=?, SITEF_IP=?, SITEF_LOJA=?, SITEF_TERMINAL=?, SITEF_PORTAPINPAD=?, SITEF_PARAMETROS=?,';
  lSQL := lSQL + ' SITEF_MSGPINPAD=?, MFE_CHAVE_ACESSO=?, IMP_MARGEM_SUP=?, IMP_MARGEM_INF=?, IMP_MARGEM_DIR=?,';
  lSQL := lSQL + ' IMP_MARGEM_ESQ=? WHERE NUMERO_CAIXA=?';

  FConexao.SQL(lSQL)
   .Params(0,FConfiguracao.GetLogomarca)
   .Params(1,FConfiguracao.GetWebsite)
   .Params(2,FConfiguracao.GetEmail)
   .Params(3,FConfiguracao.GetPorta)
   .Params(4,FConfiguracao.GetTipoAplicativo)
   .Params(5,FConfiguracao.GetImpressora)
   .Params(6,FConfiguracao.GetImpressoraFormato)
   .Params(7,FConfiguracao.GetCertificadoNumero)
   .Params(8,FConfiguracao.GetCertificadoSenha)
   .Params(9,FConfiguracao.GetWsTipoAmbiente)
   .Params(10,FConfiguracao.GetWsUfDestino)
   .Params(11,FConfiguracao.GetWsProxyHost)
   .Params(12,FConfiguracao.GetWsProxyPorta)
   .Params(13,FConfiguracao.GetWsProxyUsuario)
   .Params(14,FConfiguracao.GetWsProxySenha)
   .Params(15,FConfiguracao.GetWsTimeout)
   .Params(16,FConfiguracao.GetWsTentativas)
   .Params(17,FConfiguracao.GetWsIntervaloTentativas)
   .Params(18,FConfiguracao.GetWsTempoConsRet)
   .Params(19,FConfiguracao.GetWsAjustaConsRet)
   .Params(20,FConfiguracao.GetSmtpServidor)
   .Params(21,FConfiguracao.GetSmtpPorta)
   .Params(22,FConfiguracao.GetSmtpUsuario)
   .Params(23,FConfiguracao.GetSmtpSenha)
   .Params(24,FConfiguracao.GetSmtpSsl)
   .Params(25,FConfiguracao.GetSmtpTls)
   .Params(26,FConfiguracao.GetSmptAssunto)
   .Params(27,FConfiguracao.GetSmtpMensagem)
   .Params(28,FConfiguracao.GetNfceUltimoNumero)
   .Params(29,FConfiguracao.GetNfceTokenId)
   .Params(30,FConfiguracao.GetNfceTokenNumero)
   .Params(31,FConfiguracao.GetImpModelo)
   .Params(32,FConfiguracao.GetImpPorta)
   .Params(33,FConfiguracao.GetImpVelocidade)
   .Params(34,FConfiguracao.GetImpUmaLinha)
   .Params(35,FConfiguracao.GetImpIgnoraFormatacao)
   .Params(36,FConfiguracao.GetImpPaginaCodigo)
   .Params(37,FConfiguracao.GetSatModelo)
   .Params(38,FConfiguracao.GetSatGravarLog)
   .Params(39,FConfiguracao.GetSatVersaoXml)
   .Params(40,FConfiguracao.GetSatCodAtivacao)
   .Params(41,FConfiguracao.GetSatShCnpj)
   .Params(42,FConfiguracao.GetSatShAssinatura)
   .Params(43,FConfiguracao.GetTefTipo)
   .Params(44,FConfiguracao.GetSitefIp)
   .Params(45,FConfiguracao.GetSitefLoja)
   .Params(46,FConfiguracao.GetSitefTerminal)
   .Params(47,FConfiguracao.GetSitefPortapinpad)
   .Params(48,FConfiguracao.GetSitefParametros)
   .Params(49,FConfiguracao.GetSitefMsgpinpad)
   .Params(50,FConfiguracao.GetMfeChaveAcesso)
   .Params(51,FConfiguracao.GetImpMargemSup)
   .Params(52,FConfiguracao.GetImpMargemInf)
   .Params(53,FConfiguracao.GetImpMargemDir)
   .Params(54,FConfiguracao.GetImpMargemEsq)
   .Params(55,FConfiguracao.GetNumeroCaixa).ExecSQL;
end;

function TDAOConfiguracao.Inserir: iDAO<TConfiguracao>;
var
  lSQL : String;
begin
  Result := Self;
  lSQL := '';
  lSQL := lSQL + 'INSERT INTO CONFIGURACAO (NUMERO_CAIXA, LOGOMARCA, WEBSITE, EMAIL, ';
  lSQL := lSQL + 'PORTA, TIPO_APLICATIVO, IMPRESSORA, IMPRESSORA_FORMATO, CERTIFICADO_NUMERO, ';
  lSQL := lSQL + 'CERTIFICADO_SENHA, WS_TIPO_AMBIENTE, WS_UF_DESTINO, WS_PROXY_HOST, WS_PROXY_PORTA, ';
  lSQL := lSQL + 'WS_PROXY_USUARIO, WS_PROXY_SENHA, WS_TIMEOUT, WS_TENTATIVAS, WS_INTERVALO_TENTATIVAS, ';
  lSQL := lSQL + 'WS_TEMPO_CONS_RET, WS_AJUSTA_CONS_RET, SMTP_SERVIDOR, SMTP_PORTA, SMTP_USUARIO, ';
  lSQL := lSQL + 'SMTP_SENHA, SMTP_SSL, SMTP_TLS, SMPT_ASSUNTO, SMTP_MENSAGEM, NFCE_ULTIMO_NUMERO, ';
  lSQL := lSQL + 'NFCE_TOKEN_ID, NFCE_TOKEN_NUMERO, IMP_MODELO, IMP_PORTA, IMP_VELOCIDADE, IMP_UMA_LINHA, ';
  lSQL := lSQL + 'IMP_IGNORA_FORMATACAO, IMP_PAGINA_CODIGO, SAT_MODELO, SAT_GRAVAR_LOG, SAT_VERSAO_XML, ';
  lSQL := lSQL + 'SAT_COD_ATIVACAO, SAT_SH_CNPJ, SAT_SH_ASSINATURA, TEF_TIPO, SITEF_IP, SITEF_LOJA, SITEF_TERMINAL, ';
  lSQL := lSQL + 'SITEF_PORTAPINPAD, SITEF_PARAMETROS, SITEF_MSGPINPAD, MFE_CHAVE_ACESSO, IMP_MARGEM_SUP, IMP_MARGEM_INF, ';
  lSQL := lSQL + 'IMP_MARGEM_DIR, IMP_MARGEM_ESQ) ';
  lSQL := lSQL + 'VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,';
  lSQL := lSQL + '?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

  FConexao
    .SQL(lSQL)
     .Params(0,FConfiguracao.GetNumeroCaixa)
     .Params(1,FConfiguracao.GetLogomarca)
     .Params(2,FConfiguracao.GetWebsite)
     .Params(3,FConfiguracao.GetEmail)
     .Params(4,FConfiguracao.GetPorta)
     .Params(5,FConfiguracao.GetTipoAplicativo)
     .Params(6,FConfiguracao.GetImpressora)
     .Params(7,FConfiguracao.GetImpressoraFormato)
     .Params(8,FConfiguracao.GetCertificadoNumero)
     .Params(9,FConfiguracao.GetCertificadoSenha)
     .Params(10,FConfiguracao.GetWsTipoAmbiente)
     .Params(11,FConfiguracao.GetWsUfDestino)
     .Params(12,FConfiguracao.GetWsProxyHost)
     .Params(13,FConfiguracao.GetWsProxyPorta)
     .Params(14,FConfiguracao.GetWsProxyUsuario)
     .Params(15,FConfiguracao.GetWsProxySenha)
     .Params(16,FConfiguracao.GetWsTimeout)
     .Params(17,FConfiguracao.GetWsTentativas)
     .Params(18,FConfiguracao.GetWsIntervaloTentativas)
     .Params(19,FConfiguracao.GetWsTempoConsRet)
     .Params(20,FConfiguracao.GetWsAjustaConsRet)
     .Params(21,FConfiguracao.GetSmtpServidor)
     .Params(22,FConfiguracao.GetSmtpPorta)
     .Params(23,FConfiguracao.GetSmtpUsuario)
     .Params(24,FConfiguracao.GetSmtpSenha)
     .Params(25,FConfiguracao.GetSmtpSsl)
     .Params(26,FConfiguracao.GetSmtpTls)
     .Params(27,FConfiguracao.GetSmptAssunto)
     .Params(28,FConfiguracao.GetSmtpMensagem)
     .Params(29,FConfiguracao.GetNfceUltimoNumero)
     .Params(30,FConfiguracao.GetNfceTokenId)
     .Params(31,FConfiguracao.GetNfceTokenNumero)
     .Params(32,FConfiguracao.GetImpModelo)
     .Params(33,FConfiguracao.GetImpPorta)
     .Params(34,FConfiguracao.GetImpVelocidade)
     .Params(35,FConfiguracao.GetImpUmaLinha)
     .Params(36,FConfiguracao.GetImpIgnoraFormatacao)
     .Params(37,FConfiguracao.GetImpPaginaCodigo)
     .Params(38,FConfiguracao.GetSatModelo)
     .Params(39,FConfiguracao.GetSatGravarLog)
     .Params(40,FConfiguracao.GetSatVersaoXml)
     .Params(41,FConfiguracao.GetSatCodAtivacao)
     .Params(42,FConfiguracao.GetSatShCnpj)
     .Params(43,FConfiguracao.GetSatShAssinatura)
     .Params(44,FConfiguracao.GetTefTipo)
     .Params(45,FConfiguracao.GetSitefIp)
     .Params(46,FConfiguracao.GetSitefLoja)
     .Params(47,FConfiguracao.GetSitefTerminal)
     .Params(48,FConfiguracao.GetSitefPortapinpad)
     .Params(49,FConfiguracao.GetSitefParametros)
     .Params(50,FConfiguracao.GetSitefMsgpinpad)
     .Params(51,FConfiguracao.GetMfeChaveAcesso)
     .Params(52,FConfiguracao.GetImpMargemSup)
     .Params(53,FConfiguracao.GetImpMargemInf)
     .Params(54,FConfiguracao.GetImpMargemDir)
     .Params(55,FConfiguracao.GetImpMargemEsq)
  .ExecSQL;
end;

function TDAOConfiguracao.DataSet: TDataSet;
begin
result:=FDataSet;
end;

function TDAOConfiguracao.DataSource(var DataSource: TDataSource)
  : iDAO<TConfiguracao>;
begin
  Result := Self;
  DataSource.DataSet := FDataSet;
end;

function TDAOConfiguracao.This: TConfiguracao;
begin
  Result := FConfiguracao;
end;

function TDAOConfiguracao.These: TObjectList<TConfiguracao>;
begin
  Result := FConfiguracaos;
end;

end.
