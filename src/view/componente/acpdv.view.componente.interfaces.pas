unit acpdv.view.componente.interfaces;

interface

uses
  VCL.ExtCtrls;

type
  iImage = interface
    ['{DB388E19-9740-4018-B6A3-6352D72936A3}']
    function ResourceImage(aImage: TImage; aResource: String): iImage;
  end;

implementation

end.
