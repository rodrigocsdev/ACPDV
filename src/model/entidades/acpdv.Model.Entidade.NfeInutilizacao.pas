unit acpdv.Model.Entidade.NfeInutilizacao;

interface

type
  TNfeInutilizacao = class
  private
    FDthrCadastro :TDateTime;
    FAno :Integer;
    FNumInicial :Integer;
    FNumFinal :Integer;
    FSerie :Integer;
    FProtocolo :String;
    FDthrrecbto :TDateTime;
    FJustificativa :TDateTime;
    FXml :TDateTime;

  public
    function GetDthrCadastro :TDateTime;
    function SetDthrCadastro(const Value :TDateTime): TNfeInutilizacao;
    function GetAno :Integer;
    function SetAno(const Value :Integer): TNfeInutilizacao;
    function GetNumInicial :Integer;
    function SetNumInicial(const Value :Integer): TNfeInutilizacao;
    function GetNumFinal :Integer;
    function SetNumFinal(const Value :Integer): TNfeInutilizacao;
    function GetSerie :Integer;
    function SetSerie(const Value :Integer): TNfeInutilizacao;
    function GetProtocolo :String;
    function SetProtocolo(const Value :String): TNfeInutilizacao;
    function GetDthrrecbto :TDateTime;
    function SetDthrrecbto(const Value :TDateTime): TNfeInutilizacao;
    function GetJustificativa :TDateTime;
    function SetJustificativa(const Value :TDateTime): TNfeInutilizacao;
    function GetXml :TDateTime;
    function SetXml(const Value :TDateTime): TNfeInutilizacao;

    class function New: TNfeInutilizacao;
end;

implementation

class function TNfeInutilizacao.New: TNfeInutilizacao;
begin
  Result := Self.Create;
end;

function TNfeInutilizacao.SetDthrCadastro(const Value :TDateTime): TNfeInutilizacao;
begin
  FDthrCadastro := Value;
end;

function TNfeInutilizacao.GetDthrCadastro :TDateTime;
begin
  Result := FDthrCadastro;
end;

function TNfeInutilizacao.SetAno(const Value :Integer): TNfeInutilizacao;
begin
  FAno := Value;
end;

function TNfeInutilizacao.GetAno :Integer;
begin
  Result := FAno;
end;

function TNfeInutilizacao.SetNumInicial(const Value :Integer): TNfeInutilizacao;
begin
  FNumInicial := Value;
end;

function TNfeInutilizacao.GetNumInicial :Integer;
begin
  Result := FNumInicial;
end;

function TNfeInutilizacao.SetNumFinal(const Value :Integer): TNfeInutilizacao;
begin
  FNumFinal := Value;
end;

function TNfeInutilizacao.GetNumFinal :Integer;
begin
  Result := FNumFinal;
end;

function TNfeInutilizacao.SetSerie(const Value :Integer): TNfeInutilizacao;
begin
  FSerie := Value;
end;

function TNfeInutilizacao.GetSerie :Integer;
begin
  Result := FSerie;
end;

function TNfeInutilizacao.SetProtocolo(const Value :String): TNfeInutilizacao;
begin
  FProtocolo := Value;
end;

function TNfeInutilizacao.GetProtocolo :String;
begin
  Result := FProtocolo;
end;

function TNfeInutilizacao.SetDthrrecbto(const Value :TDateTime): TNfeInutilizacao;
begin
  FDthrrecbto := Value;
end;

function TNfeInutilizacao.GetDthrrecbto :TDateTime;
begin
  Result := FDthrrecbto;
end;

function TNfeInutilizacao.SetJustificativa(const Value :TDateTime): TNfeInutilizacao;
begin
  FJustificativa := Value;
end;

function TNfeInutilizacao.GetJustificativa :TDateTime;
begin
  Result := FJustificativa;
end;

function TNfeInutilizacao.SetXml(const Value :TDateTime): TNfeInutilizacao;
begin
  FXml := Value;
end;

function TNfeInutilizacao.GetXml :TDateTime;
begin
  Result := FXml;
end;

end.

