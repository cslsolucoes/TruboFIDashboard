unit uProviders;

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
  IdHashMessageDigest, Horse, DataSet.Serialize, DataSet.Serialize.Config;

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
  TProviders = class(TDataModule)
    FConn: TUniConnection;
    FPostgresSQL: TPostgreSQLUniProvider;
    FSQLServer: TSQLServerUniProvider;
    FMySQL: TMySQLUniProvider;
    FConnL: TUniConnection;
    Qry: TUniQuery;
    ReturnQry: TUniQuery;
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
    function setSQLStructDB(Const ATable : Boolean = False) : String;
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
  Providers: TProviders;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TProviders.Conectar: Boolean;
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

constructor TProviders.Create;
begin
//  inherited Create(nil);
  InitializeClass;
end;

procedure TProviders.DataModuleCreate(Sender: TObject);
begin
//  inherited Create(nil);
  InitializeClass;
end;

destructor TProviders.Destroy;
begin
  inherited Destroy;
end;

procedure TProviders.Disconectar;
begin
  if Assigned(FConn) then
  begin
    if FConn.Connected then
      FConn.Connected := False;
    FConn.Free;
  end;
end;

function TProviders.EncriptMD5(APassword: String): String;
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

function TProviders.getFConn: Boolean;
begin
  If Assigned(FConn) Then
    Result := FConn.Connected;
end;

function TProviders.getSQLFields: String;
Const
  SQLFields     =
      'select table_catalog,                                   ' + LineEnding +
      '       table_schema,                                    ' + LineEnding +
      '       table_name,                                      ' + LineEnding +
      '       ordinal_position,                                ' + LineEnding +
      '       column_name,                                     ' + LineEnding +
      '       data_type,                                       ' + LineEnding +
      '       character_maximum_length                         ' + LineEnding +
      'from INFORMATION_SCHEMA.COLUMNS                         ' + LineEnding +
      'where table_name = ''[VName]''                          ' + LineEnding ;
Var
  _SQL : String;
  QryAux : TUniQuery;
Begin
  _SQL := StringReplace(SQLFields,'[VName]'  ,FTabela,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  Try
    QryAux.Open;
    FFields := QryAux.ToJSONArray;
    QryAux.SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'getSQLFields' + '.xml');
    QryAux.SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'getSQLFields' + '.sql');
  Finally
    QryAux.Free;
  End;
end;

function TProviders.getSQLPrimaryKey: String;
Const
  SQLPrimaryKey =
      'select kcu.table_catalog    as database,                ' + LineEnding +
      '       kcu.table_schema     as schema,                  ' + LineEnding +
      '       kcu.table_name       as table,                   ' + LineEnding +
      '       tco.constraint_name  as constraint,              ' + LineEnding +
      '       kcu.ordinal_position as position,                ' + LineEnding +
      '       kcu.column_name      as column                   ' + LineEnding +
      'from information_schema.table_constraints tco           ' + LineEnding +
      'join information_schema.key_column_usage kcu            ' + LineEnding +
      '     on kcu.constraint_name    = tco.constraint_name    ' + LineEnding +
      '     and kcu.constraint_schema = tco.constraint_schema  ' + LineEnding +
      '     and kcu.constraint_name   = tco.constraint_name    ' + LineEnding +
      'where tco.constraint_type = ''PRIMARY KEY''             ' + LineEnding +
      'and   kcu.table_schema    = ''[VSchema]''               ' + LineEnding +
      'and   kcu.table_name      = ''[VName]''                 ' + LineEnding ;
Var
  _SQL : String;
  QryAux : TUniQuery;
Begin
  _SQL := StringReplace(SQLPrimaryKey,'[VSchema]'  ,FSchema,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL         ,'[VName]'    ,FTabela,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  Try
    QryAux.Open;
    If Not QryAux.IsEmpty Then Begin
      FPrimaryKey := QryAux.FieldByName('column').AsString;
      Result := FPrimaryKey ;
    End
    Else Raise Exception.Create('Não há Primary Key');
  Finally
    QryAux.Free;
  End;
end;

function TProviders.getSQLTables: String;
Const
  SQLTables   =
      'Select                                                  ' + LineEnding +
      '  table_catalog,                                        ' + LineEnding +
      '  table_schema,                                         ' + LineEnding +
      '  table_name,                                           ' + LineEnding +
      '  table_type,                                           ' + LineEnding +
      'from information_schema.tables                          ' + LineEnding +
      'where table_type    = ''BASE TABLE''                    ' + LineEnding +
      'and   table_catalog = ''[VCatalog]''                    ' + LineEnding +
      'and   table_schema  = ''[VSchema]''                     ' + LineEnding ;
Var
  _SQL : String;
  QryAux : TUniQuery;
Begin
  _SQL := StringReplace(SQLTables,'[VCatalog]'  ,FDataBase,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL     ,'[VSchema]',FSchema,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  Try
    QryAux.SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'getSQLTable' + '.sql');
    QryAux.Open;
    FSchemaTable := QryAux.ToJSONArray;
  Finally
    QryAux.Free;
  End;
end;

procedure TProviders.InitializeClass;
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  // Gerando nome do arquivo INI
  FArquivoINI := ExtractFilePath(ParamStr(0)) + DirectorySeparator +
    ChangeFileExt((ExtractFileName(ParamStr(0))), '.ini');
  // Sessão arquivo ini
  FSessao := 'Banco Cliente';
  // Criando objeto JSon para dados do INIFILE
  FDadosINIJson := TJSONObject.Create;
  FMensagens := TJSONObject.Create;
  // Criando objeto de conexão com o banco
  If Not Assigned(FConn) Then
  Begin
    //Carregando Driver do Banco
    If Not Assigned(FPostgresSQL) and (FProvider = 'PostgreSQL') Then
       FPostgresSQL := TPostgreSQLUniProvider.Create(nil);
    If Not Assigned(FSQLServer) and (FProvider = 'SQL Server') Then
       FSQLServer := TSQLServerUniProvider.Create(nil);
    //Crianado Conexão com o Banco de dados
    FConn := TUniConnection.Create(nil);
  End;
  // Inicia dados de conexão com banco de dados de licenças
  FProvider   := 'PostgreSQL';
  FHost       := 'sgp.csltelecom.com.br';
  FPorta      := 5432;
  FUsuario    := 'postgres';
  FSenha      := 'postmy';
  FDatabase   := 'dbsgp';
  FURL_Base   := 'http://localhost:9000';
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

  FSQLText     := '';
  FTabela      := '';
  FSchema      := '';
  FTabelaAlias := '';
  FPrimaryKey  := '';

  FDadosINIJson:= TJSONObject.Create;
  FSchemaTable := TJSONArray.Create;
  FFields      := TJSONArray.Create;
  FMensagens   := TJSONObject.Create;
  FReturnJson  := TJSONArray.Create;

  If FileExists(FArquivoINI)
  Then  LoadINI
  Else  SaveINI;

  If Not Conectar then
    raise Exception.Create('Não foi possível conectar ao banco de dados!');
end;

function TProviders.InitQuery(ASql: String): TUniQuery;
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
    SpecificOptions.Values['UnknownAsString'] := 'true';
    Close;
    SQL.Clear;
    SQL.Add(ASql);
  end;

  Result := QryAux;
end;

function TProviders.InitQuery: TUniQuery;
begin
  Result := InitQuery(FSQLText);
end;

function TProviders.InitTable: String;
begin
  If FSchema.IsEmpty Then
    raise Exception.Create('FSchema não tem dados');

  If FTabela.IsEmpty Then
    raise Exception.Create('FTabela não tem dados');

  If FTabelaAlias.IsEmpty Then
    raise Exception.Create('FTabelaAlias não tem dados');

  InitTable(FSchema,FTabela,FTabelaAlias);
end;

function TProviders.InitTable(ASchema, ATabela, ATabelaAlias: String; const ASQL: String): String;
Begin
  FSchema      := ASchema;
  FTabela      := ATabela;
  FTabelaAlias := ATabelaAlias;
  FTabelaTexto := FSchema + '.' + FTabela;
  If Not ASQL.IsEmpty Then
    FSQLText  := ASQL
  Else
    FSQLText := Format('Select * from %s.%s %s ' , [FSchema,FTabela,FTabelaAlias]);
  Qry := InitQuery(FSQLText);
  getSQLPrimaryKey;
  getSQLFields;
  //getSQLTables;
end;

function TProviders.LoadINI: Boolean;
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

function TProviders.SaveINI: Boolean;
Var
  Status: TJSONObject;
  JSon: TJSONObject;
  Ini: TIniFile;
Begin
  try
    Ini := TIniFile.Create(FArquivoINI);
    JSon := TJSONObject.Create;
    Status := TJSONObject.Create;
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

function TProviders.setSQLStructDB(const ATable: Boolean): String;
Const
  SQLStructureDB =
      'DO $$                                                                          ' + LineEnding +
      'DECLARE                                                                        ' + LineEnding +
//------------------------------------------------------------------------------------------------------
      '    mescla_database_name varchar := ''[VCatalog]'';                            ' + LineEnding +
      '    mescla_schema_name varchar   := ''[VScheme]'';                             ' + LineEnding +
      '    mescla_tabela_name varchar   := ''[VTabela]'';                             ' + LineEnding +
      '    mescla_hostname varchar      := ''[VHostname]''                            ' + LineEnding +
      '    mescla_usuario  varchar      := ''[VUsuario]''                             ' + LineEnding +
      '    mescla_senha    varchar      := ''[VSenha]''                               ' + LineEnding +
      '    mescla_coluna_qdt int4 := 0;                                               ' + LineEnding +
      '    rec RECORD;                                                                ' + LineEnding +
      '    --rec versao.schema_coluna%ROWTYPE;                                        ' + LineEnding +
//------------------------------------------------------------------------------------------------------
      'BEGIN                                                                          ' + LineEnding +
      '  FOR rec  IN (                                                                ' + LineEnding +
      '              SELECT table_catalog,table_schema,table_name                     ' + LineEnding +
      '              FROM INFORMATION_SCHEMA.COLUMNS                                  ' + LineEnding +
      '              WHERE table_catalog = mescla_database_name                       ' + LineEnding +
      '              and   table_schema  = mescla_schema_name                         ' + LineEnding +
      '              -- and   table_name    = mescla_tabela_name                      ' + LineEnding +
      '              -- and   Not table_name in (''schema_coluna'',''schema_tabela'') ' + LineEnding +
      '              GROUP BY table_catalog,table_schema,table_name                   ' + LineEnding +
      '              ORDER BY table_catalog,table_schema,table_name                   ' + LineEnding +
      '            ) LOOP                                                             ' + LineEnding +
      '                                                                               ' + LineEnding +
      '    mescla_tabela_name = rec.table_name;                                       ' + LineEnding +
      '    raise notice ''Inicio Registo coluna %'', mescla_tabela_name;              ' + LineEnding +
      '                                                                               ' + LineEnding +
      '    raise notice ''---Apagando tabela temporária temp_pkey'';                  ' + LineEnding +
      '		 DROP table if EXISTS temp_pkey;                                            ' + LineEnding +
      '                                                                               ' + LineEnding +
      '    raise notice ''---Criando tabela temporária temp_pkey'';                   ' + LineEnding +
      '    CREATE TEMP TABLE temp_pkey AS                                             ' + LineEnding +
      '			select kcu.table_catalog,                                                 ' + LineEnding +
      '				   kcu.table_schema,                                                    ' + LineEnding +
      '				   kcu.table_name,                                                      ' + LineEnding +
      '				   tco.constraint_name,                                                 ' + LineEnding +
      '				   kcu.ordinal_position as position,                                    ' + LineEnding +
      '				   kcu.column_name as key_column                                        ' + LineEnding +
      '			from information_schema.table_constraints tco                             ' + LineEnding +
      '			join information_schema.key_column_usage kcu                              ' + LineEnding +
      '				 on kcu.constraint_name = tco.constraint_name                           ' + LineEnding +
      '				 and kcu.constraint_schema = tco.constraint_schema                      ' + LineEnding +
      '				 and kcu.constraint_name = tco.constraint_name                          ' + LineEnding +
      '			where tco.constraint_type = ''PRIMARY KEY''                               ' + LineEnding +
      '			and   tco.table_catalog = mescla_database_name                            ' + LineEnding +
      '			and   tco.table_schema  = mescla_schema_name                              ' + LineEnding +
      '			and   tco.table_name    = mescla_tabela_name                              ' + LineEnding +
      '			order by kcu.table_schema,                                                ' + LineEnding +
      '					 kcu.table_name,                                                      ' + LineEnding +
      '                 position;                                                     ' + LineEnding +
      '                                                                               ' + LineEnding +
      '   raise notice ''---Apagando tabela temporária temp_columns'';                ' + LineEnding +
      '		DROP table if EXISTS temp_columns;                                          ' + LineEnding +
      '                                                                               ' + LineEnding +
      '   raise notice ''---Criando tabela temporária temp_columns'';                 ' + LineEnding +
      '		CREATE TEMP TABLE temp_columns AS                                           ' + LineEnding +
      '		SELECT                                                                      ' + LineEnding +
      '		   cc.table_catalog,                                                        ' + LineEnding +
      '		   cc.table_schema,                                                         ' + LineEnding +
      '		   cc.table_name,                                                           ' + LineEnding +
      '		   cc.column_name,                                                          ' + LineEnding +
      '		   cc.ordinal_position,                                                     ' + LineEnding +
      '		   cc.column_default,                                                       ' + LineEnding +
      '		   cc.is_nullable,                                                          ' + LineEnding +
      '		   cc.data_type,                                                            ' + LineEnding +
      '		   cc.character_maximum_length,                                             ' + LineEnding +
      '		   (CASE WHEN column_name = (SELECT key_column FROM temp_pkey limit 1)      ' + LineEnding +
      '       THEN true  ELSE false END) as pkey                                      ' + LineEnding +
      '		FROM INFORMATION_SCHEMA.COLUMNS cc                                          ' + LineEnding +
      '		Inner join temp_pkey pp on (pp.table_catalog = cc.table_catalog AND         ' + LineEnding +
      '									pp.table_schema  = cc.table_schema  AND                       ' + LineEnding +
      '									pp.table_name    = cc.table_name)                             ' + LineEnding +
      '		WHERE cc.table_catalog = mescla_database_name                               ' + LineEnding +
      '		AND   cc.table_schema  = mescla_schema_name                                 ' + LineEnding +
      '   AND   cc.table_name    = mescla_tabela_name;                                ' + LineEnding +
      '   raise notice ''Final Registo coluna %'', mescla_tabela_name;                ' + LineEnding +
      '                                                                               ' + LineEnding +
      '		if Not EXISTS (Select * from schema_tabela                                  ' + LineEnding +
      '						Where esquema  = mescla_schema_name                                 ' + LineEnding +
      '						and   banco    = mescla_database_name                               ' + LineEnding +
      '						and   tabela   = mescla_tabela_name)                                ' + LineEnding +
      '    THEN                                                                       ' + LineEnding +
      '     raise notice ''Tabela % não existe entradas'', mescla_tabela_name;        ' + LineEnding +
      '			raise notice ''Fazendo Insert'';                                          ' + LineEnding +
      '			With tabela_in as (                                                       ' + LineEnding +
      '				insert into schema_tabela                                               ' + LineEnding +
      '				(hostname, banco, usuario, senha, esquema, tabela, prkey)               ' + LineEnding +
      '				Select                                                                  ' + LineEnding +
      '				mescla_hostname    as hostname,                                         ' + LineEnding +
      '				table_catalog      as banco,                                            ' + LineEnding +
      '				mescla_usuario     as usuario,                                          ' + LineEnding +
      '				mescla_senha       as senha,                                            ' + LineEnding +
      '				table_schema       as esquema,                                          ' + LineEnding +
      '				table_name         as tabela,                                           ' + LineEnding +
      '				(SELECT key_column FROM temp_pkey ) as prkey                            ' + LineEnding +
      '				From temp_columns LIMIT 1                                               ' + LineEnding +
      '				RETURNING id                                                            ' + LineEnding +
      '			)                                                                         ' + LineEnding +
      '			insert into schema_coluna                                                 ' + LineEnding +
      '			(id_esquema_tabela,coluna,tipo,tamanho,padrao,posicao,nulo)               ' + LineEnding +
      '			Select                                                                    ' + LineEnding +
      '				(Select id from tabela_in) as id_schema_tabela,                         ' + LineEnding +
      '				column_name as coluna,                                                  ' + LineEnding +
      '				data_type   as tipo,                                                    ' + LineEnding +
      '				character_maximum_length as tamanho,                                    ' + LineEnding +
      '				column_default as padrao,                                               ' + LineEnding +
      '				ordinal_position as posicao,                                            ' + LineEnding +
      '				(CASE WHEN is_nullable = ''YES'' then True else false end) as nulo      ' + LineEnding +
      '			FROM temp_columns                                                         ' + LineEnding +
      '			ORDER BY ordinal_position;                                                ' + LineEnding +
      '    ELSE                                                                       ' + LineEnding +
      '     raise notice ''Tabela % existe entradas'', mescla_tabela_name;            ' + LineEnding +
      '			raise notice ''Fazendo Update'';                                          ' + LineEnding +
      '     DROP table if EXISTS temp_tabela;                                         ' + LineEnding +
      '			CREATE TEMP TABLE temp_tabela AS                                          ' + LineEnding +
      '				With tabela_in as (                                                     ' + LineEnding +
      '					UPDATE versao.schema_tabela SET                                       ' + LineEnding +
      '					hostname = mescla_hostname,                                           ' + LineEnding +
      '					usuario  = mescla_usuario,                                            ' + LineEnding +
      '					senha    = mescla_senha                                               ' + LineEnding +
      '					Where banco    = mescla_database_name                                 ' + LineEnding +
      '          And   esquema  = mescla_schema_name                                  ' + LineEnding +
      '					and   tabela   = mescla_tabela_name                                   ' + LineEnding +
      '					RETURNING *                                                           ' + LineEnding +
      '				)                                                                       ' + LineEnding +
      '				Select * from tabela_in;                                                ' + LineEnding +
      '                                                                               ' + LineEnding +
      '			mescla_coluna_qdt = (SELECT count(*) FROM  temp_columns                   ' + LineEnding +
      '         Where Not column_name in (Select coluna from versao.schema_coluna     ' + LineEnding +
      '         Where id_esquema_tabela = (Select id from temp_tabela limit 1)::int4) ' + LineEnding +
      '         )::int4;                                                              ' + LineEnding +
      '                                                                               ' + LineEnding +
      '			UPDATE versao.schema_coluna SET                                           ' + LineEnding +
      '				coluna  = tcc.column_name,                                              ' + LineEnding +
      '				tipo    = tcc.data_type,                                                ' + LineEnding +
      '				tamanho = tcc.character_maximum_length,                                 ' + LineEnding +
      '				padrao  = tcc.column_default,                                           ' + LineEnding +
      '				posicao = tcc.ordinal_position,                                         ' + LineEnding +
      '				nulo    = (CASE WHEN tcc.is_nullable = ''YES'' then True else false end)' + LineEnding +
      '			FROM (Select table_catalog, table_schema, table_name ,column_name,        ' + LineEnding +
      '           data_type, character_maximum_length, column_default,                ' + LineEnding +
      '           ordinal_position, is_nullable from temp_columns) as tcc             ' + LineEnding +
      '			Where tcc.table_catalog = mescla_database_name                            ' + LineEnding +
      '			and   tcc.table_schema  = mescla_schema_name                              ' + LineEnding +
      '			and   tcc.table_name    = mescla_tabela_name                              ' + LineEnding +
      '			and   tcc.COLUMN_NAME   = versao.schema_coluna.coluna;                    ' + LineEnding +
      '                                                                               ' + LineEnding +
      '      If (SELECT count(*) FROM  temp_columns Where Not column_name in          ' + LineEnding +
      '         (Select coluna from versao.schema_coluna Where id_esquema_tabela =    ' + LineEnding +
      '         (Select id from temp_tabela limit 1)::int4) )::int4 > 0               ' + LineEnding +
      '      THEN                                                                     ' + LineEnding +
      '				raise notice ''adicionando coluna'';                                    ' + LineEnding +
      '		    DROP table if EXISTS temp_columns_create;                               ' + LineEnding +
      '				CREATE TEMP TABLE temp_columns_create AS                                ' + LineEnding +
      '					SELECT * FROM  temp_columns                                           ' + LineEnding +
      '					Where Not column_name in (Select coluna from versao.schema_coluna     ' + LineEnding +
      '					Where id_esquema_tabela = (Select id from temp_tabela limit 1)::int4);' + LineEnding +
      '				insert into schema_coluna                                               ' + LineEnding +
      '					(id_esquema_tabela,coluna,tipo,tamanho,padrao,posicao,nulo)           ' + LineEnding +
      '				Select                                                                  ' + LineEnding +
      '					(Select id from temp_tabela) as id_schema_tabela,                     ' + LineEnding +
      '					column_name as coluna,                                                ' + LineEnding +
      '					data_type   as tipo,                                                  ' + LineEnding +
      '					character_maximum_length as tamanho,                                  ' + LineEnding +
      '					column_default as padrao,                                             ' + LineEnding +
      '					ordinal_position as posicao,                                          ' + LineEnding +
      '					(CASE WHEN is_nullable = ''YES'' then True else false end) as nulo    ' + LineEnding +
      '					FROM temp_columns_create                                              ' + LineEnding +
      '					ORDER BY ordinal_position;                                            ' + LineEnding +
      '      END If;                                                                  ' + LineEnding +
      '      If  (SELECT count(*) FROM  versao.schema_coluna tc                       ' + LineEnding +
      '           Where Not tc.coluna in (Select COLUMN_NAME from temp_columns)       ' + LineEnding +
      '           AND tc.id_esquema_tabela =                                          ' + LineEnding +
      '                              (Select id from temp_tabela limit 1)::int4) > 0  ' + LineEnding +
      '      THEN                                                                     ' + LineEnding +
      '        raise notice ''Apagou colunas'' ;                                      ' + LineEnding +
      '        delete from versao.schema_coluna                                       ' + LineEnding +
      '        Where id in (SELECT id FROM  versao.schema_coluna tc                   ' + LineEnding +
      '        Where Not tc.coluna in (Select COLUMN_NAME from temp_columns)          ' + LineEnding +
      '        AND tc.id_esquema_tabela = (Select id from temp_tabela limit 1)::int4);' + LineEnding +
      '      END If;                                                                  ' + LineEnding +
      '    END If;                                                                    ' + LineEnding +
      '  END LOOP;                                                                    ' + LineEnding +
      'END $$;                                                                        ' + LineEnding ;
Var
  _SQL   : String;
  QryAux : TUniQuery;
Begin
  _SQL := StringReplace(SQLStructureDB , '[VCatalog]'  , FDataBase  ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL           , '[VSchema]'   , FSchema    ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL           , '[VTabela]'   , FTabela    ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL           , '[VHostname]' , FHost      ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL           , '[VUsuario]'  , FUsuario   ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL           , '[VSenha]'    , FSenha     ,[rfReplaceAll, rfIgnoreCase]);
  If ATable Then
     _SQL := StringReplace(_SQL , '--[VTabela]' , ' and table_name = mescla_tabela_name ' ,[rfReplaceAll, rfIgnoreCase]);
  QryAux := TUniQuery.Create(nil);
  QryAux := InitQuery(_SQL);
  Try
    QryAux.ExecSQL;
    Result := _SQL;
  Finally
    QryAux.Free;
  End;
end;

end.
