unit acpdv.Model.Entidade.NfeEvento;

interface

type
  TNfeEvento = class
  private
    FDthrEvento :TDateTime;
    FSerie :Integer;
    FNumero :Integer;
    FTipo :String;
    FDescricao :String;
    FSequencia :Integer;
    FProtocolo :String;
    FDthrrecbto :TDateTime;
    FCstat :Integer;
    FXmotivo :String;
    FObservacao :String;
    FXml :String;

  public
    function GetDthrEvento :TDateTime;
    function SetDthrEvento(const Value :TDateTime): TNfeEvento;
    function GetSerie :Integer;
    function SetSerie(const Value :Integer): TNfeEvento;
    function GetNumero :Integer;
    function SetNumero(const Value :Integer): TNfeEvento;
    function GetTipo :String;
    function SetTipo(const Value :String): TNfeEvento;
    function GetDescricao :String;
    function SetDescricao(const Value :String): TNfeEvento;
    function GetSequencia :Integer;
    function SetSequencia(const Value :Integer): TNfeEvento;
    function GetProtocolo :String;
    function SetProtocolo(const Value :String): TNfeEvento;
    function GetDthrrecbto :TDateTime;
    function SetDthrrecbto(const Value :TDateTime): TNfeEvento;
    function GetCstat :Integer;
    function SetCstat(const Value :Integer): TNfeEvento;
    function GetXmotivo :String;
    function SetXmotivo(const Value :String): TNfeEvento;
    function GetObservacao :String;
    function SetObservacao(const Value :String): TNfeEvento;
    function GetXml :String;
    function SetXml(const Value :String): TNfeEvento;

    class function New: TNfeEvento;
end;

implementation

class function TNfeEvento.New: TNfeEvento;
begin
  Result := Self.Create;
end;

function TNfeEvento.SetDthrEvento(const Value :TDateTime): TNfeEvento;
begin
  FDthrEvento := Value;
end;

function TNfeEvento.GetDthrEvento :TDateTime;
begin
  Result := FDthrEvento;
end;

function TNfeEvento.SetSerie(const Value :Integer): TNfeEvento;
begin
  FSerie := Value;
end;

function TNfeEvento.GetSerie :Integer;
begin
  Result := FSerie;
end;

function TNfeEvento.SetNumero(const Value :Integer): TNfeEvento;
begin
  FNumero := Value;
end;

function TNfeEvento.GetNumero :Integer;
begin
  Result := FNumero;
end;

function TNfeEvento.SetTipo(const Value :String): TNfeEvento;
begin
  FTipo := Value;
end;

function TNfeEvento.GetTipo :String;
begin
  Result := FTipo;
end;

function TNfeEvento.SetDescricao(const Value :String): TNfeEvento;
begin
  FDescricao := Value;
end;

function TNfeEvento.GetDescricao :String;
begin
  Result := FDescricao;
end;

function TNfeEvento.SetSequencia(const Value :Integer): TNfeEvento;
begin
  FSequencia := Value;
end;

function TNfeEvento.GetSequencia :Integer;
begin
  Result := FSequencia;
end;

function TNfeEvento.SetProtocolo(const Value :String): TNfeEvento;
begin
  FProtocolo := Value;
end;

function TNfeEvento.GetProtocolo :String;
begin
  Result := FProtocolo;
end;

function TNfeEvento.SetDthrrecbto(const Value :TDateTime): TNfeEvento;
begin
  FDthrrecbto := Value;
end;

function TNfeEvento.GetDthrrecbto :TDateTime;
begin
  Result := FDthrrecbto;
end;

function TNfeEvento.SetCstat(const Value :Integer): TNfeEvento;
begin
  FCstat := Value;
end;

function TNfeEvento.GetCstat :Integer;
begin
  Result := FCstat;
end;

function TNfeEvento.SetXmotivo(const Value :String): TNfeEvento;
begin
  FXmotivo := Value;
end;

function TNfeEvento.GetXmotivo :String;
begin
  Result := FXmotivo;
end;

function TNfeEvento.SetObservacao(const Value :String): TNfeEvento;
begin
  FObservacao := Value;
end;

function TNfeEvento.GetObservacao :String;
begin
  Result := FObservacao;
end;

function TNfeEvento.SetXml(const Value :String): TNfeEvento;
begin
  FXml := Value;
end;

function TNfeEvento.GetXml :String;
begin
  Result := FXml;
end;

end.

