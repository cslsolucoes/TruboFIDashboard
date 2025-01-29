unit uSessao;

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
  IdHashMessageDigest, VirtualTable, VirtualQuery,

  Horse, horse.Jhonson, horse.JWT, Horse.HandleException, Horse.Compression,Horse.Exception.Logger,
  Horse.Logger,Horse.Logger.Provider.Console, Horse.Logger.Provider.LogFile,Horse.Utils.ClientIP,
  JOSE.Core.JWT, JOSE.Core.Builder, JOSE.Types.JSON, DataSet.Serialize, DataSet.Serialize.Config,
  RESTRequest4D, DataSet.Serialize.Adapter.RESTRequest4D, CSV.Adapter.RESTRequest4D, CSV.Adapter.RESTRequest4D.Config
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

BASE_URL_CSL = 'http://central.cslsolucoes.com.br:8122';
//BASE_URL_CSL = 'http://localhost:8122';

type
  Sessao = Class
  private
  protected
    class var FContratoId           : Integer;
    class var FProdutoId            : Integer;
    class var FContratoIdSGP        : Integer;
    class var FServidorId           : Integer;
    class var FVersaoId             : Integer;
    class var FPorta                : Integer;
    class var FProdutoDescricao     : String;
    class var FChaveLicenca         : String;

    class var FChaveJWT             : String;
    class var FKeyPath              : String;
    class var FCertPath             : String;

    class var FDadosCliente         : TJSONObject;

    class var FUsuario              : String;
    class var FSenha                : String;
    class var FIniPath              : String;
    class var FIniFileName          : String;
    class var FFileName             : String;
    class var FSessaoContrato       : String;
    class var FDataFinal            : TDateTime;
    class var FDataInicial          : TDatetime;

    class var FDebugSQL             : Boolean;

    class function getFUrlAPI: String; static;
    class function LoadIni          : Boolean;
    class function SaveIni          : Boolean;

    class function getFIniFile: String; static;
    class function getFDadosCliente : TJSONObject; static;
    class function getFConfig(const Atitulo, AChave: String): string; static;
    class function getFPort: Integer; static;
    class function getFDatabase: String; static;
    class function getFHost: String; static;
    class function getFPass: String; static;
    class function getFProvider: String; static;
    class function getFUser: String; static;

    class function  getPeriodo(Const AData : String = '' ; Const AFormat : String = 'mm/yyyy') : Boolean;
    class function  getLinceca      : Boolean;
    class function  getConfig       : Boolean;

    class function  EncriptMD5(APassword: String): String;

  public
    class var LTableConfiguracao    : TVirtualTable;

    class property  DebugSQL        : Boolean     read FDebugSQL     write FDebugSQL;
    class property  Usuario         : String      read FUsuario      write FUsuario;
    class property  Senha           : String      read FSenha        write FSenha;
    class property  ProdutoID       : Integer     read FProdutoID    write FProdutoID;
    class property  ContratoID      : Integer     read FContratoID   write FContratoID;
    class property  ChaveLicenca    : String      read FChaveLicenca write FChaveLicenca;
    class property  DadosCliente    : TJSONObject read getFDadosCliente;
    class property  SessaoContrato  : String      read FSessaoContrato;

    class property  Host            : String      read getFHost;
    class property  Database        : String      read getFDatabase;
    class property  User            : String      read getFUser;
    class property  Pass            : String      read getFPass;
    class property  Provider        : String      read getFProvider;
    class property  Port            : Integer     read getFPort;

    class property  DataInicial     : TDatetime   read FDataInicial;
    class property  DataFinal       : TDateTime   read FDataFinal;
    class property  IniFile         : String      read getFIniFile;

    class property  Config[Const Atitulo : String ;const AChave : String] : string read getFConfig;

    class property  UrlAPI           : String      read getFUrlAPI;
    class property  Porta            : Integer     read FPorta;
    class property  CertPath         : String      read FCertPath;
    class property  KeyPath          : String      read FKeyPath;
    class property  ChaveJWT         : String      read FChaveJWT;

    class Procedure LabelInit;

    class function  InitClass             : Boolean;
    class function  InitClassLicenca      : Boolean;
    class function  InitClassConfiguracao : Boolean;
    class function  Periodo(const AData: String = ''; Const AFormato: String = 'yyyy/mm/dd') : boolean;
  End;

implementation

{ Sessao }

class function Sessao.EncriptMD5(APassword: String): String;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Result := LowerCase
      (idmd5.HashStringAsHex(idmd5.HashStringAsHex(idmd5.HashStringAsHex
      (idmd5.HashStringAsHex(idmd5.HashStringAsHex(APassword))))));
  finally
    idmd5.Free;
  end;
end;

class function Sessao.getConfig: Boolean;
Var
LRequest : IRequest;
LResponse: IResponse;
begin
  Result   := False;
  Try
    LRequest := TRequest.New
          .BaseURL(BASE_URL_CSL)
          .Resource('/login/app')
          .AddBody(
                    TJSONObject.Create
                      .AddPair('contratoid'  ,FContratoId)
                      .AddPair('produtoid'   ,FProdutoID)
                      .AddPair('chavelicenca',FChaveLicenca)
                  );
    Try
      LResponse := LRequest.Post;
    Except on ex:exception do
      Begin
        If pos('(12029)', ex.Message)> 0 Then Begin
          ShowMessage('Erro ao conectar no servidor de API da CSL' + Lineending + 'O Sistema será encerrado!');
          halt;
        End;
      End;
    End;

    If LResponse.StatusCode = 200 Then Begin
      Result := True;
      FDadosCliente       := TJSONObject.Create.ParseJSONValue(LResponse.Content) as TJSONObject;

      FContratoId         := FDadosCliente.GetValue<integer>('contrato_id');
      FContratoIdSGP      := FDadosCliente.GetValue<Integer>('sgp_contrato_id');
      FServidorId         := FDadosCliente.GetValue<integer>('servidor_id');
      FVersaoId           := FDadosCliente.GetValue<integer>('versao_id');
      FPorta              := FDadosCliente.GetValue<integer>('porta');

      FChaveJWT           := FDadosCliente.GetValue<String>('chave_jwt');
      FProdutoDescricao   := FDadosCliente.GetValue<String>('produto_descricao');

      If Not Assigned(LTableConfiguracao) then
        LTableConfiguracao := TVirtualTable.Create(nil);

      LTableConfiguracao.Close;
      LTableConfiguracao.LoadStructure( FDadosCliente.GetValue<TJSONArray>('estrutura') );
      LTableConfiguracao.Open;
      LTableConfiguracao.Edit;
      LTableConfiguracao.LoadFromJSON( FDadosCliente.GetValue<TJSONArray>('dados') );
    End
  Finally

  End;
end;

class function Sessao.getFConfig(const Atitulo, AChave: String): string;
begin
  Result := '';
  If LTableConfiguracao.Active = True Then Begin
    LTableConfiguracao.Filter := 'titulo=' + QuotedStr(UpperCase(Atitulo)) + ' AND chave=' + QuotedStr(AChave);
    LTableConfiguracao.Filtered := True;
    If LTableConfiguracao.RecordCount > 0 then
      Result := LTableConfiguracao.FieldByName('valor').AsString;
    LTableConfiguracao.Filtered := false;
  End
  Else
    raise Exception.Create('LTableConfiguracao não ativa');
end;

class function Sessao.getFDadosCliente: TJSONObject;
begin
  If Assigned(FDadosCliente) Then
    Result := FDadosCliente
  Else
    Result := TJSONObject.ParseJSONValue('{}') as TJSONObject;
end;

class function Sessao.getFDatabase: String;
begin
  Result := getFConfig('ERP', 'database');
end;

class function Sessao.getFHost: String;
begin
  Result := getFConfig('ERP', 'host');
end;

class function Sessao.getFIniFile: String;
begin
  Result := FIniPath + FIniFileName;
end;

class function Sessao.getFPass: String;
begin
  Result := getFConfig('ERP', 'pass');
end;

class function Sessao.getFPort: Integer;
begin
  Result := getFConfig('ERP', 'port').ToInteger;
end;

class function Sessao.getFProvider: String;
begin
  Result := getFConfig('ERP', 'provider');
end;

class function Sessao.getFUrlAPI: String;
begin
  Result := getFConfig('ERP', 'url_api');
end;

class function Sessao.getFUser: String;
begin
  Result := getFConfig('ERP', 'user');
end;

class function Sessao.getLinceca: Boolean;
Var
LRequest : IRequest;
LResponse: IResponse;
begin
  Result   := False;
  Try
    LRequest := TRequest.New
          .BaseURL(BASE_URL_CSL)
          .Resource('/login/app')
          .AddBody(TJSONObject.Create
                      .AddPair('email',FUsuario)
                      .AddPair('senha',FSenha)
                      .AddPair('chavelicenca',FChaveLicenca)
                      .AddPair('produtoid',FProdutoID)
                  )
          ;
    Try
      LResponse := LRequest.Post;
    Except
      //Exit;
    End;

    If LResponse.StatusCode = 200 Then Begin
      Result := True;
      FDadosCliente       := TJSONObject.Create.ParseJSONValue(LResponse.Content) as TJSONObject;

      FContratoId         := FDadosCliente.GetValue<integer>('contrato_id');
      FContratoIdSGP      := FDadosCliente.GetValue<Integer>('sgp_contrato_id');
      FServidorId         := FDadosCliente.GetValue<integer>('servidor_id');
      FVersaoId           := FDadosCliente.GetValue<integer>('versao_id');
      FPorta              := FDadosCliente.GetValue<integer>('porta');

      FChaveJWT           := FDadosCliente.GetValue<String>('chave_jwt');
      FProdutoDescricao   := FDadosCliente.GetValue<String>('produto_descricao');

      If Not Assigned(LTableConfiguracao) then
        LTableConfiguracao := TVirtualTable.Create(nil);

      LTableConfiguracao.Close;
      LTableConfiguracao.LoadStructure( FDadosCliente.GetValue<TJSONArray>('estrutura') );
      LTableConfiguracao.Open;
      LTableConfiguracao.Edit;
      LTableConfiguracao.LoadFromJSON( FDadosCliente.GetValue<TJSONArray>('dados') );
      LTableConfiguracao.SaveToXML('teste.xml') ;

      SaveIni;
    End

//    Else halt

    ;
  Finally

  End;
end;

class function Sessao.getPeriodo(Const AData : String = '' ; Const AFormat : String = 'mm/yyyy') : Boolean;
Var
  fs: TFormatSettings;
  dt: TDateTime;
  d : String;
begin
  Result := False;
  fs := TFormatSettings.Create;
  fs.DateSeparator := '/';
  fs.ShortDateFormat := AFormat;
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';

  If AData.IsEmpty Then
    d := FormatDateTime('mm/yyyy', now)
  Else
    d := AData;

  dt := StrToDateTime(d, fs);

  FDataInicial := EncodeDate(YearOf(dt),monthOf(dt),1);
  FDataFinal   := EncodeDate(YearOf(dt),monthOf(dt),DaysInMonth(dt));
  Result:= True;
end;

class function Sessao.InitClass: Boolean;
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
  getPeriodo;
  Result := False;
  If LoadIni Then
    Result := getConfig
  Else Begin
    If getLinceca = False Then Begin
      ShowMessage('Configuração com problema');
      Exit;
    End;
    Result := True;
  End;
end;

class function Sessao.InitClassConfiguracao: Boolean;
begin
  Result := getConfig;
end;

class function Sessao.InitClassLicenca: Boolean;
begin
  Result := getLinceca;
end;

class procedure Sessao.LabelInit;
begin
  Writeln(format('CSL Tech - Soluções em Tecnologia Ltda. %s',[FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)]));
  Writeln(format('ContratoId %d ProdutoId %d ',[FContratoId, FProdutoId]));
  Writeln(format('Chave %s ' ,[FChaveLicenca]));
  Writeln(format('Descricao do Produto: %s ',[FProdutoDescricao]));
  Writeln(format('Servidor esta sendo executado %s:%d'  ,[Thorse.Host,Thorse.Port]));
  Writeln('Pressione ENTER para Sair');
  Readln;
  Halt;
end;

class function Sessao.LoadIni: Boolean;
Var
  JSon    : TJSONObject;
  IniFile : String;
  Ini     : TIniFile;
  Str     : String;
Begin
  FIniPath     := ExtractFilePath(ParamStr(0));
  FFileName    := ExtractFileName(ParamStr(0));
  FIniFileName := ChangeFileExt((ExtractFileName(ParamStr(0))), '.ini');

  // Gerando local e nome do arquivo ini
  IniFile := FIniPath + FIniFileName;

  // Sessão arquivo ini
  FSessaoContrato := 'Cliente';
  Str := 'Sessão não existe!';
  try
    // Criando arquivo ini
    Ini    := TIniFile.Create(IniFile);
    JSon   := TJSONObject.Create;
    try
      Result     := True;
      If Not ini.ValueExists(FSessaoContrato,'ContratoId') Then
        ini.WriteInteger(FSessaoContrato,'ContratoId', FContratoID);

      If Not ini.ValueExists(FSessaoContrato,'ProdutoId') Then
        ini.WriteInteger(FSessaoContrato,'ProdutoId', FProdutoId);

      If Not ini.ValueExists(FSessaoContrato,'ChaveLicenca') Then
        ini.WriteString(FSessaoContrato,'ChaveLicenca',FChaveLicenca);

      FContratoID   := Ini.ReadInteger( FSessaoContrato, 'ContratoId'   , FContratoID   );
      FProdutoId    := Ini.ReadInteger( FSessaoContrato, 'ProdutoId'    , FProdutoId    );
      FChaveLicenca := Ini.ReadString(  FSessaoContrato, 'ChaveLicenca' , FChaveLicenca );

      Result := (FContratoID > 0) and (FProdutoID > 0);
    finally
      Ini.Free;
      JSon.Free;
    End;
  except
    on ex: Exception do
    Begin
      ShowMessage(Format('Erro ao configurar arquivo INI, msg: %s',[ex.Message]));
    End;
  end;
end;

class function Sessao.SaveIni: Boolean;
Var
  JSon    : TJSONObject;
  IniFile : String;
  Ini     : TIniFile;
  Str     : String;
  i       : Integer;
Begin
  FIniPath     := ExtractFilePath(ParamStr(0));
  FFileName    := ExtractFileName(ParamStr(0));
  FIniFileName := ChangeFileExt((ExtractFileName(ParamStr(0))), '.ini');

  // Gerando local e nome do arquivo ini
  IniFile := FIniPath + FIniFileName;

  // Sessão arquivo ini
  FSessaoContrato := 'Cliente';
  Str := 'Sessão não existe!';
  try
    // Criando arquivo ini
    Ini    := TIniFile.Create(IniFile);
    JSon   := TJSONObject.Create;
    try
      Result     := True;
      ini.WriteInteger(FSessaoContrato,'ContratoId', FContratoID);
      ini.WriteInteger(FSessaoContrato,'ProdutoId', FProdutoId);
      ini.WriteString(FSessaoContrato,'ChaveLicenca',FChaveLicenca);
    finally
      Ini.Free;
      JSon.Free;
    End;
  except
    on ex: Exception do
    Begin
      ShowMessage(Format('Erro ao configurar arquivo INI, msg: %s',[ex.Message]));
    End;
  end;end;

class function Sessao.Periodo(const AData: String; Const AFormato: String) : boolean;
Var
  fs: TFormatSettings;
  dt: TDateTime;
  d : String;
begin
  fs := TFormatSettings.Create;
  fs.DateSeparator := '/';
  fs.ShortDateFormat := AFormato;
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';

  If AData.IsEmpty Then
    d := FormatDateTime(AFormato, now)
  Else
    d := AData+ '/01';

  dt := StrToDateTime(d, fs);

  FDataInicial := EncodeDate(YearOf(dt),monthOf(dt),1);
  FDataFinal   := EncodeDate(YearOf(dt),monthOf(dt),DaysInMonth(dt));
end;

end.
