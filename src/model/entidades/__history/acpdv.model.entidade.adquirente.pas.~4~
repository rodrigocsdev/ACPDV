unit acpdv.model.dao.entidade.adquirente;

interface

type
  TAdquirente = class
  private
    FId: Integer;
    FIdPos: Integer;
    FDescricao: String;
    FCnpj: String;
    FMerchantId: String;
    FChaveRequisicao: String;
  public
    class function New: TAdquirente;
    function SetId(Value: Integer): TAdquirente;
    function GetId: Integer;
    function SetIdPos(Value: Integer): TAdquirente;
    function GetIdPos: Integer;
    function SetDescricao(Value: String): TAdquirente;
    function GetDescricao: String;
    function SetCnpj(Value: String): TAdquirente;
    function GetCnpj: String;
    function SetMerchantId(Value: String): TAdquirente;
    function GetMerchantId: String;
    function SetChaveRequisicao(Value: String): TAdquirente;
    function GetChaveRequisicao: String;
  end;

implementation

{ TAdquirente }

function TAdquirente.GetChaveRequisicao: String;
begin
  Result := FChaveRequisicao;
end;

function TAdquirente.GetCnpj: String;
begin
  Result := FCnpj;
end;

function TAdquirente.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TAdquirente.GetId: Integer;
begin
  Result := FId;
end;

function TAdquirente.GetIdPos: Integer;
begin
  Result := FIdPos;
end;

function TAdquirente.GetMerchantId: String;
begin
  Result := FMerchantId;
end;

class function TAdquirente.New: TAdquirente;
begin
  Result := Self.Create;
end;

function TAdquirente.SetChaveRequisicao(Value: String): TAdquirente;
begin
  Result := Self;
  FChaveRequisicao := Value;
end;

function TAdquirente.SetCnpj(Value: String): TAdquirente;
begin
  Result := Self;
  FCnpj := Value;
end;

function TAdquirente.SetDescricao(Value: String): TAdquirente;
begin
  Result := Self;
  FDescricao := Value;
end;

function TAdquirente.SetId(Value: Integer): TAdquirente;
begin
  Result := Self;
  FId := Value;
end;

function TAdquirente.SetIdPos(Value: Integer): TAdquirente;
begin
  Result := Self;
  FIdPos := Value;
end;

function TAdquirente.SetMerchantId(Value: String): TAdquirente;
begin
  Result := Self;
  FMerchantId := Value;
end;

end.
