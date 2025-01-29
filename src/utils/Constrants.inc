Const
{$IFDEF MSWINDOWS}
  //Cores da Empresa
  CorLaranja                         = $002192F4; //$F49221;
  CorAzul                            = $00A06305; //$0562A1;
  CorVerde                           = $0041C68D; //$8DC641;

  //Campo em Foco
  FonteCor                           = $00A06305;
  FonteCorPadrao                     = CorAzul;

  FonteStyle                         = [fsBold];
  FonteCorFundo                      = clActiveCaption;//$00E0E9EF;

  DefaultLogin                       = 'CLAITON';
  DefaultPassword                    = '451015';
{$endif}

  caNumero           : Char = 'N';
  caNumeroPonto      : Char = 'I';
  caAaZMaiusculo     : Char = 'D';
  caAaZMinusculo     : Char = 'U';
  caHexMaiusculo     : Char = 'E';
  caHexMinusculo     : Char = 'H';
  caVersaoProduto    : Char = '1';
  caVerSaoArquivo    : Char = '2';
  caVerSaoGestao     : Char = '3';
  caVersaoNumero     : Char = '4';

  ipFormatoPadrao    : Char = 'B';
  ipFormato15d       : Char = 'A';

  maFormato2pontos   : Char = 'A';
  maFormato100pontos : Char = 'B';

  vaEmpresa                = 1 ;
  vaDescricao              = 2 ;
  vaVersaoArquivo          = 3 ;
  vaNomeInterno            = 4 ;
  vaCopyright              = 5 ;
  vaNomeOriginal           = 6 ;
  vaProduto                = 7 ;
  vaVersaoProduto          = 8 ;
  vaComentarios            = 9 ;
  vaAutor                  = 10 ;

  semana  : array [0..6]  of string [3] = ('Dom','Seg','Ter','Qua','Qui','Sex','Sab');

  semana_i: array [0..6]  of string [3] = ('Sun','Mon','Tue','Wed','Thu','Fri','Sat');

  meses   : array [1..12] of string [3] = ('Jan','Fev','Mar','Abr','Mai','Jun',
                                           'Jul','Ago','Set','Out','Nov','Dez');

  meses_i : array [1..12] of string [3] = ('Jan','Feb','Mar','Apr','May','Jun',
                                           'Jul','Aug','Sep','Oct','Nov','Dec');

  acentos : array [1..46] of String [2] = ('á' ,'à' ,'â' ,'ã' ,'ä' ,'é' ,'è' ,'ê' ,'ë' ,'í' ,
                                           'ì' ,'î' ,'ï' ,'ó' ,'ò' ,'ô' ,'õ' ,'ö' ,'ú' ,'ù' ,
                                           'û' ,'ü' ,'ç' ,'Á' ,'À' ,'Â' ,'Ã' ,'Ä' ,'É' ,'È' ,
                                           'Ê' ,'Ë' ,'Í' ,'Ì' ,'Î' ,'Ï' ,'Ó' ,'Ò' ,'Ô' ,'Õ' ,
                                           'Ö' ,'Ú' ,'Ù' ,'Û' ,'Ü' ,'Ç' );

  utf8    : array [1..46] of String [2] = ('Ã¡','Ã ','Ã¢','Ã£','Ã¤','Ã©','Ã¨','Ãª','Ã«','Ã­',
                                           'Ã¬','Ã®','Ã¯','Ã³','Ã²','Ã´','Ãµ','Ã¶','Ãº','Ã¹',
                                           'Ã»','Ã¼','Ã§','Ã' ,'Ã€','Ã‚','Ãƒ','Ã„','Ã‰','Ãˆ',
                                           'ÃŠ','Ã‹','Ã' ,'ÃŒ','ÃŽ','Ã' ,'Ã“','Ã’','Ã”','Ã•',
                                           'Ã–','Ãš','Ã™','Ã›','Ãœ','Ã‡');

  minusculo = [#97..#122];
  maiusculo = [#65..#90];

  MAX_INTERFACE_NAME_LEN             = $100;
  ERROR_SUCCESS                      = 0;
  MAXLEN_IFDESCR                     = $100;
  MAXLEN_PHYSADDR                    = 8;

  MIB_IF_OPER_STATUS_NON_OPERATIONAL = 0;
  MIB_IF_OPER_STATUS_UNREACHABLE     = 1;
  MIB_IF_OPER_STATUS_DISCONNECTED    = 2;
  MIB_IF_OPER_STATUS_CONNECTING      = 3;
  MIB_IF_OPER_STATUS_CONNECTED       = 4;
  MIB_IF_OPER_STATUS_OPERATIONAL     = 5;

  MIB_IF_TYPE_OTHER                  = 1;
  MIB_IF_TYPE_ETHERNET               = 6;
  MIB_IF_TYPE_TOKENRING              = 9;
  MIB_IF_TYPE_FDDI                   = 15;
  MIB_IF_TYPE_PPP                    = 23;
  MIB_IF_TYPE_LOOPBACK               = 24;
  MIB_IF_TYPE_SLIP                   = 28;
  MIB_IF_TYPE_WIFI                   = 71;

  MIB_IF_ADMIN_STATUS_UP             = 1;
  MIB_IF_ADMIN_STATUS_DOWN           = 2;
  MIB_IF_ADMIN_STATUS_TESTING        = 3;

  _MAX_ROWS_                         = 20;
  ANY_SIZE                           = 1;

  DADOSMAX                           = 25;

  DadosAdptador  : array [1..DADOSMAX]  of string [20] =
  ('dwIndex'          ,  'dwType'           ,  'dwMtu'            ,  'dwSpeed'          ,  'dwPhysAddrLen'    ,
   'bPhysAddr'        ,  'dwAdminStatus'    ,  'dwOperStatus'     ,  'dwLastChange'     ,  'dwInOctets'       ,
   'dwInUcastPkts'    ,  'dwInNUcastPkts'   ,  'dwInDiscards'     ,  'dwInErrors'       ,  'dwInUnknownProtos',
   'dwOutOctets'      ,  'dwOutUcastPkts'   ,  'dwOutNUcastPkts'  ,  'dwOutDiscards'    ,  'dwOutErrors'      ,
   'dwOutQLen'        ,  'dwDescrLen'       ,  'bDescr'           ,  'sIpAddress'       ,  'sIpMask'          );

  KeyMax                  = 11;

  Key: array[1..KeyMax] of string
                          =(
                            'CompanyName',
                            'FileDescription',
                            'FileVersion',
                            'InternalName',
                            'LegalCopyright',
                            'OriginalFilename',
                            'ProductName',
                            'ProductVersion',
                            'Comments',
                            'LegalTrademarks',
                            'Chave'
                           );

  KeyBr: array [1..KeyMax] of string
                          = (
                             ' 1 - Empresa....................',
                             ' 2 - Descricao..................',
                             ' 3 - Versao do Arquivo..........',
                             ' 4 - Nome Interno...............',
                             ' 5 - Copyright..................',
                             ' 6 - Nome Original do Arquivo...',
                             ' 7 - Produto....................',
                             ' 8 - Versao do Produto..........',
                             ' 9 - Comentarios................',
                             '10 - Autor......................',
                             '11 - Chave......................'
                            );

  KeyBr1: array [1..KeyMax] of string
                          = (
                             'Empresa',
                             'Descricao',
                             'Versao do Arquivo',
                             'Nome Interno',
                             'Copyright',
                             'Nome Original do Arquivo',
                             'Produto',
                             'Versao do Produto',
                             'Comentarios',
                             'Autor',
                             'Chave'
                            );

Type

  TInfoAdaptador   = array of record
                              dwIndex	   : longint;
                              dwType           : longint;
                              dwMtu            : longint;
                              dwSpeed	   : extended;
                              dwPhysAddrLen    : longint;
                              bPhysAddr        : string;
                              dwAdminStatus    : longint;
                              dwOperStatus     : longint;
                              dwLastChange     : longint;
                              dwInOctets       : longint;
                              dwInUcastPkts    : longint;
                              dwInNUcastPkts   : longint;
                              dwInDiscards     : longint;
                              dwInErrors       : longint;
                              dwInUnknownProtos: longint;
                              dwOutOctets      : longint;
                              dwOutUcastPkts   : longint;
                              dwOutNUcastPkts  : longint;
                              dwOutDiscards    : longint;
                              dwOutErrors      : longint;
                              dwOutQLen        : longint;
                              dwDescrLen       : longint;
                              bDescr           : string;
                              sIpAddress       : string;
                              sIpMask          : string;
                              end;

  MIB_IFROW        = record
                     wszName          : array[0 .. (MAX_INTERFACE_NAME_LEN * 2 - 1)] of ansichar;
                     dwIndex          : longint;
                     dwType           : longint;
                     dwMtu            : longint;
                     dwSpeed          : longint;
                     dwPhysAddrLen    : longint;
                     bPhysAddr        : array[0 .. (MAXLEN_PHYSADDR - 1)] of byte;
                     dwAdminStatus    : longint;
                     dwOperStatus     : longint;
                     dwLastChange     : longint;
                     dwInOctets       : longint;
                     dwInUcastPkts    : longint;
                     dwInNUcastPkts   : longint;
                     dwInDiscards     : longint;
                     dwInErrors       : longint;
                     dwInUnknownProtos: longint;
                     dwOutOctets      : longint;
                     dwOutUcastPkts   : longint;
                     dwOutNUcastPkts  : longint;
                     dwOutDiscards    : longint;
                     dwOutErrors      : longint;
                     dwOutQLen        : longint;
                     dwDescrLen       : longint;
                     bDescr           : array[0 .. (MAXLEN_IFDESCR - 1)] of ansichar;
                     end;

  MIB_IPADDRROW    = record
                     dwAddr           : longint;
                     dwIndex          : longint;
                     dwMask           : longint;
                     dwBCastAddr      : longint;
                     dwReasmSize      : longint;
                     unused1          : word;
                     unused2          : word;
                     end;
