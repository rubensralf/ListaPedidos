object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 720
  ClientWidth = 879
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
    Width = 879
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlPedidosCampos: TPanel
      Left = 0
      Top = 0
      Width = 257
      Height = 233
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lblData: TLabel
        Left = 35
        Top = 32
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object lblDescricao: TLabel
        Left = 12
        Top = 54
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblSituacao: TLabel
        Left = 17
        Top = 188
        Width = 41
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object lblValorTotalPedido: TLabel
        Left = 15
        Top = 212
        Width = 43
        Height = 13
        Caption = 'Vlr. Total'
      end
      object lblCodigo: TLabel
        Left = 25
        Top = 9
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Enabled = False
      end
      object medData: TMaskEdit
        Left = 61
        Top = 29
        Width = 70
        Height = 19
        Alignment = taRightJustify
        Ctl3D = False
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object cbbSituacao: TComboBox
        Left = 61
        Top = 184
        Width = 145
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Items.Strings = (
          '01 - Em an'#225'lise'
          '02 - Aprovado'
          '03 - Cancelado')
      end
      object medValorTotalPedido: TMaskEdit
        Left = 61
        Top = 209
        Width = 90
        Height = 19
        Alignment = taRightJustify
        Ctl3D = False
        EditMask = '!99.999.999,00;1;_'
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 4
        Text = '  .   .   ,  '
      end
      object mmoDescricaoPedido: TMemo
        Left = 61
        Top = 51
        Width = 185
        Height = 129
        MaxLength = 200
        TabOrder = 2
      end
      object edtCodigoPedido: TEdit
        Left = 61
        Top = 5
        Width = 70
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object dbgPedidos: TDBGrid
      Left = 257
      Top = 0
      Width = 622
      Height = 233
      Align = alClient
      DataSource = dsPedidos
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
  end
  object pnlTituloPedidos: TPanel
    Left = 0
    Top = 0
    Width = 879
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PEDIDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object quPedidos: TFDQuery
    SQL.Strings = (
      'select * from pedidos')
    Left = 448
    Top = 80
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
    Left = 448
    Top = 136
  end
end
