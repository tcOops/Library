object FrmMBlocKData: TFrmMBlocKData
  Left = 365
  Top = 160
  BorderStyle = bsDialog
  Caption = 'BLOCKDATA'
  ClientHeight = 424
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo_MBlockData: TMemo
    Left = 0
    Top = 0
    Width = 386
    Height = 390
    Align = alClient
    Color = clSilver
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 390
    Width = 386
    Height = 34
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Button1: TButton
      Left = 174
      Top = 4
      Width = 153
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
