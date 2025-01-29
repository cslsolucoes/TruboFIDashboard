unit uProvidersCliente;

{$ifdef FPC}
  {$MODE DELPHI}{$H+}
{$endif}

interface

uses
{$IFDEF FPC}
  Classes, SysUtils, StrUtils, DateUtils, DB, JSon, Inifiles,
{$ELSE}
  {$IFDEF MSWINDOWS}
    Winapi.Windows, Winapi.Messages,Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  {$ENDIF}
    System.SysUtils, System.Variants, System.Classes, System.JSON, System.StrUtils,
    System.DateUtils, System.IniFiles, Data.DB,
{$ENDIF }
  DBAccess, Uni, MemDS, UniProvider, PostgreSQLUniProvider, SQLServerUniProvider, MySQLUniProvider,
  IdHashMessageDigest, Horse, DataSet.Serialize, DataSet.Serialize.Config,

  VirtualTable, VirtualQuery, uSessao

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

{$IFDEF DEBUG}
  Debug = True;
{$ELSE}
  Debug = False;
{$ENDIF}

type
  TProvidersClientes = class(TDataModule)
    FConn: TUniConnection;
    FPostgresSQL: TPostgreSQLUniProvider;
    FSQLServer: TSQLServerUniProvider;
    FMySQL: TMySQLUniProvider;
    FConnL: TUniConnection;
    Qry: TUniQuery;
    ReturnQry: TUniQuery;
    qryVirutal: TVirtualQuery;
    TbVirutal: TVirtualTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  Protected
    FArquivoINI  : String;
    FSessao      : String;
    FDadosINIJson: TJSONObject;

    FProvider    : String;
    FHost        : String;
    FPorta       : Integer;
    FDataBase    : String;
    FUsuario     : String;
    FSenha       : String;
    FURL_Base    : String;

    FSchema      : String;
    FTabela      : String;
    FTabelaAlias : String;
    FTabelaTexto : String;
    FSQLText     : String;
    FSchemaTable : TJSONArray;
    FPrimaryKey  : String;
    FFields      : TJSONArray;

    FMensagens   : TJSONObject;
    FReturnJson  : TJSONArray;
    FReturn      : String;

    function getFConn         : Boolean;
    function getSQLTables     : String;
    function getSQLPrimaryKey : String;
    function getSQLFields     : String;
    { Protected declarations }
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Conn       : TUniConnection read FConn        write FConn;
    property ConnStatus : Boolean        read getFConn;
    property Provider   : String         read FProvider    write FProvider;
    property Porta      : Integer        read FPorta       write FPorta;
    property Host       : String         read FHost        write FHost;
    property Usuario    : String         read FUsuario     write FUsuario;
    property Senha      : String         read FSenha       write FSenha;
    property DataBase   : String         read FDataBase    write FDataBase;
    property URL_Base   : String         read FURL_Base    write FURL_Base;

    property Schema     : String         read FSchema      write FSchema;
    property Tabela     : String         read FTabela      write FTabela;
    property TabelaAlias: String         read FTabelaAlias write FTabelaAlias;
    property SQLText    : String         read FSQLText     write FSQLText;
    property PrimaryKey : string         read FPrimaryKey  write FPrimaryKey ;
    property Fields     : TJSONArray     read FFields      write FFields;

    property INIArquivo : String         read FArquivoINI  write FArquivoINI;
    property INISessao  : String         read FSessao      write FSessao;

    property Mensagens  : TJSONObject    read FMensagens   write FMensagens;
    property ReturnJson : TJSONArray     read FReturnJson  write FReturnJson;
    property Return     : String         read FReturn      write FReturn;

    Procedure InitializeClass;

    Function InitTable(ASchema,ATabela,ATabelaAlias : String; Const  ASQL : String = ''  ) : String; overload;
    Function InitTable : String; overload;
    Function InitQuery(ASql: String): TUniQuery; overload;
    Function InitQuery: TUniQuery; overload;

    Function EncriptMD5(APassword: String): String;
    Function LoadINI: Boolean;
    Function SaveINI: Boolean;

    Function Conectar: Boolean;
    Procedure Disconectar;
    { Public declarations }
  end;


var
  ProvidersClientes: TProvidersClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TProvidersClientes.Conectar: Boolean;
begin
  Try
    If not Assigned(FConn) Then
    Begin
      If not Assigned(FSQLServer) Then
        FSQLServer := TSQLServerUniProvider.Create(nil);
      FConn := TUniConnection.Create(Nil);
    end;
    FConn.Connected := True;
    Result := True;
  except
    Result := False;
  End;
end;

constructor TProvidersClientes.Create;
begin
  InitializeClass;
end;

procedure TProvidersClientes.DataModuleCreate(Sender: TObject);
begin
  InitializeClass;
end;

destructor TProvidersClientes.Destroy;
begin
  inherited Destroy;
end;

procedure TProvidersClientes.Disconectar;
begin
  if Assigned(FConn) then
  begin
    if FConn.Connected then
      FConn.Connected := False;
    FConn.Free;
  end;
end;

function TProvidersClientes.EncriptMD5(APassword: String): String;
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

function TProvidersClientes.getFConn: Boolean;
begin
  If Assigned(FConn) Then
    Result := FConn.Connected;
end;

function TProvidersClientes.getSQLFields: String;
Const
  SQLFieldsPostgreSQL  =
      'select table_catalog,                                   ' + LineEnding +
      '       table_schema,                                    ' + LineEnding +
      '       table_name,                                      ' + LineEnding +
      '       ordinal_position,                                ' + LineEnding +
      '       column_name,                                     ' + LineEnding +
      '       data_type,                                       ' + LineEnding +
      '       character_maximum_length                         ' + LineEnding +
      'from INFORMATION_SCHEMA.COLUMNS                         ' + LineEnding +
      'where table_name = ''[VName]''                          ' + LineEnding ;

  SQLFieldsMySQL =
      'With colunas as (                                               ' + LineEnding +
      'SELECT                                                          ' + LineEnding +
      ' TABLE_CATALOG,TABLE_SCHEMA,TABLE_NAME, ORDINAL_POSITION,       ' + LineEnding +
      ' COLUMN_NAME, COLUMN_TYPE, CHARACTER_MAXIMUM_LENGTH, COLUMN_KEY ' + LineEnding +
      'FROM INFORMATION_SCHEMA.COLUMNS                                 ' + LineEnding +
      'WHERE TABLE_SCHEMA = ''ixcprovedor''                            ' + LineEnding +
      'AND   TABLE_NAME   = ''cliente''                                ' + LineEnding +
      'ORDER BY table_name,ORDINAL_POSITION                            ' + LineEnding +
      ')                                                               ' + LineEnding +
      'Select * from colunas                                           ' + LineEnding ;

Var
  _SQL : String;
  QryAux : TUniQuery;
Begin
  If FProvider.Equals('MySQL') Then
    _SQL := SQLFieldsMySQL
  Else If FProvider.Equals('PostgreSQL') Then
         _SQL := SQLFieldsPostgreSQL;

  _SQL := StringReplace(_SQL,'[VName]'  ,FTabela,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  Try
    QryAux.Open;
    FFields := QryAux.ToJSONArray;
    If Debug = True Then QryAux.SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'getSQLFields' + '.xml');
    If Debug = True Then QryAux.SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'getSQLFields' + '.sql');
  Finally
    QryAux.Free;
  End;
end;

function TProvidersClientes.getSQLPrimaryKey: String;
Const
  SQLPrimaryKeyPostgreSQL =
      'select kcu.table_catalog    as database,                ' + LineEnding +
      '       kcu.table_schema     as schema,                  ' + LineEnding +
      '       kcu.table_name       as table,                   ' + LineEnding +
      '       tco.constraint_name  as constraint,              ' + LineEnding +
      '       kcu.ordinal_position as position,                ' + LineEnding +
      '       kcu.column_name      as columns                  ' + LineEnding +
      'from information_schema.table_constraints tco           ' + LineEnding +
      'join information_schema.key_column_usage kcu            ' + LineEnding +
      '     on kcu.constraint_name    = tco.constraint_name    ' + LineEnding +
      '     and kcu.constraint_schema = tco.constraint_schema  ' + LineEnding +
      '     and kcu.constraint_name   = tco.constraint_name    ' + LineEnding +
      'where tco.constraint_type = ''PRIMARY KEY''             ' + LineEnding +
      'and   kcu.table_schema    = ''[VSchema]''               ' + LineEnding +
      'and   kcu.table_name      = ''[VName]''                 ' + LineEnding ;

  SQLPrimaryKeyMySQL =
      'With chave as (                                         ' + LineEnding +
      'SELECT TABLE_SCHEMA, TABLE_NAME, ORDINAL_POSITION,      ' + LineEnding +
      'COLUMN_NAME as COLUMNS, DATA_TYPE, COLUMN_TYPE, COLUMN_KEY, EXTRA  ' + LineEnding +
      'FROM INFORMATION_SCHEMA.COLUMNS                         ' + LineEnding +
      'WHERE COLUMN_KEY   = ''PRI''                            ' + LineEnding +
      'AND   TABLE_SCHEMA = ''[VSchema]''                      ' + LineEnding +
      'AND   TABLE_NAME   = ''[VName]''                        ' + LineEnding +
      'ORDER BY TABLE_NAME,ORDINAL_POSITION                    ' + LineEnding +
      ')                                                       ' + LineEnding +
      'Select * from chave                                     ' + LineEnding ;
Var
  _SQL : String;
  QryAux : TUniQuery;
Begin
  If FProvider.Equals('MySQL') Then
    _SQL := SQLPrimaryKeyMySQL
  Else If FProvider.Equals('PostgreSQL') Then
         _SQL := SQLPrimaryKeyPostgreSQL;

  _SQL := StringReplace(_SQL,'[VSchema]'  ,FSchema,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL,'[VName]'    ,FTabela,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  If Debug = True Then QryAux.SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TProvidersClientes.getSQLPrimaryKey' + '.sql');
  Try
    QryAux.Open;
    If Not QryAux.IsEmpty Then Begin
      If Debug = True Then QryAux.SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TProvidersClientes.getSQLPrimaryKey' + '.xml');
      FPrimaryKey := QryAux.FieldByName('columns').AsString;
      Result := FPrimaryKey ;
    End
    Else Raise Exception.Create('Não há Primary Key');
  Finally
    QryAux.Free;
  End;
end;

function TProvidersClientes.getSQLTables: String;
Const
  SQLTablesPostgreSQL  =
      'Select                                                  ' + LineEnding +
      '  table_catalog,                                        ' + LineEnding +
      '  table_schema,                                         ' + LineEnding +
      '  table_name,                                           ' + LineEnding +
      '  table_type                                            ' + LineEnding +
      'from information_schema.tables                          ' + LineEnding +
      'where table_type    = ''BASE TABLE''                    ' + LineEnding +
      'and   table_catalog = ''[VCatalog]''                    ' + LineEnding +
      'and   table_schema  = ''[VSchema]''                     ' + LineEnding ;

  SQLTablesMySQL =
      'With tabela as (                                           ' + LineEnding +
      'SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE ' + LineEnding +
      'FROM INFORMATION_SCHEMA.TABLES                             ' + LineEnding +
      'WHERE TABLE_TYPE   = ''BASE TABLE''                        ' + LineEnding +
      'AND   TABLE_SCHEMA = ''[VCatalog]''                        ' + LineEnding +
      'ORDER BY TABLE_NAME                                        ' + LineEnding +
      ')                                                          ' + LineEnding +
      'Select * from tabela                                       ' + LineEnding ;
Var
  _SQL : String;
  QryAux : TUniQuery;
Begin
  If FProvider.Equals('MySQL') Then
    _SQL := SQLTablesMySQL
  Else If FProvider.Equals('PostgreSQL') Then
         _SQL := SQLTablesPostgreSQL;

  _SQL := StringReplace(_SQL,'[VCatalog]' ,FDataBase,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL,'[VSchema]'  ,FSchema  ,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  Try
    If Debug = True Then QryAux.SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'getSQLTable' + '.sql');
    QryAux.Open;
    FSchemaTable := QryAux.ToJSONArray;
  Finally
    QryAux.Free;
  End;
end;

procedure TProvidersClientes.InitializeClass;
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;

  // Criando objeto de conexão com o banco
  If Not Assigned(FConn) Then
  Begin
    //Carregando Driver do Banco
    If Not Assigned(FPostgresSQL) and (FProvider = 'PostgreSQL') Then
      FPostgresSQL := TPostgreSQLUniProvider.Create(nil);
    If Not Assigned(FSQLServer) and (FProvider = 'SQL Server') Then
      FSQLServer := TSQLServerUniProvider.Create(nil);
    If Not Assigned(FMySQL) and (FProvider = 'MySQL') Then
      FMySQL := TMySQLUniProvider.Create(nil);
    //Crianado Conexão com o Banco de dados
    FConn := TUniConnection.Create(nil);
  End;

  FArquivoINI     := Sessao.IniFile;
  FSessao         := Sessao.SessaoContrato;
  FDadosINIJson   := TJSONObject.Create;
  FSchemaTable    := TJSONArray.Create;
  FFields         := TJSONArray.Create;
  FMensagens      := TJSONObject.Create;
  FReturnJson     := TJSONArray.Create;

  FSQLText        := '';
  FTabela         := '';
  FSchema         := '';
  FTabelaAlias    := '';
  FPrimaryKey     := '';

  // Inicia dados de conexão com banco de dados de licenças
  FProvider       := Sessao.Provider;
  FHost           := Sessao.Host;
  FPorta          := Sessao.Port;
  FUsuario        := Sessao.User;
  FSenha          := Sessao.Pass;
  FDatabase       := Sessao.Database;
  FURL_Base       := BASE_URL_CSL;

  // Configurando componete com dados padrão
  With FConn do
  Begin
    LoginPrompt   := False;
    ProviderName  := FProvider;
    Port          := FPorta;
    DataBase      := FDataBase;
    Username      := FUsuario;
    Server        := FHost;
    Password      := FSenha;
    Options.KeepDesignConnected := True;
  end;

  If Not Conectar then
    raise Exception.Create('Não foi possível conectar ao banco de dados!');
end;

function TProvidersClientes.InitQuery(ASql: String): TUniQuery;
var
  QryAux: TUniQuery;
begin
  QryAux := TUniQuery.Create(Nil);
  with QryAux do
  begin
    Connection                 := FConn;
    CachedUpdates              := True;
    Options.AutoPrepare        := True;
    Options.QueryRecCount      := True;
    Options.RequiredFields     := True;
    Options.SetFieldsReadOnly  := False;
    Options.ReturnParams       := True;
//    SpecificOptions.Values['UnknownAsString'] := 'true';
    Close;
    SQL.Clear;
    SQL.Add(ASql);
  end;

  Result := QryAux;
end;

function TProvidersClientes.InitQuery: TUniQuery;
begin
  Result := InitQuery(FSQLText);
end;

function TProvidersClientes.InitTable: String;
begin
  If FSchema.IsEmpty Then
    raise Exception.Create('FSchema não tem dados');

  If FTabela.IsEmpty Then
    raise Exception.Create('FTabela não tem dados');

  If FTabelaAlias.IsEmpty Then
    raise Exception.Create('FTabelaAlias não tem dados');

  InitTable(FSchema,FTabela,FTabelaAlias);
end;

function TProvidersClientes.InitTable(ASchema, ATabela, ATabelaAlias: String; const ASQL: String): String;
Begin
  FTabelaTexto := '';

  If Not ASchema.IsEmpty Then Begin
    FSchema      := ASchema;
    FTabelaTexto := FSchema + '.'
  End;

  FTabela      := ATabela;
  FTabelaAlias := ATabelaAlias;
  FTabelaTexto := FTabelaTexto + FTabela;

  If Not ASQL.IsEmpty Then
    FSQLText  := ASQL
  Else
    FSQLText := Format('Select * from %s %s ' , [FTabelaTexto,FTabelaAlias]);

  Qry := InitQuery(FSQLText);
  getSQLPrimaryKey;
  getSQLFields;
  //getSQLTables;
end;

function TProvidersClientes.LoadINI: Boolean;
Var
  Status: TJSONObject;
  JSon: TJSONObject;
  Ini: TIniFile;
Begin
  try
    Ini    := TIniFile.Create(FArquivoINI);
    JSon   := TJSONObject.Create;
    Status := TJSONObject.Create;
    try
      With FConn do
      Begin
        LoginPrompt  := False;
        ProviderName := Ini.ReadString( FSessao, 'Provider' , FProvider );
        Port         := Ini.ReadInteger(FSessao, 'Port'     , FPorta    );
        DataBase     := Ini.ReadString( FSessao, 'Database' , FDataBase );
        Username     := Ini.ReadString( FSessao, 'Username' , FUsuario  );
        Server       := Ini.ReadString( FSessao, 'Server'   , FHost     );
        Password     := Ini.ReadString( FSessao, 'Password' , FSenha    );
        FURL_Base    := Ini.ReadString( FSessao, 'URL_Base' , FURL_Base );
      end;
      Status.AddPair('status', 'success'); // ctrl + espaço autocomplite
      Status.AddPair('msg', 'Load IniFiles success');
      FMensagens := Status;
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
      FMensagens := Status;
    End;
  end;
end;

function TProvidersClientes.SaveINI: Boolean;
Var
  Status: TJSONObject;
  JSon: TJSONObject;
  Ini: TIniFile;
Begin
  try
    Ini          := TIniFile.Create(FArquivoINI);
    JSon         := TJSONObject.Create;
    Status       := TJSONObject.Create;
    try
      Ini.WriteString( FSessao, 'Provider' , FProvider );
      Ini.WriteInteger(FSessao, 'Port'     , FPorta    );
      Ini.WriteString( FSessao, 'Database' , FDataBase );
      Ini.WriteString( FSessao, 'Username' , FUsuario  );
      Ini.WriteString( FSessao, 'Server'   , FHost     );
      Ini.WriteString( FSessao, 'Password' , FSenha    );
      Ini.WriteString( FSessao, 'URL_Base' , FURL_Base );
      Status.AddPair('status', 'success');
      Status.AddPair('msg', 'Connect database success');
      FMensagens := Status;
      Result     := True;
    finally
      Ini.Free;
      JSon.Free;
      Status.Free;
    End;
  except
    on ex: Exception do
    Begin
      Status.AddPair('status', 'error');
      Status.AddPair('msg', Format('Erro ao configurar banco, msg: %s',
        [ex.Message]));
      FMensagens := Status;
    End;
  end;
end;

end.
