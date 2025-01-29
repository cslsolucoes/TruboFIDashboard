unit uSessao;

interface
Uses DataSet.Serialize, DataSet.Serialize.Config,
     DBAccess, Uni, MemDS, UniProvider, PostgreSQLUniProvider;

type
  TLicenca = Class
  protected
    class var FChaveJWT     : String;
    class var FChaveLicenca : String;
    class var FContratoId   : Integer;
    class var FProdutoId    : Integer;
    class var FServidorId   : Integer;
    class var FVersaoId     : Integer;

  public
    class property  ChaveJWT     : String   read FChaveJWT;
    class property  ChaveLicenca : String   read FChaveLicenca;
    class property  ContratoId   : Integer  read FContratoId;
    class property  ProdutoId    : Integer  read FProdutoId;
    class property  ServidorId   : Integer  read FServidorId;
    class property  VersaoId     : Integer  read FVersaoId;

  End;

  TSessao = Class
  protected
    class var FUsuario  : String;
    class var FSenha    : String;

  public
    class property  Usuario     : String   read FUsuario;
    class property  Senha       : String   read FSenha;

  End;

implementation

{ Sessao }

end.
