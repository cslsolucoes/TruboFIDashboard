unit ufrmPrincipal;

interface

uses
{$IFDEF FPC}
  Classes, SysUtils, StrUtils, DateUtils, DB, fcJSon, Inifiles, Graphics, Forms, Dialogs,
{$ELSE}
  {$IFDEF MSWINDOWS}
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.ImgList,
  Vcl.ButtonStylesAttributes, Vcl.CategoryButtons, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StyledButton,
  {$ENDIF}
    IniFiles,System.SysUtils, System.Variants, System.Classes, System.JSON, System.StrUtils,
    System.DateUtils, System.ImageList, Data.DB, RzPanel,
{$ENDIF }

   uLoading, uNavigation, uSessao, ufrmCobrancaDashBoard, ufrmCobrancaRelatorio;

type
  TfrmPrincipal = class(TForm)
    iMenu: TImageList;
    iTitulo: TImageList;
    pnlTitulo: TRzPanel;
    Panel3: TRzPanel;
    btnMinimizar: TStyledSpeedButton;
    Panel4: TRzPanel;
    btnNormal: TStyledSpeedButton;
    Panel5: TRzPanel;
    btnClose: TStyledSpeedButton;
    pPrincipal: TRzPanel;
    imgWallPaper: TImage;
    sMenu: TSplitView;
    pnlMenuCobrancaGrafico: TRzPanel;
    btnCobrancaGrafico: TStyledSpeedButton;
    lbCobrancaGraficos: TLabel;
    pnlMenu: TRzPanel;
    btnMenu: TStyledSpeedButton;
    lbMenu: TLabel;
    Panel1: TRzPanel;
    lblNome: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image1: TImage;
    pnlBoton: TRzPanel;
    pContainer: TRzPanel;
    pnlMenuCobrancaRelatorio: TRzPanel;
    btnCobrancaRelatorio: TStyledSpeedButton;
    lbCobrancaRelatorio: TLabel;

    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnCobrancaGraficoClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnNormalClick(Sender: TObject);

    procedure CaptureMouse_Down(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CaptureMouse_Move(Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure CaptureMouse_Up(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnCobrancaRelatorioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Capture : Boolean;
  px,py : Integer;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  sMenu.Opened := Not (sMenu.Opened = True);
end;

procedure TfrmPrincipal.btnMinimizarClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

procedure TfrmPrincipal.btnNormalClick(Sender: TObject);
begin
  If TStyledSpeedButton(Sender).ImageIndex = 3 Then Begin
    TStyledSpeedButton(Sender).ImageIndex := 0;
    WindowState := TWindowState.wsNormal;
  End
  Else Begin
    TStyledSpeedButton(Sender).ImageIndex := 3;
    WindowState := TWindowState.wsMaximized;
  End;
end;

procedure TfrmPrincipal.CaptureMouse_Down(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Capture := not (WindowState = TWindowState.wsMaximized);
  If Capture Then
  Begin
    px := x;
    py := y;
  end;
end;

procedure TfrmPrincipal.CaptureMouse_Move(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Capture then
  Begin
    Left := (left + x) - px;
    Top  := (Top  + y) - py;
  end;
end;

procedure TfrmPrincipal.CaptureMouse_Up(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Capture:= False;
end;

procedure TfrmPrincipal.btnCobrancaGraficoClick(Sender: TObject);
begin
  TNavigation.Open(TfrmCobrancaDashboard, frmCobrancaDashboard, pContainer);
end;

procedure TfrmPrincipal.btnCobrancaRelatorioClick(Sender: TObject);
begin
  TNavigation.Open(TfrmCobranca, frmCobranca, pContainer);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  Sessao.DebugSQL := True;
{$ELSE}
  Sessao.DebugSQL := False;
{$ENDIF}
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  WindowState := TWindowState.wsMaximized;
end;

end.
