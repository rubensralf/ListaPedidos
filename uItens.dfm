object fItens: TfItens
  Left = 0
  Top = 0
  Caption = 'Itens'
  ClientHeight = 412
  ClientWidth = 718
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
  object pnlFundoItens: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 412
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlItens: TPanel
      Left = 0
      Top = 0
      Width = 718
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      Caption = 'ITENS'
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
        Left = 548
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
        object sbtConfirmarItem: TPngSpeedButton
          Left = 74
          Top = 2
          Width = 23
          Height = 22
          Enabled = False
          Flat = True
          OnClick = sbtConfirmarItemClick
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
      Width = 718
      Height = 102
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      object lblValor: TLabel
        Left = 51
        Top = 19
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblDescricao: TLabel
        Left = 29
        Top = 44
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object edtValor: TEdit
        Left = 78
        Top = 15
        Width = 100
        Height = 21
        Alignment = taRightJustify
        MaxLength = 11
        TabOrder = 0
        Text = '0,00'
        OnEnter = edtValorEnter
        OnExit = edtValorExit
        OnKeyPress = edtValorKeyPress
      end
      object chkAtivo: TCheckBox
        Left = 198
        Top = 17
        Width = 49
        Height = 17
        Caption = 'Ativo'
        TabOrder = 1
      end
      object mmoDescricao: TMemo
        Left = 78
        Top = 40
        Width = 570
        Height = 46
        MaxLength = 200
        TabOrder = 2
      end
    end
    object dbgItens: TDBGrid
      Left = 0
      Top = 129
      Width = 718
      Height = 283
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsItens
      GradientEndColor = 14084566
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgItensCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taRightJustify
          Title.Caption = 'C'#243'digo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Title.Caption = 'Ativo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 1500
          Visible = True
        end>
    end
  end
  object quItens: TFDQuery
    SQL.Strings = (
      'select codigo, descricao, valor, '
      '       case when ativo = true then '#39'Sim'#39
      '            else '#39'N'#227'o'#39
      '       end as ativo '
      'from   itens')
    Left = 184
    Top = 200
    object quItenscodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object quItensdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 200
    end
    object quItensvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = '##,###,##0.00'
    end
    object quItensativo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object dsItens: TDataSource
    DataSet = quItens
    Left = 248
    Top = 200
  end
end
