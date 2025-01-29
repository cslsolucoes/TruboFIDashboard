unit ufrmMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, System.ImageList,
  Vcl.ImgList, Vcl.ButtonStylesAttributes, Vcl.StyledButton, Vcl.StdCtrls,
  uSessao, ufrmPrincipal, uNavigation;

type
  TfrmMensagem = class(TForm)
    pnlHeader: TRzPanel;
    iTitulo: TImageList;
    btnClose: TStyledSpeedButton;
    pnlBoton: TRzPanel;
    pPrincipal: TRzPanel;
    pLogin: TRzPanel;
    lbTituloAcesso: TLabel;
    lbUsuario: TLabel;
    lbInformativo: TLabel;
    lbSenha: TLabel;
    pnlAcessar: TRzPanel;
    btnAcessar: TStyledSpeedButton;
    pnlUsuario: TRzPanel;
    edtUsuario: TEdit;
    pnlSenha: TRzPanel;
    edtSenha: TEdit;
    lbChave: TLabel;
    pnlChave: TRzPanel;
    edtChave: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}

procedure TfrmMensagem.btnAcessarClick(Sender: TObject);
begin
  Sessao.Usuario      := Trim(edtUsuario.Text);
  Sessao.Senha        := Trim(edtSenha.Text);
  Sessao.ChaveLicenca := Trim(edtChave.Text);
  If Sessao.InitClassLicenca Then begin
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
      frmPrincipal.ShowModal;
  end
  Else Begin
    Showmessage('Erro ao validar licença!');
  End;
  Close;
end;

procedure TfrmMensagem.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMensagem.FormShow(Sender: TObject);
begin
  Height := 470;
  Width  := 420;
end;

end.
