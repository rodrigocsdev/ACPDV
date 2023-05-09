unit acpdv.Model.Entidade.CartaoBandeira;

interface

type
  TCartaoBandeira = class
  private
    FId :Integer;
    FDescricao :String;
  public
    function GetId :Integer;
    function SetId(const Value :Integer): TCartaoBandeira;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TCartaoBandeira;

    class function New: TCartaoBandeira;
end;

implementation

class function TCartaoBandeira.New: TCartaoBandeira;
begin
  Result := Self.Create;
end;

function TCartaoBandeira.SetId(const Value :Integer): TCartaoBandeira;
begin
  FId := Value;
end;

function TCartaoBandeira.GetId :Integer;
begin
  Result := FId;
end;

function TCartaoBandeira.SetDescricao(const Value :String): TCartaoBandeira;
begin
  FDescricao := Value;
end;

function TCartaoBandeira.GetDescricao :String;
begin
  Result := FDescricao;
end;

end.

