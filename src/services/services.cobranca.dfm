inherited ServicesCobranca: TServicesCobranca
  Width = 555
  inherited FConn: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'ixcprovedor'
    Username = 'leitura'
    Server = 'ixc.turbofi.com.br'
    Connected = True
    EncryptedPassword = 
      '89FF9AFFA5FFACFFC9FF9AFF9BFF91FFACFFB3FFCDFF8AFF8AFFB8FF94FFB5FF' +
      'BCFF90FF9DFFC7FF'
  end
  inherited FConnL: TUniConnection
    EncryptedPassword = 'D5FFD5FFD5FFD5FFD5FFD5FF'
  end
  inherited Qry: TUniQuery
    SQL.Strings = (
      
        'With                                                            ' +
        '                          '
      
        'chamado as (                                                    ' +
        '                          '
      
        '  Select  * from su_oss_chamado c                               ' +
        '                          '
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      
        '  And c.setor = 32                                              ' +
        '                     '
      
        '  And (DATE_FORMAT(data_abertura,'#39'%Y-%m'#39')   = DATE_FORMAT('#39'2024-' +
        '12-01'#39','#39'%Y-%m'#39')  '
      
        '  or   DATE_FORMAT(data_fechamento,'#39'%Y-%m'#39') = DATE_FORMAT('#39'2024-' +
        '12-01'#39','#39'%Y-%m'#39')) '
      
        '  ),                                                            ' +
        '                          '
      
        'users as (                                                      ' +
        '                          '
      
        '  Select c.id_tecnico,UPPER(u.funcionario) as funcionario from c' +
        'hamado c                                        '
      
        '  inner join ixcprovedor.funcionarios u on (u.id=c.id_tecnico)  ' +
        '                          '
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      
        '  GROUP BY c.id_tecnico,u.funcionario                           ' +
        '                          '
      
        '  )                                                             ' +
        '                          '
      
        'Select users.*,                                                 ' +
        '                                                      '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'A'#39'  ) as aberta,      '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'F'#39'  ) as fechada,     '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'AN'#39' ) as analise,     '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'AS'#39' ) as assumido,    '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'EN'#39' ) as encaminhado, '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'RAG'#39') as Reagendado,  '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'AG'#39' ) as agendado,    '
      
        '  (Select count(*) from chamado c WHERE 1 = 1 And c.id_tecnico =' +
        ' users.id_tecnico and status='#39'EX'#39' ) as execucao     '
      'from users ')
  end
  inherited qryVirutal: TVirtualQuery
    Top = 160
  end
  inherited TbVirutal: TVirtualTable
    Left = 112
    Data = {04000000000000000000}
  end
  object QryChamado: TUniQuery
    Connection = FConn
    SQL.Strings = (
      
        'With                                                            ' +
        '                          '
      
        'chamado as (                                                    ' +
        '                          '
      
        '  Select c.razao,osa.assunto,                                   ' +
        '                          '
      
        '  CONVERT(                                                      ' +
        '                          '
      
        '   (Case osc.status                                             ' +
        '                          '
      
        '     When '#39'A'#39'   Then '#39'Aberto'#39'                                   ' +
        '                      '
      
        '     When '#39'F'#39'   Then '#39'Fechado'#39'                                  ' +
        '                      '
      
        '     When '#39'AN'#39'  Then '#39'Analise'#39'                                  ' +
        '                      '
      
        '     When '#39'AS'#39'  Then '#39'Assunto'#39'                                  ' +
        '                      '
      
        '     When '#39'EN'#39'  Then '#39'Encaminhado'#39'                              ' +
        '                      '
      
        '     When '#39'RAG'#39' Then '#39'Reagendado'#39'                               ' +
        '                      '
      
        '     When '#39'AG'#39'  Then '#39'Agendado'#39'                                 ' +
        '                      '
      
        '     When '#39'EX'#39'  Then '#39'Execucao'#39'                                 ' +
        '                      '
      
        '     Else '#39'Desconhecido'#39'                                        ' +
        '                        '
      
        '   End), char(15)) as status_char,                              ' +
        '                          '
      
        'CONVERT(osc.mensagem_resposta, CHAR(250)) as mensagem_resposta_c' +
        'har,                      '
      
        'DATE_FORMAT(data_fechamento   ,'#39'%d-%m-%Y'#39') as data_fechamento_m,' +
        '                        '
      
        'DATE_FORMAT(data_inicio       ,'#39'%d-%m-%Y'#39') as data_inicio_m,    ' +
        '                        '
      
        'DATE_FORMAT(data_final        ,'#39'%d-%m-%Y'#39') as data_final_m,     ' +
        '                        '
      
        'DATE_FORMAT(data_hora_assumido,'#39'%d-%m-%Y'#39') as data_hora_assumido' +
        '_m,                     '
      
        '(Case When osc.id_assunto in (51, 84)                           ' +
        '                          '
      
        '    THEN (SELECT u.nome FROM ixcprovedor.su_ticket t            ' +
        '                          '
      
        '            Inner Join ixcprovedor.usuarios u on (u.id = t.id_us' +
        'uarios)                   '
      
        '          WHERE t.id = osc.id_ticket LIMIT 1)                   ' +
        '                          '
      
        '    Else (Case id_tecnico When 0 Then f.funcionario Else osc.id_' +
        'atendente End)            '
      
        ' END                                                            ' +
        '                          '
      
        ') as tecnico,                                                   ' +
        '                          '
      
        'osc.* from su_oss_chamado osc                                   ' +
        '                          '
      
        'Inner Join ixcprovedor.cliente        c   on (c.id=osc.id_client' +
        'e)                        '
      
        'Inner Join ixcprovedor.su_oss_assunto osa on (osa.id=osc.id_assu' +
        'nto)                      '
      
        'Inner Join ixcprovedor.funcionarios   f   on (f.funcionario=osc.' +
        'id_atendente)             '
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      
        '  And osc.setor = 32  or (osc.id_assunto in (51, 84) )          ' +
        '                                                     '
      
        '  And (DATE_FORMAT(data_abertura,'#39'%Y-%m'#39')   = DATE_FORMAT('#39'2025-' +
        '01-01'#39','#39'%Y-%m'#39')  '
      
        '  or   DATE_FORMAT(data_fechamento,'#39'%Y-%m'#39') = DATE_FORMAT('#39'2025-' +
        '01-01'#39','#39'%Y-%m'#39')) '
      
        '  ),                                                            ' +
        '                          '
      
        'users as ((                                                     ' +
        '                          '
      
        '  (Select distinct u.id as id_tecnico,UPPER(u.funcionario) as fu' +
        'ncionario from chamado c           '
      
        '  inner join ixcprovedor.funcionarios u on (u.funcionario=c.id_a' +
        'tendente)                 '
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      
        '  GROUP BY c.id_tecnico,u.funcionario)                          ' +
        '                          '
      
        '  -- UNION Select 0 as id_tecnico, '#39'0-Ainda n o distribuidas'#39' as' +
        ' funcionario               '
      
        '  ) order by funcionario)                                       ' +
        '                          '
      ''
      
        'Select *, --id,id_cliente,razao,id_assunto,assunto,mensagem_resp' +
        'osta_char,status_char,id_atendente, tecnico, '
      ' DATE_FORMAT(data_fechamento,'#39'%d-%m-%Y'#39') as data_fechamento_m, '
      ' DATE_FORMAT(data_inicio,'#39'%d-%m-%Y'#39') as data_inicio_m, '
      ' DATE_FORMAT(data_final,'#39'%d-%m-%Y'#39') as data_final_m,'
      
        ' DATE_FORMAT(data_hora_assumido,'#39'%d-%m-%Y'#39') as data_hora_assumid' +
        'o_m'
      ' '
      ' from chamado')
    Left = 304
    Top = 160
  end
  object QryPie: TUniQuery
    Connection = FConn
    SQL.Strings = (
      
        'With                                                            ' +
        '                          '
      
        'chamado as (                                                    ' +
        '                          '
      '  Select c.razao,osa.assunto,'
      '  CONVERT('
      '  (Case osc.status '
      '      When '#39'A'#39'   Then '#39'Aberto'#39
      '      When '#39'F'#39'   Then '#39'Fechado'#39
      '      When '#39'AN'#39'  Then '#39'Analise'#39
      '      When '#39'AS'#39'  Then '#39'Assunto'#39
      '      When '#39'EN'#39'  Then '#39'Encaminhado'#39
      '      When '#39'RAG'#39' Then '#39'Reagendado'#39
      '      When '#39'AG'#39'  Then '#39'Agendado'#39
      '      When '#39'EX'#39'  Then '#39'Execucao'#39
      '    Else '#39'Desconhecido'#39
      '  End), char(15)) as status_char,'
      
        '  CONVERT(osc.mensagem_resposta, CHAR(250)) as mensagem_resposta' +
        '_char,'
      '  osc.* from su_oss_chamado osc'
      
        '  Inner Join ixcprovedor.cliente        c   on (c.id=osc.id_clie' +
        'nte)'
      
        '  Inner Join ixcprovedor.su_oss_assunto osa on (osa.id=osc.id_as' +
        'sunto)'
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      
        '  And osc.setor = 32                                            ' +
        '                       '
      
        '  And (DATE_FORMAT(osc.data_abertura,'#39'%Y-%m'#39')   = DATE_FORMAT('#39'2' +
        '024-12-01'#39','#39'%Y-%m'#39')  '
      
        '  or   DATE_FORMAT(osc.data_fechamento,'#39'%Y-%m'#39') = DATE_FORMAT('#39'2' +
        '024-12-01'#39','#39'%Y-%m'#39')) '
      
        '  ),                                                            ' +
        '                          '
      
        'users as (                                                      ' +
        '                          '
      
        '  (Select c.id_tecnico,UPPER(u.funcionario) as funcionario from ' +
        'chamado c                  '
      
        '  inner join ixcprovedor.funcionarios u on (u.id=c.id_tecnico)  ' +
        '                          '
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      '  GROUP BY c.id_tecnico,u.funcionario) UNION'
      
        '  Select 0 as id_tecnico, '#39'Ainda n'#227'o distribuidas'#39' as funcionari' +
        'o'
      '  )'
      
        ' Select id,id_cliente,razao,id_assunto,assunto,mensagem_resposta' +
        '_char,status_char,id_atendente, '
      ' DATE_FORMAT(data_fechamento,'#39'%d-%m-%Y'#39') as data_fechamento_m, '
      ' DATE_FORMAT(data_inicio,'#39'%d-%m-%Y'#39') as data_inicio_m, '
      ' DATE_FORMAT(data_final,'#39'%d-%m-%Y'#39') as data_final_m,'
      
        ' DATE_FORMAT(data_hora_assumido,'#39'%d-%m-%Y'#39') as data_hora_assumid' +
        'o_m'
      ' '
      ' from chamado')
    Left = 392
    Top = 160
  end
  object QryGrupo: TUniQuery
    Connection = FConn
    SQL.Strings = (
      
        'With                                                            ' +
        '                          '
      
        'chamado as (                                                    ' +
        '                          '
      '  Select c.razao,osa.assunto,'
      '  CONVERT('
      '  (Case osc.status '
      '      When '#39'A'#39'   Then '#39'Aberto'#39
      '      When '#39'F'#39'   Then '#39'Fechado'#39
      '      When '#39'AN'#39'  Then '#39'Analise'#39
      '      When '#39'AS'#39'  Then '#39'Assunto'#39
      '      When '#39'EN'#39'  Then '#39'Encaminhado'#39
      '      When '#39'RAG'#39' Then '#39'Reagendado'#39
      '      When '#39'AG'#39'  Then '#39'Agendado'#39
      '      When '#39'EX'#39'  Then '#39'Execucao'#39
      '    Else '#39'Desconhecido'#39
      '  End), char(15)) as status_char,'
      
        '  CONVERT(osc.mensagem_resposta, CHAR(250)) as mensagem_resposta' +
        '_char,'
      '  osc.* from su_oss_chamado osc'
      
        '  Inner Join ixcprovedor.cliente        c   on (c.id=osc.id_clie' +
        'nte)'
      
        '  Inner Join ixcprovedor.su_oss_assunto osa on (osa.id=osc.id_as' +
        'sunto)'
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      
        '  And osc.setor = 32                                            ' +
        '                       '
      
        '  And (DATE_FORMAT(osc.data_abertura,'#39'%Y-%m'#39')   = DATE_FORMAT('#39'2' +
        '024-12-01'#39','#39'%Y-%m'#39')  '
      
        '  or   DATE_FORMAT(osc.data_fechamento,'#39'%Y-%m'#39') = DATE_FORMAT('#39'2' +
        '024-12-01'#39','#39'%Y-%m'#39')) '
      
        '  ),                                                            ' +
        '                          '
      
        'users as (                                                      ' +
        '                          '
      
        '  (Select c.id_tecnico,UPPER(u.funcionario) as funcionario from ' +
        'chamado c                  '
      
        '  inner join ixcprovedor.funcionarios u on (u.id=c.id_tecnico)  ' +
        '                          '
      
        '  WHERE 1 = 1                                                   ' +
        '                          '
      '  GROUP BY c.id_tecnico,u.funcionario) UNION'
      
        '  Select 0 as id_tecnico, '#39'Ainda n'#227'o distribuidas'#39' as funcionari' +
        'o'
      '  )'
      
        ' Select id,id_cliente,razao,id_assunto,assunto,mensagem_resposta' +
        '_char,status_char,id_atendente, '
      ' DATE_FORMAT(data_fechamento,'#39'%d-%m-%Y'#39') as data_fechamento_m, '
      ' DATE_FORMAT(data_inicio,'#39'%d-%m-%Y'#39') as data_inicio_m, '
      ' DATE_FORMAT(data_final,'#39'%d-%m-%Y'#39') as data_final_m,'
      
        ' DATE_FORMAT(data_hora_assumido,'#39'%d-%m-%Y'#39') as data_hora_assumid' +
        'o_m'
      ' '
      ' from chamado')
    Left = 472
    Top = 160
  end
end
