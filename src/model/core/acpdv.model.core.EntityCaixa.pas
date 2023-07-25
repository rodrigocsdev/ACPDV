unit acpdv.model.core.entitycaixa;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Generics.Collections,
  Data.DB,
  acpdv.model.enum,
  acpdv.model.dao.CAIXA,
  acpdv.model.dao.turno,
  acpdv.model.dao.Operador, acpdv.Model.dao.CAIXA_MOVIMENTO,
  acpdv.Model.Entidade.caixamovimento;

type
  TEntityCaixa = class
  private
    FLista: TDictionary<String, Variant>;
    procedure PreencheLista(DataSet: TDataSet; Table: String); overload;
    procedure PreencheLista(Lista: TDictionary<String, Variant>); overload;

    constructor Create;
  public
    class function New: TEntityCaixa;
    function Dados(Lista: TDictionary<String, Variant>): TEntityCaixa;
    function NumeroCaixaTurno(aOperador, aCaixa: String)
      : TDictionary<String, Variant>;
    function AbrirCaixa(Value: TDictionary<String, Variant>): TEntityCaixa;
    function FecharCaixa(Value: TDictionary<String, Variant>): TEntityCaixa;
    function CaixaAberto: Boolean;
  end;

implementation

{ TEntityCaixa }

function TEntityCaixa.AbrirCaixa(Value: TDictionary<String, Variant>)
  : TEntityCaixa;
begin
  Result := Self;

  TDAOCaixaMovimento.New.Inserir(
    TCaixaMovimento.New
      .SetIdOperador(Value['ID_OPERADOR'])
      .SetIdCaixa(Value['ID_CAIXA'])
      .SetIdTurno(Value['ID_TURNO'])
      .SetSaldoInicial(Value['SALDOINICIAL'])
      .SetSituacao('A'));

  PreencheLista(Value);
end;

function TEntityCaixa.CaixaAberto: Boolean;
begin
  Result := TDAOCaixaMovimento.New.FindWhere('id_caixa', FLista['ID_CAIXA'])
    .DataSet.Locate('SITUACAO', 'A',[]);
end;

constructor TEntityCaixa.Create;
begin
  FLista := TDictionary<String, Variant>.Create;
end;

function TEntityCaixa.Dados(Lista: TDictionary<String, Variant>): TEntityCaixa;
begin
  Result := Self;
end;

function TEntityCaixa.FecharCaixa(
  Value: TDictionary<String, Variant>): TEntityCaixa;
var
  lTipoPagamento: TTipoPagamento;
  lTotal: Currency;
  lDataSet: TDataSet;
  lKey: String;
begin
  Result := Self;
  lTotal := 0;

  for lKey in Value.Keys do
    if lTipoPagamento.ToEnum(lKey).ToString.Equals(lKey) then
      lTotal := lTotal + StrToCurrDef(value[lKey],0);

  lDataSet := TDAOCaixaMovimento.New.FindWhere('ID_CAIXA', Value['ID_CAIXA']).DataSet;

  lDataSet.Locate('ID_CAIXA;ID_TURNO;ID_OPERADOR;SITUACAO',
    VArArrayOf([Value['ID_CAIXA'],Value['ID_TURNO'], Value['ID_OPERADOR'], 'A']),[]);

  TDAOCaixaMovimento.New.Atualizar(
    TCaixaMovimento.New
      .SetId(lDataSet.FieldByName('ID').AsInteger)
      .SetDataFechamento(now)
      .SetSituacao('F')
      .SetValorTotal(lTotal));
  PreencheLista(Value);
end;

class function TEntityCaixa.New: TEntityCaixa;
begin
  Result := Self.Create;
end;

function TEntityCaixa.NumeroCaixaTurno(aOperador, aCaixa: String)
  : TDictionary<String, Variant>;
var
  lTipoTurno: TTipoTurno;
begin
  PreencheLista(TDAOCaixa.New.FindWhere('nome', UpperCase(aCaixa)).DataSet, 'CAIXA');
  PreencheLista(TDAOTurno.New.FindWhere('nome', lTipoTurno.ToTurno(now).ToString).DataSet, 'TURNO');
  PreencheLista(TDAOOperador.New.FindWhere('nome', UpperCase(aOperador)).DataSet, 'OPERADOR');
  Result := FLista;
end;

procedure TEntityCaixa.PreencheLista(Lista: TDictionary<String, Variant>);
var
  lKey: String;
begin
  for lKey in Lista.Keys do
    FLista.AddOrSetValue(lKey, Lista[lKey]);
end;

procedure TEntityCaixa.PreencheLista(DataSet: TDataSet; Table: String);
var
  I, F: Integer;
begin
  for I := 0 to Pred(DataSet.RecordCount) do
  begin
    for F := 0 to Pred(DataSet.FieldCount) do
      FLista.AddOrSetValue(DataSet.fields[F].FieldName + '_' + Table,
        DataSet.fields[F].AsVariant);
  end;
end;

end.
