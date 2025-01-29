object ProvidersClientes: TProvidersClientes
  OnCreate = DataModuleCreate
  Height = 421
  Width = 767
  object FConn: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'dbsgp'
    Username = 'postgres'
    Server = 'sgp.csltelecom.com.br'
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
    EncryptedPassword = '8FFF90FF8CFF8BFF92FF86FF'
  end
  object FPostgresSQL: TPostgreSQLUniProvider
    Left = 112
    Top = 24
  end
  object FSQLServer: TSQLServerUniProvider
    Left = 200
    Top = 24
  end
  object FMySQL: TMySQLUniProvider
    Left = 112
    Top = 88
  end
  object FConnL: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'dbsgp'
    Username = 'postgres'
    Server = '201.87.244.234'
    LoginPrompt = False
    Left = 24
    Top = 88
    EncryptedPassword = 'D5FFD5FFD5FFD5FFD5FFD5FF'
  end
  object Qry: TUniQuery
    Connection = FConn
    Left = 200
    Top = 88
  end
  object ReturnQry: TUniQuery
    Connection = FConn
    Left = 24
    Top = 160
  end
end
