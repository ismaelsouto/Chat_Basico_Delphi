object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 630
  ClientWidth = 549
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 99
    Height = 40
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button2: TButton
    Left = 32
    Top = 78
    Width = 129
    Height = 33
    Caption = 'Conectar/Desconectar'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 96
    Top = 127
    Width = 313
    Height = 378
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 319
    Top = 514
    Width = 90
    Height = 41
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 514
    Width = 217
    Height = 39
    TabOrder = 3
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 496
    Top = 8
  end
end
