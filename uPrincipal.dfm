object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 766
  ClientWidth = 1060
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenu
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenu: TMainMenu
    Left = 24
    Top = 16
    object mniConsultas: TMenuItem
      Caption = 'Consultas'
      object mniPedidos: TMenuItem
        Caption = 'Pedidos'
        OnClick = mniPedidosClick
      end
      object mniItens: TMenuItem
        Caption = 'Itens'
        OnClick = mniItensClick
      end
    end
    object mniSair: TMenuItem
      Caption = 'Sair'
      OnClick = mniSairClick
    end
  end
end
