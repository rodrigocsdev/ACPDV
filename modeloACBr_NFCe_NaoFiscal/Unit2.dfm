object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 477
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 146
    Height = 41
    Caption = 'Abre Cupom'
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 160
    Top = 0
    Width = 509
    Height = 477
    Align = alRight
    Lines.Strings = (
      'Nome da Empresa'
      'Nome da Rua , 1234 - Bairro'
      'Cidade - UF - 99999-999'
      'CNPJ: 01.234.567/0001-22 IE: 012.345.678.90'
      '20/06/2023 12:38:41'#9'COO: 000023'
      ''
      'CUPOM NAO FISCAL'
      '001'#9'CARTAO'#9'7,00'
      'TESTE DE COMPROVANTE NAO FISCAL'
      'TOTAL R$'#9'0,00'
      ''
      'DINHEIRO'#9'7,00'
      #11
      'Componentes ACBr'#11
      'http://acbr.sourceforge.net'#11
      ''
      ''
      '20/06/2023 12:39:14'#9'Projeto ACBr: 0.9.0a'
      'Obrigado Volte Sempre'
      '')
    TabOrder = 1
  end
  object btnAtiva: TButton
    Left = 8
    Top = 444
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 413
    Width = 129
    Height = 25
    Caption = 'Redu'#231'ao z'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
end
