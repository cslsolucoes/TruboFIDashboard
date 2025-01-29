unit uLicenca;

{$ifdef FPC}
  {$MODE DELPHI}{$H+}
{$endif}

interface

uses
{$IFDEF FPC}
  Classes, SysUtils, StrUtils, DateUtils, DB, fcJSon, Inifiles,
{$ELSE}
  {$IFDEF MSWINDOWS}
    Winapi.Windows, Winapi.Messages,Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  {$ENDIF}
    IniFiles,System.SysUtils, System.Variants, System.Classes, System.JSON, System.StrUtils,
    System.DateUtils,  Data.DB,
{$ENDIF }
  DBAccess, Uni, MemDS, UniProvider, PostgreSQLUniProvider, SQLServerUniProvider, MySQLUniProvider,
  IdHashMessageDigest,

  Horse, horse.Jhonson, horse.JWT, Horse.HandleException, Horse.Compression,Horse.Exception.Logger,
  Horse.Logger,Horse.Logger.Provider.Console, Horse.Logger.Provider.LogFile,Horse.Utils.ClientIP,
  JOSE.Core.JWT, JOSE.Core.Builder, JOSE.Types.JSON, DataSet.Serialize, DataSet.Serialize.Config,
  RESTRequest4D, DataSet.Serialize.Adapter.RESTRequest4D, CSV.Adapter.RESTRequest4D, CSV.Adapter.RESTRequest4D.Config,
  uSessao
  ;

const
{$IFDEF FPC}
  ;
{$ELSE}
  LineEnding = #13#10;
  EmptyStr = '';

  {$IFDEF MSWINDOWS}
    DirectorySeparator = '\';
  {$ELSE}
    DirectorySeparator = '/';
  {$ENDIF}
{$ENDIF}

type
  TLicenca = Class
  private
  protected
    class var FContratoId       : Integer;
    class var FContratoIdSGP    : Integer;
    class var FProdutoId        : Integer;
    class var FServidorId       : Integer;
    class var FVersaoId         : Integer;
    class var FProdutoDescricao : String;
    class var FKeyPath          : String;
    class var FCertPath         : String;

    class var FUrlHost          : String;
    class var FUrlHostPorta     : Integer;
    class var FUrlResource      : String;
    class var FUrlBody          : TJSONObject;
    class var FUrlResposta      : String;
    class var FUrlSenha         : String;
    class var FUrlUsuario       : String;

    class var FChaveJWT         : String;
    class var FChaveLicenca     : String;
    class var FDadosCliente     : TJSONObject;
    class var FArquivoINI       : String;
    class var FSessaoContrato   : String;

    class function LoadINI      : Boolean;
    class function SaveINI      : Boolean;

    class function getToken : String;
    class function CarregaDados : Boolean;
    class function getChaveLicenca  : Boolean;
//    class function getContratoCliente  : Boolean;

  public
    Const Debug = True;
    class property  ContratoId       : Integer     read FContratoId;
    class property  ContratoIdSGP    : integer     read FContratoIdSGP;
    class property  ProdutoId        : Integer     read FProdutoId;
    class property  ServidorId       : Integer     read FServidorId;
    class property  VersaoId         : Integer     read FVersaoId;
    class property  ProdutoDescricao : String      read FProdutoDescricao;
    class property  CertPath         : String      read FCertPath;
    class property  KeyPath          : String      read FKeyPath;

    class property  UrlHost          : String      read FUrlHost       write FUrlHost;
    class property  UrlHostPorta     : Integer     read FUrlHostPorta  write FUrlHostPorta;
    class property  UrlResource      : String      read FUrlResource   write FUrlResource;
    class property  UrlBody          : TJSONObject read FUrlBody       write FUrlBody;
    class property  UrlResposta      : String      read FUrlResposta   write FUrlResposta;
    class property  UrlUsuario       : String      read FUrlUsuario    write FUrlUsuario;
    class property  UrlSenha         : String      read FUrlSenha      write FUrlSenha;

    class property  ChaveJWT         : String      read FChaveJWT;
    class property  ChaveLicenca     : String      read FChaveLicenca;
    class property  DadosCliente     : TJSONObject read FDadosCliente;

    class procedure InitClass;
  End;

implementation

{ Tlicenca }

class function TLicenca.CarregaDados: Boolean;
begin

end;

class function TLicenca.getChaveLicenca: Boolean;
var
  LResponse: IResponse;
begin
  Try
  LResponse := TRequest.New.BaseURL('http://localhost:8122')
    .Resource('/produto')
    .BasicAuthentication('turbofi','4djcqt6w')
    .TokenBearer('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MzY2MDczNTcsImlkIjoiMSIsIm5hbWUiOiJMaWNlblx1MDBFN2EgZGUgU29mdHdhcmVzIEdlc3RvciBDU0wiLCJlbWFpbCI6ImNzbHNvbHVjb2VzMUBnbWFpbC5jb20iLCJpYXQiOjE3MzQwMTUzNTd9.QbfAI1yFeFV_D-76Fo2izCRY0-Ka8QYSvMp-cr-fbo4')
    .Accept('application/json')
    .AddBody('{"licenca":"1fe83af4-8515-4775-a3af-22d202cf68ef"}')
    .get;

  if LResponse.StatusCode = 200 then
    ShowMessage(LResponse.Content);
  except

  End;
  halt;
end;

class function TLicenca.getToken: String;
var
  LJWT: TJWT;
//  LClaims: TServicesClaims;
  LToken: String;
begin
(*
  LJWT := TJWT.Create(TServicesClaims);
  LClaims := TServicesClaims(LJWT.Claims);
  try
    // Entra com o dados do payload
    LClaims.Expiration := IncDay(Now, 1);
    LClaims.Id         := Sessao.ProdutoId.ToString;
    LClaims.Name       := Sessao.ProdutoDescricao;
    LClaims.Email      := FUsuario;
    LClaims.IssuedAt   := now;

    // Geração do token
    FTokenJWT := '{"token":"'     + TJOSE.SHA256CompactToken(Sessao.ChaveJWT, LJWT) + '",' + LineEnding +
                 ' "ProdutoId":"' + LClaims.Id                                      + '",' + LineEnding +
                 ' "Nome":"'      + LClaims.Name                                    + '",' + LineEnding +
                 ' "Email":"'     + LClaims.Email                                   + '",' + LineEnding +
                 ' "Expiracao":"' + LClaims.Expiration.ToString                     + '",' + LineEnding +
                 ' "IssuwdAt":"'  + LClaims.IssuedAt.ToString                       + '"}' + LineEnding ;
    Result := True
  finally
    FreeAndNil(LJWT);
  end;
*)

end;

class procedure TLicenca.InitClass;
begin
   getChaveLicenca;
end;

class function TLicenca.LoadINI: Boolean;
Var
  Status: TJSONObject;
  JSon: TJSONObject;
  Ini: TIniFile;
  Str: String;
Begin
  // Gerando nome do arquivo INI
  FArquivoINI := ExtractFilePath(ParamStr(0)) + ChangeFileExt((ExtractFileName(ParamStr(0))), '.ini');
  // Sessão arquivo ini
  FSessaoContrato := 'Cliente';
  Str := 'Sessão não existe!';
  try
    Ini    := TIniFile.Create(FArquivoINI);
    JSon   := TJSONObject.Create;
    Status := TJSONObject.Create;
    try
      if Ini.SectionExists(FSessaoContrato) then begin
        FContratoId   := Ini.ReadInteger( FSessaoContrato, 'ContratoId'   , FContratoId );
        FProdutoId    := Ini.ReadInteger( FSessaoContrato, 'ProdutoId'    , FProdutoId );

        Status.AddPair('status', 'success'); // ctrl + espaço autocomplite
        Status.AddPair('msg', 'Load IniFiles success');
        Result     := True;
      end
      Else Begin
        {$IFDEF MSWINDOWS}
          ShowMessage(Str);
        {$ELSE}
          Writeln(Str);
          readln;
        {$ENDIF}
      end;
    finally
      Ini.DisposeOf;
      JSon.DisposeOf;
      Status.DisposeOf;
    End;
  except
    on ex: Exception do
    Begin
      Status.AddPair('status', 'error');
      Status.AddPair('msg', Format('Erro ao configurar banco, msg: %s',
        [ex.Message]));
    End;
  end;
end;

class function TLicenca.SaveINI: Boolean;
Var
  Status: TJSONObject;
  JSon: TJSONObject;
  Ini: TIniFile;
Begin
  // Gerando nome do arquivo INI
  FArquivoINI := ExtractFilePath(ParamStr(0)) + ChangeFileExt((ExtractFileName(ParamStr(0))), '.ini');
  // Sessão arquivo ini
  FSessaoContrato := 'Cliente';
  try
    Ini := TIniFile.Create(FArquivoINI);
    JSon := TJSONObject.Create;
    Status := TJSONObject.Create;
    try
      Ini.WriteInteger( FSessaoContrato, 'ContratoId'   , FContratoId );
      Ini.WriteInteger( FSessaoContrato, 'ProdutoId'    , FProdutoId );

      Status.AddPair('status', 'success');
      Status.AddPair('msg', 'Connect database success');
      Result     := True;
    finally
      Ini.DisposeOf;
      JSon.DisposeOf;
      Status.DisposeOf;
    End;
  except
    on ex: Exception do
    Begin
      Status.AddPair('status', 'error');
      Status.AddPair('msg', Format('Erro ao configurar banco, msg: %s',
        [ex.Message]));
    End;
  end;
end;

(*
class function TLicenca.getContratoCliente: Boolean;
var
  LResponse: IResponse;
begin

  LResponse := TRequest.New.BaseURL('http://localhost:8888/users')
    .TokenBearer('')
    .Accept('application/json')
    .AddBody('{"email":"cslsolucoes1@gmail.com","senha":"j2b681r7"}')
    .Post;

  if LResponse.StatusCode = 200 then
    ShowMessage(LResponse.Content);
end;
*)
end.
