unit cupomnaofiscal.interfaces;

interface

uses
  System.Generics.Collections,
  cupomnaofiscal.dto;

type
  iCupomNaoFiscal = interface
    function MontaCabecalho(Value: TDadosCabecalho): iCupomNaoFiscal;
    function MontaCoporNota(Value: TDadosCorpo): iCupomNaoFiscal;
    function MontaRodaPe(Value: TDadosRodape): iCupomNaoFiscal;
    function Gravar(Path: String): iCupomNaoFiscal;
    procedure Imprimir;
  end;

implementation

end.
