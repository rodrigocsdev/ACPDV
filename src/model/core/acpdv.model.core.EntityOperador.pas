unit acpdv.model.core.entityoperador;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.Variants,
  System.Classes,
  System.TypInfo,
  System.DateUtils,
  Data.DB,
  acpdv.model.dao.Operador,
  acpdv.model.dao.CAIXA,
  acpdv.model.dao.turno,
  Datasnap.DBClient, acpdv.Model.dao.CAIXA_MOVIMENTO,
  acpdv.Model.Entidade.caixamovimento;

type
  TEntityOperador = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FLista: TDictionary<String, String>;
    FOperador: String;
    FDataSet: TDataSet;

    FCaixaMovemento: TCaixaMovimento;

    procedure PreecheLista(Value: TDictionary<String, Variant>);
  public
    class function New: TEntityOperador;
    function ValidarOperador(aUsuario, aSenha: String): Boolean;
//    function AbrirCaixa(Value: TDictionary<String, Variant>): TEntityOperador;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TEntityOperador }

//function TEntityOperador.AbrirCaixa(
//  Value: TDictionary<String, Variant>): TEntityOperador;
//var
//  lDao: TDAOCaixaMovimento;
//begin
//  Result := Self;
//  lDao:= TDAOCaixaMovimento.New;
//
//  Value['idoperador'];
//
//  FCaixaMovemento :=
//    TCaixaMovimento.New
//      .SetIdOperador(Value['idoperador'])
//      .SetIdCaixa(Value['idcaixa'])
//      .SetIdTurno(Value['idturno']);
//
//  lDao.Inserir(FCaixaMovemento);
//  PreecheLista(Value);
//end;

procedure TEntityOperador.DataModuleCreate(Sender: TObject);
begin
  FLista := TDictionary<String, String>.Create;
end;

procedure TEntityOperador.DataModuleDestroy(Sender: TObject);
begin
  FLista.Free;
end;

class function TEntityOperador.New: TEntityOperador;
begin
  Result := Self.Create(nil);
end;

procedure TEntityOperador.PreecheLista(Value: TDictionary<String, VAriant>);
var
  lKey: String;
begin
  for lKey in Value.Keys do
    FLista.Add(lKey, Value[lKey]);
end;

function TEntityOperador.ValidarOperador(aUsuario, aSenha: String): Boolean;
var
  lDataSet: TDataSet;
begin
  Result := False;

  lDataSet := TDAOOperador.New.Listar.DataSet;

  lDataSet.Locate('NOME;SENHA', VarArrayOf([UpperCase(aUsuario), aSenha]),[]);

  if not lDataSet.IsEmpty then
    Result := True;
end;

end.
