unit acpdv.Model.Entidade.Empresa;

interface

type
  TEmpresa = class
  private
    FId :Integer;
    FCrt :Integer;
    FRazaoSocial :String;
    FNomeFantasia :String;
    FCnpj :String;
    FIe :String;
    FIm :String;
    FCnae :String;
    FFone :String;
    FEndereco :String;
    FNumero :String;
    FComplemento :String;
    FBairro :String;
    FCidade :Integer;
    FCep :Integer;

  public
    function GetId :Integer;
    function SetId(const Value :Integer): TEmpresa;
    function GetCrt :Integer;
    function SetCrt(const Value :Integer): TEmpresa;
    function GetRazaoSocial :String;
    function SetRazaoSocial(const Value :String): TEmpresa;
    function GetNomeFantasia :String;
    function SetNomeFantasia(const Value :String): TEmpresa;
    function GetCnpj :String;
    function SetCnpj(const Value :String): TEmpresa;
    function GetIe :String;
    function SetIe(const Value :String): TEmpresa;
    function GetIm :String;
    function SetIm(const Value :String): TEmpresa;
    function GetCnae :String;
    function SetCnae(const Value :String): TEmpresa;
    function GetFone :String;
    function SetFone(const Value :String): TEmpresa;
    function GetEndereco :String;
    function SetEndereco(const Value :String): TEmpresa;
    function GetNumero :String;
    function SetNumero(const Value :String): TEmpresa;
    function GetComplemento :String;
    function SetComplemento(const Value :String): TEmpresa;
    function GetBairro :String;
    function SetBairro(const Value :String): TEmpresa;
    function GetCidade :Integer;
    function SetCidade(const Value :Integer): TEmpresa;
    function GetCep :Integer;
    function SetCep(const Value :Integer): TEmpresa;

    class function New: TEmpresa;
end;

implementation

class function TEmpresa.New: TEmpresa;
begin
  Result := Self.Create;
end;

function TEmpresa.SetId(const Value :Integer): TEmpresa;
begin
  FId := Value;
end;

function TEmpresa.GetId :Integer;
begin
  Result := FId;
end;

function TEmpresa.SetCrt(const Value :Integer): TEmpresa;
begin
  FCrt := Value;
end;

function TEmpresa.GetCrt :Integer;
begin
  Result := FCrt;
end;

function TEmpresa.SetRazaoSocial(const Value :String): TEmpresa;
begin
  FRazaoSocial := Value;
end;

function TEmpresa.GetRazaoSocial :String;
begin
  Result := FRazaoSocial;
end;

function TEmpresa.SetNomeFantasia(const Value :String): TEmpresa;
begin
  FNomeFantasia := Value;
end;

function TEmpresa.GetNomeFantasia :String;
begin
  Result := FNomeFantasia;
end;

function TEmpresa.SetCnpj(const Value :String): TEmpresa;
begin
  FCnpj := Value;
end;

function TEmpresa.GetCnpj :String;
begin
  Result := FCnpj;
end;

function TEmpresa.SetIe(const Value :String): TEmpresa;
begin
  FIe := Value;
end;

function TEmpresa.GetIe :String;
begin
  Result := FIe;
end;

function TEmpresa.SetIm(const Value :String): TEmpresa;
begin
  FIm := Value;
end;

function TEmpresa.GetIm :String;
begin
  Result := FIm;
end;

function TEmpresa.SetCnae(const Value :String): TEmpresa;
begin
  FCnae := Value;
end;

function TEmpresa.GetCnae :String;
begin
  Result := FCnae;
end;

function TEmpresa.SetFone(const Value :String): TEmpresa;
begin
  FFone := Value;
end;

function TEmpresa.GetFone :String;
begin
  Result := FFone;
end;

function TEmpresa.SetEndereco(const Value :String): TEmpresa;
begin
  FEndereco := Value;
end;

function TEmpresa.GetEndereco :String;
begin
  Result := FEndereco;
end;

function TEmpresa.SetNumero(const Value :String): TEmpresa;
begin
  FNumero := Value;
end;

function TEmpresa.GetNumero :String;
begin
  Result := FNumero;
end;

function TEmpresa.SetComplemento(const Value :String): TEmpresa;
begin
  FComplemento := Value;
end;

function TEmpresa.GetComplemento :String;
begin
  Result := FComplemento;
end;

function TEmpresa.SetBairro(const Value :String): TEmpresa;
begin
  FBairro := Value;
end;

function TEmpresa.GetBairro :String;
begin
  Result := FBairro;
end;

function TEmpresa.SetCidade(const Value :Integer): TEmpresa;
begin
  FCidade := Value;
end;

function TEmpresa.GetCidade :Integer;
begin
  Result := FCidade;
end;

function TEmpresa.SetCep(const Value :Integer): TEmpresa;
begin
  FCep := Value;
end;

function TEmpresa.GetCep :Integer;
begin
  Result := FCep;
end;

end.

