object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 720
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPedidos: TPanel
    Left = 0
    Top = 25
    Width = 893
    Height = 306
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object dbgPedidos: TDBGrid
      Left = 257
      Top = 87
      Width = 636
      Height = 219
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPedidos
      GradientEndColor = 14084566
      TabOrder = 0
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
          Alignment = taLeftJustify
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
    object pnlCampos: TPanel
      Left = 0
      Top = 0
      Width = 893
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      Color = clMoneyGreen
      ParentBackground = False
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
      object lblSituacao: TLabel
        Left = 152
        Top = 16
        Width = 41
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object medData: TMaskEdit
        Left = 62
        Top = 13
        Width = 70
        Height = 19
        Alignment = taRightJustify
        Ctl3D = False
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
      end
      object mmoDescricaoPedido: TMemo
        Left = 62
        Top = 37
        Width = 818
        Height = 33
        MaxLength = 200
        TabOrder = 1
      end
      object cbbSituacao: TComboBox
        Left = 196
        Top = 12
        Width = 145
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Items.Strings = (
          '00 - Em an'#225'lise'
          '01 - Aprovado'
          '02 - Cancelado')
      end
    end
    object pnlPedidosCampos: TPanel
      Left = 0
      Top = 87
      Width = 257
      Height = 219
      Align = alLeft
      BevelOuter = bvNone
      Color = 14084566
      ParentBackground = False
      TabOrder = 2
      object lblValorBruto: TLabel
        Left = 96
        Top = 9
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
        Top = 81
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
        Top = 153
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
      object pnlValorLiquido: TPanel
        Left = 16
        Top = 25
        Width = 225
        Height = 41
        BevelOuter = bvNone
        Caption = 'R$0,00'
        Color = 9815189
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object pnl1: TPanel
        Left = 16
        Top = 97
        Width = 225
        Height = 41
        BevelOuter = bvNone
        Caption = 'R$0,00'
        Color = 9815189
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object pnl2: TPanel
        Left = 16
        Top = 169
        Width = 225
        Height = 41
        BevelOuter = bvNone
        Caption = 'R$0,00'
        Color = 9815189
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object pnl4: TPanel
      Left = 0
      Top = 82
      Width = 893
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 3
    end
  end
  object pnlTituloPedidos: TPanel
    Left = 0
    Top = 0
    Width = 893
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PEDIDOS'
    Color = 7122540
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object pnlItens: TPanel
    Left = 0
    Top = 346
    Width = 893
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'ITENS DO PEDIDO'
    Color = 7122540
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object pnl3: TPanel
    Left = 0
    Top = 331
    Width = 893
    Height = 15
    Align = alTop
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 3
  end
  object pnlDadosItens: TPanel
    Left = 0
    Top = 371
    Width = 893
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 4
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
      Items.Strings = (
        '00 - Em an'#225'lise'
        '01 - Aprovado'
        '02 - Cancelado')
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
    object medValor: TMaskEdit
      Left = 199
      Top = 36
      Width = 100
      Height = 21
      Alignment = taRightJustify
      EditMask = '00.000.000,00;1;_'
      MaxLength = 13
      TabOrder = 2
      Text = '  .   .   ,  '
    end
  end
  object dbgItensPedido: TDBGrid
    Left = 0
    Top = 439
    Width = 893
    Height = 257
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsItensPedido
    GradientEndColor = 14084566
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Alignment = taRightJustify
        Title.Caption = 'Item'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Alignment = taRightJustify
        Title.Caption = 'Qtd.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desconto'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vlr. Desconto'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorTotal'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vlr. Total'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 607
        Visible = True
      end>
  end
  object pnlSair: TPanel
    Left = 0
    Top = 696
    Width = 893
    Height = 24
    Align = alBottom
    BevelOuter = bvNone
    Color = 9815189
    ParentBackground = False
    TabOrder = 6
    object pnlSair2: TPanel
      Left = 872
      Top = 0
      Width = 21
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 871
      object sbtSair: TPngSpeedButton
        Left = -1
        Top = 1
        Width = 23
        Height = 22
        Flat = True
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
  object quPedidos: TFDQuery
    SQL.Strings = (
      'select * from pedidos')
    Left = 288
    Top = 184
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
    Left = 344
    Top = 184
  end
  object quItensPedido: TFDQuery
    SQL.Strings = (
      
        'SELECT IPED.QUANTIDADE, IPED.DESCONTO, IPED.VALORTOTAL, ITEM.COD' +
        'IGO, ITEM.DESCRICAO '
      'FROM   ITENSPEDIDO IPED'
      '       INNER JOIN ITENS ITEM ON ITEM.CODIGO = IPED.CODIGOITEM')
    Left = 352
    Top = 536
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
    object quItensPedidocodigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = []
      ReadOnly = True
    end
    object quItensPedidodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object dsItensPedido: TDataSource
    DataSet = quItensPedido
    Left = 440
    Top = 536
  end
end
