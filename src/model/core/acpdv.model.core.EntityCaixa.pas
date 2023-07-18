unit acpdv.model.core.EntityCaixa;

interface

uses
 System.Generics.Collections,
 Data.DB,
 acpdv.model.enum,
 acpdv.model.dao.CAIXA,
 acpdv.model.dao.turno,
 acpdv.model.dao.Operador;

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
  function CaixaAberto: Boolean;
 end;

implementation

{ TEntityCaixa }

function TEntityCaixa.AbrirCaixa(Value: TDictionary<String, Variant>)
  : TEntityCaixa;
begin

end;

function TEntityCaixa.CaixaAberto: Boolean;
begin

end;

constructor TEntityCaixa.Create;
begin
 FLista := TDictionary<String, Variant>.Create;
end;

function TEntityCaixa.Dados(Lista: TDictionary<String, Variant>): TEntityCaixa;
begin

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
 PreencheLista(TDAOCaixa.New.FindWhere('nome',))
end;

procedure TEntityCaixa.PreencheLista(Lista: TDictionary<String, Variant>);
begin

end;

procedure TEntityCaixa.PreencheLista(DataSet: TDataSet; Table: String);
var
 I, F: Integer;
begin
 for I := 0 to Pred(DataSet.RecordCount) do
 begin
  for F := 0 to Pred(DataSet.FieldCount) do
  begin
   FLista.AddOrSetValue(DataSet.Fields[F].FieldName + '_' + Table,
     DataSet.Fields[F].AsVariant);
  end;
 end;
end;

end.
