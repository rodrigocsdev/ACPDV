unit concretecupomnaofiscal;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Generics.Collections,
  cupomnaofiscal.interfaces,
  cupomnaofiscal.dto,
  System.Classes,
  Printers;

type
  TPosicao = (ESQUERDA, DIREITA, CENTRO, GERAL);

  TCupomNaoFiscal = class(TInterfacedObject, iCupomNaoFiscal)
  private
    FPrinter: TStringList;

    function AjustarStringCenter(const Texto : String; const Caracter : Char): string;
    function AjustarStringDireita(const Texto : String; const Caracter : Char): string;
    function AjustarStringEsquerda(const Texto: String; const Caracter: Char): String;
    function AjustarStrings(const LTexto, RTexto: String; const Caracter: Char): String;
    procedure QuebrarLinha(const Texto: String);

    const
      COLUNAS = 50;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: iCupomNaoFiscal;
    function MontaCabecalho(Value: TDadosCabecalho): iCupomNaoFiscal;
    function MontaCoporNota(Value: TDadosCorpo): iCupomNaoFiscal;
    function MontaRodaPe(Value: TDadosRodape): iCupomNaoFiscal;
    function Gravar(Path: String): iCupomNaoFiscal;
    procedure Imprimir;
  end;

implementation

function TCupomNaoFiscal.AjustarStringCenter(const Texto : String; const Caracter : Char): string;
begin
  var lTamanho := Length(Texto);
  if not (lTamanho > COLUNAS) then
  begin
    var lCharacter := Trunc((COLUNAS - lTamanho)/2);
    Result := AjustarStringDireita(StringOfChar(Caracter, lCharacter) + Texto, Caracter);
    Exit;
  end;
  Result := LeftStr(Texto,COLUNAS);
end;

function TCupomNaoFiscal.AjustarStringDireita(const Texto: String;
  const Caracter: Char): string;
begin
  var lTamanho := Length(Texto);

  if not (lTamanho > COLUNAS) then
  begin
    Result := Texto + StringOfChar(Caracter, (COLUNAS - lTamanho));
    Exit;
  end;

  Result := LeftStr(Texto, COLUNAS);
end;

function TCupomNaoFiscal.AjustarStringEsquerda(const Texto: String;
  const Caracter: Char): String;
begin
  var lTamanho := Texto.Length;

  if not (lTamanho > COLUNAS) then
  begin
    Result := StringOfChar(Caracter, COLUNAS) + Texto;
    Exit;
  end;

  Result := LeftStr(Texto,COLUNAS);
end;

function TCupomNaoFiscal.AjustarStrings(const LTexto, RTexto: String;
  const Caracter: Char): String;
begin
  var lLTexto := LTexto.Length;
  var lRTexto := RTexto.Length;
  var lTamanho := COLUNAS-(LTexto.Length+RTexto.Length);
  Result := LeftStr(LTexto,lLTexto)+StringOfChar(Caracter,lTamanho)+RightStr(RTexto,lRTexto);
end;

constructor TCupomNaoFiscal.Create;
begin
  FPrinter := TStringList.Create;
end;

destructor TCupomNaoFiscal.Destroy;
begin
  FPrinter.DisposeOf;
  inherited;
end;

function TCupomNaoFiscal.Gravar(Path: String): iCupomNaoFiscal;
begin
  Result := Self;
  FPrinter.SaveToFile(Path);
end;

procedure TCupomNaoFiscal.Imprimir;
Var
  MemoFile: TextFile;
  P: Integer;
Begin
  AssignPrn(MemoFile);
  Rewrite(MemoFile);
  For P := 0 to FPrinter.Count - 1 do
    Writeln(MemoFile, FPrinter.Strings[P]);
  CloseFile(MemoFile);
end;

function TCupomNaoFiscal.MontaCabecalho(Value: TDadosCabecalho): iCupomNaoFiscal;
begin
  Result := Self;

  FPrinter.Add(AjustarStringCenter(Value.Empresa.Nome,' '));
  QuebrarLinha(Value.Empresa.Logradouro + ' - ' + Value.Empresa.Bairro);
  QuebrarLinha(Value.Empresa.Cidade + ' - ' + Value.Empresa.Estado + ' - ' + Value.Empresa.Cep);
  FPrinter.Add(AjustarStrings(Value.Empresa.CNPJ,Value.Empresa.IE,' '));
  FPrinter.Add(AjustarStrings(FormatDateTime('dd/mm/yyyy hh:mm:ss',Value.Venda.DataHora),Format('COO:%4.4d',[Value.Venda.COO]),' '));
  FPrinter.Add(StringOfChar('-',COLUNAS));
end;

function TCupomNaoFiscal.MontaCoporNota(Value: TDadosCorpo): iCupomNaoFiscal;
begin
  Result := Self;

  FPrinter.Add('#   Cód.    Descricao        Unit   Qtde    Valor ');

  for var I in Value.Itens do
    FPrinter.Add(I.Item.ToString + StringOfChar(' ', (4-I.Item.ToString.Length)) +
                 I.Codigo.ToString + StringOfChar(' ', (8-I.Codigo.ToString.Length)) +
                 I.Descricao + StringOfChar(' ', (17-I.Descricao.Length)) +
                 FormatCurr(',0.00',I.Valor) + StringOfChar(' ', (7-FormatCurr(',0.00',I.Valor).Length)) +
                 FormatFloat(',0.000',I.Quantidade) + StringOfChar(' ', (8-FormatFloat(',0.000',I.Quantidade).Length)) +
                 FormatCurr(',0.00', I.Total));

  FPrinter.Add(StringOfChar('-',COLUNAS));
  FPrinter.Add(AjustarStrings('Qtd. Total de Itens',Value.Venda.QuantidadeTotal.ToString,' '));
  FPrinter.Add(AjustarStrings('Valor Total',FormatCurr('"R$ ",0.00',Value.Venda.Total),' '));
  FPrinter.Add(StringOfChar('-', COLUNAS));
  FPrinter.Add(AjustarStrings('Forma de Pagamento','Valor Pago',' '));
  FPrinter.Add(AjustarStrings(Value.Pagamento.TipoPagamento,FormatCurr('"R$ ",0.00', Value.Pagamento.ValorPago),' '));
end;

function TCupomNaoFiscal.MontaRodaPe(Value: TDadosRodape): iCupomNaoFiscal;
begin
  Result := Self;
  FPrinter.Add(StringOfChar('-', COLUNAS));
  FPrinter.Add(AjustarStrings('Operador: '+Value.Operador.Nome, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now), ' '));
  FPrinter.Add(AjustarStringCenter('** NAO E CUPOM FISCAL **',' '));
  FPrinter.Add(StringOfChar('-', COLUNAS));
  FPrinter.Add(AjustarStringCenter('Obrigado e Volte Sempre', ' '));
end;

class function TCupomNaoFiscal.New: iCupomNaoFiscal;
begin
  Result := Self.Create;
end;

procedure TCupomNaoFiscal.QuebrarLinha(const Texto: String);
begin
  var lTexto := Texto;
  var lResultado := '';
  var I := 1;

  while I <= lTexto.Length do
  begin
    if lTexto.Length <= COLUNAS then
    begin
      FPrinter.Add(AjustarStringCenter(Copy(lTexto,I,lTexto.Length),' '));
      Break;
    end;

    lResultado := lResultado + lTexto[I];

    if ((I mod COLUNAS = 0) and (lTexto[I] = #32)) then
    begin
      FPrinter.Add(AjustarStringCenter(Copy(lResultado,1,lResultado.Length-1),' '));
      lTexto := Copy(lTexto, lResultado.Length, lTexto.Length);
      lResultado := '';
      I := 1;
    end;

    inc(I);
  end;
end;

end.
