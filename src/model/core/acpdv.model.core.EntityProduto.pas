unit acpdv.model.core.entityproduto;

interface

uses
  Data.DB,
  System.Generics.Collections,
  acpdv.model.dao.produto;

type
  TEntityProduto = class
  private
  public
    class function New: TEntityProduto;
    function GetProdutoById(Id: String;
      var Dados: TDictionary<string, variant>): Boolean;
  end;

implementation

uses
  System.Variants,
  acpdv.Model.dao.Ibpt;

{ TEntityProduto }

function TEntityProduto.GetProdutoById(Id: String;
  var Dados: TDictionary<string, variant>): Boolean;
var
  lDataSet: TDataSet;
  I: Integer;
begin
  Result := False;

  lDataSet := TDAOProduto.New.ListarPorId(Id).DataSet;

  var lDataSetIBPT := TDAOIbpt.New.Listar.DataSet;

  lDataSetIBPT.Locate('ID;EXTIPI', VarArrayOf([lDataSet.FieldByName('NCM').AsString,
                                      lDataSet.FieldByName('EXTIPI').AsString]),[]);

  for var J := 0 to Pred(lDataSetIBPT.FieldCount) do
     Dados.AddOrSetValue(lDataSetIBPT.fields[J].FieldName+'_PRODUTO',
     lDataSetIBPT.Fields[J].AsVariant);

  if not lDataSet.IsEmpty then
  begin
    Result := True;
    for I := 0 to Pred(lDataSet.FieldCount) do
      Dados.AddOrSetValue(lDataSet.Fields[I].FieldName+'_PRODUTO',
        lDataSet.Fields[I].AsVariant);
    Exit;
  end;
end;

class function TEntityProduto.New: TEntityProduto;
begin
  Result := Self.Create;
end;

end.
