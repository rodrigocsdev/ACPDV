{ *******************************************************************************
Title: PanelBorderColor
Description: Biblioteca para arrendondar as bordas dos panels

The MIT License

Copyright: Copyright (C) 2015

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

The author may be contacted at:
????

@author João
@version 1.0
******************************************************************************* }{}
unit upanelbordercolor;

interface

uses

  Windows,
  Messages,
  SysUtils,
  Classes,
  VCL.Graphics,
  VCL.ExtCtrls,
  VCL.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Direct2D,
  D2D1;

type

  TDestAlign = (alNone, alTop, alBottom, alLeft, alRight, alLeftRight, alTopBottom);

  TPanelBorderColor = class(VCL.ExtCtrls.TPanel)
    private
      FD2DCanvas: TDirect2DCanvas;
      FRadiusX : Integer;
      FRadiusY : Integer;
      FColor : TColor;
      FBorderColor : TColor;
      FBorderVisible : Boolean;
      FColorBackGround  : TColor;
      FDestWidth : Integer;
      FDestVisible : Boolean;
      FPenWidth : Integer;
      FExStyle : DWORD;
      FDestAlign : TDestAlign;
      procedure PaintBorder;
      procedure SetBorderColor(const Value: TColor);
      procedure SetPenWidth(const Value: Integer);
      procedure SetRadiusX(const Value: Integer);
      procedure SetRadiusY(const Value: Integer);
      procedure SetColorBackGround(const Value: TColor);
      procedure SetColor(const Value: TColor);
      procedure SetDestWidth(const Value: Integer);
      procedure SetDestVisible(const Value: Boolean);
      procedure SetBorderVisible(const Value: Boolean);
      procedure SetDestAlign(const Value: TDestAlign);
    protected
      procedure CreateParams(var Params : TCreateParams); override;
      procedure CreateWnd; override;
      procedure WMSize(var Message: TWMSize); message WM_SIZE;
      procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
      procedure CMMouseEnter(var Msg: TMessage); message CM_MouseEnter;
      procedure CMMouseLeave(var Msg: TMessage); message CM_MouseLeave;
      procedure WM_NCPaint(var Message : TWMNCPaint); message WM_NCPaint;
      procedure Paint; override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
    published
      property BorderRadiusX : Integer read FRadiusX write SetRadiusX;
      property BorderRadiusY : Integer read FRadiusY write SetRadiusY;
      property BorderColor : TColor read FBorderColor write SetBorderColor;
      property BorderVisible : Boolean read FBorderVisible write SetBorderVisible;
      property Color : TColor read FColor write SetColor;
      property ColorBackGround : TColor read FColorBackGround write SetColorBackGround;
      property BorderPenWidth : Integer read FPenWidth write SetPenWidth;
      property DestWidth : Integer read FDestWidth write SetDestWidth;
      property DestVisible : Boolean read FDestVisible write SetDestVisible;
      property DestAlign : TDestAlign read FDestAlign write SetDestAlign;
  end;

procedure Register;

implementation

{ TPanelBorderColor }

procedure TPanelBorderColor.CMMouseEnter(var Msg: TMessage);
begin
//  PaintStruct;
end;

procedure TPanelBorderColor.CMMouseLeave(var Msg: TMessage);
begin
// PaintStruct;
end;

constructor TPanelBorderColor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 200;
  Height := 50;
  BevelOuter:=bvNone;
  BorderStyle := bsNone;
  Caption:='';

  FColor := clbtnFace;
  FColorBackGround := clSilver;
  FBorderColor := clGray;
  FRadiusX := 10;
  FRadiusY := 10;
  FPenWidth := 2;
  FDestWidth:=70;
  FBorderVisible := True;
  FDestVisible:=True;
  FDestAlign:=alRight;

  DoubleBuffered:=False;
  ParentDoubleBuffered:=False;
  FullRepaint:=False;

  ControlStyle := ControlStyle - [csOpaque, csSetCaption] + [csAcceptsControls, csPannable];
end;

procedure TPanelBorderColor.CreateParams(var Params: TCreateParams);
begin

  inherited CreateParams(Params);

  with Params do
  begin
    FExStyle := ExStyle or WS_EX_TRANSPARENT;
    ExStyle := FExStyle;
  end;

end;

procedure TPanelBorderColor.CreateWnd;
begin
  inherited;
end;

destructor TPanelBorderColor.Destroy;
begin
  if Assigned(FD2DCanvas) then
    FreeAndNil(FD2DCanvas);
  inherited;
end;


procedure TPanelBorderColor.Paint;
begin
  inherited;
  PaintBorder;
end;

procedure TPanelBorderColor.PaintBorder;
var
  RRect, RRect2: TD2D1RoundedRect;
  Rect : D2D1_Rect_F;
begin
  FD2DCanvas := TDirect2DCanvas.Create(Canvas, ClientRect);
try

  D2D1RenderTargetProperties(D2D1_RENDER_TARGET_TYPE_DEFAULT);
  FD2DCanvas.RenderTarget.SetAntialiasMode(D2D1_ANTIALIAS_MODE_PER_PRIMITIVE);
  FD2DCanvas.RenderTarget.SetTransform(TD2DMatrix3x2F.Identity);
  FD2DCanvas.RenderTarget.BeginDraw;

  FD2DCanvas.Brush.Style:=bsSolid;
  FD2DCanvas.Brush.Color:=FColorBackGround;

  RRect.Rect.Left:=ClientRect.Left+2;
  RRect.Rect.Top:=ClientRect.Top+2;
  RRect.Rect.Right:=ClientRect.Right-2;
  RRect.Rect.Bottom:=ClientRect.Bottom-2;
  RRect.RadiusX:=FRadiusX;
  RRect.RadiusY:=FRadiusY;

  FD2DCanvas.FillRoundedRectangle(RRect);

  if (FDestVisible=True) then
  begin

    if FDestAlign=alRight then
    begin

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Right-FDestWidth;
      RRect2.Rect.Top:=ClientRect.Top+2;
      RRect2.Rect.Right:=ClientRect.Right-2;
      RRect2.Rect.Bottom:=ClientRect.Bottom-2;
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=(ClientRect.Right-(FDestWidth+2));
      Rect.Top:=ClientRect.Top+2;
      Rect.Right:=ClientRect.Right-(FDestWidth-8);
      Rect.Bottom:=ClientRect.Bottom-2;

      FD2DCanvas.FillRectangle(Rect);
    end;


    if FDestAlign=alLeft then
    begin
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Left;
      RRect2.Rect.Top:=ClientRect.Top+2;
      RRect2.Rect.Right:=ClientRect.Left+(FDestWidth+2);
      RRect2.Rect.Bottom:=ClientRect.Bottom-2;
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=(ClientRect.Left+(FDestWidth+2));
      Rect.Top:=ClientRect.Top+2;
      Rect.Right:=ClientRect.Left+(FDestWidth-8);
      Rect.Bottom:=ClientRect.Bottom-2;

      FD2DCanvas.FillRectangle(Rect);
    end;


    if FDestAlign=alLeftRight then
    begin
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Right-FDestWidth;
      RRect2.Rect.Top:=ClientRect.Top+2;
      RRect2.Rect.Right:=ClientRect.Right-2;
      RRect2.Rect.Bottom:=ClientRect.Bottom-2;
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=(ClientRect.Right-(FDestWidth+2));
      Rect.Top:=ClientRect.Top+2;
      Rect.Right:=ClientRect.Right-(FDestWidth-8);
      Rect.Bottom:=ClientRect.Bottom-2;

      FD2DCanvas.FillRectangle(Rect);

      //
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Left;
      RRect2.Rect.Top:=ClientRect.Top+2;
      RRect2.Rect.Right:=ClientRect.Left+(FDestWidth+2);
      RRect2.Rect.Bottom:=ClientRect.Bottom-2;
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=(ClientRect.Left+(FDestWidth+2));
      Rect.Top:=ClientRect.Top+2;
      Rect.Right:=ClientRect.Left+(FDestWidth-8);
      Rect.Bottom:=ClientRect.Bottom-2;

      FD2DCanvas.FillRectangle(Rect);


    end;


    if FDestAlign=alTop then
    begin
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Left+2;
      RRect2.Rect.Top:=ClientRect.Top+2;
      RRect2.Rect.Right:=ClientRect.Right-2;
      RRect2.Rect.Bottom:=ClientRect.Top+2+(FDestWidth+2);
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=ClientRect.Left+2;
      Rect.Top:=ClientRect.Top+(FDestWidth-2);
      Rect.Right:=ClientRect.Right-2;
      Rect.Bottom:=ClientRect.Top+(FDestWidth+8);

      FD2DCanvas.FillRectangle(Rect);
    end;


    if FDestAlign=alBottom then
    begin
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Left+2;
      RRect2.Rect.Top:=ClientRect.Bottom-2;
      RRect2.Rect.Right:=ClientRect.Right-2;
      RRect2.Rect.Bottom:=ClientRect.Bottom-2-(FDestWidth+2);
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=ClientRect.Left+2;
      Rect.Top:=ClientRect.Bottom-(FDestWidth-2);
      Rect.Right:=ClientRect.Right-2;
      Rect.Bottom:=ClientRect.Bottom-(FDestWidth+8);

      FD2DCanvas.FillRectangle(Rect);
    end;

    if FDestAlign=alTopBottom then
    begin
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Left+2;
      RRect2.Rect.Top:=ClientRect.Top+2;
      RRect2.Rect.Right:=ClientRect.Right-2;
      RRect2.Rect.Bottom:=ClientRect.Top+2+(FDestWidth+2);
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=ClientRect.Left+2;
      Rect.Top:=ClientRect.Top+(FDestWidth-2);
      Rect.Right:=ClientRect.Right-2;
      Rect.Bottom:=ClientRect.Top+(FDestWidth+8);

      FD2DCanvas.FillRectangle(Rect);
      //
      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FBorderColor;

      RRect2.Rect.Left:=ClientRect.Left+2;
      RRect2.Rect.Top:=ClientRect.Bottom-2;
      RRect2.Rect.Right:=ClientRect.Right-2;
      RRect2.Rect.Bottom:=ClientRect.Bottom-2-(FDestWidth+2);
      RRect2.RadiusX:=FRadiusX;
      RRect2.RadiusY:=FRadiusY;

      FD2DCanvas.FillRoundedRectangle(RRect2);

      FD2DCanvas.Brush.Style:=bsSolid;
      FD2DCanvas.Brush.Color:=FColorBackGround;

      Rect.Left:=ClientRect.Left+2;
      Rect.Top:=ClientRect.Bottom-(FDestWidth-2);
      Rect.Right:=ClientRect.Right-2;
      Rect.Bottom:=ClientRect.Bottom-(FDestWidth+8);

      FD2DCanvas.FillRectangle(Rect);
    end;

  end;


  if (FBorderVisible=True) then
  begin

    FD2DCanvas.Brush.Style:=bsSolid;
    FD2DCanvas.Pen.Width:=FPenWidth;
    FD2DCanvas.Pen.Color:= FBorderColor;

    RRect.Rect.Left:=ClientRect.Left+2;
    RRect.Rect.Top:=ClientRect.Top+2;
    RRect.Rect.Right:=ClientRect.Right-2;
    RRect.Rect.Bottom:=ClientRect.Bottom-2;
    RRect.RadiusX:=FRadiusX;
    RRect.RadiusY:=FRadiusY;

    FD2DCanvas.DrawRoundedRectangle(RRect);

  end;

finally
  FD2DCanvas.RenderTarget.EndDraw;
  FreeAndNil(FD2DCanvas);
end;

end;

procedure TPanelBorderColor.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetBorderVisible(const Value: Boolean);
begin
  FBorderVisible := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetColor(const Value: TColor);
begin
  FColor := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetColorBackGround(const Value: TColor);
begin
  FColorBackGround := Value;
  PaintBorder;
End;

procedure TPanelBorderColor.SetDestAlign(const Value: TDestAlign);
begin
  FDestAlign := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetDestVisible(const Value: Boolean);
begin
  FDestVisible := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetDestWidth(const Value: Integer);
begin
  FDestWidth := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetPenWidth(const Value: Integer);
begin
  FPenWidth := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.SetRadiusX(const Value: Integer);
begin
  FRadiusX := Value;
  PaintBorder;
end;


procedure TPanelBorderColor.SetRadiusY(const Value: Integer);
begin
  FRadiusY := Value;
  PaintBorder;
end;

procedure TPanelBorderColor.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
End;

procedure TPanelBorderColor.WMSize(var Message: TWMSize);
var
  S: TD2DSizeU;
begin
  if Assigned(FD2DCanvas) then
  begin
    S := D2D1SizeU(ClientWidth, ClientHeight);
    ID2D1HwndRenderTarget(FD2DCanvas.RenderTarget).Resize(S);
  end;
  Realign;
  PaintBorder;
  Invalidate;
end;

procedure TPanelBorderColor.WM_NCPaint(var Message: TWMNCPaint);
begin
 PaintBorder;
 Invalidate;
end;

procedure Register;
begin
  RegisterComponents('Standard', [TPanelBorderColor]);
end;

initialization
  RegisterClass(TPanelBorderColor);

end.
