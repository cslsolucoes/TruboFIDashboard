unit ufrmCobrancaRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, Vcl.ComCtrls,  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.WinXCtrls,
  Vcl.Grids, Vcl.DBGrids,VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart,RzLabel, RzDTP, datelbl,RzPanel, DBAccess, Uni,

  uLoading, uNavigation, uSessao, services.cobranca, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, cxCurrencyEdit,
  dxSkinWhiteprint, dxSkinWXI, dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, cxMemo,
  ufrmCobrancaDetalhes
  ;

type
  TfrmCobranca = class(TForm)
    pnlHeader: TRzPanel;
    pnlBoton: TRzPanel;
    pPrincipal: TRzPanel;
    btnClose: TStyledSpeedButton;
    iTitulo: TImageList;
    pnlChamado: TRzPanel;
    dbGridChamado: TDBGrid;
    dsQryGrupo: TUniDataSource;
    dsQryChamado: TUniDataSource;
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
    pnlHeaderFiltro: TRzPanel;
    gbFiltroStatus: TGroupBox;
    cbFiltroStatus: TComboBox;
    lbFiltroStatus: TLabel;
    gbFiltroAssunto: TGroupBox;
    lbFiltroAssunto: TLabel;
    cbFiltroAssunto: TComboBox;
    gbFiltroAtendente: TGroupBox;
    lbFiltroAtendente: TLabel;
    cbFiltroAtendente: TComboBox;
    btnFiltrar: TStyledSpeedButton;
    pnlData: TPanel;
    lbTituloPeriodo_A: TLabel;
    pnlDataFinal: TRzPanel;
    lbDataFinal: TDateLabel;
    dtDataFinal: TRzDateTimePicker;
    pnlDataInicial: TRzPanel;
    lbDataInicial: TDateLabel;
    dtDataInicial: TRzDateTimePicker;
    pnlTipoFiltro: TPanel;
    lbTipoFiltro: TLabel;
    cbTipoFiltro: TComboBox;
    pnlPeriodo: TRzPanel;
    lbPeriodo: TLabel;
    cbPeriodo: TComboBox;
    lbTitulo: TLabel;
    StyledSpeedButton1: TStyledSpeedButton;

    procedure FormShow(Sender: TObject);

    procedure dbGridChamadoTitleClick(Column: TColumn);

    procedure btnCloseClick(Sender: TObject);

    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);

    procedure CaptureMouse_Down(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CaptureMouse_Move(Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure CaptureMouse_Up(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure On_Enter(Sender: TObject);
    procedure On_Exit(Sender: TObject);
    procedure On_KeyPress(Sender: TObject; var Key: char);
    procedure On_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure cbPeriodoChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure grfBarrasClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure lbTipoFiltroClick(Sender: TObject);
    procedure cbTipoFiltroCloseUp(Sender: TObject);

    procedure lbFiltroStatusClick(Sender: TObject);
    procedure lbFiltroAtendenteClick(Sender: TObject);
    procedure lbFiltroAssuntoClick(Sender: TObject);
    procedure cbPeriodoCloseUp(Sender: TObject);

  private
    { Private declarations }
  public
    Procedure Grafico1;
    Procedure Periodo;
    Procedure MesReferencia;
    Procedure TerminateLoad(Sender : TObject);
    Procedure RefreshConsulta;
    Procedure Consulta;

    { Public declarations }
  end;

var
  frmCobranca: TfrmCobranca;
  Capture : Boolean;
  px,py : Integer;
  Ordem       : String;
  idOrdem     : integer;
  ItemIndexAssunto, ItemIndexAtendente : integer;

implementation

{$R *.dfm}

procedure TfrmCobranca.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCobranca.btnFiltrarClick(Sender: TObject);
begin
 If cbTipoFiltro.ItemIndex = 0 Then
   Periodo;
 RefreshConsulta;
end;

procedure TfrmCobranca.CaptureMouse_Down(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Capture := not (WindowState = TWindowState.wsMaximized);
  If Capture Then
  Begin
    px := x;
    py := y;
  end;
end;

procedure TfrmCobranca.CaptureMouse_Move(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Capture then
  Begin
    Left := (left + x) - px;
    Top  := (Top  + y) - py;
  end;
end;

procedure TfrmCobranca.CaptureMouse_Up(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Capture:= False;
end;

procedure TfrmCobranca.cbTipoFiltroCloseUp(Sender: TObject);
begin
  pnlTipoFiltro.Align := alLeft;
  pnlPeriodo.Visible := (TComboBox(Sender).ItemIndex = 0) ;
  pnlData.Visible    := (TComboBox(Sender).ItemIndex = 1) ;
  pnlTipoFiltro.Align := alRight;
end;

procedure TfrmCobranca.cbPeriodoChange(Sender: TObject);
begin
  Periodo;
  //On_Exit(Sender);
end;

procedure TfrmCobranca.cbPeriodoCloseUp(Sender: TObject);
begin
  Periodo;
  On_Exit(Sender);
end;

procedure TfrmCobranca.dbGridChamadoTitleClick(Column: TColumn);
Var
  Str : String;
  Tp  : String;
begin

  If idOrdem = Column.Index Then Begin
    If pos('Desc',Ordem) > 0
    Then tp := ' Asc'
    Else tp := ' Desc'
  End
  Else tp := ' Asc';

  str := 'Order by ' + Column.FieldName + tp;

 {
  Case  Column.Index of
    0:Str :=  'Order by id' + tp;
    1:Str :=  'Order by status_char' + tp;
    2:Str :=  'Order by assunto' + tp;
    3:Str :=  'Order by id_cliente' + tp;
    4:Str :=  'Order by razao' + tp;
    5:Str :=  'Order by tecnico' + tp;
    6:Str :=  'Order by id_assunto' + tp;
    7:Str :=  'Order by mensagem_resposta_char' + tp;
    8:Str :=  'Order by data_inicio_m' + tp;
    9:Str :=  'Order by data_final_m' + tp;
    10:Str:=  'Order by data_abertura_m' + tp;
    11:Str:=  'Order by data_fechamento_m' + tp;
    12:Str:=  'Order by data_hora_assumido_m' + tp;

    Else     Str :=  'Order by razao asc';
  End;
}

  idOrdem := Column.Index;
  Ordem   := Str;
  ServicesCobranca.Ordem  :=  Str ;
  RefreshConsulta;
//  ServicesCobranca.ListaChamado(32,dtDataInicial.DateTime);
end;

procedure TfrmCobranca.FormShow(Sender: TObject);
Begin
  ServicesCobranca := TServicesCobranca.Create;
  MesReferencia;

  Ordem   := 'Order by razao Asc'   ;
  ServicesCobranca.Ordem  :=  Ordem ;
  idOrdem := 3;

  pnlPeriodo.Visible := True;
  pnlData.Visible    := False;

  cbTipoFiltro.ItemIndex := 0;
  cbFiltroStatus.ItemIndex := 0;
  cbFiltroAssunto.ItemIndex := 0;
  cbFiltroAtendente.ItemIndex := 0;
  ItemIndexAssunto   := -1;
  ItemIndexAtendente := -1;

  RefreshConsulta;
end;

procedure TfrmCobranca.Grafico1;
//var
// s,r: TTMSFNCChartSerie;
begin
{
 TMSFNCChart1.BeginUpdate;
 TMSFNCChart1.Title.Fill.Color := $0061B048;
 s := TMSFNCChart1.Series[0];
 s.Points.Clear;
 s.AddPoint(Random(100) + 40, gcDarkred,       'Dark Red');
 s.AddPoint(Random(100) + 40, gcSteelblue,     'Steel Blue');
 s.AddPoint(Random(100) + 40, gcYellowgreen,   'Yellow Green');
 s.AddPoint(Random(100) + 40, gcLightseagreen, 'Light Sea Green');
 s.AddPoint(Random(100) + 40, gcOrange,        'Orange');
 TMSFNCChart1.EndUpdate;

 TMSFNCChart2.BeginUpdate;
 TMSFNCChart2.Title.Fill.Color := $0061B048;
 r := TMSFNCChart2.Series[0];
 r.Points.Clear;
 r.AddPoint(Random(100) + 40, gcDarkred,       'Dark Red');
 r.AddPoint(Random(100) + 40, gcSteelblue,     'Steel Blue');
 r.AddPoint(Random(100) + 40, gcYellowgreen,   'Yellow Green');
 r.AddPoint(Random(100) + 40, gcLightseagreen, 'Light Sea Green');
 r.AddPoint(Random(100) + 40, gcOrange,        'Orange1');
 s.AddPoint(Random(100) + 40, gcAliceblue,     'Dark Red1');
 s.AddPoint(Random(100) + 40, gcAntiquewhite,  'Steel Blue1');
 s.AddPoint(Random(100) + 40, gcAzure,         'Yellow Green1');
 s.AddPoint(Random(100) + 40, gcBeige,         'Light Sea Green1');
 s.AddPoint(Random(100) + 40, gcBlanchedalmond,'Orange1');
 TMSFNCChart2.EndUpdate;
}
end;

procedure TfrmCobranca.grfBarrasClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ShowMessage(Series.SeriesIndex.ToString);

 TNavigation.OpenModal(TfrmCobrancaDetalhes,frmCobrancaDetalhes);

 ShowMessage('grfBarrasClickSeries ' + Series.SeriesIndex.ToString + '  ' + Series.XLabel[ValueIndex])
end;

procedure TfrmCobranca.LabelMouseEnter(Sender: TObject);
begin
  If Sender is TDateLabel Then Begin
    TDateLabel(sender).Color := $00AFE895;
    TDateLabel(sender).Font.Color := clBlack;
  End;
  If Sender is TLabel Then Begin
    TLabel(sender).Color := $00AFE895;
    TLabel(sender).Font.Color := clBlack;
  End;
end;

procedure TfrmCobranca.LabelMouseLeave(Sender: TObject);
begin
  If Sender is TDateLabel Then Begin
    TDateLabel(sender).Color := $0061B048;
    TDateLabel(sender).Font.Color := clWhite;
  End;
  If Sender is TLabel Then Begin
    TLabel(sender).Color := $0061B048;
    TLabel(sender).Font.Color := clWhite;
  End;
end;

procedure TfrmCobranca.lbFiltroAssuntoClick(Sender: TObject);
begin
  lbFiltroAssunto.Visible := False;
  cbFiltroAssunto.Visible := True;
  cbFiltroAssunto.SetFocus;
end;

procedure TfrmCobranca.lbFiltroAtendenteClick(Sender: TObject);
begin
  lbFiltroAtendente.Visible := False;
  cbFiltroAtendente.Visible := True;
  cbFiltroAtendente.SetFocus;
end;

procedure TfrmCobranca.lbFiltroStatusClick(Sender: TObject);
begin
  lbFiltroStatus.Visible := False;
  cbFiltroStatus.Visible := True;
  cbFiltroStatus.SetFocus;
end;

procedure TfrmCobranca.lbTipoFiltroClick(Sender: TObject);
begin
  lbTipoFiltro.Visible := False;
  cbTipoFiltro.Visible := True;
  cbTipoFiltro.SetFocus;
end;

procedure TfrmCobranca.MesReferencia;
Var
  TService : TServicesCobranca;
begin
  dtDataInicial.Date       := Sessao.DataInicial;
  dtDataFinal.Date         := Sessao.DataFinal;
  lbDataInicial.Caption    := FormatDateTime('dd/mm/yyyy',dtDataInicial.DateTime);
  lbDataFinal.Caption      := FormatDateTime('dd/mm/yyyy',dtDataFinal.DateTime);

  TService := TServicesCobranca.Create;
  Try
    With TService do Begin
      ListaPeriodo;
      cbPeriodo.Clear;
      While Not ReturnQry.Eof do
      Begin
        cbPeriodo.Items.Add(ReturnQry.FieldByName('meses').AsString);
        ReturnQry.Next;
      End;
      cbPeriodo.ItemIndex := 0;
      lbPeriodo.Caption   := cbPeriodo.Text;
      ReturnQry.Close;
    End;

  Finally
    TService.Free;
  End;
end;

procedure TfrmCobranca.On_Enter(Sender: TObject);
Var
  VName : String;
  i : integer;
begin
  If Sender.ToString = 'TDateLabel' Then Begin
    VName := stringReplace((Sender as TLabel).Name,'lb','dt',[rfReplaceAll, rfIgnoreCase]);
    TDateLabel(Sender).Visible := False;
    With TRzDateTimePicker(TDateLabel(Sender).Parent.FindChildControl(VName)) do Begin
      DateTime := StrToDateTime(TDateLabel(Sender).Caption);
      Visible := True;
      SetFocus;
    End;
  End;

  If Sender.ToString = 'TLabel' Then Begin
    VName := stringReplace((Sender as TLabel).Name,'lb','cb',[rfReplaceAll, rfIgnoreCase]);
    TLabel(Sender).Visible := False;
    With TComboBox(TLabel(Sender).Parent.FindChildControl(VName)) do Begin
      Visible := True;
      SetFocus;
    End;
    //TComboBox(TLabel(Sender).Parent.FindChildControl(VName)).
  End;
end;

procedure TfrmCobranca.On_Exit(Sender: TObject);
Var
  VName : String;
  i : integer;
begin

  If Sender.ToString = 'TComboBox'  Then Begin
    VName := stringReplace(TComboBox(Sender).Name,'cb','lb',[rfReplaceAll, rfIgnoreCase]);
    For i := 0 to  (ComponentCount -1) do Begin
      if Components[i].Name = VName then Begin
        TLabel(Components[i]).Caption := TComboBox(Sender).Text;
        TLabel(Components[i]).Visible := true;
        TComboBox(Sender).Visible := False;
        Break
      End;
    End;
  End;

  If Sender.ToString = 'TRzDateTimePicker'  Then Begin
    VName := stringReplace(TRzDateTimePicker(Sender).Name,'dt','lb',[rfReplaceAll, rfIgnoreCase]);
    For i := 0 to  (ComponentCount -1) do Begin
      if Components[i].Name = VName then Begin
        TDateLabel(Components[i]).Caption := FormatDateTime('dd/mm/yyyy', TRzDateTimePicker(Sender).DateTime);;
        TDateLabel(Components[i]).Visible := true;
        TRzDateTimePicker(Sender).Visible := False;
        Break
      End;
    End;
  End;
end;

procedure TfrmCobranca.On_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
If (Sender is TcxTextEdit)  Then
  With (Sender As TcxTextEdit) Do Begin
    Case AnsiIndexStr(Name, ['edtNumeroOS'])  of
      0:Begin
        Case Key of
         VK_RETURN : Begin
                      //DetalhesClick(Sender);
                      SetFocus;
                      SelectAll;
                     End;
         VK_DOWN   : Begin
                        If Not (dbGrid1.DataSource.DataSet.RecNo = dbGrid1.DataSource.DataSet.RecordCount) Then
                           dbGrid1.DataSource.DataSet.RecNo := dbGrid1.DataSource.DataSet.RecNo + 1
                        ;

                     End;
         VK_UP     : Begin
                        If Not (dbGrid1.DataSource.DataSet.RecNo = 1) Then
                        dbGrid1.DataSource.DataSet.RecNo := dbGrid1.DataSource.DataSet.RecNo - 1
                        ;
                     end;
         //Else ShowMessage(inttostr(Key));
        end;
      end;
    end;
  end;
}

end;

procedure TfrmCobranca.On_KeyPress(Sender: TObject; var Key: char);
begin
  If (Sender is TcxTextEdit)  Then
    With (Sender As TcxTextEdit) Do Begin
      If name = 'edtFiltrar' Then
      Begin
        If (Key = #13) Then begin
//           BotaoProcucar(Sender);
           SetFocus;
           SelectAll;
        end;
      end;
    end;
end;

procedure TfrmCobranca.Periodo;
begin
  lbPeriodo.Caption := cbPeriodo.Text;
  lbPeriodo.Visible := True;
  cbPeriodo.Visible := False;
  Sessao.Periodo(lbPeriodo.Caption);
  dtDataInicial.Date       := Sessao.DataInicial;
  dtDataFinal.Date         := Sessao.DataFinal;
  lbDataInicial.Caption    := FormatDateTime('dd/mm/yyyy',dtDataInicial.DateTime);
  lbDataFinal.Caption      := FormatDateTime('dd/mm/yyyy',dtDataFinal.DateTime);
End;

procedure TfrmCobranca.Consulta;
begin
  With ServicesCobranca do
  Begin
    ItemIndexAssunto   := cbFiltroAssunto.ItemIndex;
    ItemIndexAtendente := cbFiltroAtendente.ItemIndex;

    If cbTipoFiltro.ItemIndex = 0 Then Begin
      ListaChamado(32,dtDataInicial.DateTime);
    End
    Else Begin
      If cbTipoFiltro.ItemIndex = 1 Then
        ListaChamado(32,dtDataInicial.DateTime, dtDataFinal.DateTime);
    End;
  End;
end;

procedure TfrmCobranca.RefreshConsulta;
begin
  dsQryChamado.DataSet := nil;

  pPrincipal.Parent.Parent.Visible := false;
  TLoading.Show;

  ServicesCobranca.FiltroSQL := '';

  if (cbFiltroStatus.ItemIndex    > 0)
  Or (cbFiltroAssunto.ItemIndex   > 0)
  Or (cbFiltroAtendente.ItemIndex > 0) then Begin

    If cbFiltroStatus.ItemIndex > 0 Then
       ServicesCobranca.FiltroSQL := ServicesCobranca.FiltroSQL + 'AND status_char = ' + QuotedStr(cbFiltroStatus.Text)    + LineEnding;
    If cbFiltroAssunto.ItemIndex > 0 Then
       ServicesCobranca.FiltroSQL := ServicesCobranca.FiltroSQL + 'AND assunto     = ' + QuotedStr(cbFiltroAssunto.Text)   + LineEnding;
    If cbFiltroAtendente.ItemIndex > 0 Then
       ServicesCobranca.FiltroSQL := ServicesCobranca.FiltroSQL + 'AND tecnico     = ' + QuotedStr(cbFiltroAtendente.Text) + LineEnding;

  End;

  ServicesCobranca.Filtro := Not ServicesCobranca.FiltroSQL.IsEmpty;

  TLoading.ExecuteThread(procedure
  begin
    Consulta;
  end, TerminateLoad);
end;

procedure TfrmCobranca.TerminateLoad(Sender: TObject);
begin
  dbGridChamado.DataSource := dsQryChamado;

  pPrincipal.Visible := True;

  With ServicesCobranca do
  Begin

    If cbTipoFiltro.ItemIndex = 0 Then Begin
      ListaCombobox(32,'assunto',dtDataInicial.DateTime);
      cbFiltroAssunto.Clear;
      cbFiltroAssunto.Items.Add('TODOS');
      While Not QryCombobox.Eof do
      Begin
        cbFiltroAssunto.Items.Add(QryCombobox.FieldByName('assunto').AsString);
        QryCombobox.Next;
      End;
      ListaCombobox(32,'tecnico',dtDataInicial.DateTime);
      cbFiltroAtendente.Clear;
      cbFiltroAtendente.Items.Add('TODOS');
      While Not QryCombobox.Eof do
      Begin
        cbFiltroAtendente.Items.Add(QryCombobox.FieldByName('tecnico').AsString);
        QryCombobox.Next;
      End;
    End
    Else Begin
      If cbTipoFiltro.ItemIndex = 1 Then
        ListaCombobox(32,'assunto',dtDataInicial.DateTime, dtDataFinal.DateTime);
        cbFiltroAssunto.Clear;
        cbFiltroAssunto.Items.Add('TODOS');
        While Not QryCombobox.Eof do
        Begin
          cbFiltroAssunto.Items.Add(QryCombobox.FieldByName('assunto').AsString);
          QryCombobox.Next;
        End;
        ListaCombobox(32,'tecnico',dtDataInicial.DateTime, dtDataFinal.DateTime);
        cbFiltroAtendente.Clear;
        cbFiltroAtendente.Items.Add('TODOS');
        While Not QryCombobox.Eof do
        Begin
          cbFiltroAtendente.Items.Add(QryCombobox.FieldByName('tecnico').AsString);
          QryCombobox.Next;
        End;
    End;

    cbFiltroAssunto.ItemIndex   := ItemIndexAssunto ;
    cbFiltroAtendente.ItemIndex :=ItemIndexAtendente ;
    dsQryChamado.DataSet := QryChamado;

  End;

  pPrincipal.Parent.Parent.Visible := True;
  TLoading.Hide ;
end;

end.
