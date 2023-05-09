unit acpdv.Model.Entidade.Pessoa;

interface

type
  TPessoa = class
  private
    FId :Integer;
    FNome :String;
    FAtivo :String;
    FTipoPessoa :String;
    FCnpjCpf :String;
    FFone :String;
    FEndereco :String;
    FNumero :String;
    FComplemento :String;
    FBairro :String;
    FCidade :Integer;
    FCep :String;
    FEmail :String;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TPessoa;
    function GetNome :String;
    function SetNome(const Value :String): TPessoa;
    function GetAtivo :String;
    function SetAtivo(const Value :String): TPessoa;
    function GetTipoPessoa :String;
    function SetTipoPessoa(const Value :String): TPessoa;
    function GetCnpjCpf :String;
    function SetCnpjCpf(const Value :String): TPessoa;
    function GetFone :String;
    function SetFone(const Value :String): TPessoa;
    function GetEndereco :String;
    function SetEndereco(const Value :String): TPessoa;
    function GetNumero :String;
    function SetNumero(const Value :String): TPessoa;
    function GetComplemento :String;
    function SetComplemento(const Value :String): TPessoa;
    function GetBairro :String;
    function SetBairro(const Value :String): TPessoa;
    function GetCidade :Integer;
    function SetCidade(const Value :Integer): TPessoa;
    function GetCep :String;
    function SetCep(const Value :String): TPessoa;
    function GetEmail :String;
    function SetEmail(const Value :String): TPessoa;

    class function New: TPessoa;
end;

implementation

class function TPessoa.New: TPessoa;
begin
  Result := Self.Create;
end;

function TPessoa.SetId(const Value :Integer): TPessoa;
begin
  FId := Value;
end;

function TPessoa.GetId :Integer;
begin
  Result := FId;
end;

function TPessoa.SetNome(const Value :String): TPessoa;
begin
  FNome := Value;
end;

function TPessoa.GetNome :String;
begin
  Result := FNome;
end;

function TPessoa.SetAtivo(const Value :String): TPessoa;
begin
  FAtivo := Value;
end;

function TPessoa.GetAtivo :String;
begin
  Result := FAtivo;
end;

function TPessoa.SetTipoPessoa(const Value :String): TPessoa;
begin
  FTipoPessoa := Value;
end;

function TPessoa.GetTipoPessoa :String;
begin
  Result := FTipoPessoa;
end;

function TPessoa.SetCnpjCpf(const Value :String): TPessoa;
begin
  FCnpjCpf := Value;
end;

function TPessoa.GetCnpjCpf :String;
begin
  Result := FCnpjCpf;
end;

function TPessoa.SetFone(const Value :String): TPessoa;
begin
  FFone := Value;
end;

function TPessoa.GetFone :String;
begin
  Result := FFone;
end;

function TPessoa.SetEndereco(const Value :String): TPessoa;
begin
  FEndereco := Value;
end;

function TPessoa.GetEndereco :String;
begin
  Result := FEndereco;
end;

function TPessoa.SetNumero(const Value :String): TPessoa;
begin
  FNumero := Value;
end;

function TPessoa.GetNumero :String;
begin
  Result := FNumero;
end;

function TPessoa.SetComplemento(const Value :String): TPessoa;
begin
  FComplemento := Value;
end;

function TPessoa.GetComplemento :String;
begin
  Result := FComplemento;
end;

function TPessoa.SetBairro(const Value :String): TPessoa;
begin
  FBairro := Value;
end;

function TPessoa.GetBairro :String;
begin
  Result := FBairro;
end;

function TPessoa.SetCidade(const Value :Integer): TPessoa;
begin
  FCidade := Value;
end;

function TPessoa.GetCidade :Integer;
begin
  Result := FCidade;
end;

function TPessoa.SetCep(const Value :String): TPessoa;
begin
  FCep := Value;
end;

function TPessoa.GetCep :String;
begin
  Result := FCep;
end;

function TPessoa.SetEmail(const Value :String): TPessoa;
begin
  FEmail := Value;
end;

function TPessoa.GetEmail :String;
begin
  Result := FEmail;
end;

end.

