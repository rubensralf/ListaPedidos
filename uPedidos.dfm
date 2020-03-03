object fPedidos: TfPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 504
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCampos: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object grpFiltro: TGroupBox
      Left = 0
      Top = 100
      Width = 623
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
      ExplicitTop = 104
      object sbTAtualizar: TPngSpeedButton
        Left = 592
        Top = 15
        Width = 23
        Height = 22
        Flat = True
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
      object Código: TLabel
        Left = 18
        Top = 20
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFiltroSituacao: TLabel
        Left = 423
        Top = 20
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
      object edtFiltroCodigo: TEdit
        Left = 54
        Top = 17
        Width = 60
        Height = 19
        Alignment = taRightJustify
        TabOrder = 0
      end
      object grpFiltroData: TGroupBox
        Left = 124
        Top = 7
        Width = 289
        Height = 39
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object De: TLabel
          Left = 24
          Top = 16
          Width = 13
          Height = 13
          Caption = 'De'
        end
        object Até: TLabel
          Left = 145
          Top = 16
          Width = 17
          Height = 13
          Caption = 'At'#233
        end
        object dtpFiltroDataDe: TDateTimePicker
          Left = 40
          Top = 12
          Width = 100
          Height = 21
          Date = 43889.000000000000000000
          Time = 0.883298206019389900
          TabOrder = 0
        end
        object dtpFiltroDataAte: TDateTimePicker
          Left = 165
          Top = 12
          Width = 100
          Height = 21
          Date = 43889.000000000000000000
          Time = 0.883298206019389900
          TabOrder = 1
        end
      end
      object cbbFiltroSituacao: TComboBox
        Left = 467
        Top = 16
        Width = 110
        Height = 21
        TabOrder = 2
        Items.Strings = (
          '01 - Em an'#225'lise'
          '02 - Aprovado'
          '03 - Cancelado')
      end
    end
  end
  object dbgPedidos: TDBGrid
    Left = 0
    Top = 145
    Width = 623
    Height = 359
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorTotal'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vlr. Total'
        Width = 80
        Visible = True
      end>
  end
  object quPedidos: TFDQuery
    SQL.Strings = (
      'select * from pedidos')
    Left = 40
    Top = 216
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
    object quPedidosvalorTotal: TFloatField
      FieldName = 'valorTotal'
      Origin = 'valorTotal'
    end
  end
  object dsPedidos: TDataSource
    DataSet = quPedidos
    Left = 96
    Top = 216
  end
end
