object Form1: TForm1
  Left = 255
  Top = 269
  Width = 1016
  Height = 639
  Caption = #1048#1043#1056#1040
  Color = clBtnFace
  Constraints.MinHeight = 639
  Constraints.MinWidth = 1016
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    1000
    600)
  PixelsPerInch = 96
  TextHeight = 13
  object Left_Panel: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 600
    Align = alLeft
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 5
      Top = 10
      Width = 240
      Height = 30
      Caption = #1058#1045#1050#1057#1058#1054#1042#1067#1049' '#1060#1040#1049#1051' '#1050#1054#1052#1040#1053#1044#1067' 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Memo1: TMemo
      Left = 5
      Top = 50
      Width = 240
      Height = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = Memo1Change
    end
    object Button5: TButton
      Left = 56
      Top = 500
      Width = 130
      Height = 30
      Caption = #1048#1043#1056#1040#1058#1068
      TabOrder = 2
      OnClick = Button5Click
    end
  end
  object Right_Panel: TPanel
    Left = 750
    Top = 0
    Width = 250
    Height = 600
    Align = alRight
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 50
      Width = 240
      Height = 30
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1074' '#1089#1077#1082#1091#1085#1076#1072#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 5
      Top = 128
      Width = 240
      Height = 30
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = #1050#1086#1083'-'#1074#1086' '#1088#1072#1091#1085#1076#1086#1074' '#1076#1083#1103' '#1087#1086#1073#1077#1076#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object Edit1: TEdit
      Left = 5
      Top = 80
      Width = 240
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Options_Confirm_Button: TButton
      Left = 75
      Top = 200
      Width = 100
      Height = 30
      Caption = #1055#1056#1048#1053#1071#1058#1068
      TabOrder = 1
      OnClick = Options_Confirm_ButtonClick
    end
    object Edit3: TEdit
      Left = 2
      Top = 158
      Width = 240
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object First_Player_Panel: TPanel
    Left = 250
    Top = 0
    Width = 150
    Height = 50
    Align = alCustom
    Anchors = []
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Second_Player_Panel: TPanel
    Left = 600
    Top = 0
    Width = 150
    Height = 50
    Align = alCustom
    Anchors = []
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Score_Panel: TPanel
    Left = 450
    Top = 0
    Width = 100
    Height = 50
    Anchors = []
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button2: TButton
    Left = 5
    Top = 130
    Width = 240
    Height = 30
    Caption = #1048#1057#1055#1054#1051#1053#1071#1045#1052#1067#1049' '#1060#1040#1049#1051' '#1050#1054#1052#1040#1053#1044#1067' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 5
    Top = 170
    Width = 240
    Height = 70
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 6
    OnChange = Memo2Change
  end
  object Button3: TButton
    Left = 5
    Top = 250
    Width = 240
    Height = 30
    Caption = #1058#1045#1050#1057#1058#1054#1042#1067#1049' '#1060#1040#1049#1051' '#1050#1054#1052#1040#1053#1044#1067' 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button3Click
  end
  object Memo3: TMemo
    Left = 5
    Top = 290
    Width = 240
    Height = 70
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 8
    OnChange = Memo3Change
  end
  object Button4: TButton
    Left = 5
    Top = 370
    Width = 240
    Height = 30
    Caption = #1048#1057#1055#1054#1051#1053#1071#1045#1052#1067#1049' '#1060#1040#1049#1051' '#1050#1054#1052#1040#1053#1044#1067' 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button4Click
  end
  object Memo4: TMemo
    Left = 5
    Top = 410
    Width = 240
    Height = 80
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 10
    OnChange = Memo4Change
  end
  object Panel1: TPanel
    Left = 250
    Top = 550
    Width = 500
    Height = 50
    BevelOuter = bvNone
    TabOrder = 11
  end
  object Panel2: TPanel
    Left = 400
    Top = 0
    Width = 50
    Height = 50
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object Panel3: TPanel
    Left = 550
    Top = 0
    Width = 50
    Height = 50
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 80
  end
end
