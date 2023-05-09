CREATE TABLE CAIXA (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	NOME VARCHAR(100)
);


CREATE TABLE CAIXA_MOVIMENTO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID_OPERADOR INTEGER NOT NULL,
	ID_CAIXA INTEGER NOT NULL,
	ID_TURNO INTEGER,
	DATA_ABERTURA DATE NOT NULL,
	DATA_FECHAMENTO DATE,
	SITUACAO VARCHAR(1)
);


CREATE TABLE CARTAO_BANDEIRA (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	DESCRICAO VARCHAR(10)
);


CREATE TABLE CEST (
	ID VARCHAR(7) NOT NULL,
	NCM VARCHAR(10) NOT NULL,
	DESCRICAO VARCHAR(600),
	CONSTRAINT PK_CEST PRIMARY KEY (ID,NCM)
);


CREATE TABLE CFOP (
	ID SMALLINT NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(500)
);


CREATE TABLE CODIGO_ANP (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	FAMILIA VARCHAR(100),
	GRUPO VARCHAR(100),
	SUB_GRUPO VARCHAR(100),
	SUB_SUB_GRUPO VARCHAR(100),
	PRODUTO VARCHAR(300)
);


CREATE TABLE CONFIGURACAO (
	NUMERO_CAIXA SMALLINT NOT NULL PRIMARY KEY,
	LOGOMARCA VARCHAR(300),
	WEBSITE VARCHAR(300),
	EMAIL VARCHAR(200),
	PORTA SMALLINT DEFAULT 6162,
	TIPO_APLICATIVO VARCHAR(10) DEFAULT 'NFCE',
	IMPRESSORA VARCHAR(100),
	IMPRESSORA_FORMATO SMALLINT,
	CERTIFICADO_NUMERO VARCHAR(40),
	CERTIFICADO_SENHA VARCHAR(60),
	WS_TIPO_AMBIENTE CHAR(1),
	WS_UF_DESTINO VARCHAR(2),
	WS_PROXY_HOST VARCHAR(200),
	WS_PROXY_PORTA SMALLINT,
	WS_PROXY_USUARIO VARCHAR(100),
	WS_PROXY_SENHA VARCHAR(100),
	WS_TIMEOUT INTEGER,
	WS_TENTATIVAS INTEGER,
	WS_INTERVALO_TENTATIVAS INTEGER,
	WS_TEMPO_CONS_RET INTEGER,
	WS_AJUSTA_CONS_RET CHAR(1),
	SMTP_SERVIDOR VARCHAR(300),
	SMTP_PORTA SMALLINT,
	SMTP_USUARIO VARCHAR(100),
	SMTP_SENHA VARCHAR(100),
	SMTP_SSL CHAR(1),
	SMTP_TLS CHAR(1),
	SMPT_ASSUNTO VARCHAR(200),
	SMTP_MENSAGEM BLOB SUB_TYPE BINARY,
	NFCE_ULTIMO_NUMERO INTEGER,
	NFCE_TOKEN_ID VARCHAR(50),
	NFCE_TOKEN_NUMERO VARCHAR(50),
	IMP_MODELO VARCHAR(30) DEFAULT '',
	IMP_PORTA VARCHAR(250) DEFAULT 'COM1',
	IMP_VELOCIDADE INTEGER DEFAULT 115200,
	IMP_UMA_LINHA CHAR(1) DEFAULT 'S',
	IMP_IGNORA_FORMATACAO CHAR(1) DEFAULT 'S',
	IMP_PAGINA_CODIGO VARCHAR(30) DEFAULT 'pc1252',
	SAT_MODELO VARCHAR(20),
	SAT_GRAVAR_LOG VARCHAR(255) DEFAULT 'S',
	SAT_VERSAO_XML VARCHAR(10) DEFAULT '00.06',
	SAT_COD_ATIVACAO VARCHAR(50),
	SAT_SH_CNPJ VARCHAR(14),
	SAT_SH_ASSINATURA VARCHAR(344),
	TEF_TIPO VARCHAR(30),
	SITEF_IP VARCHAR(50),
	SITEF_LOJA CHAR(8),
	SITEF_TERMINAL CHAR(8),
	SITEF_PORTAPINPAD INTEGER,
	SITEF_PARAMETROS VARCHAR(300),
	SITEF_MSGPINPAD VARCHAR(33),
	MFE_CHAVE_ACESSO VARCHAR(50),
	IMP_MARGEM_SUP INTEGER,
	IMP_MARGEM_INF INTEGER,
	IMP_MARGEM_DIR INTEGER,
	IMP_MARGEM_ESQ INTEGER
);

CREATE TABLE CRT (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	DESCRICAO VARCHAR(100)
);


CREATE TABLE CST (
	ID VARCHAR(3) NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(250),
	SIMPLES_NACIONAL CHAR(1)
);


CREATE TABLE CSTCOFINS (
	ID CHAR(2) NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(250)
);

CREATE TABLE CSTIPI (
	ID CHAR(2) NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(250)
);


CREATE TABLE CSTPIS (
	ID CHAR(2) NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(250)
);


CREATE TABLE FORMA_PAGAMENTO (
	ID INTEGER NOT NULL PRIMARY KEY,
	ATIVO CHAR(1),
	TIPO INTEGER,
	TEF CHAR(1),
	DESCRICAO VARCHAR(50),
	ID_NFE INTEGER,
	ID_SAT INTEGER,
	POS CHAR(1)
);

CREATE TABLE IBPT (
	ID VARCHAR(15) NOT NULL,
	EXTIPI VARCHAR(3) NOT NULL,
	TIPO INTEGER NOT NULL,
	ALIQ_NACIONAL NUMERIC(5,2),
	ALIQ_IMPORTADO NUMERIC(5,2),
	ALIQ_ESTADUAL NUMERIC(5,2),
	ALIQ_MUNICIPAL NUMERIC(5,2),
	CEST VARCHAR(7),
	CONSTRAINT PK_IBPT PRIMARY KEY (ID,EXTIPI,TIPO)
);


CREATE TABLE NFE_INUTILIZACAO (
	DTHR_CADASTRO TIMESTAMP NOT NULL PRIMARY KEY,
	ANO INTEGER,
	NUM_INICIAL INTEGER,
	NUM_FINAL INTEGER,
	SERIE INTEGER,
	PROTOCOLO VARCHAR(50),
	DTHRRECBTO TIMESTAMP,
	JUSTIFICATIVA BLOB SUB_TYPE TEXT,
	XML BLOB SUB_TYPE TEXT
);

CREATE TABLE OPERADOR (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	NOME VARCHAR(100)
);


CREATE TABLE ORIGEM (
	ID INTEGER NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(250)
);

CREATE TABLE SUPRIMENTO_SANGRIA (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID_CAIXA_MOVIMENTO INTEGER NOT NULL,
	TIPO_EMISSAO VARCHAR(1),
	VL_EMISSAO NUMERIC(15,2),
	ANOTACAO BLOB
);


CREATE TABLE TURNO (
	ID_TURNO INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	NOME VARCHAR(100)
);


CREATE TABLE UF (
	ID CHAR(2) NOT NULL PRIMARY KEY,
	DESCRICAO VARCHAR(50),
	COD_IBGE INTEGER
);

CREATE TABLE UNIDADE (
	ID VARCHAR(6) NOT NULL PRIMARY KEY,
	UNIDADE VARCHAR(15)
);

CREATE TABLE CIDADE (
	COD_IBGE INTEGER,
	DESCRICAO VARCHAR(100),
	ID_UF CHAR(2) NOT NULL,
	CONSTRAINT CIDADE_PK PRIMARY KEY (COD_IBGE),
	CONSTRAINT CIDADE_FK FOREIGN KEY (ID_UF) REFERENCES UF(ID)
);


CREATE TABLE EMPRESA (
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	CRT INTEGER,
	RAZAO_SOCIAL VARCHAR(60),
	NOME_FANTASIA VARCHAR(60),
	CNPJ VARCHAR(14),
	IE VARCHAR(14),
	IM VARCHAR(15),
	CNAE VARCHAR(7),
	FONE VARCHAR(14),
	ENDERECO VARCHAR(60),
	NUMERO VARCHAR(60),
	COMPLEMENTO VARCHAR(60),
	BAIRRO VARCHAR(60),
	CIDADE INTEGER,
	CEP INTEGER,
	CONSTRAINT EMPRESA_FK FOREIGN KEY (CIDADE) REFERENCES CIDADE(COD_IBGE),
	CONSTRAINT EMPRESA_FK_1 FOREIGN KEY (CRT) REFERENCES CRT(ID)
);


CREATE TABLE PESSOA (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	NOME VARCHAR(60),
	ATIVO CHAR(1),
	TIPO_PESSOA CHAR(1),
	CNPJ_CPF VARCHAR(14),
	FONE VARCHAR(14),
	ENDERECO VARCHAR(60),
	NUMERO VARCHAR(60),
	COMPLEMENTO VARCHAR(60),
	BAIRRO VARCHAR(60),
	CIDADE INTEGER,
	CEP VARCHAR(8),
	EMAIL VARCHAR(60),
	CONSTRAINT FK_CIDADE_PESSOA FOREIGN KEY (CIDADE) REFERENCES CIDADE(COD_IBGE)
);

CREATE TABLE POS (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID_EMPRESA INTEGER NOT NULL,
	DESCRICAO VARCHAR(50),
	NUMERO_SERIE VARCHAR(50),
	CONSTRAINT FK_EMPRESA_POS FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(ID)
);


CREATE TABLE PRODUTO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ATIVO CHAR(1),
	PERMITE_FRACIONAR CHAR(1),
	GTIN VARCHAR(14),
	DESCRICAO VARCHAR(120),
	UND VARCHAR(6),
	VL_UNITARIO NUMERIC(18,10),
	NCM VARCHAR(8),
	EXTIPI VARCHAR(3),
	CFOP INTEGER,
	ORIGEM INTEGER,
	CST VARCHAR(3),
	SN_ALIQCREDITO NUMERIC(5,2),
	ICMS_ALIQUOTA NUMERIC(5,2),
	ID_CSTPIS CHAR(2),
	PIS_ALIQUOTA NUMERIC(5,2),
	ID_CSTCOFINS CHAR(2),
	COFINS_ALIQUOTA NUMERIC(5,2),
	CEST VARCHAR(7),
	QTDE_ESTOQUE DECIMAL(12,3) DEFAULT 0 NOT NULL,
	GERA_ARQUIVO_BALANCA CHAR(1),
	COMBUSTIVEL CHAR(1),
	ID_CODIGO_ANP INTEGER,
	CONSTRAINT FK_COFINS_PRODUTO FOREIGN KEY (ID_CSTCOFINS) REFERENCES CSTCOFINS(ID),
	CONSTRAINT FK_CST_PRODUTO FOREIGN KEY (CST) REFERENCES CST(ID),
	CONSTRAINT FK_ORIGEM_PRODUTO FOREIGN KEY (ORIGEM) REFERENCES ORIGEM(ID),
	CONSTRAINT FK_PIS_PRODUTO FOREIGN KEY (ID_CSTPIS) REFERENCES CSTPIS(ID),
	CONSTRAINT FK_UND_PRODUTO FOREIGN KEY (UND) REFERENCES UNIDADE(ID)
);

CREATE TABLE ADQUIRENTE (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID_POS INTEGER NOT NULL,
	DESCRICAO VARCHAR(50),
	CNPJ VARCHAR(14),
	MERCHANTID VARCHAR(50),
	CHAVE_REQUISICAO VARCHAR(50),
	CONSTRAINT FK_POS_ADQUIRENTE FOREIGN KEY (ID_POS) REFERENCES POS(ID)
);

CREATE TABLE MFE_PAGAMENTO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID_RESPOSTA_FISCAL INTEGER,
	ID_ADQUIRENTE INTEGER,
	MENSAGEM VARCHAR(500),
	STATUSPAGAMENTO VARCHAR(100),
	MFE_ID INTEGER,
	MFE_CODIGO VARCHAR(20),
	MFE_VALOR VARCHAR(255),
	CFE_SERIE INTEGER,
	CFE_NUMERO INTEGER,
	CODIGOAUTORIZACAO VARCHAR(20),
	NSU VARCHAR(20),
	BIN VARCHAR(8),
	DONOCARTAO VARCHAR(120),
	DATAEXPIRACAO VARCHAR(5),
	INSTITUICAOFINANCEIRA VARCHAR(100),
	PARCELAS INTEGER,
	ULTIMOSQUATRODIGITOS INTEGER,
	CODIGOPAGAMENTO VARCHAR(20),
	VALORPAGAMENTO NUMERIC(10,2),
	IDFILA INTEGER,
	TIPO VARCHAR(10),
	CONSTRAINT FK_ADQUIRENTE_MFEPAGAMENTO FOREIGN KEY (ID_ADQUIRENTE) REFERENCES ADQUIRENTE(ID)
);

CREATE TABLE NFE (
	SERIE INTEGER NOT NULL,
	NUMERO INTEGER NOT NULL,
	ID_EMPRESA INTEGER,
	SITUACAO CHAR(1),
	CHAVE_ACESSO CHAR(44),
	DT_EMISSAO DATE,
	DTHR_SAIDA TIMESTAMP,
	TIPO_NFE INTEGER,
	TIPO_EMISSAO INTEGER,
	ID_PESSOA INTEGER,
	DEST_NOME VARCHAR(60),
	DEST_CNPJ_CPF VARCHAR(14),
	DEST_FONE VARCHAR(14),
	DEST_ENDERECO VARCHAR(60),
	DEST_NUMERO VARCHAR(60),
	DEST_COMPLEMENTO VARCHAR(60),
	DEST_BAIRRO VARCHAR(60),
	DEST_CIDADE INTEGER,
	DEST_CIDADE_DESCRICAO VARCHAR(60),
	DEST_UF CHAR(2),
	DEST_CEP VARCHAR(8),
	VL_BASE_ICMS NUMERIC(15,2),
	VL_ICMS NUMERIC(15,2),
	VL_DESCONTO NUMERIC(15,2),
	VL_PRODUTOS NUMERIC(15,2),
	VL_OUTRAS NUMERIC(15,2),
	VL_TOTAL_NF NUMERIC(15,2),
	VL_PIS NUMERIC(15,2),
	VL_COFINS NUMERIC(15,2),
	VL_TROCO NUMERIC(15,2),
	CSTAT INTEGER,
	XMOTIVO VARCHAR(255),
	DHRECBTO TIMESTAMP,
	NPROT VARCHAR(50),
	PROTOCOLO INTEGER,
	OBSERVACAO BLOB SUB_TYPE TEXT,
	XML BLOB SUB_TYPE TEXT,
	XML_CANCELAMENTO BLOB SUB_TYPE TEXT,
	SAT_NUMERO_CFE INTEGER,
	SAT_NUMERO_SERIE INTEGER,
	ID_CAIXA_MOVIMENTO INTEGER,
	CNF INTEGER,
	CARRO_KM INTEGER,
	CARRO_PLACA VARCHAR(50),
	CONSTRAINT PK_NFE PRIMARY KEY (SERIE,NUMERO),
	CONSTRAINT FK_CIDADE_NFE FOREIGN KEY (DEST_CIDADE) REFERENCES CIDADE(COD_IBGE),
	CONSTRAINT FK_EMPRESA_NFE FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(ID),
	CONSTRAINT FK_PESSOA_NFE FOREIGN KEY (ID_PESSOA) REFERENCES PESSOA(ID)
);

CREATE TABLE NFE_EVENTO (
	DTHR_EVENTO TIMESTAMP NOT NULL,
	SERIE INTEGER NOT NULL,
	NUMERO INTEGER NOT NULL,
	TIPO VARCHAR(10),
	DESCRICAO VARCHAR(50),
	SEQUENCIA INTEGER,
	PROTOCOLO VARCHAR(50),
	DTHRRECBTO TIMESTAMP,
	CSTAT INTEGER,
	XMOTIVO VARCHAR(255),
	OBSERVACAO BLOB SUB_TYPE TEXT,
	XML BLOB SUB_TYPE TEXT,
	CONSTRAINT PK_NFE_EVENTO PRIMARY KEY (DTHR_EVENTO),
	CONSTRAINT FK_NFE_EVENTO FOREIGN KEY (SERIE,NUMERO) REFERENCES NFE(SERIE,NUMERO)
);

CREATE TABLE NFE_ITEM (
	SERIE INTEGER NOT NULL,
	NUMERO INTEGER NOT NULL,
	ITEM INTEGER NOT NULL,
	ID_PRODUTO INTEGER NOT NULL,
	GTIN VARCHAR(14),
	DESCRICAO VARCHAR(120),
	CFOP INTEGER,
	UND VARCHAR(6),
	QUANTIDADE NUMERIC(15,4),
	VL_UNITARIO NUMERIC(18,10),
	VL_DESCONTO NUMERIC(15,2),
	VL_DESCONTO_RATEIO NUMERIC(15,2),
	VL_OUTROS NUMERIC(15,2),
	VL_OUTROS_RATEIO NUMERIC(15,2),
	VL_PRODUTO NUMERIC(15,2),
	VL_TOTAL NUMERIC(15,2),
	ORIGEM INTEGER,
	CST VARCHAR(3),
	NCM VARCHAR(8),
	EXTIPI VARCHAR(3),
	SN_VBASE NUMERIC(15,2),
	SN_ALIQCREDITO NUMERIC(5,2),
	SN_VCREDITO NUMERIC(15,2),
	ICMS_VBASE NUMERIC(15,2),
	ICMS_ALIQUOTA NUMERIC(5,2),
	ICMS_VIMPOSTO NUMERIC(15,2),
	PIS_CST CHAR(2),
	PIS_VBASE NUMERIC(15,2),
	PIS_ALIQUOTA NUMERIC(5,2),
	PIS_VIMPOSTO NUMERIC(15,2),
	COFINS_CST CHAR(2),
	COFINS_VBASE NUMERIC(15,2),
	COFINS_ALIQUOTA NUMERIC(5,2),
	COFINS_VIMPOSTO NUMERIC(15,2),
	IN_ALIQ_FEDERAL NUMERIC(5,2),
	IN_VL_FEDERAL NUMERIC(15,2),
	IN_ALIQ_ESTADUAL NUMERIC(5,2),
	IN_VL_ESTADUAL NUMERIC(15,2),
	IN_ALIQ_MUNICIPAL NUMERIC(5,2),
	IN_VL_MUNICIPAL NUMERIC(15,2),
	INF_ADICIONAL VARCHAR(500),
	CEST VARCHAR(7),
	ID_CODIGO_ANP INTEGER,
	CONSTRAINT PK_NFEITEM PRIMARY KEY (SERIE,NUMERO,ITEM),
	CONSTRAINT FK_CFOP_NFEITEM FOREIGN KEY (CFOP) REFERENCES CFOP(CFOP),
	CONSTRAINT FK_CSTCOFINS_NFEITEM FOREIGN KEY (COFINS_CST) REFERENCES CSTCOFINS(ID_CSTCOFINS),
	CONSTRAINT FK_CSTPIS_NFEITEM FOREIGN KEY (PIS_CST) REFERENCES CSTPIS(ID_CSTPIS),
	CONSTRAINT FK_CST_NFEITEM FOREIGN KEY (CST) REFERENCES CST(ID_CST),
	CONSTRAINT FK_NFE_NFEITEM FOREIGN KEY (SERIE,NUMERO) REFERENCES NFE(SERIE,NUMERO) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_ORIGEM_NFEITEM FOREIGN KEY (ORIGEM) REFERENCES ORIGEM(ID_ORIGEM),
	CONSTRAINT FK_PRODUTO_NFEITEM FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);

CREATE TABLE NFE_PAGAMENTO (
	SERIE INTEGER NOT NULL,
	NUMERO INTEGER NOT NULL,
	FORMA_PAGAMENTO INTEGER NOT NULL,
	VALOR NUMERIC(15,2) NOT NULL,
	CONSTRAINT PK_NFE_PAGAMENTO PRIMARY KEY (SERIE,NUMERO,FORMA_PAGAMENTO),
	CONSTRAINT FK_NFEPAGTO_PAGTO FOREIGN KEY (SERIE,NUMERO) REFERENCES NFE(SERIE,NUMERO) ON DELETE CASCADE ON UPDATE CASCADE
);