program DashBoard;

uses
  Vcl.Forms,
  ufrmUtil in 'src\view\ufrmUtil.pas' {Form1},
  uProviders in 'src\providers\uProviders.pas' {Providers: TDataModule},
  services.cobranca in 'src\services\services.cobranca.pas',
  uProvidersCliente in 'src\providers\uProvidersCliente.pas' {ProvidersClientes: TDataModule},
  uFormatString in 'src\utils\uFormatString.pas',
  uLoading in 'src\utils\uLoading.pas',
  uNavigation in 'src\utils\uNavigation.pas',
  uSessao in 'src\utils\uSessao.pas',
  ufrmCobrancaDashBoard in 'src\view\ufrmCobrancaDashBoard.pas' {frmCobrancaDashboard},
  ufrmCobrancaDetalhes in 'src\view\ufrmCobrancaDetalhes.pas' {frmCobrancaDetalhes},
  ufrmCobrancaRelatorio in 'src\view\ufrmCobrancaRelatorio.pas' {frmCobranca},
  ufrmMensagem in 'src\view\ufrmMensagem.pas' {frmMensagem},
  ufrmPrincipal in 'src\view\ufrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Sessao.ProdutoID := 2;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  If Not Sessao.InitClass Then
    Application.CreateForm(TfrmMensagem, frmMensagem)
  Else
    Application.CreateForm(TfrmPrincipal, frmPrincipal);

  Application.Run;
end.
