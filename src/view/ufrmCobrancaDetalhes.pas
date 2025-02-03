unit ufrmCobrancaDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, Vcl.ExtCtrls, RzPanel,
  uNavigation, Data.DB, Vcl.Grids, Vcl.DBGrids, services.cobranca, DBAccess, Uni,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinWXI,
  dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxTextEdit, Vcl.StdCtrls;

type
  TfrmCobrancaDetalhes = class(TForm)
    iTitulo: TImageList;
    pnlBoton: TRzPanel;
    pnlHeader: TRzPanel;
    btnClose: TStyledSpeedButton;
    pnlPrincipal: TRzPanel;
    dsQryGrupo: TUniDataSource;
    dbGridChamado: TDBGrid;
    pnlDadosOS: TRzPanel;
    gbId: TGroupBox;
    edtId: TcxDBTextEdit;
    gbNome: TGroupBox;
    edtNome: TcxDBTextEdit;
    gbIdCliente: TGroupBox;
    edtIdCliente: TcxDBTextEdit;
    gbAssunto: TGroupBox;
    edtAssunto: TcxDBTextEdit;
    gbStatus: TGroupBox;
    edtStatus: TcxDBTextEdit;
    gbHistorico: TGroupBox;
    edtHistorico: TcxDBTextEdit;
    GroupBox1: TGroupBox;
    cxDBMemo1: TcxDBMemo;
    GroupBox2: TGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    GroupBox3: TGroupBox;
    cxDBTextEdit2: TcxDBTextEdit;
    GroupBox4: TGroupBox;
    cxDBTextEdit3: TcxDBTextEdit;
    GroupBox5: TGroupBox;
    cxDBTextEdit4: TcxDBTextEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCobrancaDetalhes: TfrmCobrancaDetalhes;

implementation

{$R *.dfm}

procedure TfrmCobrancaDetalhes.btnCloseClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TfrmCobrancaDetalhes.FormShow(Sender: TObject);
begin
  dsQryGrupo.DataSet := nil;
  dsQryGrupo.DataSet := ServicesCobranca.QryChamado;
  pnlHeader.Caption := pnlHeader.Caption + '    ' + TUniQuery(dsQryGrupo.DataSet).FieldByName('tecnico').AsString + ' Quantidade : ' + TUniQuery(dsQryGrupo.DataSet).RecordCount.ToString;
end;

end.
