unit Unit3;

interface

uses
  System.Classes, ACBrDANFCeFortesFr, ACBrDFe, ACBrNFe,
  ACBrECFVirtualNaoFiscal, ACBrECFVirtual, ACBrECFVirtualBuffer,
  ACBrECFVirtualPrinter, ACBrECFVirtualNFCe, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter, ACBrECF;

type
  TDataModule3 = class(TDataModule)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrPosPrinter1: TACBrPosPrinter;
    ACBrECFVirtualNaoFiscal1: TACBrECFVirtualNaoFiscal;
  private

  public

  end;

var
  DataModule3: TDataModule3;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
