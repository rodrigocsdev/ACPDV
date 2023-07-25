unit acpdv.view.principal;

interface

uses
  system.Generics.Collections,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,
  acpdv.view.page.login,
  Vcl.WinXCtrls,
  acpdv.view.page.identificarcliente,
  acpdv.view.page.importarcliente,
  acpdv.view.abrircaixa,
  Vcl.Imaging.pngimage,
  acpdv.model.fechamentocaixa,
  acpdv.view.page.fechamentocaixa,
  acpdv.view.page.pagamento,
  acpdv.view.loginsupervisor,
  acpdv.view.componente.listaitem,
  acpdv.view.componente.mensagens,
  acpdv.model.conexao.configuracao,
  acpdv.Model.dao.Operador,
  acpdv.controller;


type
  Tpageprincipal = class(TForm)
    pnlContainer: TPanel;
    pnlTitle: TPanel;
    pnlButton: TPanel;
    pnlMain: TPanel;
    pnlOperacoes: TPanel;
    pnlGrid: TPanel;
    pnlCancelarOp: TPanel;
    Shape1: TShape;
    btnCancelarOp: TSpeedButton;
    pnlConsultarPreco: TPanel;
    Shape2: TShape;
    btnConsultarPreco: TSpeedButton;
    pnlAbrirCaixa: TPanel;
    Shape3: TShape;
    btnAbrirCaixa: TSpeedButton;
    pnlCancelarVenda: TPanel;
    Shape4: TShape;
    btnCancelarVenda: TSpeedButton;
    pnlCancelarItem: TPanel;
    Shape5: TShape;
    btnCancelarItem: TSpeedButton;
    pnlMaisFuncoes: TPanel;
    Shape6: TShape;
    btnMaisFuncoes: TSpeedButton;
    pnlTotalCompra: TPanel;
    Label1: TLabel;
    Shape7: TShape;
    pnledtTotalCompra: TPanel;
    lblTotalCompra: TLabel;
    pnlSubTotal: TPanel;
    Label2: TLabel;
    pnlEdtSubTotal: TPanel;
    Shape8: TShape;
    lblSubTotal: TLabel;
    pnlQuantidade: TPanel;
    Label3: TLabel;
    pnlEdtQuantidade: TPanel;
    Shape9: TShape;
    edtQuantidade: TEdit;
    pnlPreco: TPanel;
    Label4: TLabel;
    pnlEdtPreco: TPanel;
    Shape10: TShape;
    lblPreco: TLabel;
    pnlProduto: TPanel;
    Label5: TLabel;
    pnlEdtProduto: TPanel;
    Shape11: TShape;
    edtProduto: TEdit;
    pnlImgProduto: TPanel;
    ImageProduto: TImage;
    pnlMaster: TPanel;
    SplitViewFuncoes: TSplitView;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape12: TShape;
    Panel3: TPanel;
    Shape13: TShape;
    Panel4: TPanel;
    Shape14: TShape;
    Panel5: TPanel;
    Shape15: TShape;
    Panel6: TPanel;
    Shape16: TShape;
    Panel7: TPanel;
    Shape17: TShape;
    SplitViewConfig: TSplitView;
    pnlConfContainer: TPanel;
    Panel8: TPanel;
    Shape18: TShape;
    pnlIdentificaCliente: TPanel;
    pnlTitulo: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    pnlListaItems: TPanel;
    Shape19: TShape;
    ListBoxItems: TListBox;
    pnldatabase: TPanel;
    Label6: TLabel;
    Panel16: TPanel;
    Shape20: TShape;
    edtdatabase: TEdit;
    Panel15: TPanel;
    Label7: TLabel;
    Panel17: TPanel;
    Shape21: TShape;
    edtUserName: TEdit;
    Panel18: TPanel;
    Label8: TLabel;
    Panel19: TPanel;
    Shape22: TShape;
    edtPassword: TEdit;
    Panel20: TPanel;
    Label9: TLabel;
    Panel21: TPanel;
    Shape23: TShape;
    edtdriveid: TEdit;
    Panel22: TPanel;
    Shape24: TShape;
    btnCadastrarConfiguracaoBD: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMaisFuncoesClick(Sender: TObject);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadastrarConfiguracaoBDClick(Sender: TObject);
  private
    FIndex: Integer;
    FTotal: Currency;
    FController: TController;
    FCaixa: TDictionary<String,VAriant>;

    procedure Confirmar(Sender: TObject);

    procedure MontarBotoes;

    procedure FixarForm;

    procedure SplitViewAction(Value: TSplitView);
    procedure AjustarCampos;
    procedure VerificaCaixaFechadoAberto(Value: Boolean);
    procedure InformacoesOperador;
  public

  end;

var
  pageprincipal: Tpageprincipal;

implementation

uses
  acpdv.model.conexao;

{$R *.dfm}

procedure Tpageprincipal.AjustarCampos;
begin
  edtProduto.Text := '';
  lblPreco.Caption := FormatCurr('"R$ ",0.00', 0);
  edtQuantidade.Text := FormatFloat(',0.000', 0);
  lblSubTotal.Caption := FormatCurr('"R$ ",0.00', 0);
  lblTotalCompra.Caption := FormatCurr('"R$ ",0.00', 0);
  pnlTitle.SetFocus;
end;

procedure Tpageprincipal.btnCadastrarConfiguracaoBDClick(Sender: TObject);
var
  lConf: TConfiguracao;
begin
  lConf := TConfiguracao.New(ExtractFilePath(ParamStr(0)));
  try
    lConf.SetDataBase(edtdatabase.Text).SetUserName(edtUserName.Text)
      .SetPassword(edtPassword.Text).SetDriveID(edtdriveid.Text)
      .Build;
    ShowMessage('Banco configurado');
    SplitViewAction(SplitViewConfig);
  finally
    lConf.Free;
  end;
  TConexao.Create(Application);
end;

procedure Tpageprincipal.btnMaisFuncoesClick(Sender: TObject);
begin
  SplitViewAction(SplitViewFuncoes);
end;

procedure Tpageprincipal.Confirmar(Sender: TObject);
begin
  VerificaCaixaFechadoAberto(FController.Caixa.AbrirCaixa(FCaixa).CaixaAberto);
end;

procedure Tpageprincipal.edtProdutoKeyPress(Sender: TObject; var Key: Char);
var
  lListaProduto: TDictionary<String, Variant>;
begin
  if not FController.Caixa.CaixaAberto then
  begin
    Key := #0;
    edtProduto.Clear;
    edtProduto.SetFocus;
    TPageMensagens.New(Self).Mensagem('O caixa deve estar aberto!'+#13+'Deseja abrir o caixa?', INFORMACAO)
      .Embed(pnlMaster).ClickConfirmar(Confirmar);
    Exit;
  end;

  case Key of
    '.', ',':
      begin
        Key := ',';
        if pos(',', edtProduto.Text) > 0 then
          Key := #0;
      end;

    '*':
      begin
        if pos('*', edtProduto.Text) > 0 then
          Key := #0;
      end;

    '/':
      Application.MessageBox('Nenhuma balança configurada', 'Balança',
        MB_ICONINFORMATION + MB_OK);

    #13:
      begin
        if Trim(edtProduto.Text) <> '' then
        begin

          if edtQuantidade.Text = '0,000' then
            edtQuantidade.Clear;

        lListaProduto := TDictionary<String, Variant>.Create;
        try
          Inc(FIndex);

          if not FController.Produto.GetProdutoById(edtProduto.Text, lListaProduto) then
          begin
            TPageMensagens.New(Self).Mensagem('Código do produto não foi encontrado!', ALERTA)
            .Embed(pnlMaster);
            Exit;
          end;

          edtQuantidade.Text := FormatFloat(',0.000',
            StrToFloatDef(edtQuantidade.Text, 1));
          lblPreco.Caption := FormatCurr('"R$ ",0.00', lListaProduto['VL_UNITARIO_PRODUTO']);
          lblSubTotal.Caption := FormatCurr('"R$ ",0.00',
            lListaProduto['VL_UNITARIO_PRODUTO'] * StrToFloatDef(edtQuantidade.Text, 1));

          FTotal := FTotal + (lListaProduto['VL_UNITARIO_PRODUTO']
            * StrToFloatDef(edtQuantidade.Text, 1));

          lblTotalCompra.Caption := FormatCurr('"R$ ",0.00', FTotal);


          TComponenteListaItem.New(Self)
            .Embed(ListBoxItems)
            .Item(FIndex)
            .Codigo(lListaProduto['ID_PRODUTO'])
            .Descricao(lListaProduto['DESCRICAO_PRODUTO'])
            .Quantidade(StrToFloatDef(edtQuantidade.Text,1))
            .ValorUnitario(lListaProduto['VL_UNITARIO_PRODUTO'])
            .Alinhamento(alTop)
            .Nome('FRAME'+FIndex.ToString)
            .Build;

        finally
          lListaProduto.Free;
        end;

        edtProduto.Clear;
        edtProduto.SetFocus;
        end;
      end;
  end;

  if not CharInSet(Key, ['0' .. '9', ',', '*', #8]) then
    Key := #0;
end;

procedure Tpageprincipal.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtProduto.SetFocus;
end;

procedure Tpageprincipal.FixarForm;
begin
  Self.WindowState := TWindowState.wsNormal;
  Self.Position := poScreenCenter;
  Self.Constraints.MaxHeight := Self.ClientHeight;
  Self.Constraints.MinHeight := Self.ClientHeight;
  Self.Constraints.MaxWidth := Self.ClientWidth;
  Self.Constraints.MinWidth := Self.ClientWidth;
end;

procedure Tpageprincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCaixa.DisposeOf;
end;

procedure Tpageprincipal.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FCaixa:= TDictionary<String,VAriant>.Create;
  FixarForm;
  MontarBotoes;
end;

procedure Tpageprincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lKeyEvent: TKeyEvent;
  I: Integer;
begin
  lKeyEvent := nil;

  for I := Pred(pnlMaster.ControlCount) downto 0 do
  begin
    if ((pnlMaster.Controls[I] is TForm) and
      (TForm(pnlMaster.Controls[I]).ModalResult = mrOk)) then
    begin
      if TForm(pnlMaster.Controls[I]).KeyPreview then
        lKeyEvent := TForm(pnlMaster.Controls[I]).OnKeyDown;

      if Assigned(lKeyEvent) then
        lKeyEvent(Sender, Key, Shift);

      Exit;
    end;
  end;

  if ((Shift = [ssCtrl]) and (Key = VK_MULTIPLY)) then
  begin
    edtQuantidade.Clear;
    edtQuantidade.SetFocus;
  end;

  if ((Shift = [ssCtrl]) and (Key = VK_F1)) then
  begin
    SplitViewAction(SplitViewConfig);
    Exit;
  end;

  case Key of
    VK_ESCAPE:
      Self.Close;
    VK_F4:
      begin
        TPageFechamentoCaixa
          .New(Self)
          .Informacoes(FCaixa)
          .Embed(pnlMaster)
          .ValidarCaixa(procedure (Value: Boolean)
          begin
            VerificaCaixaFechadoAberto(Value);
          end)
          .Show;
      end;
    VK_F2:
      begin
        TPageAbrirCaixa.New(Self).Embed(pnlMaster)
           .Informacoes(FCaixa)
           .Click(procedure (Value: Boolean)
           begin
              VerificaCaixaFechadoAberto(Value);
           end)
          .Show;
      end;
    VK_F6:
      ShowMessage('Cancelar Venda');
    VK_F5:
      ShowMessage('Cancelar Item');
    VK_F12:
      btnMaisFuncoesClick(Sender);
    VK_F7:
      begin
        TPagePagamento.New(Self).Embed(pnlMaster);
      end;
    VK_F1:
      begin
        TPageImportarCliente.New(Self).Embed(pnlMaster).Show;
      end;
    VK_F9:
      begin
        TPageIdentificarCliente.New(Self).IdentificaCPF.Embed(pnlMaster)
          .identificarcliente(
          procedure(aCPF, aCliente: String)
          begin
            if not aCliente.IsEmpty then
              aCliente := 'Cliente: ' + aCliente;
            if not aCPF.IsEmpty then
              aCPF := 'CPF: ' + aCPF;

            if ((not aCliente.IsEmpty) or (not aCPF.IsEmpty)) then
            begin
              pnlIdentificaCliente.Visible := True;
              pnlIdentificaCliente.Caption := aCliente + ' ' + aCPF;
            end;
          end).Show;
      end;
    VK_F11:
      begin
        TPagePermissaoSupervisor.New(Self).New(Self).Embed(pnlMaster);
      end;
  end;
end;

procedure Tpageprincipal.FormShow(Sender: TObject);
begin
  FIndex := 0;

  TPageLogin.New(Self).Embed(pnlMaster).INFORMACAO(
    procedure(Value: String)
    begin
      FCaixa := FController.Caixa.NumeroCaixaTurno(Value,'Caixa 1');

      VerificaCaixaFechadoAberto(FController.Caixa.CaixaAberto);
    end).Show;
end;

procedure Tpageprincipal.InformacoesOperador;
var
  lCaption, loperador: String;
begin
  lOperador := 'Caixa: ' + FCaixa['NOME_CAIXA'] + ' | Operador: ' +
    FCaixa['NOME_OPERADOR'] + ' | Turno: ' + FCaixa['NOME_TURNO'];

  lCaption := StringOfChar(' ',
    (255 - (Length(Self.Caption) + Length(lOperador))));
  Self.Caption := Self.Caption + lCaption + lOperador;
end;

procedure Tpageprincipal.MontarBotoes;
begin
  btnCancelarOp.Caption := 'Cancelar Operação ' + ''#13'' + ' (F10)';
  btnConsultarPreco.Caption := 'Fechar Caixa' + ''#13'' + '(F4)';
  btnAbrirCaixa.Caption := 'Abrir Caixa' + ''#13'' + '(F2)';
  btnCancelarVenda.Caption := 'Cancelar Venda' + ''#13'' + '(F6)';
  btnCancelarItem.Caption := 'Cancelar Item' + ''#13'' + '(F5)';
  btnMaisFuncoes.Caption := 'Mais Funções' + ''#13'' + '(F12)';
end;

procedure Tpageprincipal.SplitViewAction(Value: TSplitView);
begin
  Value.Opened := not Value.Opened;
end;

procedure Tpageprincipal.VerificaCaixaFechadoAberto(Value: Boolean);
begin
  if not Value then
  begin
    pnlTitle.Caption := 'Caixa Fechado';
    AjustarCampos;
    Exit;
  end;
  pnlTitle.Caption := 'Caixa Aberto';

  InformacoesOperador;

  AjustarCampos;
end;

end.
