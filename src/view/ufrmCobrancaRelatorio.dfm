object frmCobranca: TfrmCobranca
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmCobranca'
  ClientHeight = 573
  ClientWidth = 1915
  Color = 15005659
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object pnlHeader: TRzPanel
    Left = 0
    Top = 0
    Width = 1915
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    Color = 6402120
    TabOrder = 0
    OnMouseDown = CaptureMouse_Down
    OnMouseMove = CaptureMouse_Move
    OnMouseUp = CaptureMouse_Up
    object btnClose: TStyledSpeedButton
      AlignWithMargins = True
      Left = 1880
      Top = 5
      Width = 30
      Height = 32
      Hint = 'Fechar Sistema'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 4
      Align = alRight
      ImageIndex = 2
      Images = iTitulo
      Flat = True
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCloseClick
      ButtonStylePressed.BorderColor = clWhite
      ButtonStylePressed.ButtonColor = 6402120
      ButtonStyleHot.BorderColor = 11528341
      ButtonStyleHot.ButtonColor = 11528341
      ExplicitLeft = 5
    end
    object lbTitulo: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 245
      Height = 41
      Margins.Top = 0
      Margins.Right = 100
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Lista de Ordens de Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      OnMouseDown = CaptureMouse_Down
      OnMouseMove = CaptureMouse_Move
      OnMouseUp = CaptureMouse_Up
      ExplicitHeight = 30
    end
  end
  object pnlBoton: TRzPanel
    Left = 0
    Top = 568
    Width = 1915
    Height = 5
    Align = alBottom
    BorderOuter = fsNone
    Color = 15987699
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object pPrincipal: TRzPanel
    Left = 0
    Top = 94
    Width = 1915
    Height = 474
    Align = alClient
    BorderOuter = fsNone
    BorderColor = clWhite
    BorderShadow = clWhite
    Color = 15987699
    GradientColorStyle = gcsCustom
    GradientColorStart = 15005659
    GradientColorStop = 6402120
    GradientDirection = gdDiagonalDown
    GridColor = clWhite
    GridStyle = gsDottedLines
    GridXSize = 30
    GridYSize = 30
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    VisualStyle = vsGradient
    object pnlChamado: TRzPanel
      Left = 0
      Top = 0
      Width = 1915
      Height = 474
      Align = alClient
      BorderOuter = fsNone
      Color = 15987699
      TabOrder = 0
      Transparent = True
      object dbGridChamado: TDBGrid
        Left = 0
        Top = 164
        Width = 1915
        Height = 310
        Align = alClient
        BorderStyle = bsNone
        Color = 15005659
        DataSource = dsQryChamado
        DrawingStyle = gdsGradient
        FixedColor = clHotLight
        GradientEndColor = 6402120
        GradientStartColor = 15005659
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack, dgThumbTracking]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnTitleClick = dbGridChamadoTitleClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'Id OS'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status_char'
            Title.Caption = 'Status'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assunto'
            Title.Caption = 'Assunto'
            Width = 360
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_cliente'
            Title.Caption = 'Id Cliente'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'razao'
            Title.Caption = 'Nome Cliente'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tecnico'
            Title.Caption = 'Atendente'
            Width = 297
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_assunto'
            Title.Caption = 'Id Assunto'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'mensagem_resposta_char'
            Title.Caption = 'Mensagem'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_inicio_m'
            Title.Caption = 'Dt Inical'
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_final_m'
            Title.Caption = 'Dt Final'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_abertura_m'
            Title.Caption = 'Dt Abertura'
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_fechamento_m'
            Title.Caption = 'Dt Fechado'
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_hora_assumido_m'
            Title.Caption = 'Dt Assumido'
            Width = 130
            Visible = True
          end>
      end
      object pnlDadosOS: TRzPanel
        Left = 0
        Top = 0
        Width = 1915
        Height = 164
        Align = alTop
        Color = 6402120
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11528341
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          1915
          164)
        object gbId: TGroupBox
          Left = 6
          Top = 3
          Width = 75
          Height = 50
          Caption = 'Id OS'
          TabOrder = 0
          object edtId: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'id'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 62
          end
        end
        object gbNome: TGroupBox
          Left = 167
          Top = 3
          Width = 474
          Height = 50
          Caption = 'Nome Cliente'
          TabOrder = 1
          object edtNome: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'razao'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 461
          end
        end
        object gbIdCliente: TGroupBox
          Left = 87
          Top = 3
          Width = 74
          Height = 50
          Caption = 'Id Cliente'
          TabOrder = 2
          object edtIdCliente: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'id_cliente'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 61
          end
        end
        object gbAssunto: TGroupBox
          Left = 6
          Top = 54
          Width = 419
          Height = 50
          Caption = 'Assunto'
          TabOrder = 3
          object edtAssunto: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'assunto'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 406
          end
        end
        object gbStatus: TGroupBox
          Left = 431
          Top = 54
          Width = 210
          Height = 50
          Caption = 'Status'
          TabOrder = 4
          object edtStatus: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'status_char'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 197
          end
        end
        object gbHistorico: TGroupBox
          Left = 6
          Top = 105
          Width = 210
          Height = 50
          Caption = 'Atendente'
          TabOrder = 5
          object edtHistorico: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'tecnico'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 197
          end
        end
        object GroupBox1: TGroupBox
          Left = 647
          Top = 3
          Width = 1263
          Height = 152
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Historico'
          TabOrder = 6
          object cxDBMemo1: TcxDBMemo
            Left = 2
            Top = 19
            Align = alClient
            DataBinding.DataField = 'mensagem'
            DataBinding.DataSource = dsQryChamado
            DragCursor = crHandPoint
            DragMode = dmAutomatic
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Properties.ScrollBars = ssBoth
            Properties.WantTabs = True
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TransparentBorder = True
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 131
            Width = 1259
          end
        end
        object GroupBox2: TGroupBox
          Left = 222
          Top = 105
          Width = 100
          Height = 50
          Caption = 'Data Inicial'
          TabOrder = 7
          object cxDBTextEdit1: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'data_inicio_m'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 87
          end
        end
        object GroupBox3: TGroupBox
          Left = 328
          Top = 105
          Width = 100
          Height = 50
          Caption = 'Data Final'
          TabOrder = 8
          object cxDBTextEdit2: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'data_final_m'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 87
          end
        end
        object GroupBox4: TGroupBox
          Left = 434
          Top = 105
          Width = 100
          Height = 50
          Caption = 'Data Fechar'
          TabOrder = 9
          object cxDBTextEdit3: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'data_fechamento_m'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 87
          end
        end
        object GroupBox5: TGroupBox
          Left = 540
          Top = 105
          Width = 100
          Height = 50
          Caption = 'Dt Assumeida'
          TabOrder = 10
          object cxDBTextEdit4: TcxDBTextEdit
            AlignWithMargins = True
            Left = 8
            Top = 19
            Margins.Left = 6
            Margins.Top = 0
            Align = alClient
            DataBinding.DataField = 'data_hora_assumido_m'
            DataBinding.DataSource = dsQryChamado
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsNone
            Style.Color = 6402120
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 87
          end
        end
      end
    end
  end
  object pnlHeaderFiltro: TRzPanel
    Left = 0
    Top = 41
    Width = 1915
    Height = 53
    Align = alTop
    BorderOuter = fsNone
    Color = 6402120
    TabOrder = 3
    OnMouseDown = CaptureMouse_Down
    OnMouseMove = CaptureMouse_Move
    OnMouseUp = CaptureMouse_Up
    object btnFiltrar: TStyledSpeedButton
      AlignWithMargins = True
      Left = 1878
      Top = 5
      Width = 32
      Height = 44
      Hint = 'Filtrar'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 4
      Align = alRight
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1E1E81000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF1E1E1E810000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF1E1E
        1E81000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF1E1E1E810000000000000000000000000000000000000000000000000000
        000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF1E1E1E8100000000000000000000000000000000000000000000
        0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
        00001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E810000000000000000000000001E1E
        1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E8100000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltrarClick
      OnMouseDown = CaptureMouse_Up
      ButtonStylePressed.BorderColor = clWhite
      ButtonStylePressed.ButtonColor = 6402120
      ButtonStyleHot.BorderColor = 11528341
      ButtonStyleHot.ButtonColor = 11528341
      ExplicitLeft = 1332
      ExplicitTop = 2
      ExplicitHeight = 32
    end
    object StyledSpeedButton1: TStyledSpeedButton
      AlignWithMargins = True
      Left = 939
      Top = 5
      Width = 32
      Height = 44
      Hint = 'Filtrar'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 4
      Align = alLeft
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1E1E81000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF1E1E1E810000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C3C3CFF3C3C3CFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF1E1E
        1E81000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF1E1E1E810000000000000000000000000000000000000000000000000000
        000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF1E1E1E8100000000000000000000000000000000000000000000
        0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
        00001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E810000000000000000000000001E1E
        1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E8100000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFiltrarClick
      OnMouseDown = CaptureMouse_Up
      ButtonStylePressed.BorderColor = clWhite
      ButtonStylePressed.ButtonColor = 6402120
      ButtonStyleHot.BorderColor = 11528341
      ButtonStyleHot.ButtonColor = 11528341
      ExplicitLeft = 1332
      ExplicitTop = 2
      ExplicitHeight = 32
    end
    object gbFiltroStatus: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 132
      Height = 48
      Margins.Left = 5
      Margins.Top = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Status'
      Ctl3D = True
      DefaultHeaderFont = False
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clBlack
      HeaderFont.Height = -13
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      object lbFiltroStatus: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 23
        Width = 119
        Height = 20
        Margins.Left = 6
        Margins.Top = 0
        Align = alClient
        Caption = 'TODOS'
        OnClick = lbFiltroStatusClick
        ExplicitWidth = 51
        ExplicitHeight = 21
      end
      object cbFiltroStatus: TComboBox
        Left = 2
        Top = 23
        Width = 128
        Height = 28
        Margins.Left = 6
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csOwnerDrawFixed
        ItemHeight = 22
        ParentColor = True
        TabOrder = 0
        Visible = False
        OnEnter = On_Enter
        OnExit = On_Exit
        OnSelect = On_Exit
        Items.Strings = (
          'TODOS'
          'Aberto     '
          'Fechado    '
          'Analise   '
          'Assunto    '
          'Encaminhado'
          'Reagendado '
          'Agendado   '
          'Execucao   ')
      end
    end
    object gbFiltroAssunto: TGroupBox
      AlignWithMargins = True
      Left = 145
      Top = 0
      Width = 389
      Height = 48
      Margins.Left = 5
      Margins.Top = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Assunto'
      Color = 6402120
      Ctl3D = True
      DefaultHeaderFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clBlack
      HeaderFont.Height = -13
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      object lbFiltroAssunto: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 23
        Width = 376
        Height = 20
        Margins.Left = 6
        Margins.Top = 0
        Align = alClient
        Caption = 'TODOS'
        OnClick = lbFiltroAssuntoClick
        ExplicitWidth = 51
        ExplicitHeight = 21
      end
      object cbFiltroAssunto: TComboBox
        Left = 2
        Top = 23
        Width = 385
        Height = 28
        Margins.Left = 6
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csOwnerDrawFixed
        ItemHeight = 22
        ParentColor = True
        TabOrder = 0
        Visible = False
        OnEnter = On_Enter
        OnExit = On_Exit
        OnSelect = On_Exit
        Items.Strings = (
          'Todas'
          'Aberto     '
          'Fechado    '
          'Analise   '
          'Assunto    '
          'Encaminhado'
          'Reagendado '
          'Agendado   '
          'Execucao   ')
      end
    end
    object gbFiltroAtendente: TGroupBox
      AlignWithMargins = True
      Left = 542
      Top = 0
      Width = 389
      Height = 48
      Margins.Left = 5
      Margins.Top = 0
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Atendente'
      Color = 6402120
      Ctl3D = True
      DefaultHeaderFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clBlack
      HeaderFont.Height = -13
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object lbFiltroAtendente: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 23
        Width = 376
        Height = 20
        Margins.Left = 6
        Margins.Top = 0
        Align = alClient
        Caption = 'TODOS'
        OnClick = lbFiltroAtendenteClick
        ExplicitWidth = 51
        ExplicitHeight = 21
      end
      object cbFiltroAtendente: TComboBox
        Left = 2
        Top = 23
        Width = 385
        Height = 28
        Margins.Left = 6
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csOwnerDrawFixed
        ItemHeight = 22
        ParentColor = True
        TabOrder = 0
        Visible = False
        OnEnter = On_Enter
        OnExit = On_Exit
        OnSelect = On_Exit
        Items.Strings = (
          'Todas'
          'Aberto     '
          'Fechado    '
          'Analise   '
          'Assunto    '
          'Encaminhado'
          'Reagendado '
          'Agendado   '
          'Execucao   ')
      end
    end
    object pnlData: TPanel
      AlignWithMargins = True
      Left = 1616
      Top = 0
      Width = 257
      Height = 53
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      object lbTituloPeriodo_A: TLabel
        AlignWithMargins = True
        Left = 126
        Top = 0
        Width = 11
        Height = 53
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alRight
        Caption = #224
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnMouseDown = CaptureMouse_Down
        OnMouseMove = CaptureMouse_Move
        OnMouseUp = CaptureMouse_Up
        ExplicitHeight = 30
      end
      object pnlDataFinal: TRzPanel
        AlignWithMargins = True
        Left = 147
        Top = 7
        Width = 110
        Height = 41
        Margins.Left = 0
        Margins.Top = 7
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alRight
        BorderOuter = fsNone
        Color = 15987699
        TabOrder = 0
        Transparent = True
        object lbDataFinal: TDateLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 97
          Height = 35
          Margins.Right = 10
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '02/02/2025'
          Color = 6402120
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = On_Enter
          OnMouseDown = CaptureMouse_Down
          OnMouseMove = CaptureMouse_Move
          OnMouseUp = CaptureMouse_Up
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
          DateTimeFormat = 'dd/mm/yyyy'
          Version = '1.1.0.0'
          RefreshInterval = 0
          RefreshEnabled = False
          ExplicitLeft = 10
          ExplicitHeight = 23
        end
        object dtDataFinal: TRzDateTimePicker
          Left = 0
          Top = 0
          Width = 110
          Height = 41
          Margins.Left = 6
          Margins.Bottom = 4
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Date = 45545.000000000000000000
          Format = ''
          Time = 0.691542280095745800
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParseInput = True
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnExit = On_Exit
        end
      end
      object pnlDataInicial: TRzPanel
        AlignWithMargins = True
        Left = 6
        Top = 7
        Width = 110
        Height = 41
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 7
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alRight
        BorderOuter = fsNone
        Color = 15987699
        TabOrder = 1
        Transparent = True
        object lbDataInicial: TDateLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 97
          Height = 35
          Margins.Right = 10
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '02/02/2025'
          Color = 6402120
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = On_Enter
          OnMouseDown = CaptureMouse_Down
          OnMouseMove = CaptureMouse_Move
          OnMouseUp = CaptureMouse_Up
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
          DateTimeFormat = 'dd/mm/yyyy'
          Version = '1.1.0.0'
          RefreshInterval = 0
          RefreshEnabled = False
          ExplicitLeft = 10
          ExplicitHeight = 23
        end
        object dtDataInicial: TRzDateTimePicker
          Left = 0
          Top = 0
          Width = 110
          Height = 41
          Margins.Right = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Date = 45545.000000000000000000
          Format = ''
          Time = 0.691542280095745800
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParseInput = True
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnExit = On_Exit
        end
      end
    end
    object pnlTipoFiltro: TPanel
      AlignWithMargins = True
      Left = 1312
      Top = 0
      Width = 209
      Height = 53
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 4
      object lbTipoFiltro: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 203
        Height = 53
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'M'#234's refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = lbTipoFiltroClick
        ExplicitWidth = 126
        ExplicitHeight = 41
      end
      object cbTipoFiltro: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 8
        Width = 203
        Height = 28
        Margins.Top = 8
        Margins.Bottom = 0
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csOwnerDrawFixed
        Ctl3D = True
        DropDownCount = 3
        DropDownWidth = 160
        ExtendedUI = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemHeight = 22
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'Per'#237'odo selecionado'
        Visible = False
        OnCloseUp = cbTipoFiltroCloseUp
        OnEnter = On_Enter
        OnExit = On_Exit
        OnSelect = On_Exit
        Items.Strings = (
          'M'#234's refer'#234'ncia'
          'Per'#237'odo selecionado')
      end
    end
    object pnlPeriodo: TRzPanel
      AlignWithMargins = True
      Left = 1526
      Top = 7
      Width = 90
      Height = 41
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alRight
      BorderOuter = fsNone
      Color = 6402120
      TabOrder = 5
      object lbPeriodo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 77
        Height = 35
        Margins.Right = 10
        Align = alClient
        AutoSize = False
        Caption = '2024-12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        OnClick = On_Enter
        OnMouseEnter = LabelMouseEnter
        OnMouseLeave = LabelMouseLeave
        ExplicitLeft = 10
        ExplicitWidth = 187
        ExplicitHeight = 23
      end
      object cbPeriodo: TComboBox
        Left = 0
        Top = 0
        Width = 90
        Height = 30
        Margins.Top = 6
        Align = alClient
        AutoCloseUp = True
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csOwnerDrawFixed
        Ctl3D = True
        ExtendedUI = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemHeight = 24
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnChange = cbPeriodoChange
        OnCloseUp = cbPeriodoCloseUp
        OnExit = On_Exit
        OnSelect = On_Exit
        Items.Strings = (
          '')
      end
    end
  end
  object iTitulo: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Scaled = True
    Left = 215
    Top = 242
    Bitmap = {
      494C010108001800040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026170566B56F18DCF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFB36F17DB251705640000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026170566B56F18DCF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFB36F17DB251705640000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000080A27662831B6DC3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF2731B4DB080A25640000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000003000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      00002013045DF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FF1E12
      045A000000000000000000000000000000000000000000000000000000000000
      00002013045DF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FF1E12
      045A000000000000000000000000000000000000000000000000000000000000
      00000708205D3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF0608
      1E5A000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AB6917D6F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFA867
      16D4000000000000000000000000000000000000000000000000000000000000
      0000AB6917D6F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFA867
      16D4000000000000000000000000000000000000000000000000000000000000
      0000252EACD63542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF252E
      A8D4000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9420FDF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFED92
      20FC000000000000000000000000000000000000000000000000000000000000
      0000EF9420FDF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFED92
      20FC000000000000000000000000000000000000000000000000000000000000
      00003541F0FD3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3440
      EEFC000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF8C176FFFAD5A2FFFAD5
      A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5
      A2FFFAD5A2FFFAD5A2FFF8C176FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF8C176FFFAD5A2FFFAD5
      A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5
      A2FFFAD5A2FFFAD5A2FFF8C176FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF4955F5FF7981
      F8FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF5B65F6FF3D49F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFDEACCFFFAD5
      A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5
      A2FFFAD5A2FFFDEACCFFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF454FF5FFCFCEFDFFECEA
      FFFF7B83F8FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF5E68
      F6FFE4E2FEFFBDBDFCFF3B48F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000007676
      76AE0F0F0F3E0000000000000000000000000000000000000000000000000000
      0000F7F7F7FB00000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFAD5A2FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFFAD5A2FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF767DF8FFEDEAFFFFEEEB
      FFFFEDEAFFFF8188F8FF3542F4FF3542F4FF3542F4FF3542F4FF636BF7FFE6E4
      FFFFEEEBFFFFEEEBFFFF8389F9FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF00000000000000000000000014141448FFFF
      FFFFFFFFFFFF1515154A0000000000000000000000000000000000000000FDFD
      FDFEFFFFFFFFEDEDEDF6000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFAD5A2FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFFAD5A2FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF8D92F9FFEEEB
      FFFFEEEBFFFFECEAFFFF7A82F8FF3542F4FF3542F4FF5E68F6FFE4E2FEFFEEEB
      FFFFEEEBFFFFA5A9FBFF3643F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000002C2C
      2C6BFFFFFFFFFFFFFFFF0F0F0F3E000000000000000000000000F9F9F9FCFFFF
      FFFFF3F3F3F900000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFAD5A2FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFFAD5A2FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF8D92
      F9FFEEEBFFFFEEEBFFFFECE9FFFF747BF8FF5E68F6FFE4E2FEFFEEEBFFFFEEEB
      FFFFA5A9FBFF3643F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00002C2C2C6BFFFFFFFFFFFFFFFF0F0F0F3E00000000F9F9F9FCFFFFFFFFF3F3
      F3F90000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFAD5A2FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFFAD5A2FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF8D92F9FFEEEBFFFFEEEBFFFFEBE9FFFFE7E5FFFFEEEBFFFFEEEBFFFFA5A9
      FBFF3643F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000002C2C2C6BFFFFFFFFFFFFFFFFFBFBFBFDFFFFFFFFF3F3F3F90000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFAD5A2FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFFAD5A2FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF8D92F9FFEEEBFFFFEEEBFFFFEEEBFFFFEEEBFFFFA5A9FBFF3643
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000002C2C2C6BFFFFFFFFFFFFFFFFF5F5F5FA000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFAD5A2FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFFAD5A2FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF5E68F6FFE9E6FFFFEEEBFFFFEEEBFFFFEDEAFFFF737BF8FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000F9F9F9FCFFFFFFFFFFFFFFFFFFFFFFFF0F0F0F3E0000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFDEACCFFFAD5
      A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5
      A2FFFAD5A2FFFDEACCFFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF5E68F6FFE4E2FEFFEEEBFFFFEEEBFFFFEEEBFFFFEEEBFFFFEBE8FFFF727A
      F8FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000F9F9F9FCFFFFFFFFF3F3F3F92C2C2C6BFFFFFFFFFFFFFFFF0F0F
      0F3E0000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF5E68
      F6FFE4E2FEFFEEEBFFFFEEEBFFFFA5A9FBFF8C92F9FFEEEBFFFFEEEBFFFFEBE8
      FFFF7179F8FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000F9F9F9FCFFFFFFFFF3F3F3F900000000000000002C2C2C6BFFFFFFFFFFFF
      FFFF0F0F0F3E00000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFFAD5A2FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5
      E1FFFEF5E1FFFEF5E1FFFAD5A2FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF5E68F6FFE4E2
      FEFFEEEBFFFFEEEBFFFFA5A9FBFF3643F4FF3542F4FF8C92F9FFEEEBFFFFEEEB
      FFFFEBE8FFFF7179F8FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF00000000000000000000000000000000F9F9
      F9FCFFFFFFFFF3F3F3F9000000000000000000000000000000002C2C2C6BFFFF
      FFFFFFFFFFFF0F0F0F3E000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF8C176FFFAD5A2FFFAD5
      A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5A2FFFAD5
      A2FFFAD5A2FFFAD5A2FFF8C176FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF6069F7FFE6E4FFFFEEEB
      FFFFEEEBFFFF9CA0FAFF3542F4FF3542F4FF3542F4FF3542F4FF8087F8FFEDEA
      FFFFEEEBFFFFECE9FFFF6771F7FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF00000000000000000000000000000000FFFF
      FFFFF3F3F3F90000000000000000000000000000000000000000000000002C2C
      2C6BFFFFFFFF19191951000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF4F5AF6FFD9D8FEFFEEEB
      FFFFA5A9FBFF3643F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF8C92
      F9FFEEEBFFFFC1C2FCFF3D4AF5FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000202021700000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF4B56F5FF8D92
      F9FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF6B73F7FF3B46F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      0000F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FF000000000000000000000000000000000000000000000000000000000000
      00003542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9420FDF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFED92
      20FC000000000000000000000000000000000000000000000000000000000000
      0000EF9420FDF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFED92
      20FC000000000000000000000000000000000000000000000000000000000000
      00003541F0FD3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3440
      EEFC000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFF000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      00030000000300000003000000030000000300000003FFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AB6917D6F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFA867
      16D4000000000000000000000000000000000000000000000000000000000000
      0000AB6917D6F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFA867
      16D4000000000000000000000000000000000000000000000000000000000000
      0000252EACD63542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF252E
      A8D4000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000028180568F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FF2617
      0566000000000000000000000000000000000000000000000000000000000000
      000028180568F39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FF2617
      0566000000000000000000000000000000000000000000000000000000000000
      0000080A28683542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF080A
      2766000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFD0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026170566AB6917D6E78E1FF9F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFE78E1FF9AB6917D6251705640000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026170566AB6917D6E78E1FF9F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFE78E1FF9AB6917D6251705640000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000080A2766252EACD6333FE8F93542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542F4FF3542
      F4FF3542F4FF3542F4FF3542F4FF3542F4FF333FE8F9252EACD6080A25640000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000003000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000003000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FB000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000500000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00AE0000003E0000000000000000000000000000000000000000000000000000
      0000000000FB00000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FB000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000500000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000480000
      00FF000000FF0000004A00000000000000000000000000000000000000000000
      00FE000000FF000000F6000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      0005000000000000000000000000000000000000000000000000000000FF0000
      00FF0000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      006B000000FF000000FF0000003E000000000000000000000000000000FC0000
      00FF000000F900000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      0005000000000000000000000000000000000000000000000000000000FF0000
      00FF0000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00000000006B000000FF000000FF0000003E00000000000000FC000000FF0000
      00F90000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      001B000000FA000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000006B000000FF000000FF000000FD000000FF000000F90000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      000000000000000000000000006B000000FF000000FF000000FA000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      00EA000000FF000000FF00000005000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00000000000000000000000000FC000000FF000000FF000000FF0000003E0000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      0005000000FA000000FF00000005000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      000000000000000000FC000000FF000000F90000006B000000FF000000FF0000
      003E0000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      00FF000000FF000000FF00000005000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000FC000000FF000000F900000000000000000000006B000000FF0000
      00FF0000003E00000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FA000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00FC000000FF000000F9000000000000000000000000000000000000006B0000
      00FF000000FF0000003E000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000FA000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00FF000000F90000000000000000000000000000000000000000000000000000
      006B000000FF00000051000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000FA000000FF00000005000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001700000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000FA000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000FA000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      00030000000300000003000000030000000300000003000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000030000000300000003000000030000
      0003000000030000000300000003000000030000000300000003000000030000
      00030000000300000003000000030000000300000003000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FD000000FD000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FD000000FD0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FD000000FD000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FD000000FD0000
      00FD000000FD000000FD000000FD000000FD000000FD000000FD000000FD0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object dsQryGrupo: TUniDataSource
    Left = 528
    Top = 449
  end
  object dsQryChamado: TUniDataSource
    Left = 504
    Top = 785
  end
end
