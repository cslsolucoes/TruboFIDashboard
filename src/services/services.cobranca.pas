unit services.cobranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProvidersCliente, VirtualTable,
  VirtualQuery, Data.DB, MemDS, DBAccess, Uni, MySQLUniProvider, JSON,
  SQLServerUniProvider, UniProvider, PostgreSQLUniProvider, uSessao;

type
  TServicesCobranca = class(TProvidersClientes)
    QryChamado: TUniQuery;
    QryPie: TUniQuery;
    QryGrupo: TUniQuery;
    QryCombobox: TUniQuery;
  private
    { Private declarations }
  protected
    FSQL12meses        : String;
    FSQLMesAno         : String;
    FSQLAbertoFechados : String;
    FSQLGrupo          : String;
    FSQLGrupoCampo     : String;
    FOrdem             : String;
    FFiltroSQL         : String;
    FFiltro            : Boolean;
    { Protected declarations }
  public
    constructor Create;
    destructor  Destroy; override;

    property Ordem     : String  read FOrdem     write FOrdem;
    property Filtro    : Boolean read FFiltro    write FFiltro;
    property FiltroSQL : String  read FFiltroSQL write FFiltroSQL;

    Function GraphicBar : Boolean;
    Function GraphicPie : Boolean;
    Function ListaPeriodo : Boolean;

    Function ListaGrupos(  Const AGrupo: Integer; Const ADataInicial : TDateTime) : Boolean; overload;
    Function ListaGrupos(  Const AGrupo: Integer; Const ADataInicial : TDateTime; Const ADataFinal: TDateTime) : Boolean; overload;

    Function ListaChamado( Const AGrupo: Integer; Const ADataInicial : TDateTime) : Boolean; overload;
    Function ListaChamado( Const AGrupo: Integer; Const ADataInicial : TDateTime; Const ADataFinal: TDateTime): Boolean; overload;
    Function ListaCombobox(Const AGrupo: Integer; Const ACampo : String ;Const ADataInicial : TDateTime) : Boolean; overload;
    Function ListaCombobox(Const AGrupo: Integer; Const ACampo : String ;Const ADataInicial : TDateTime;const ADataFinal: TDateTime ): Boolean; overload;



    { Public declarations }
  end;

var
  ServicesCobranca: TServicesCobranca;

implementation

{$R *.dfm}

{ TServicesCobranca }

constructor TServicesCobranca.Create;
begin
  inherited;
  InitTable('ixcprovedor','fn_areceber','r');

  FSQL12meses :=
//    'SET `lc_time_names` = ''pt_BR'';                                                                         ' + LineEnding +
      'With                                                                                                     ' + LineEnding +
      'dataMes as (                                                                                             ' + LineEnding +
      '         SELECT DATE_FORMAT(r.data_vencimento,''%Y-%m'') as mes_vencimento,                              ' + LineEnding +
      '         DATE_FORMAT(r.data_vencimento,''%Y-%m-01'') as mes_dia_inicio,                                  ' + LineEnding +
      '         DATE_FORMAT(LAST_DAY(r.data_vencimento),''%Y-%m-%d'') as mes_dia_final,                         ' + LineEnding +
      '         count(c.razao) as qtd,                                                                          ' + LineEnding +
      '         sum(r.valor) as total,                                                                          ' + LineEnding +
      '         DATE_FORMAT(r.data_vencimento,''%Y/%m'') as meses                                               ' + LineEnding +
      '         FROM `fn_areceber` r                                                                            ' + LineEnding +
      '         Inner Join  ixcprovedor.cliente c on (c.id=r.id_cliente)                                        ' + LineEnding +
      '         inner Join  ixcprovedor.crm_cobranca cc on (cc.id=r.id_cobranca)                                ' + LineEnding +
      '         Where 1 = 1                                                                                     ' + LineEnding +
      '         AND r.status in(''A'')                                                                          ' + LineEnding +
      '         AND r.data_vencimento BETWEEN DATE_FORMAT(now(),''%Y-%m-01'') AND LAST_DAY(now())               ' + LineEnding +
      '         AND r.data_vencimento < now() AND r.pagamento_data is null                                      ' + LineEnding +
      '         GROUP BY DATE_FORMAT(r.data_vencimento,''%Y-%m'')                                               ' + LineEnding +
      '        ),                                                                                               ' + LineEnding +
      'dataAno as (                                                                                             ' + LineEnding +
      '         SELECT DATE_FORMAT(r.data_vencimento,''%Y-%m'') as mes_vencimento,                              ' + LineEnding +
      '         DATE_FORMAT(r.data_vencimento,''%Y-%m-01'') as mes_dia_inicio,                                  ' + LineEnding +
      '         DATE_FORMAT(LAST_DAY(r.data_vencimento),''%Y-%m-%d'') as mes_dia_final,                         ' + LineEnding +
      '         count(c.razao) as qtd,                                                                          ' + LineEnding +
      '         sum(r.valor) as total,                                                                          ' + LineEnding +
      '         DATE_FORMAT(r.data_vencimento,''%Y/%m'') as meses                                               ' + LineEnding +
      '         FROM `fn_areceber` r                                                                            ' + LineEnding +
      '         Inner Join  ixcprovedor.cliente c on (c.id=r.id_cliente)                                        ' + LineEnding +
      '         inner Join  ixcprovedor.crm_cobranca cc on (cc.id=r.id_cobranca)                                ' + LineEnding +
      '         Where 1 = 1                                                                                     ' + LineEnding +
      '         AND r.status in(''A'')                                                                          ' + LineEnding +
      '         AND DATE_FORMAT(r.data_vencimento,''%Y-%m'') >= DATE_FORMAT(DATE_ADD(now(), INTERVAL -12 MONTH),''%Y-%m'') ' + LineEnding +
      '         AND r.data_vencimento < now() AND r.pagamento_data is null                                      ' + LineEnding +
      '         GROUP BY DATE_FORMAT(r.data_vencimento,''%Y-%m'')                                               ' + LineEnding +
      '        ),                                                                                               ' + LineEnding +
      'dataAno1 as (                                                                                            ' + LineEnding +
      '         (Select DATE_FORMAT(now(),''%Y/%m'') as meses )        UNION                                    ' + LineEnding +
      '         (SELECT                                                                                         ' + LineEnding +
      '         DATE_FORMAT(r.data_vencimento,''%Y/%m'') as meses                                               ' + LineEnding +
      '         FROM `fn_areceber` r                                                                            ' + LineEnding +
      '         Inner Join  ixcprovedor.cliente c on (c.id=r.id_cliente)                                        ' + LineEnding +
      '         inner Join  ixcprovedor.crm_cobranca cc on (cc.id=r.id_cobranca)                                ' + LineEnding +
      '         Where 1 = 1                                                                                     ' + LineEnding +
      '         AND r.status in(''A'')                                                                          ' + LineEnding +
      '         AND DATE_FORMAT(r.data_vencimento,''%Y-%m'') >= DATE_FORMAT(DATE_ADD(now(), INTERVAL -12 MONTH),''%Y-%m'') ' + LineEnding +
      '         AND r.data_vencimento < now() AND r.pagamento_data is null                                      ' + LineEnding +
      '         GROUP BY DATE_FORMAT(r.data_vencimento,''%Y-%m''))                                              ' + LineEnding +
      '        )                                                                                                ' + LineEnding ;

  FSQLMesAno :=
      'With                                                                                                     ' + LineEnding +
      'lista as (                                                                                               ' + LineEnding +
      '          SELECT c.id,c.razao, count(c.razao) as quantidade, sum(valor) as total FROM fn_areceber r      ' + LineEnding +
      '          Inner Join ixcprovedor.cliente c on (c.id=r.id_cliente)                                        ' + LineEnding +
      '          Where status in(''A'')                                                                         ' + LineEnding +
      '          AND data_vencimento BETWEEN [DataInicialMes] AND [DataFinalMes]                                ' + LineEnding +
      '          AND data_vencimento < DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -20 DAY),''%Y-%m-%d'')              ' + LineEnding +
      '          GROUP BY c.id,c.razao                                                                          ' + LineEnding +
      '          ),                                                                                             ' + LineEnding +
      'lista1 as (                                                                                              ' + LineEnding +
      '          SELECT c.id,c.razao, count(c.razao) as quantidade, sum(valor) as total FROM fn_areceber r      ' + LineEnding +
      '          Inner Join  ixcprovedor.cliente c on (c.id=r.id_cliente)                                       ' + LineEnding +
      '          Where status in(''A'')                                                                         ' + LineEnding +
      '          AND data_vencimento BETWEEN [DataInicialAno] AND [DataFinalAno]                                ' + LineEnding +
      '          AND data_vencimento < DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -20 DAY),''%Y-%m-%d'')              ' + LineEnding +
      '          GROUP BY c.id,c.razao                                                                          ' + LineEnding +
      '          ),                                                                                             ' + LineEnding +
      'clientes as (                                                                                            ' + LineEnding +
      '          Select count(razao) as qtd_clientes, sum(total)  as total from lista                           ' + LineEnding +
      '          ),                                                                                             ' + LineEnding +
      'clientes1 as (                                                                                           ' + LineEnding +
      '          Select count(razao) as qtd_clientes, sum(total)  as total from lista1                          ' + LineEnding +
      '          )                                                                                              ' + LineEnding +
      'Select qtd_clientes, total, (total/qtd_clientes) as media from clientes UNION                            ' + LineEnding +
      'Select qtd_clientes, total, (total/qtd_clientes) as media from clientes1                                 ' + LineEnding ;

  FSQLAbertoFechados :=
      'With                                                                                                                             ' + LineEnding +
      'abertos as  (                                                                                                                    ' + LineEnding +
      '              SELECT DATE_FORMAT(DATE_ADD(data_vencimento, INTERVAL -20 DAY),''%Y-%m-%d'') as data, r.* FROM fn_areceber r       ' + LineEnding +
      '              Inner Join  ixcprovedor.cliente c on (c.id=r.id_cliente)                                                           ' + LineEnding +
      '              Where status in(''A'')                                                                                             ' + LineEnding +
      '              AND data_vencimento BETWEEN DATE_FORMAT(DATE_ADD(NOW(), INTERVAL  -12 MONTH),''%Y-%m-01'') AND LAST_DAY(now())  ' + LineEnding +
//      '              AND data_vencimento BETWEEN DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -30 DAY),''%Y-%m-01'') AND LAST_DAY(now())        ' + LineEnding +
      '              AND data_vencimento <       DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -20 DAY),''%Y-%m-%d'')                            ' + LineEnding +
      '              ORDER BY data_vencimento                                                                                           ' + LineEnding +
      '            ),                                                                                                                   ' + LineEnding +
      'fechados as (                                                                                                                    ' + LineEnding +
      '              SELECT DATE_FORMAT(DATE_ADD(data_vencimento, INTERVAL +20 DAY),''%Y-%m-%d'') as data, r.* FROM fn_areceber r       ' + LineEnding +
      '              Inner Join  ixcprovedor.cliente c on (c.id=r.id_cliente)                                                           ' + LineEnding +
      '              Where Not status in (''A'',''C'')                                                                                  ' + LineEnding +
      '              AND data_vencimento BETWEEN DATE_FORMAT(DATE_ADD(NOW(), INTERVAL  -12 MONTH),''%Y-%m-01'') AND LAST_DAY(now())  ' + LineEnding +
//      '              AND data_vencimento BETWEEN DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -30 DAY),''%Y-%m-01'') AND LAST_DAY(now())        ' + LineEnding +
      '              AND pagamento_data >=       DATE_FORMAT(DATE_ADD(data_vencimento, INTERVAL +20 DAY),''%Y-%m-%d'')                  ' + LineEnding +
      '              ORDER BY data_vencimento                                                                                           ' + LineEnding +
      '            )                                                                                                                    ' + LineEnding +
      'Select                                                                                                                           ' + LineEnding +
      '(Select count(*) from abertos  ) as aberto,                                                                                      ' + LineEnding +
      '(Select count(*) from fechados ) as fechado                                                                                      ' + LineEnding ;

  FSQLGrupo :=
      'With                                                                                      ' + LineEnding +
      'chamado as (                                                                              ' + LineEnding +
      //'  Select * from su_oss_chamado c                                                          ' + LineEnding +
      '  Select c.razao,osa.assunto,                                                             ' + LineEnding +
      '  CONVERT(                                                                                ' + LineEnding +
      '   (Case osc.status                                                                       ' + LineEnding +
      '     When ''A''   Then ''Aberto''                                                         ' + LineEnding +
      '     When ''F''   Then ''Fechado''                                                        ' + LineEnding +
      '     When ''AN''  Then ''Analise''                                                        ' + LineEnding +
      '     When ''AS''  Then ''Assunto''                                                        ' + LineEnding +
      '     When ''EN''  Then ''Encaminhado''                                                    ' + LineEnding +
      '     When ''RAG'' Then ''Reagendado''                                                     ' + LineEnding +
      '     When ''AG''  Then ''Agendado''                                                       ' + LineEnding +
      '     When ''EX''  Then ''Execucao''                                                       ' + LineEnding +
      '     Else ''Desconhecido''                                                                ' + LineEnding +
      '   End), char(15)) as status_char,                                                        ' + LineEnding +
      'CONVERT(osc.mensagem_resposta, CHAR(250)) as mensagem_resposta_char,                      ' + LineEnding +
      'DATE_FORMAT(data_fechamento   ,''%d-%m-%Y'') as data_fechamento_m,                        ' + LineEnding +
      'DATE_FORMAT(data_abertura     ,''%d-%m-%Y'') as data_abertura_m,                          ' + LineEnding +
      'DATE_FORMAT(data_inicio       ,''%d-%m-%Y'') as data_inicio_m,                            ' + LineEnding +
      'DATE_FORMAT(data_final        ,''%d-%m-%Y'') as data_final_m,                             ' + LineEnding +
      'DATE_FORMAT(data_hora_assumido,''%d-%m-%Y'') as data_hora_assumido_m,                     ' + LineEnding +
//      '(Case id_tecnico When 0 Then f.funcionario Else osc.id_atendente End) as tecnico,         ' + LineEnding +
      '(Case When osc.id_assunto in (51, 84)                                                     ' + LineEnding +
      '    THEN (SELECT u.nome FROM ixcprovedor.su_ticket t                                      ' + LineEnding +
      '            Inner Join ixcprovedor.usuarios u on (u.id = t.id_usuarios)                   ' + LineEnding +
      '          WHERE t.id = osc.id_ticket LIMIT 1)                                             ' + LineEnding +
      '    Else (Case id_tecnico When 0 Then f.funcionario Else osc.id_atendente End)            ' + LineEnding +
      ' END                                                                                      ' + LineEnding +
      ') as tecnico,                                                                             ' + LineEnding +
      '( SELECT f.id FROM usuarios f                                                             ' + LineEnding +
      '  WHERE UPPER(f.nome) = UPPER(Case When osc.id_assunto in (51, 84)                        ' + LineEnding +
      '                                     THEN (SELECT u.nome FROM ixcprovedor.su_ticket t     ' + LineEnding +
      '                                           Inner Join ixcprovedor.usuarios u on (u.id = t.id_usuarios) ' + LineEnding +
      '                                           WHERE t.id = osc.id_ticket LIMIT 1)            ' + LineEnding +
      '                                     Else osc.id_atendente                                ' + LineEnding +
      '                                     END) LIMIT 1                                         ' + LineEnding +
      ' ) as tecnico_id,                                                                         ' + LineEnding +
      'osc.* from su_oss_chamado osc                                                             ' + LineEnding +
      'Inner Join ixcprovedor.cliente        c   on (c.id=osc.id_cliente)                        ' + LineEnding +
      'Inner Join ixcprovedor.su_oss_assunto osa on (osa.id=osc.id_assunto)                      ' + LineEnding +
      'Inner Join ixcprovedor.funcionarios   f   on (f.funcionario=osc.id_atendente)             ' + LineEnding +
      '  WHERE 1 = 1                                                                             ' + LineEnding +
      '  And (osc.setor = [Grupo]  or osc.id_assunto in (51, 84))'                                 + LineEnding +
      '  -- [Filtro]'                                                                              + LineEnding +
      '  ),                                                                                      ' + LineEnding +
      'users as ((                                                                               ' + LineEnding +
      '  (Select distinct u.id as id_tecnico,UPPER(u.funcionario) as funcionario from chamado c  ' + LineEnding +
      '  inner join ixcprovedor.funcionarios u on (u.funcionario=c.id_atendente)                 ' + LineEnding +
      '  WHERE 1 = 1                                                                             ' + LineEnding +
      '  GROUP BY c.id_tecnico,u.funcionario)                                                    ' + LineEnding +
      '  -- UNION Select 0 as id_tecnico, ''0-Ainda não distribuidas'' as funcionario            ' + LineEnding +
      '  ) order by funcionario),                                                                ' + LineEnding +
      'users1 as(                                                                                ' + LineEnding +
      '   SELECT  tecnico_id as id_tecnico ,tecnico as funcionario FROM chamado                  ' + LineEnding +
      '   GROUP BY  tecnico_id,tecnico                                                           ' + LineEnding +
      '  )                                                                                       ' + LineEnding ;

  FSQLGrupoCampo :=

      'Select users.*,                                                                                                       ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico                   ) as total,       ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''A''  ) as aberta,      ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''F''  ) as fechada,     ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''AN'' ) as analise,     ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''AS'' ) as assumido,    ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''EN'' ) as encaminhado, ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''RAG'') as reagendado,  ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''AG'' ) as agendado,    ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 And c.tecnico_id = users.id_tecnico and status=''EX'' ) as execucao     ' + LineEnding +
      'from users1 as users                                                                                                  ' + LineEnding +

      'Union' + LineEnding +
      'Select null,null,                                                                 ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1                   ) as total,       ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''A''  ) as aberta,      ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''F''  ) as fechada,     ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''AN'' ) as analise,     ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''AS'' ) as assumido,    ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''EN'' ) as encaminhado, ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''RAG'') as reagendado,  ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''AG'' ) as agendado,    ' + LineEnding +
      '  (Select count(*) from chamado c WHERE 1 = 1 and status=''EX'' ) as execucao     ' + LineEnding +
      'from users1 as users                                                              ' + LineEnding ;

  FFiltro := False;
  FFiltroSQL := '';
end;

destructor TServicesCobranca.Destroy;
begin
  inherited Destroy;
  FOrdem := '';
end;

function TServicesCobranca.GraphicBar: Boolean;
begin
  ReturnQry := InitQuery(FSQL12meses);

  With ReturnQry do
  Begin
    SQL.Add('Select * from dataAno ORDER BY mes_vencimento desc');
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.GraphicBar' + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.GraphicBar' + '.xml');
  End;
end;

function TServicesCobranca.GraphicPie: Boolean;
begin
  QryPie := InitQuery(FSQLAbertoFechados);

  With QryPie do
  Begin
   If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.GraphicPie' + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.GraphicPie' + '.xml');
  End;
end;

function TServicesCobranca.ListaChamado(const AGrupo: Integer; const ADataInicial: TDateTime): Boolean;
Var
  _SQL : String;
begin
  _SQL := FSQLGrupo;
  _SQL := _SQL + ' Select * from chamado where 1 = 1 ' + LineEnding;;
  _SQL := _SQL + ' And ( DATE_FORMAT(data_abertura,''%Y-%m'')   = DATE_FORMAT(''[DataInicial]'',''%Y-%m'')    '  + LineEnding;;
  _SQL := _SQL + ' or    DATE_FORMAT(data_fechamento,''%Y-%m'') = DATE_FORMAT(''[DataInicial]'',''%Y-%m'')  ) ' + LineEnding; ;

  If  (FFiltro = True)
  And (FFiltroSQL.IsEmpty = False) Then
    _SQL := _SQL + FFiltroSQL + LineEnding;

  _SQL := _SQL + FOrdem  + LineEnding ;

  _SQL := StringReplace(_SQL ,'[Grupo]'      ,AGrupo.ToString                           ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[DataInicial]',FormatDateTime('yyyy-mm-dd', ADataInicial),[rfReplaceAll, rfIgnoreCase]);

  If Assigned(QryChamado) Then
    If QryChamado.Active Then
      QryChamado.close;

  QryChamado := InitQuery(_SQL);

  With QryChamado do
  Begin
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaChamado' + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaChamado' + '.xml');
  End;
end;

function TServicesCobranca.ListaCombobox(const AGrupo: Integer;
  const ACampo: String; const ADataInicial, ADataFinal: TDateTime): Boolean;
Var
  _SQL : String;
begin
  _SQL := FSQLGrupo;
  _SQL := _SQL + ' Select [Campo] from chamado where 1 = 1 ' + LineEnding;;
  _SQL := _SQL + ' And (data_fechamento BETWEEN ''[DataInicial]'' and ''[DataFinal]''   ' + LineEnding ;
  _SQL := _SQL + ' or   data_abertura   BETWEEN ''[DataInicial]'' and ''[DataFinal]'' ) ' + LineEnding ;

//  If  (FFiltro = True)
//  And (FFiltroSQL.IsEmpty = False) Then
//    _SQL := _SQL + FFiltroSQL + LineEnding;

  _SQL := _SQL + 'GROUP BY [Campo]                                                                            ' + LineEnding;
  _SQL := _SQL + 'Order by [Campo] Asc ' + LineEnding ;

  _SQL := StringReplace(_SQL ,'[Campo]'      ,ACampo                                    ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[Grupo]'      ,AGrupo.ToString                           ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[DataInicial]',FormatDateTime('yyyy-mm-dd', ADataInicial),[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[DataFinal]'  ,FormatDateTime('yyyy-mm-dd', ADataFinal)  ,[rfReplaceAll, rfIgnoreCase]);

  If Assigned(QryCombobox) Then
    QryCombobox.close;

  QryCombobox := InitQuery(_SQL);

  With QryCombobox do
  Begin
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaComboboxData'+ ACampo + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaComboboxData'+ ACampo + '.xml');
  End;
end;

function TServicesCobranca.ListaGrupos(const AGrupo: Integer;
  const ADataInicial, ADataFinal: TDateTime): Boolean;
Var
  _SQL : String;
begin
  _SQL := '';
  _SQL := _SQL + ' And  (data_fechamento BETWEEN ''[DataInicial]'' and ''[DataFinal]''   ' + LineEnding ;
  _SQL := _SQL + '   or    data_abertura   BETWEEN ''[DataInicial]'' and ''[DataFinal]'' ) ' + LineEnding ;

  _SQL := StringReplace(FSQLGrupo,'-- [Filtro]'  ,_SQL                                      ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL     ,'[Grupo]'      ,AGrupo.ToString                           ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL     ,'[DataInicial]',FormatDateTime('yyyy-mm-dd', ADataInicial),[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL     ,'[DataFinal]'  ,FormatDateTime('yyyy-mm-dd', ADataFinal)  ,[rfReplaceAll, rfIgnoreCase]);

  QryGrupo := InitQuery(_SQL + FSQLGrupoCampo);

  With QryGrupo do
  Begin
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaGruposData' + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaGruposData' + '.xml');
  End;
end;

function TServicesCobranca.ListaCombobox(const AGrupo: Integer;
  const ACampo: String; const ADataInicial: TDateTime): Boolean;
Var
  _SQL : String;
begin
  _SQL := FSQLGrupo;
  _SQL := _SQL + ' Select [Campo] from chamado where 1 = 1 ' + LineEnding;;
  _SQL := _SQL + ' And ( DATE_FORMAT(data_abertura,''%Y-%m'')   = DATE_FORMAT(''[DataInicial]'',''%Y-%m'')    ' + LineEnding;
  _SQL := _SQL + ' or    DATE_FORMAT(data_fechamento,''%Y-%m'') = DATE_FORMAT(''[DataInicial]'',''%Y-%m'')  ) ' + LineEnding;

//  If  (FFiltro = True)
//  And (FFiltroSQL.IsEmpty = False) Then
//    _SQL := _SQL + FFiltroSQL + LineEnding;

  _SQL := _SQL + 'GROUP BY [Campo]                                                                            ' + LineEnding;
  _SQL := _SQL + 'Order by [Campo] Asc ' + LineEnding ;

  _SQL := StringReplace(_SQL ,'[Campo]'      ,ACampo                                    ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[Grupo]'      ,AGrupo.ToString                           ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[DataInicial]',FormatDateTime('yyyy-mm-dd', ADataInicial),[rfReplaceAll, rfIgnoreCase]);

  If Assigned(QryCombobox) Then
    QryCombobox.close;

  QryCombobox := InitQuery(_SQL);

  With QryCombobox do
  Begin
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaCombobox'+ ACampo + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaCombobox' + ACampo + '.xml');
  End;
end;

function TServicesCobranca.ListaChamado(const AGrupo: Integer; const ADataInicial: TDateTime;const ADataFinal: TDateTime): Boolean;
Var
  _SQL : String;
begin
  _SQL := FSQLGrupo;
  _SQL := _SQL + ' Select * from chamado where 1 = 1 ' + LineEnding;
  _SQL := _SQL + ' And  (data_fechamento BETWEEN ''[DataInicial]'' and ''[DataFinal]''   ' + LineEnding ;
  _SQL := _SQL + ' or    data_abertura   BETWEEN ''[DataInicial]'' and ''[DataFinal]'' ) ' + LineEnding ;

  If  (FFiltro = True)
  And (FFiltroSQL.IsEmpty = False) Then
    _SQL := _SQL + FFiltroSQL + LineEnding;

  _SQL := _SQL + FOrdem  + LineEnding ;

  _SQL := StringReplace(_SQL ,'[Grupo]'      ,AGrupo.ToString                           ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[DataInicial]',FormatDateTime('yyyy-mm-dd', ADataInicial),[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL ,'[DataFinal]'  ,FormatDateTime('yyyy-mm-dd', ADataFinal)  ,[rfReplaceAll, rfIgnoreCase]);

  If Assigned(QryChamado) Then
    If QryChamado.Active Then
      QryChamado.close;

  QryChamado := InitQuery(_SQL);

  With QryChamado do
  Begin
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaChamadoData' + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaChamadoData' + '.xml');
  End;
End;

function TServicesCobranca.ListaGrupos(const AGrupo: Integer; Const ADataInicial: TDateTime): Boolean;
Var
  _SQL : String;
begin
  _SQL := '';
  _SQL := _SQL + ' And ( DATE_FORMAT(data_abertura,''%Y-%m'')   = DATE_FORMAT(''[DataInicial]'',''%Y-%m'')    ' + LineEnding;
  _SQL := _SQL + ' or    DATE_FORMAT(data_fechamento,''%Y-%m'') = DATE_FORMAT(''[DataInicial]'',''%Y-%m'')  ) ' + LineEnding;

  _SQL := StringReplace(FSQLGrupo,'-- [Filtro]'  ,_SQL                                      ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL     ,'[Grupo]'      ,AGrupo.ToString                           ,[rfReplaceAll, rfIgnoreCase]);
  _SQL := StringReplace(_SQL     ,'[DataInicial]',FormatDateTime('yyyy-mm-dd', ADataInicial),[rfReplaceAll, rfIgnoreCase]);

  QryGrupo := InitQuery(_SQL + FSQLGrupoCampo);

  With QryGrupo do
  Begin
    If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaGrupos' + '.sql');
    Open;
    If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaGrupos' + '.xml');
  End;
end;

function TServicesCobranca.ListaPeriodo: Boolean;
begin
  ReturnQry := InitQuery(FSQL12meses);

  With ReturnQry do
  Begin
    SQL.Add('Select meses from dataAno1 ORDER BY meses desc');
   If Sessao.DebugSQL = True Then  SQL.SaveToFile(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaPeriodo' + '.sql');
    Open;
   If Sessao.DebugSQL = True Then  SaveToXML(copy(INIArquivo,1,length(INIArquivo) - 3 ) + 'TServicesCobranca.ListaPeriodo' + '.xml');
  End;
end;

end.
