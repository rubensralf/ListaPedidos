object fPedidos: TfPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 809
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl3: TPanel
    Left = 0
    Top = 521
    Width = 932
    Height = 15
    Align = alTop
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
  end
  object pnlFundoItens: TPanel
    Left = 0
    Top = 536
    Width = 932
    Height = 249
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object pnlItens: TPanel
      Left = 0
      Top = 0
      Width = 932
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      Caption = 'ITENS DO PEDIDO'
      Color = 12961221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object pnl6: TPanel
        Left = 762
        Top = 0
        Width = 170
        Height = 27
        Align = alRight
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object sbtNovoItem: TPngSpeedButton
          Left = 8
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          OnClick = sbtNovoItemClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000B1300000B
            1301009A9C18000000424944415478DA6364C00D4E02B11912DB029B22463C06
            FC2746EDA8011041E4D026159C64C4621349802A069C00627332F51F1B1CB130
            8C0D408E9D63406C8D4D11003DF6139CCDCEF0EB0000000049454E44AE426082}
        end
        object sbtEditarItem: TPngSpeedButton
          Left = 41
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          OnClick = sbtEditarItemClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000B1300000B
            1301009A9C18000001074944415478DAA5D0B14A42511CC7F173F14E41838DD2
            0B38092D2E36B426A29B3AF806D1A08884488585481841D1E012642F20482FE0
            E4262D6D4E16088E369A7E0FFC85C3E59EEB15FFF0E172FFE79EDFFD9FE3A83D
            CB09F95D046544F18AE92E017AF31B4AF23EC319BEC306B8F840DEE8E909E258
            6C0BB8C411EED043C1584BE333282083BE4C792B21EF28628E047E6D012718E2
            C0E86D429ED0C597ED0E8E3142CC674D87DC980D6FC0A1FC396199EC59EEC537
            C095339F5B360F90C3D216A0D32F2C9BC738C5C2BBE0184F7DBE86CFE61F24E5
            A96C018FA8E01E57C6FA1F5232810A0A58E10135B451C53FB27276152640570B
            757430C18BDA52DE005D4D5C7B7AD65A039F6131111025CF7E0000000049454E
            44AE426082}
        end
        object sbtCancelarEdicaoItem: TPngSpeedButton
          Left = 107
          Top = 2
          Width = 23
          Height = 22
          Enabled = False
          Flat = True
          OnClick = sbtCancelarEdicaoItemClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000B1300000B
            1301009A9C180000012D4944415478DAA5D2B14B02511CC0F1B3393024C22573
            B2A3086C6CD0A13112727092A0A2252208F79A6B91A28686A60812054388DA82
            A0A1B1A2409B8A8228100CFF80FAFEE8F7421E77A7D083CF70CF77DFBBE7BB90
            F3CF11F2999F401609BD6EA08AC76E81080E90C30B6E757E123194B082965740
            6EBEC610E67161C56735DE441A5F76A08C690D15B0E3B1B561DCE0521FF21790
            3DDF6306A3280644E6F4FF1843DD0436B184B85EAF0744E49E37EC61CB048ED1
            AF75A787C8393EB11014088A48E0038B26B081658C78ECD98EF4E91676B16D02
            E3784006675D22AFA8C0C553E7319E2085295DE41791F3AFC9FE3B8F51C600AE
            3088555DF4ADBFC96BCBA77D8867E7F7436ADB011961EC238F77DCE97C12511C
            61CDDCEC1530C3D51371F52DEA38953DDB0BFD023D8F1F3268441173315CF800
            00000049454E44AE426082}
        end
        object sbtExcluirItem: TPngSpeedButton
          Left = 140
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          OnClick = sbtExcluirItemClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            61000000097048597300000B1300000B1301009A9C18000000264944415478DA
            6364A010308E1A30080DA827525F232E031A8834A0019701031F06A306900100
            2FAC02119CAEF2980000000049454E44AE426082}
        end
        object sbtConfirmarItemPedido: TPngSpeedButton
          Left = 74
          Top = 2
          Width = 23
          Height = 22
          Enabled = False
          Flat = True
          OnClick = sbtConfirmarItemPedidoClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000B1300000B
            1301009A9C18000000BE4944415478DA6364A010300E8401CC40FC0F88FF9363
            803A10EF05E273401C0AC43F493100A4793F104B42F92B8138825803D480F800
            926610D801C49E300340742510EB01710A107F21A0F9284833107F86195007C4
            8D50F64120F606E2AF40AC0AD52C854D337220DE80FA1106409A0A80781B9AE6
            6340EC01D38C6C80263480C49114FF67408DA563509B3F21070EB2026C86C0C0
            71A8CD9FD025D063019B213835633300DD10ACCE2664000334406381B81339C0
            4831806840B101004B852811B9C712AB0000000049454E44AE426082}
        end
      end
    end
    object pnlDadosItens: TPanel
      Left = 0
      Top = 27
      Width = 932
      Height = 68
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      object lblItem: TLabel
        Left = 47
        Top = 15
        Width = 22
        Height = 13
        Caption = 'Item'
      end
      object lblQuantidade: TLabel
        Left = 13
        Top = 41
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lblVlrDesconto: TLabel
        Left = 132
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Vlr. Desconto'
      end
      object cbbItem: TComboBox
        Left = 72
        Top = 11
        Width = 808
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnDropDown = cbbItemDropDown
      end
      object edtQuantidade: TEdit
        Left = 72
        Top = 37
        Width = 50
        Height = 19
        Alignment = taRightJustify
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtValorDesconto: TEdit
        Left = 199
        Top = 36
        Width = 100
        Height = 21
        Alignment = taRightJustify
        MaxLength = 10
        TabOrder = 2
        Text = '0,00'
        OnExit = edtValorDescontoExit
        OnKeyPress = edtValorDescontoKeyPress
      end
    end
    object dbgItensPedido: TDBGrid
      Left = 0
      Top = 95
      Width = 932
      Height = 154
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsItensPedido
      GradientEndColor = 14084566
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigoItem'
          Title.Alignment = taRightJustify
          Title.Caption = 'Item'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numeroPedido'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valoritem'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr. Item'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desconto'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr. Desconto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorTotal'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr. Total'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 600
          Visible = True
        end>
    end
  end
  object pnlPedidos: TPanel
    Left = 0
    Top = 27
    Width = 932
    Height = 494
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object dbgPedidos: TDBGrid
      Left = 257
      Top = 129
      Width = 675
      Height = 365
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPedidos
      GradientEndColor = 14084566
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgPedidosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'numero'
          Title.Alignment = taRightJustify
          Title.Caption = 'N'#250'mero'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'data'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'situacao_fmt'
          Title.Caption = 'Situa'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorTotal'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr. Total'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 600
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'situacao'
          Title.Caption = 'Situa'#231#227'o'
          Visible = False
        end>
    end
    object pnlCampos: TPanel
      Left = 0
      Top = 0
      Width = 932
      Height = 124
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object grpFiltro: TGroupBox
        Left = 0
        Top = 79
        Width = 932
        Height = 45
        Align = alBottom
        Caption = 'Filtros '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sbtTAtualizarPedidos: TPngSpeedButton
          Left = 608
          Top = 17
          Width = 23
          Height = 22
          Flat = True
          OnClick = sbtTAtualizarPedidosClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000B1300000B
            1301009A9C18000001504944415478DA8DD3CD2B445118C7F133219214920D89
            62656F210B2F0B940DC5DAD698E4250BD94EC8C846ECACFC05241B14FE000B0B
            D9C8821479D90CC2C8F7D77D46B73BE7D63CF569EE3C73CE6FEE3DE7DC842BAC
            320CA0072D28C11DCEB1872CAAB08B9D4464F238326874FE7AC53246D1895438
            4013E73C137E501F13F81F308F35BBFEC606B6716B3D052CD8B88280665CA31C
            EF18C45964A0C69CA0D517B06AE9AA24B63CB77A8C5E4F3FA9804B74E00D0DF8
            F20CAC419DA77FAF804FBB7DFD4BBF2BAE46EC717E15300D7DDEB8609F8B29AD
            5137B29AA843E1DBF7273C7BFA15F69BE65D28407B9FF10C3CC490A73F8B75BB
            4E2B207C06F275853E3C44FAEA1DD89A7DA02D2E60C50587E9D1BEB76312532E
            783754296CC605E4EB05A5A88EF4D35872B6FAF98053EC6311B53181DAA91917
            DA2D05684FC73061CF55896174A109399B78E482B3920B27FE0121FC45559B8D
            7C800000000049454E44AE426082}
        end
        object lblNumero: TLabel
          Left = 33
          Top = 21
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFiltroSituacao: TLabel
          Left = 399
          Top = 21
          Width = 41
          Height = 13
          Caption = 'Situa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDe: TLabel
          Left = 143
          Top = 21
          Width = 13
          Height = 13
          Caption = 'De'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAté: TLabel
          Left = 269
          Top = 21
          Width = 17
          Height = 13
          Caption = 'At'#233
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtFiltroNumero: TEdit
          Left = 73
          Top = 17
          Width = 60
          Height = 21
          Alignment = taRightJustify
          MaxLength = 8
          TabOrder = 0
        end
        object cbbFiltroSituacao: TComboBox
          Left = 446
          Top = 18
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dtpFiltroDataDe: TDateTimePicker
          Left = 159
          Top = 17
          Width = 100
          Height = 21
          Date = 43894.000000000000000000
          Time = 0.883298206019389900
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dtpFiltroDataAte: TDateTimePicker
          Left = 292
          Top = 17
          Width = 100
          Height = 21
          Date = 43894.000000000000000000
          Time = 0.883298206019389900
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object pnlCamposPedidos: TPanel
        Left = 0
        Top = 0
        Width = 932
        Height = 79
        Align = alClient
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object lblData: TLabel
          Left = 36
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object lblDescricao: TLabel
          Left = 13
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object dtpData: TDateTimePicker
          Left = 62
          Top = 12
          Width = 100
          Height = 21
          Date = 43894.000000000000000000
          Time = 0.883298206019389900
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object mmoDescricaoPedido: TMemo
          Left = 62
          Top = 37
          Width = 818
          Height = 33
          MaxLength = 200
          TabOrder = 1
        end
      end
    end
    object pnlPedidosCampos: TPanel
      Left = 0
      Top = 129
      Width = 257
      Height = 365
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object lblValorBruto: TLabel
        Left = 96
        Top = 63
        Width = 64
        Height = 16
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblValorDesconto: TLabel
        Left = 85
        Top = 149
        Width = 86
        Height = 16
        Caption = 'Valor Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblValorLiquido: TLabel
        Left = 91
        Top = 235
        Width = 74
        Height = 16
        Caption = 'Valor L'#237'quido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlValorBruto: TPanel
        Left = 16
        Top = 79
        Width = 225
        Height = 50
        BevelOuter = bvNone
        Caption = 'R$0,00'
        Color = 12961221
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object pnlValorDesconto: TPanel
        Left = 16
        Top = 165
        Width = 225
        Height = 50
        BevelOuter = bvNone
        Caption = 'R$0,00'
        Color = 12961221
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object pnlValorLiquido: TPanel
        Left = 16
        Top = 251
        Width = 225
        Height = 50
        BevelOuter = bvNone
        Caption = 'R$0,00'
        Color = 12961221
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object pnl4: TPanel
      Left = 0
      Top = 124
      Width = 932
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 3
    end
  end
  object pnlSair: TPanel
    Left = 0
    Top = 785
    Width = 932
    Height = 24
    Align = alBottom
    BevelOuter = bvNone
    Color = 12961221
    ParentBackground = False
    TabOrder = 3
    object pnlSair2: TPanel
      Left = 911
      Top = 0
      Width = 21
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object sbtSair: TPngSpeedButton
        Left = -1
        Top = 1
        Width = 23
        Height = 22
        Flat = True
        OnClick = sbtSairClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000934944415478DA
          6364C004FC402CC9801DBC06E2B7C8028C58149D0662131C065C0062434206DC
          0062752CE24F81F80B106B906AC05D20CE858A659063002710FF00E202720D80
          A91935604819708E0135B982D4A800F17C06489A302164801410CB01B10510F7
          037113109703F159204E07E22B840C80017720DEC100C97D2003E601F17F7445
          F80CE081FA7B3A035A164606001D10271185DD84900000000049454E44AE4260
          82}
      end
    end
  end
  object pnlTituloPedidos: TPanel
    Left = 0
    Top = 0
    Width = 932
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PEDIDOS'
    Color = 12961221
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    object pnl5: TPanel
      Left = 762
      Top = 0
      Width = 170
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object sbtNovoPedido: TPngSpeedButton
        Left = 8
        Top = 2
        Width = 23
        Height = 22
        Flat = True
        OnClick = sbtNovoPedidoClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C086488000000097048597300000B1300000B
          1301009A9C18000000424944415478DA6364C00D4E02B11912DB029B22463C06
          FC2746EDA8011041E4D026159C64C4621349802A069C00627332F51F1B1CB130
          8C0D408E9D63406C8D4D11003DF6139CCDCEF0EB0000000049454E44AE426082}
      end
      object sbtEditarPedido: TPngSpeedButton
        Left = 41
        Top = 2
        Width = 23
        Height = 22
        Flat = True
        OnClick = sbtEditarPedidoClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C086488000000097048597300000B1300000B
          1301009A9C18000001074944415478DAA5D0B14A42511CC7F173F14E41838DD2
          0B38092D2E36B426A29B3AF806D1A08884488585481841D1E012642F20482FE0
          E4262D6D4E16088E369A7E0FFC85C3E59EEB15FFF0E172FFE79EDFFD9FE3A83D
          CB09F95D046544F18AE92E017AF31B4AF23EC319BEC306B8F840DEE8E909E258
          6C0BB8C411EED043C1584BE333282083BE4C792B21EF28628E047E6D012718E2
          C0E86D429ED0C597ED0E8E3142CC674D87DC980D6FC0A1FC396199EC59EEC537
          C095339F5B360F90C3D216A0D32F2C9BC738C5C2BBE0184F7DBE86CFE61F24E5
          A96C018FA8E01E57C6FA1F5232810A0A58E10135B451C53FB27276152640570B
          757430C18BDA52DE005D4D5C7B7AD65A039F6131111025CF7E0000000049454E
          44AE426082}
      end
      object sbtCancelarEdicaoPedido: TPngSpeedButton
        Left = 107
        Top = 2
        Width = 23
        Height = 22
        Enabled = False
        Flat = True
        OnClick = sbtCancelarEdicaoPedidoClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C086488000000097048597300000B1300000B
          1301009A9C180000012D4944415478DAA5D2B14B02511CC0F1B3393024C22573
          B2A3086C6CD0A13112727092A0A2252208F79A6B91A28686A60812054388DA82
          A0A1B1A2409B8A8228100CFF80FAFEE8F7421E77A7D083CF70CF77DFBBE7BB90
          F3CF11F2999F401609BD6EA08AC76E81080E90C30B6E757E123194B082965740
          6EBEC610E67161C56735DE441A5F76A08C690D15B0E3B1B561DCE0521FF21790
          3DDF6306A3280644E6F4FF1843DD0436B184B85EAF0744E49E37EC61CB048ED1
          AF75A787C8393EB11014088A48E0038B26B081658C78ECD98EF4E91676B16D02
          E3784006675D22AFA8C0C553E7319E2085295DE41791F3AFC9FE3B8F51C600AE
          3088555DF4ADBFC96BCBA77D8867E7F7436ADB011961EC238F77DCE97C12511C
          61CDDCEC1530C3D51371F52DEA38953DDB0BFD023D8F1F3268441173315CF800
          00000049454E44AE426082}
      end
      object sbtExcluirPedido: TPngSpeedButton
        Left = 140
        Top = 2
        Width = 23
        Height = 22
        Flat = True
        OnClick = sbtExcluirPedidoClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000264944415478DA
          6364A010308E1A30080DA827525F232E031A8834A0019701031F06A306900100
          2FAC02119CAEF2980000000049454E44AE426082}
      end
      object sbtConfirmarPedido: TPngSpeedButton
        Left = 74
        Top = 2
        Width = 23
        Height = 22
        Enabled = False
        Flat = True
        OnClick = sbtConfirmarPedidoClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C086488000000097048597300000B1300000B
          1301009A9C18000000BE4944415478DA6364A010300E8401CC40FC0F88FF9363
          803A10EF05E273401C0AC43F493100A4793F104B42F92B8138825803D480F800
          926610D801C49E300340742510EB01710A107F21A0F9284833107F86195007C4
          8D50F64120F606E2AF40AC0AD52C854D337220DE80FA1106409A0A80781B9AE6
          6340EC01D38C6C80263480C49114FF67408DA563509B3F21070EB2026C86C0C0
          71A8CD9FD025D063019B213835633300DD10ACCE2664000334406381B81339C0
          4831806840B101004B852811B9C712AB0000000049454E44AE426082}
      end
    end
  end
  object quPedidos: TFDQuery
    SQL.Strings = (
      
        'select ped.numero, ped.data, ped.descricao, ped.situacao, ped.va' +
        'lortotal, sit.descricao as situacao_fmt'
      'from   pedidos ped'
      '       inner join situacoes sit on sit.codigo = ped.situacao'
      'where  0 = 0'
      'order  by ped.numero desc')
    Left = 408
    Top = 272
    object quPedidosnumero: TFDAutoIncField
      FieldName = 'numero'
      Origin = 'numero'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object quPedidosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object quPedidosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object quPedidossituacao: TSmallintField
      FieldName = 'situacao'
      Origin = 'situacao'
    end
    object quPedidossituacao_fmt: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao_fmt'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object quPedidosvalorTotal: TFloatField
      DisplayWidth = 1
      FieldName = 'valorTotal'
      Origin = 'valorTotal'
      DisplayFormat = '##,###,##0.00'
      Precision = 2
    end
  end
  object dsPedidos: TDataSource
    DataSet = quPedidos
    Left = 464
    Top = 272
  end
  object quItensPedido: TFDQuery
    SQL.Strings = (
      
        'select itped.numeropedido, itped.codigoitem, itped.quantidade, i' +
        'tped.desconto, item.valor as valoritem, itped.valortotal, item.d' +
        'escricao'
      'from   itenspedido itped'
      '       inner join itens item on item.codigo = itped.codigoitem'
      'where  0 = 0')
    Left = 144
    Top = 672
    object quItensPedidoquantidade: TSmallintField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object quItensPedidodesconto: TFloatField
      FieldName = 'desconto'
      Origin = 'desconto'
    end
    object quItensPedidovalorTotal: TFloatField
      FieldName = 'valorTotal'
      Origin = 'valorTotal'
    end
    object quItensPedidonumeroPedido: TIntegerField
      FieldName = 'numeroPedido'
      Origin = 'numeroPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object quItensPedidocodigoItem: TIntegerField
      FieldName = 'codigoItem'
      Origin = 'codigoItem'
    end
    object quItensPedidodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object quItensPedidovaloritem: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valoritem'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsItensPedido: TDataSource
    DataSet = quItensPedido
    Left = 232
    Top = 672
  end
end
