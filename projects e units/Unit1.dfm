object TikTacToe: TTikTacToe
  Left = 0
  Top = 0
  Caption = 'TicTacToe'
  ClientHeight = 473
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 23
  object line1: TLabel
    Left = 304
    Top = 288
    Width = 8
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object line2: TLabel
    Left = 288
    Top = 317
    Width = 8
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object line3: TLabel
    Left = 304
    Top = 346
    Width = 8
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lb_tittle: TLabel
    Left = 272
    Top = 24
    Width = 113
    Height = 33
    Caption = 'Jogador: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 224
    Top = 112
    Width = 117
    Height = 23
    Caption = 'Digite a linha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 224
    Top = 145
    Width = 132
    Height = 23
    Caption = 'Digite a coluna:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object linha: TEdit
    Left = 347
    Top = 112
    Width = 126
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = linhaKeyPress
  end
  object coluna: TEdit
    Left = 362
    Top = 145
    Width = 111
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = colunaKeyPress
  end
  object Button1: TButton
    Left = 256
    Top = 200
    Width = 160
    Height = 41
    Caption = 'Realizar Jogada'
    TabOrder = 2
    OnClick = Button1Click
  end
end
