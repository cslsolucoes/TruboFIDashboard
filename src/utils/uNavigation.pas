/////////////////////////////////////////////////////////////////////////////
{
    Unit Vcl.Navigation
    Criação: 99 Coders | Heber Stein Mazutti
    Site: https://www.youtube.com/@99coders
    Versão: 1.2
}
/////////////////////////////////////////////////////////////////////////////



unit uNavigation;

interface

uses System.SysUtils, System.UITypes, Vcl.Forms, Vcl.Graphics, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.Classes, RzPanel;

type
  TNavigation = class
    private
      class var FrmOpen: TForm;
      class var FrmModalOpen: TForm;
      class var FrmModalOpen1: TForm;
      class var FrmModalFundo: TForm;
      class var FrmModalFundo1: TForm;
    public
      class var Titulo : String;
      class var ParamInt: integer;
      class var ParamStr: string;
      class var ExecuteOnClose: procedure of Object;

      class procedure Open(FrmClass: TFormClass; Frm: TForm; Parent: TPanel   = nil; const NumFrm : integer = 1); overload;
      class procedure Open(FrmClass: TFormClass; Frm: TForm; Parent: TRzPanel = nil; const NumFrm : integer = 1); overload;
      class procedure OpenModal(FrmClass: TFormClass; Frm: TForm; const NumFrm : integer = 1; Parent: TForm = nil);
      class procedure Close(Frm: TForm);
      class procedure CloseAndCancel(Frm: TForm);
    end;


implementation

uses
  Vcl.Controls;

class procedure TNavigation.Open(FrmClass: TFormClass; Frm: TForm; Parent: TPanel = nil; const NumFrm : integer = 1);
begin
    // Fecha o form caso tenha algo algum aberto...
    if Assigned(FrmOpen) then
    begin
        FrmOpen.Free;
        FrmOpen := nil
    end;

    if (FrmClass = nil) then
        exit;

    if NOT Assigned(Frm) then
        Application.CreateForm(FrmClass, Frm);

    if Parent <> nil then
    begin
        if Parent.ClassType = TPanel then
        begin
            Frm.Parent := TPanel(Parent);
            TPanel(Parent).Margins.Bottom := 1;
            TPanel(Parent).Margins.Bottom := 0;
        end
        else if Parent.ClassType = TForm then
            Frm.Parent := TForm(Parent);
    end;

    frm.Position    := poDefaultPosOnly;
    frm.WindowState := wsMaximized;
    FrmOpen := Frm; // Salva qual é o form aberto
    Frm.Show;
end;

class procedure TNavigation.Open(FrmClass: TFormClass; Frm: TForm;
  Parent: TRzPanel; const NumFrm: integer);
begin
    // Fecha o form caso tenha algo algum aberto...
    if Assigned(FrmOpen) then
    begin
        FrmOpen.Free;
        FrmOpen := nil
    end;

    if (FrmClass = nil) then
        exit;

    if NOT Assigned(Frm) then
        Application.CreateForm(FrmClass, Frm);

    if Parent <> nil then
    begin
        if Parent.ClassType = TRzPanel then
        begin
            Frm.Parent := TRzPanel(Parent);
            TRzPanel(Parent).Margins.Bottom := 1;
            TRzPanel(Parent).Margins.Bottom := 0;
            TRzPanel(Parent).Visible := True;

        end
        else if Parent.ClassType = TForm then
            Frm.Parent := TForm(Parent);
    end;

    frm.Position    := poDefaultPosOnly;
    frm.WindowState := wsMaximized;
    FrmOpen := Frm; // Salva qual é o form aberto
    Frm.Show;

end;

class procedure TNavigation.OpenModal(FrmClass: TFormClass; Frm: TForm; const NumFrm : integer = 1; Parent: TForm = nil );
begin
  Case NumFrm of
    1:Begin
      // Fundo opaco...
      if NOT Assigned(FrmModalFundo) then Begin
          FrmModalFundo := TForm.Create(Frm);
      End;

      FrmModalFundo.AlphaBlend := true;
      FrmModalFundo.AlphaBlendValue := 160;
      FrmModalFundo.Color := clBlack;

      if Parent = nil then
          FrmModalFundo.WindowState := wsMaximized
      else
      begin
          FrmModalFundo.WindowState := wsNormal;
          FrmModalFundo.Position := poDesigned;
          FrmModalFundo.Width := Parent.Width;
          FrmModalFundo.Height := Parent.Height;
          FrmModalFundo.Left := Parent.Left;
          FrmModalFundo.Top := Parent.Top;
      end;

      FrmModalFundo.BorderStyle := bsNone;

      if NOT Assigned(Frm) then
          Frm := FrmClass.Create(Frm);

      FrmModalFundo.Show;

      FrmModalOpen := Frm; // Salva qual é o form modal aberto...
      Frm.ShowModal;

    End;
    2:Begin
      if NOT Assigned(FrmModalFundo1) then Begin
          FrmModalFundo1 := TForm.Create(Frm);
      End;

      FrmModalFundo1.AlphaBlend := true;
      FrmModalFundo1.AlphaBlendValue := 160;
      FrmModalFundo1.Color := clBlack;

      if Parent = nil then
          FrmModalFundo1.WindowState := wsMaximized
      else
      begin
          FrmModalFundo1.WindowState := wsNormal;
          FrmModalFundo1.Position := poDesigned;
          FrmModalFundo1.Width := Parent.Width;
          FrmModalFundo1.Height := Parent.Height;
          FrmModalFundo1.Left := Parent.Left;
          FrmModalFundo1.Top := Parent.Top;
      end;

      FrmModalFundo1.BorderStyle := bsNone;

      //if NOT Assigned(Frm) then
      //    Frm := FrmClass.Create(Frm);

      FrmModalFundo1.Show;

      FrmModalOpen1 := Frm; // Salva qual é o form modal aberto...
      Frm.ShowModal;
    End;
  End;
end;

class procedure TNavigation.Close(Frm: TForm);
begin
  // Verifica se está fechando um modal...
  If Assigned(FrmModalOpen) Then Begin
    if Frm.Name = FrmModalOpen.Name then
    begin
        FrmModalFundo.Free;
        FrmModalFundo := nil;
    end;
  End;

  If Assigned(FrmModalOpen1) Then Begin
    if Frm.Name = FrmModalOpen1.Name then
    begin
        FrmModalFundo1.Free;
        FrmModalFundo1 := nil;
    end;
  End;

  if Assigned(ExecuteOnClose) then
  begin
      ExecuteOnClose();
      ExecuteOnClose := nil;
  end;

  Frm.Close;
end;

class procedure TNavigation.CloseAndCancel(Frm: TForm);
begin
    // Verifica se está fechando um modal...
    if Frm.Name = FrmModalOpen.Name then
    begin
        FrmModalFundo.Free;
        FrmModalFundo := nil;
    end;

    if Frm.Name = FrmModalOpen1.Name then
    begin
        FrmModalFundo1.Free;
        FrmModalFundo1 := nil;
    end;

    Frm.Close;
end;

end.
