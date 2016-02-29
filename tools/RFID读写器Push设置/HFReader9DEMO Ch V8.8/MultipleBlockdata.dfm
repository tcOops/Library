object Form_Mbdata: TForm_Mbdata
  Left = 404
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #25968#25454
  ClientHeight = 446
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListView_MBlockData: TListView
    Left = 0
    Top = 0
    Width = 354
    Height = 411
    Align = alClient
    Columns = <
      item
        Caption = #22359#21495
        Width = 60
      end
      item
        Caption = #25968#25454
        Width = 200
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 411
    Width = 354
    Height = 35
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 164
      Top = 6
      Width = 141
      Height = 23
      Caption = #36820'      '#22238
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
