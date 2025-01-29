unit ufrmCobrancaDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, Vcl.ExtCtrls, RzPanel,
  uNavigation, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCobrancaDetalhes = class(TForm)
    iTitulo: TImageList;
    pnlBoton: TRzPanel;
    pnlHeader: TRzPanel;
    btnClose: TStyledSpeedButton;
    pnlPrincipal: TRzPanel;
    DBGrid1: TDBGrid;
    procedure btnCloseClick(Sender: TObject);
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

end.
