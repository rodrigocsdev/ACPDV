unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.Generics.Collections,
  cupomnaofiscal.interfaces,
  concretecupomnaofiscal,
  cupomnaofiscal.dto;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  var
  lLista := TDictionary<String, Variant>.Create;

  var
    lCabecalho: TDadosCabecalho;

  lCabecalho.Empresa.Nome := 'Jorge e Mário Adega Ltda';
  lCabecalho.Empresa.Logradouro :=
    'Rua Maria Antonieta Mello Freire Conceição, 182';
  lCabecalho.Empresa.Bairro := 'Parque Santana';
  lCabecalho.Empresa.Cidade := 'Mogi das Cruzes';
  lCabecalho.Empresa.Estado := 'SP';
  lCabecalho.Empresa.Cep := '08730-230';
  lCabecalho.Empresa.CNPJ := '57.761.998/0001-64';
  lCabecalho.Empresa.IE := '729.926.060.277';

  var
    lCorpo: TDadosCorpo;
  var
  lItens := TList<TItens>.Create;
  var
    lItem: TItens;
  var
    lVenda: TVenda;

  lVenda.DataHora := Now;
  lVenda.COO := 1;

  lItem.Item := 1;
  lItem.Codigo := 123;
  lItem.Descricao := 'PRODUTO 1';
  lItem.Valor := 5;
  lItem.Quantidade := 1;
  lItem.Total := (lItem.Valor * lItem.Quantidade);

  lItens.Add(lItem);

  lItem.Item := 2;
  lItem.Codigo := 321;
  lItem.Descricao := 'PRODUTO 2';
  lItem.Valor := 2;
  lItem.Quantidade := 3;
  lItem.Total := (lItem.Valor * lItem.Quantidade);

  lItens.Add(lItem);

  var
    lTotal: Currency := 0;
  for var I in lItens do
    lTotal := lTotal + I.Total;

  lVenda.QuantidadeTotal := lItens.Count;
  lVenda.Total := lTotal;

  var
    lPagamento: TPagamentos;

  lCorpo.Itens := lItens;
  lCorpo.Venda := lVenda;
  lCorpo.Pagamento.TipoPagamento := 'Dinheiro';
  lCorpo.Pagamento.ValorPago := lTotal;

  lCabecalho.Venda := lVenda;

  var
    lRodaPe: TDadosRodape;

  lRodaPe.Operador.Nome := 'Alessandro';

  TCupomNaoFiscal.New.MontaCabecalho(lCabecalho).MontaCoporNota(lCorpo)
    .MontaRodaPe(lRodaPe).Gravar(ExtractFilePath(Application.ExeName) +
    'cupom.txt').Imprimir;

  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'cupom.txt')
end;

end.
