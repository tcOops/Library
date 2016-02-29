object frmHFReaderDemoMain: TfrmHFReaderDemoMain
  Left = 129
  Top = 29
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'HFReader'#31995#21015#30005#23376#26631#31614#35835#20889#22120#25509#21475#21151#33021#28436#31034'V8.80'
  ClientHeight = 676
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 657
    Width = 782
    Height = 19
    AutoHint = True
    Panels = <
      item
        Width = 260
      end
      item
        Text = #31471#21475
        Width = 60
      end
      item
        Text = #21378#21830#21517#31216
        Width = 110
      end
      item
        Text = #22359#21495
        Width = 225
      end
      item
        Text = #22359#22823#23567
        Width = 110
      end
      item
        Text = #31867#22411
        Width = 15
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 782
    Height = 657
    ActivePage = TabSheet_CMD
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet_CMD: TTabSheet
      Caption = #25351#20196
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 774
        Height = 630
        Align = alClient
        BevelOuter = bvLowered
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        DesignSize = (
          774
          630)
        object Label7: TLabel
          Left = 604
          Top = 430
          Width = 102
          Height = 12
          Caption = #35810#26597'DSFID-UID'#21015#34920
        end
        object GroupBox_ReaderInfo: TGroupBox
          Left = 154
          Top = 4
          Width = 441
          Height = 69
          Caption = #35835#20889#22120#20449#24687
          TabOrder = 3
          object Label2: TLabel
            Left = 130
            Top = 22
            Width = 36
            Height = 12
            Caption = #29256#26412#65306
          end
          object Label3: TLabel
            Left = 6
            Top = 45
            Width = 36
            Height = 12
            Caption = #22320#22336#65306
          end
          object Label4: TLabel
            Left = 127
            Top = 47
            Width = 132
            Height = 12
            Caption = #35810#26597#21629#20196#26368#22823#21709#24212#26102#38388#65306
          end
          object Label5: TLabel
            Left = 304
            Top = 46
            Width = 36
            Height = 12
            Caption = '*100ms'
          end
          object Label10: TLabel
            Left = 7
            Top = 22
            Width = 36
            Height = 12
            Caption = #22411#21495#65306
          end
          object Label11: TLabel
            Left = 229
            Top = 20
            Width = 60
            Height = 12
            Caption = #25903#25345#21327#35758#65306
          end
          object Edit_Version: TEdit
            Left = 177
            Top = 18
            Width = 46
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 1
          end
          object Edit_ComAdr: TEdit
            Left = 52
            Top = 41
            Width = 72
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 3
          end
          object Edit_InventoryTime: TEdit
            Left = 261
            Top = 43
            Width = 41
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 4
          end
          object Button3: TButton
            Left = 345
            Top = 41
            Width = 89
            Height = 22
            Action = Action_GetReaderInformation
            TabOrder = 5
          end
          object Edit_Type: TEdit
            Left = 52
            Top = 18
            Width = 72
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 0
          end
          object Edit_TrType: TEdit
            Left = 290
            Top = 18
            Width = 144
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 2
          end
        end
        object GroupBox_OperMode: TGroupBox
          Left = 154
          Top = 143
          Width = 441
          Height = 55
          Caption = #25805#20316#27169#24335
          TabOrder = 4
          object RadioButton_Address: TRadioButton
            Left = 20
            Top = 36
            Width = 117
            Height = 17
            Caption = 'Address'#27169#24335'(&A)'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = RadioButton_SelectClick
          end
          object RadioButton_Select: TRadioButton
            Left = 247
            Top = 12
            Width = 104
            Height = 17
            Caption = 'Select'#27169#24335'(&S)'
            TabOrder = 1
            OnClick = RadioButton_SelectClick
          end
          object ComboBox_UID: TComboBox
            Left = 20
            Top = 14
            Width = 149
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 2
            OnChange = ComboBox_UIDChange
          end
          object RadioButton_Non_Address: TRadioButton
            Left = 247
            Top = 34
            Width = 146
            Height = 17
            Caption = 'Non-Address'#27169#24335'(&N)'
            TabOrder = 3
            OnClick = RadioButton_SelectClick
          end
        end
        object GroupBox_Power: TGroupBox
          Left = 8
          Top = 217
          Width = 139
          Height = 66
          Caption = #30005#28304#31649#29702
          TabOrder = 0
          object Button4: TButton
            Left = 11
            Top = 17
            Width = 118
            Height = 21
            Action = Action_OpenRf
            TabOrder = 0
          end
          object Button5: TButton
            Left = 11
            Top = 39
            Width = 118
            Height = 21
            Action = Action_CloseRf
            TabOrder = 1
          end
        end
        object GroupBox_OtherCMD: TGroupBox
          Left = 154
          Top = 490
          Width = 443
          Height = 50
          Caption = #20854#20182#21629#20196
          TabOrder = 9
          object Button6: TButton
            Left = 11
            Top = 19
            Width = 110
            Height = 21
            Action = Action_StayQuiet
            TabOrder = 0
          end
          object Button7: TButton
            Left = 139
            Top = 19
            Width = 134
            Height = 21
            Action = Action_Select
            TabOrder = 1
          end
          object Button8: TButton
            Left = 293
            Top = 17
            Width = 132
            Height = 21
            Action = Action_ResetToReady
            Caption = #36820#22238#20934#22791#29366#24577
            TabOrder = 2
          end
        end
        object GroupBox_ComAdr: TGroupBox
          Left = 8
          Top = 287
          Width = 139
          Height = 62
          Caption = #35835#20889#22120#22320#22336#25913#20889
          TabOrder = 1
          object Label6: TLabel
            Left = 14
            Top = 17
            Width = 54
            Height = 12
            Caption = #22320#22336'(HEX)'
          end
          object Edit_NewComAdr: TEdit
            Left = 80
            Top = 13
            Width = 47
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            MaxLength = 2
            TabOrder = 0
            Text = '00'
            OnKeyPress = Edit_NewComAdrKeyPress
          end
          object Button9: TButton
            Left = 9
            Top = 34
            Width = 119
            Height = 21
            Action = Action_WriteComAdr
            TabOrder = 1
          end
        end
        object GroupBox_Inventory: TGroupBox
          Left = 604
          Top = 244
          Width = 165
          Height = 65
          Caption = #35810#26597#21629#20196#65288#21333#24352#30005#23376#26631#31614#65289
          TabOrder = 10
          object Button10: TButton
            Left = 4
            Top = 14
            Width = 157
            Height = 21
            Action = Action_Inventory_00
            TabOrder = 0
          end
          object Button11: TButton
            Left = 4
            Top = 35
            Width = 157
            Height = 21
            Action = Action_Inventory_01
            Caption = #35810#26597#21629#20196'('#24102'AFI'#27169#24335')'
            TabOrder = 1
          end
        end
        object GroupBox_Inventory2: TGroupBox
          Left = 604
          Top = 311
          Width = 165
          Height = 115
          Caption = #35810#26597#21629#20196#65288#22810#24352#30005#23376#26631#31614#65289
          TabOrder = 11
          object Button12: TButton
            Left = 3
            Top = 17
            Width = 158
            Height = 21
            Action = Action_Inventory_06
            TabOrder = 0
          end
          object Button13: TButton
            Left = 4
            Top = 67
            Width = 158
            Height = 21
            Action = Action_Inventory_07
            Caption = #26032#30340#35810#26597'('#24102'AFI)'
            TabOrder = 2
          end
          object Button24: TButton
            Left = 3
            Top = 39
            Width = 158
            Height = 21
            Action = Action_Inventory_02
            TabOrder = 1
          end
          object Button25: TButton
            Left = 4
            Top = 89
            Width = 158
            Height = 21
            Action = Action_Inventory_03
            Caption = #32487#32493#35810#26597'('#24102'AFI)'
            TabOrder = 3
          end
        end
        object ListBox_GroupBox_InventoryList: TListBox
          Left = 604
          Top = 446
          Width = 166
          Height = 177
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
          ItemHeight = 12
          TabOrder = 12
        end
        object GroupBox_Block: TGroupBox
          Left = 154
          Top = 283
          Width = 441
          Height = 119
          Caption = #25968#25454#22359#25805#20316
          TabOrder = 6
          object Label8: TLabel
            Left = 9
            Top = 41
            Width = 36
            Height = 12
            Caption = #22359#21495#65306
          end
          object Label14: TLabel
            Left = 9
            Top = 94
            Width = 66
            Height = 12
            Caption = #36215#22987#22359#21495#65306' '
          end
          object Label16: TLabel
            Left = 179
            Top = 15
            Width = 66
            Height = 12
            Caption = #26368#22823#22359#21495#65306' '
          end
          object Label17: TLabel
            Left = 298
            Top = 15
            Width = 72
            Height = 12
            Caption = #21333#20301#22359#22823#23567#65306
          end
          object Label18: TLabel
            Left = 9
            Top = 17
            Width = 72
            Height = 12
            Caption = #26631#31614#20889#31867#22411#65306
          end
          object Label20: TLabel
            Left = 172
            Top = 95
            Width = 60
            Height = 12
            Caption = #32467#26463#22359#21495#65306
          end
          object ComboBox_BlockNum: TComboBox
            Left = 56
            Top = 37
            Width = 58
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 0
          end
          object Button18: TButton
            Left = 15
            Top = 61
            Width = 96
            Height = 23
            Action = Action_LockBlock
            TabOrder = 1
          end
          object Edit_R_BlockData: TEdit
            Left = 130
            Top = 37
            Width = 163
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 2
          end
          object Button19: TButton
            Left = 300
            Top = 37
            Width = 131
            Height = 21
            Action = Action_ReadSingleBlock
            TabOrder = 3
          end
          object Edit_BlockData: TEdit
            Left = 130
            Top = 62
            Width = 163
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            TabOrder = 4
            OnKeyPress = Edit_NewComAdrKeyPress
          end
          object Button20: TButton
            Left = 300
            Top = 62
            Width = 131
            Height = 21
            Action = Action_WriteSingleBlock
            TabOrder = 5
          end
          object Button28: TButton
            Left = 300
            Top = 88
            Width = 131
            Height = 23
            Action = Action_ReadMultipleBlock
            TabOrder = 6
          end
          object ComboBox_BlockAdr: TComboBox
            Left = 94
            Top = 90
            Width = 61
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 7
            OnChange = ComboBox_BlockAdrChange
          end
          object ComboBox_MAXBlockNum: TComboBox
            Left = 241
            Top = 11
            Width = 53
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 8
            OnChange = ComboBox_MAXBlockNumChange
          end
          object ComboBox_BlockEndAdr: TComboBox
            Left = 239
            Top = 91
            Width = 53
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 9
          end
          object ComboBox_Edit_BlockStyle: TComboBox
            Left = 112
            Top = 13
            Width = 61
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 10
            OnChange = ComboBox_Edit_BlockStyleChange
          end
          object ComboBox_Edit_BlockStyleNum: TComboBox
            Left = 370
            Top = 10
            Width = 59
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 11
            OnChange = ComboBox_Edit_BlockStyleNumChange
          end
        end
        object GroupBox_SystemInformation: TGroupBox
          Left = 154
          Top = 201
          Width = 441
          Height = 81
          Caption = #30005#23376#26631#31614#35814#32454#20449#24687
          TabOrder = 5
          object Edit_SystemInfo: TEdit
            Left = 13
            Top = 15
            Width = 236
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 0
          end
          object Button16: TButton
            Left = 256
            Top = 14
            Width = 172
            Height = 21
            Action = Action_GetSystemInformation
            TabOrder = 1
          end
          object Memo_SystemInfo2: TMemo
            Left = 13
            Top = 41
            Width = 417
            Height = 32
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object GroupBox_InventoryScanTime: TGroupBox
          Left = 604
          Top = 4
          Width = 165
          Height = 39
          Caption = #35810#26597#21629#20196#26368#22823#21709#24212#26102#38388
          TabOrder = 2
          object Label9: TLabel
            Left = 67
            Top = 19
            Width = 36
            Height = 12
            Caption = '*100ms'
          end
          object ComboBox_InventoryScanTime: TComboBox
            Left = 13
            Top = 15
            Width = 50
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ItemHeight = 12
            TabOrder = 0
          end
          object BitBtn1: TBitBtn
            Left = 105
            Top = 14
            Width = 48
            Height = 19
            Action = Action_WriteInventoryScanTime
            Caption = #20889#20837
            TabOrder = 1
          end
        end
        object GroupBox_AFI: TGroupBox
          Left = 154
          Top = 403
          Width = 443
          Height = 41
          Caption = 'AFI'#24212#29992#31867#22411#35782#21035#30721'(HEX)'
          TabOrder = 7
          object Edit_AFI: TEdit
            Left = 16
            Top = 16
            Width = 89
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            MaxLength = 2
            TabOrder = 0
            Text = '00'
            OnKeyPress = Edit_NewComAdrKeyPress
          end
          object Button21: TButton
            Left = 139
            Top = 13
            Width = 134
            Height = 21
            Action = Action_WriteAFI
            TabOrder = 1
          end
          object Button17: TButton
            Left = 291
            Top = 13
            Width = 134
            Height = 21
            Action = Action_LockAFI
            Caption = #38145#23450'AFI'
            TabOrder = 2
          end
        end
        object GroupBox_DSFID: TGroupBox
          Left = 154
          Top = 444
          Width = 443
          Height = 46
          Caption = 'DSFID'#25968#25454#20445#23384#35782#21035#30721'(HEX)'
          TabOrder = 8
          object Edit_DSFID: TEdit
            Left = 16
            Top = 16
            Width = 89
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            MaxLength = 2
            TabOrder = 0
            Text = '00'
            OnKeyPress = Edit_NewComAdrKeyPress
          end
          object Button22: TButton
            Left = 137
            Top = 15
            Width = 134
            Height = 21
            Action = Action_WriteDSFID
            TabOrder = 1
          end
          object Button23: TButton
            Left = 292
            Top = 17
            Width = 133
            Height = 21
            Action = Action_LockDSFID
            TabOrder = 2
          end
        end
        object GroupBox_Output: TGroupBox
          Left = 8
          Top = 354
          Width = 139
          Height = 80
          Caption = #36890#29992#36755#20986#31471#21475#29366#24577
          TabOrder = 13
          object Label_LED: TLabel
            Left = 8
            Top = 14
            Width = 30
            Height = 12
            Caption = #31471#21475'2'
          end
          object Label_BEEP: TLabel
            Left = 78
            Top = 14
            Width = 30
            Height = 12
            Caption = #31471#21475'1'
          end
          object Button26: TButton
            Left = 12
            Top = 54
            Width = 115
            Height = 21
            Action = ActionSetGeneralOutput
            TabOrder = 2
          end
          object ComboBox_Output1: TComboBox
            Left = 8
            Top = 31
            Width = 56
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 0
            Items.Strings = (
              #20302#30005#24179
              #39640#30005#24179)
          end
          object ComboBox_Output0: TComboBox
            Left = 77
            Top = 31
            Width = 56
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 1
            Items.Strings = (
              #20302#30005#24179
              #39640#30005#24179)
          end
        end
        object GroupBox_Input: TGroupBox
          Left = 8
          Top = 436
          Width = 139
          Height = 47
          Caption = #36890#29992#36755#20837#31471#21475#29366#24577
          TabOrder = 14
          object Button29: TButton
            Left = 89
            Top = 18
            Width = 42
            Height = 21
            Action = ActionGetGeneralInput
            TabOrder = 0
          end
          object Edit_Input0_State: TEdit
            Left = 10
            Top = 19
            Width = 63
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 1
          end
        end
        object GroupBox_Relay: TGroupBox
          Left = 8
          Top = 485
          Width = 139
          Height = 48
          Caption = #32487#30005#22120#29366#24577
          TabOrder = 15
          object Button27: TButton
            Left = 87
            Top = 18
            Width = 42
            Height = 21
            Action = ActionSetRelay
            TabOrder = 0
          end
          object ComboBox_Relay0: TComboBox
            Left = 10
            Top = 19
            Width = 67
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ItemHeight = 12
            TabOrder = 1
            Items.Strings = (
              #21560#21512
              #37322#25918)
          end
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 535
          Width = 139
          Height = 46
          Caption = #35835#20889#22120#22825#32447#29366#24577
          TabOrder = 16
          object Edit_ANTStatus: TEdit
            Left = 10
            Top = 18
            Width = 61
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ReadOnly = True
            TabOrder = 0
          end
          object Button30: TButton
            Left = 86
            Top = 16
            Width = 43
            Height = 25
            Action = Action_GetANTStatus
            Caption = #33719#21462
            TabOrder = 1
          end
        end
        object TGroupBox
          Left = 438
          Top = 541
          Width = 159
          Height = 45
          TabOrder = 17
          object Button31: TButton
            Left = 8
            Top = 12
            Width = 135
            Height = 25
            Action = Action_SetActiveANT
            Caption = #35774#32622#26377#25928#22825#32447
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          Left = 604
          Top = 43
          Width = 165
          Height = 63
          Caption = #26631#31614#36890#36807#26102#38388
          TabOrder = 18
          object Label29: TLabel
            Left = 66
            Top = 16
            Width = 36
            Height = 12
            Caption = '*100ms'
          end
          object Label32: TLabel
            Left = 66
            Top = 38
            Width = 36
            Height = 12
            Caption = '*100ms'
          end
          object ComboBox_AccessTime: TComboBox
            Left = 12
            Top = 14
            Width = 51
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 0
          end
          object Button32: TButton
            Left = 106
            Top = 11
            Width = 47
            Height = 23
            Action = Action_SetAccessTime
            TabOrder = 1
          end
          object Edit_AccessTimeRet: TEdit
            Left = 12
            Top = 36
            Width = 51
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ReadOnly = True
            TabOrder = 2
          end
          object Button37: TButton
            Left = 106
            Top = 36
            Width = 47
            Height = 21
            Action = Action_GetAccessTime
            TabOrder = 3
          end
        end
        object GroupBox5: TGroupBox
          Left = 410
          Top = 586
          Width = 161
          Height = 41
          TabOrder = 19
          object Button42: TButton
            Left = 16
            Top = 12
            Width = 133
            Height = 25
            Action = Action_SetReceiveANT
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 6
          Top = 583
          Width = 137
          Height = 45
          Caption = #20027#20174#36890#36947#29366#24577
          TabOrder = 20
          object Button41: TButton
            Left = 86
            Top = 16
            Width = 45
            Height = 23
            Action = Action_GetReceiveANTStatus
            Caption = #33719#21462
            TabOrder = 0
          end
          object Edit_ReceiveANTStatus: TEdit
            Left = 4
            Top = 18
            Width = 79
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ReadOnly = True
            TabOrder = 1
          end
        end
        object RadioGroup_ReceiveANT: TRadioGroup
          Left = 150
          Top = 586
          Width = 263
          Height = 41
          Caption = #20027#20174#36890#36947#35774#32622
          TabOrder = 21
        end
        object CheckBox_RX_ANT: TCheckBox
          Left = 296
          Top = 604
          Width = 83
          Height = 17
          Caption = 'RX_Channel'
          TabOrder = 22
        end
        object CheckBox_TX_ANT: TCheckBox
          Left = 164
          Top = 604
          Width = 95
          Height = 17
          Caption = 'TX/RX_Channel'
          TabOrder = 23
        end
        object RadioGroup_ActiveANTNum: TGroupBox
          Left = 157
          Top = 541
          Width = 285
          Height = 45
          Caption = #35774#32622#24403#21069#26377#25928#22825#32447
          TabOrder = 24
          object RadioButton_ActiveANTNum1: TRadioButton
            Left = 10
            Top = 20
            Width = 51
            Height = 17
            Caption = #22825#32447'1'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RadioButton_ActiveANTNum2: TRadioButton
            Left = 76
            Top = 20
            Width = 65
            Height = 17
            Caption = #22825#32447'2'
            TabOrder = 1
          end
          object RadioButton_ActiveANTNum3: TRadioButton
            Left = 142
            Top = 22
            Width = 71
            Height = 15
            Caption = #22825#32447'3'
            TabOrder = 2
          end
          object RadioButton_ActiveANTNum4: TRadioButton
            Left = 218
            Top = 20
            Width = 61
            Height = 17
            Caption = #22825#32447'4'
            TabOrder = 3
          end
        end
        object GroupBox_parsemode: TGroupBox
          Left = 604
          Top = 160
          Width = 165
          Height = 39
          Caption = #35299#26512#27169#24335
          TabOrder = 25
          object RadioButton_parsemode1: TRadioButton
            Left = 9
            Top = 16
            Width = 79
            Height = 17
            Action = Action_SetParseMode
            TabOrder = 0
          end
          object RadioButton_parsemode2: TRadioButton
            Left = 87
            Top = 16
            Width = 73
            Height = 17
            Caption = #23485#24230#20248#20808
            TabOrder = 1
            OnClick = Action_SetParseModeExecute
          end
        end
        object GroupBox_depth: TGroupBox
          Left = 604
          Top = 201
          Width = 165
          Height = 41
          Caption = #35843#21046#24230
          TabOrder = 26
          object RadioButton_depth1: TRadioButton
            Left = 88
            Top = 18
            Width = 65
            Height = 17
            Caption = '10%'
            TabOrder = 0
            OnClick = Action_SetDepthExecute
          end
          object RadioButton_depth2: TRadioButton
            Left = 9
            Top = 18
            Width = 73
            Height = 17
            Action = Action_SetDepth
            Caption = '100%'
            TabOrder = 1
          end
        end
        object GroupBox14: TGroupBox
          Left = 605
          Top = 109
          Width = 164
          Height = 49
          Caption = #35774#32622#35810#26597#21152#36895#21151#33021
          TabOrder = 27
          object RadioButton1: TRadioButton
            Left = 7
            Top = 21
            Width = 113
            Height = 17
            Caption = #21551#21160
            Enabled = False
            TabOrder = 0
            OnClick = RadioButton1Click
          end
          object RadioButton2: TRadioButton
            Left = 87
            Top = 21
            Width = 73
            Height = 17
            Caption = #31105#27490
            Enabled = False
            TabOrder = 1
            OnClick = RadioButton2Click
          end
        end
        object GroupBox15: TGroupBox
          Left = 154
          Top = 77
          Width = 263
          Height = 63
          Caption = #27874#29305#29575#35774#32622#20351#33021
          TabOrder = 28
          object RadioButton3: TRadioButton
            Left = 8
            Top = 24
            Width = 124
            Height = 17
            Caption = #35774#32622#26377#25928
            Enabled = False
            TabOrder = 0
            OnClick = RadioButton3Click
          end
          object RadioButton4: TRadioButton
            Left = 144
            Top = 25
            Width = 113
            Height = 17
            Caption = #35774#32622#26080#25928
            Enabled = False
            TabOrder = 1
            OnClick = RadioButton4Click
          end
        end
        object GroupBox16: TGroupBox
          Left = 420
          Top = 75
          Width = 175
          Height = 65
          Caption = #27874#29305#29575#35774#32622
          TabOrder = 29
          object ComboBox1: TComboBox
            Left = 8
            Top = 13
            Width = 159
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
            Items.Strings = (
              '19200bps'
              '38400bps'
              '57600bps'
              '115200bps')
          end
          object Button43: TButton
            Left = 8
            Top = 36
            Width = 157
            Height = 25
            Caption = #35774#32622
            TabOrder = 1
            OnClick = Button43Click
          end
        end
        object PageControl2: TPageControl
          Left = 3
          Top = 0
          Width = 148
          Height = 213
          ActivePage = TabSheet3
          Style = tsFlatButtons
          TabOrder = 30
          OnChange = PageControl2Change
          object TabSheet3: TTabSheet
            Caption = #20018#21475
            object GroupBox_COM: TGroupBox
              Left = 1
              Top = -4
              Width = 139
              Height = 187
              TabOrder = 0
              object Label1: TLabel
                Left = 12
                Top = 15
                Width = 36
                Height = 12
                Caption = #31471#21475#65306
              end
              object Label12: TLabel
                Left = 14
                Top = 119
                Width = 60
                Height = 12
                Caption = #24050#25171#24320#31471#21475
              end
              object Label13: TLabel
                Left = 16
                Top = 83
                Width = 42
                Height = 12
                Caption = #27874#29305#29575':'
              end
              object ComboBox_COM: TComboBox
                Left = 62
                Top = 12
                Width = 68
                Height = 20
                Style = csDropDownList
                ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                ItemHeight = 12
                TabOrder = 0
                OnChange = ComboBox_COMChange
              end
              object Button1: TButton
                Left = 12
                Top = 59
                Width = 116
                Height = 21
                Action = Action_OpenCOM
                TabOrder = 1
              end
              object Button2: TButton
                Left = 12
                Top = 160
                Width = 116
                Height = 21
                Action = Action_CloseCOM
                TabOrder = 2
              end
              object StaticText1: TStaticText
                Left = 11
                Top = 40
                Width = 70
                Height = 16
                Caption = #35835#20889#22120#22320#22336':'
                TabOrder = 3
              end
              object Edit_CmdComAddr: TEdit
                Left = 88
                Top = 37
                Width = 39
                Height = 20
                CharCase = ecUpperCase
                ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                MaxLength = 2
                TabOrder = 4
                Text = 'FF'
                OnKeyPress = Edit_NewComAdrKeyPress
              end
              object ComboBox_AlreadyOpenCOM: TComboBox
                Left = 12
                Top = 135
                Width = 117
                Height = 20
                Style = csDropDownList
                ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                ItemHeight = 12
                TabOrder = 5
                OnCloseUp = ComboBox_AlreadyOpenCOMCloseUp
              end
              object ComboBox_baud: TComboBox
                Left = 12
                Top = 96
                Width = 118
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 6
                Items.Strings = (
                  '19200bps'
                  '38400bps'
                  '57600bps'
                  '115200bps')
              end
            end
          end
          object TabSheet4: TTabSheet
            Caption = #32593#21475
            ImageIndex = 1
            object gp_net: TGroupBox
              Left = 3
              Top = 1
              Width = 137
              Height = 182
              Caption = #32593#21475#36890#35759
              TabOrder = 0
              object Label59: TLabel
                Left = 12
                Top = 19
                Width = 36
                Height = 12
                Caption = #31471#21475#65306
              end
              object Label60: TLabel
                Left = 12
                Top = 55
                Width = 18
                Height = 12
                Caption = 'IP:'
              end
              object Label61: TLabel
                Left = 12
                Top = 88
                Width = 72
                Height = 12
                Caption = #35835#20889#22120#22320#22336#65306
              end
              object Edit7: TEdit
                Left = 48
                Top = 14
                Width = 80
                Height = 20
                MaxLength = 5
                TabOrder = 0
                Text = '6000'
                OnKeyPress = Edit1KeyPress
              end
              object Edit8: TEdit
                Left = 32
                Top = 47
                Width = 97
                Height = 20
                TabOrder = 1
                Text = '192.168.1.192'
              end
              object Edit9: TEdit
                Left = 80
                Top = 80
                Width = 48
                Height = 20
                TabOrder = 2
                Text = 'FF'
                OnKeyPress = Edit_NewComAdrKeyPress
              end
              object opnet: TButton
                Left = 11
                Top = 111
                Width = 117
                Height = 25
                Caption = #25171#24320
                TabOrder = 3
                OnClick = opnetClick
              end
              object closenet: TButton
                Left = 11
                Top = 147
                Width = 117
                Height = 25
                Caption = #20851#38381
                TabOrder = 4
                OnClick = closenetClick
              end
            end
          end
        end
      end
    end
    object TabSheet_TestMode: TTabSheet
      Caption = #27979#35797#27169#24335
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 602
        Width = 774
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Button14: TButton
          Left = 16
          Top = 5
          Width = 136
          Height = 21
          Action = Action_OpenTestMode
          TabOrder = 0
        end
        object Button15: TButton
          Left = 156
          Top = 5
          Width = 136
          Height = 21
          Action = Action_CloseTestMode
          TabOrder = 1
        end
      end
      object ListView_UID: TListView
        Left = 0
        Top = 0
        Width = 774
        Height = 602
        Align = alClient
        Columns = <
          item
            Caption = #24207#21495
          end
          item
            Caption = #21378#21830
            Width = 250
          end
          item
            Caption = 'UID'
            Width = 160
          end
          item
            Caption = 'DSFID'
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object TabSheet_ScanMode: TTabSheet
      Caption = #25195#25551#27169#24335
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 774
        Height = 630
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 2
          Top = 3
          Width = 775
          Height = 319
          Caption = #25195#25551#27169#24335#35774#32622
          TabOrder = 1
          object Label15: TLabel
            Left = 11
            Top = 159
            Width = 60
            Height = 12
            Caption = #36215#22987#22359#21495#65306
          end
          object Label19: TLabel
            Left = 11
            Top = 185
            Width = 60
            Height = 12
            Caption = #22359'    '#25968#65306
          end
          object Label21: TLabel
            Left = 9
            Top = 213
            Width = 60
            Height = 12
            Caption = #36215#22987#23383#33410#65306
          end
          object Label22: TLabel
            Left = 9
            Top = 237
            Width = 60
            Height = 12
            Caption = #23383' '#33410' '#25968#65306
          end
          object Label23: TLabel
            Left = 11
            Top = 265
            Width = 60
            Height = 12
            Caption = #38388' '#38548' '#31526#65306
          end
          object Label24: TLabel
            Left = 9
            Top = 291
            Width = 60
            Height = 12
            Caption = #32467' '#26463' '#31526#65306
          end
          object ComboBox_FirstBlockNum: TComboBox
            Left = 82
            Top = 153
            Width = 77
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 0
          end
          object ComboBox_NumBlock: TComboBox
            Left = 82
            Top = 179
            Width = 77
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 1
          end
          object ComboBox_SepChar: TComboBox
            Left = 82
            Top = 259
            Width = 77
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            ItemIndex = 6
            TabOrder = 2
            Text = '","'
            Items.Strings = (
              ''
              'CR+LF'
              'CR'
              'LF'
              'TAB'
              '";"'
              '","'
              '""')
          end
          object ComboBox_EndChar: TComboBox
            Left = 82
            Top = 287
            Width = 77
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            ItemIndex = 1
            TabOrder = 3
            Text = 'CR+LF'
            Items.Strings = (
              ''
              'CR+LF'
              'CR'
              'LF'
              'TAB'
              '";"'
              '","'
              '""')
          end
          object ComboBox_FirstByte: TComboBox
            Left = 82
            Top = 207
            Width = 77
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 4
          end
          object ComboBox_NumByte: TComboBox
            Left = 82
            Top = 233
            Width = 77
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 5
          end
          object Button33: TButton
            Left = 608
            Top = 145
            Width = 137
            Height = 25
            Action = Action_SetScanMode
            Caption = #36827#20837#25195#25551#27169#24335
            TabOrder = 6
          end
          object GroupBox_UserDefinechar: TGroupBox
            Left = 180
            Top = 161
            Width = 181
            Height = 108
            Caption = #33258#23450#20041#38388#38548#31526'/'#32467#26463#31526
            TabOrder = 7
            object CheckBox_SepUserbit71: TCheckBox
              Left = 9
              Top = 24
              Width = 111
              Height = 17
              Caption = #33258#23450#20041#38388#38548#31526#65306
              TabOrder = 0
            end
            object CheckBox_SepUserbit70: TCheckBox
              Left = 7
              Top = 64
              Width = 115
              Height = 17
              Caption = #33258#23450#20041#32467#26463#31526#65306
              TabOrder = 1
            end
            object Edit_SepUser: TEdit
              Left = 124
              Top = 22
              Width = 47
              Height = 20
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
              TabOrder = 2
            end
            object Edit_EndUser: TEdit
              Left = 123
              Top = 63
              Width = 47
              Height = 20
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
              TabOrder = 3
            end
          end
          object GroupBox_ScanModeOption: TGroupBox
            Left = 3
            Top = 75
            Width = 770
            Height = 67
            TabOrder = 8
            object RadioGroup_Reader_Mode_bit0: TRadioGroup
              Left = 1
              Top = 6
              Width = 92
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #24102'Com_Adr'
                #19981#24102'Com_Adr')
              TabOrder = 0
            end
            object RadioGroup_Reader_Mode_bit1: TRadioGroup
              Left = 91
              Top = 6
              Width = 69
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #24102'UID'
                #19981#24102'UID')
              TabOrder = 1
            end
            object RadioGroup_Reader_Mode_bit2: TRadioGroup
              Left = 158
              Top = 6
              Width = 98
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #21253#21547#25351#23450#22359
                #19981#21253#21547#25351#23450#22359)
              TabOrder = 2
            end
            object RadioGroup_Reader_Mode_bit3: TRadioGroup
              Left = 254
              Top = 6
              Width = 110
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #24102#23433#20840#29366#24577#23383
                #19981#24102#23433#20840#29366#24577#23383)
              TabOrder = 3
            end
            object RadioGroup_Reader_Mode_bit401: TRadioGroup
              Left = 362
              Top = 6
              Width = 75
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #21313#20845#36827#21046
                'ASCII')
              TabOrder = 4
            end
            object RadioGroup_Reader_Mode_bit5: TRadioGroup
              Left = 435
              Top = 6
              Width = 123
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #36827#34892#24320#20851#23556#39057#22330
                #19981#36827#34892#24320#20851#23556#39057#22330)
              TabOrder = 5
            end
            object RadioGroup_Reader_Mode_bit6: TRadioGroup
              Left = 556
              Top = 6
              Width = 138
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #20572#27490#25195#25551#26102#20851#38381#23556#39057#22330
                #26080#25805#20316)
              TabOrder = 6
            end
            object RadioGroup_Reader_Mode_bit7: TRadioGroup
              Left = 692
              Top = 6
              Width = 76
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #40483#21483#38378#28865
                #26080)
              TabOrder = 7
            end
          end
          object GroupBox7: TGroupBox
            Left = 366
            Top = 210
            Width = 235
            Height = 60
            Caption = #24403#21069#25195#25551#27169#24335#29366#24577
            TabOrder = 9
            object Label25: TLabel
              Left = 36
              Top = 26
              Width = 6
              Height = 12
            end
          end
          object GroupBox13: TGroupBox
            Left = 366
            Top = 161
            Width = 235
            Height = 47
            Caption = #24403#21069#29992#25143#33258#23450#20041#25968#25454#22359#38271#24230#65306
            TabOrder = 10
            object Edit_UserDefineBlocklengthshow: TEdit
              Left = 28
              Top = 18
              Width = 121
              Height = 20
              Color = clSilver
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
              TabOrder = 0
            end
          end
          object Button34: TButton
            Left = 608
            Top = 202
            Width = 137
            Height = 25
            Action = Action_CloseScanModeDataShow
            TabOrder = 11
          end
          object Button35: TButton
            Left = 608
            Top = 173
            Width = 137
            Height = 25
            Action = Action_OpenScanModeDataShow
            TabOrder = 12
          end
          object Button36: TButton
            Left = 609
            Top = 289
            Width = 137
            Height = 25
            Action = Action_CloseScanMode
            TabOrder = 13
          end
          object GroupBox22: TGroupBox
            Left = 3
            Top = 11
            Width = 756
            Height = 69
            TabOrder = 14
            object RadioGroup1: TRadioGroup
              Left = 2
              Top = 6
              Width = 99
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #27491#24120#25968#25454#25195#25551
                'EAS'#25195#25551)
              TabOrder = 0
            end
            object RadioGroup2: TRadioGroup
              Left = 102
              Top = 6
              Width = 88
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #27491#24120#28789#25935#24230
                #39640#28789#25935#24230)
              TabOrder = 1
            end
            object RadioGroup3: TRadioGroup
              Left = 190
              Top = 6
              Width = 100
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #31105#27490#36755#20837#21516#27493
                #20801#35768#36755#20837#21516#27493)
              TabOrder = 2
            end
            object RadioGroup4: TRadioGroup
              Left = 291
              Top = 6
              Width = 100
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #31105#27490#25351#20196#21516#27493
                #20801#35768#25351#20196#21516#27493)
              TabOrder = 3
            end
            object RadioGroup5: TRadioGroup
              Left = 392
              Top = 6
              Width = 100
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #31105#27490#25195#25551#25552#31034
                #20801#35768#25195#25551#25552#31034)
              TabOrder = 4
            end
            object RadioGroup6: TRadioGroup
              Left = 493
              Top = 6
              Width = 116
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #31105#27490'EAS'#25506#27979#25552#31034
                #20801#35768'EAS'#25506#27979#25552#31034)
              TabOrder = 5
            end
            object RadioGroup7: TRadioGroup
              Left = 610
              Top = 6
              Width = 142
              Height = 55
              ItemIndex = 0
              Items.Strings = (
                #31105#27490'EAS'#28040#24687#36755#20986#25552#31034
                #20801#35768'EAS'#28040#24687#36755#20986#25552#31034)
              TabOrder = 6
            end
          end
          object Button_startscan: TButton
            Left = 609
            Top = 231
            Width = 137
            Height = 25
            Caption = #36827#34892#24403#21069#25195#25551
            Enabled = False
            TabOrder = 15
            OnClick = Button_startscanClick
          end
          object Button_stopscan: TButton
            Left = 609
            Top = 260
            Width = 137
            Height = 25
            Caption = #26242#20572#24403#21069#25195#25551
            Enabled = False
            TabOrder = 16
            OnClick = Button_stopscanClick
          end
        end
        object Memo1: TMemo
          Left = 4
          Top = 328
          Width = 759
          Height = 269
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          Lines.Strings = (
            '')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object GroupBox23: TGroupBox
          Left = 2
          Top = 598
          Width = 423
          Height = 30
          Caption = #26174#31034#26684#24335
          TabOrder = 2
          object RadioButton5: TRadioButton
            Left = 11
            Top = 11
            Width = 113
            Height = 17
            Caption = #21313#20845#36827#21046#26174#31034
            TabOrder = 0
          end
          object RadioButton6: TRadioButton
            Left = 187
            Top = 11
            Width = 104
            Height = 17
            Caption = 'ASCII'
            TabOrder = 1
          end
        end
        object Button76: TButton
          Left = 617
          Top = 601
          Width = 132
          Height = 25
          Caption = #28165#23631
          TabOrder = 3
          OnClick = Button76Click
        end
      end
    end
    object TabSheet_CustomCmd: TTabSheet
      Caption = #33258#23450#20041#25968#25454#22359#38271#24230
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 774
        Height = 630
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object GroupBox8: TGroupBox
          Left = 500
          Top = 32
          Width = 165
          Height = 83
          Caption = #35810#26597#21629#20196#65288#21333#24352#30005#23376#26631#31614#65289
          TabOrder = 0
          object Button44: TButton
            Left = 12
            Top = 18
            Width = 137
            Height = 21
            Action = Action_Inventory_00
            TabOrder = 0
          end
          object Button45: TButton
            Left = 12
            Top = 51
            Width = 137
            Height = 21
            Action = Action_Inventory_01
            Caption = #35810#26597#21629#20196'('#24102'AFI'#27169#24335')'
            TabOrder = 1
          end
        end
        object GroupBox9: TGroupBox
          Left = 500
          Top = 141
          Width = 165
          Height = 168
          Caption = #35810#26597#21629#20196#65288#22810#24352#30005#23376#26631#31614#65289
          TabOrder = 1
          object Button46: TButton
            Left = 11
            Top = 31
            Width = 137
            Height = 21
            Action = Action_Inventory_06
            TabOrder = 0
          end
          object Button47: TButton
            Left = 11
            Top = 104
            Width = 137
            Height = 21
            Action = Action_Inventory_07
            Caption = #26032#30340#35810#26597'('#24102'AFI)'
            TabOrder = 2
          end
          object Button48: TButton
            Left = 11
            Top = 55
            Width = 137
            Height = 21
            Action = Action_Inventory_02
            TabOrder = 1
          end
          object Button49: TButton
            Left = 11
            Top = 128
            Width = 137
            Height = 21
            Action = Action_Inventory_03
            Caption = #32487#32493#35810#26597'('#24102'AFI)'
            TabOrder = 3
          end
        end
        object GroupBox10: TGroupBox
          Left = 46
          Top = 32
          Width = 228
          Height = 47
          Caption = #29992#25143#33258#23450#20041#25968#25454#22359#38271#24230
          TabOrder = 2
          object ComboBox_SetBlockLength: TComboBox
            Left = 12
            Top = 18
            Width = 59
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            ItemIndex = 3
            TabOrder = 0
            Text = '0X04'
            Items.Strings = (
              '0X01'
              '0X02'
              '0X03'
              '0X04'
              '0X05'
              '0X06'
              '0X07'
              '0X08')
          end
          object Button50: TButton
            Left = 88
            Top = 16
            Width = 131
            Height = 23
            Action = Action_SetBlockLength
            TabOrder = 1
          end
        end
        object GroupBox12: TGroupBox
          Left = 273
          Top = 32
          Width = 218
          Height = 47
          Caption = #33719#21462#33258#23450#20041#25968#25454#22359#38271#24230
          TabOrder = 3
          object Edit_UserDefineBlocklength: TEdit
            Left = 12
            Top = 18
            Width = 55
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            TabOrder = 0
          end
          object Button52: TButton
            Left = 86
            Top = 14
            Width = 123
            Height = 23
            Action = Action_GetUserDefineBlocklength
            TabOrder = 1
          end
        end
        object GroupBox11: TGroupBox
          Left = 47
          Top = 87
          Width = 445
          Height = 68
          Caption = #25805#20316#27169#24335
          TabOrder = 4
          object RadioButton_Address1: TRadioButton
            Left = 25
            Top = 44
            Width = 116
            Height = 17
            Caption = 'Address'#27169#24335'(&A)'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = RadioButton_SelectClick
          end
          object RadioButton_Select1: TRadioButton
            Left = 256
            Top = 20
            Width = 104
            Height = 17
            Caption = 'Select'#27169#24335'(&S)'
            TabOrder = 1
            OnClick = RadioButton_SelectClick
          end
          object ComboBox_UID2: TComboBox
            Left = 25
            Top = 18
            Width = 149
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 2
            OnChange = ComboBox_UID2Change
          end
          object RadioButton_Non_Address1: TRadioButton
            Left = 256
            Top = 42
            Width = 146
            Height = 17
            Caption = 'Non-Address'#27169#24335'(&N)'
            TabOrder = 3
            OnClick = RadioButton_SelectClick
          end
        end
        object GroupBox4: TGroupBox
          Left = 47
          Top = 162
          Width = 445
          Height = 147
          Caption = #25968#25454#22359#25805#20316
          TabOrder = 5
          object Label26: TLabel
            Left = 10
            Top = 57
            Width = 60
            Height = 12
            Caption = #35835#20889#22359#21495#65306
          end
          object Label27: TLabel
            Left = 10
            Top = 120
            Width = 66
            Height = 12
            Caption = #36215#22987#22359#21495#65306' '
          end
          object Label28: TLabel
            Left = 220
            Top = 22
            Width = 66
            Height = 12
            Caption = #26368#22823#22359#21495#65306' '
          end
          object Label30: TLabel
            Left = 10
            Top = 22
            Width = 72
            Height = 12
            Caption = #26631#31614#20889#31867#22411#65306
          end
          object Label31: TLabel
            Left = 138
            Top = 120
            Width = 60
            Height = 12
            Caption = #32467#26463#22359#21495#65306
          end
          object ComboBox_BlockNumUser: TComboBox
            Left = 65
            Top = 53
            Width = 60
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 0
          end
          object Edit_R_BlockData2: TEdit
            Left = 136
            Top = 53
            Width = 163
            Height = 20
            Color = clSilver
            ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
            ReadOnly = True
            TabOrder = 1
          end
          object Edit_BlockData2: TEdit
            Left = 136
            Top = 80
            Width = 163
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            TabOrder = 2
            OnKeyPress = Edit_NewComAdrKeyPress
          end
          object ComboBox_BlockAdrUser: TComboBox
            Left = 66
            Top = 116
            Width = 61
            Height = 20
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 3
          end
          object ComboBox_MAXBlockNumuser: TComboBox
            Left = 312
            Top = 18
            Width = 59
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 4
            Text = ' '
            OnChange = ComboBox_MAXBlockNumuserChange
          end
          object ComboBox_BlockEndAdrUser: TComboBox
            Left = 203
            Top = 116
            Width = 62
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 5
          end
          object ComboBox_Edit_BlockStyleuser: TComboBox
            Left = 135
            Top = 18
            Width = 61
            Height = 20
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ItemHeight = 12
            TabOrder = 6
          end
          object Button38: TButton
            Left = 310
            Top = 49
            Width = 119
            Height = 25
            Action = Action_ReadUserSingleBlock
            TabOrder = 7
          end
          object Button39: TButton
            Left = 310
            Top = 78
            Width = 119
            Height = 25
            Action = Action_WriteUserSingleBlock
            TabOrder = 8
          end
          object Button40: TButton
            Left = 310
            Top = 112
            Width = 119
            Height = 25
            Action = Action_ReadUserMultipleBlock
            TabOrder = 9
          end
        end
      end
    end
    object TabSheet_TransparentCMD: TTabSheet
      Caption = #36879#26126#21629#20196
      ImageIndex = 4
      object GroupBox20: TGroupBox
        Left = 8
        Top = 7
        Width = 683
        Height = 155
        Caption = #26222#36890#35835#31867#22411#36879#26126#21629#20196#65306
        TabOrder = 0
        object Label45: TLabel
          Left = 19
          Top = 36
          Width = 66
          Height = 12
          Caption = #21629#20196#25968#25454#65306' '
        end
        object Label46: TLabel
          Left = 16
          Top = 98
          Width = 66
          Height = 12
          Caption = #21709#24212#25968#25454#65306' '
        end
        object Button54: TButton
          Left = 526
          Top = 18
          Width = 143
          Height = 25
          Action = Action_TransparentRead
          TabOrder = 0
        end
        object Memo_TransparentReadData: TMemo
          Left = 85
          Top = 18
          Width = 431
          Height = 51
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object Memo_TransparentReadRspData: TMemo
          Left = 85
          Top = 80
          Width = 431
          Height = 51
          Color = clScrollBar
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 2
        end
      end
      object GroupBox17: TGroupBox
        Left = 8
        Top = 173
        Width = 683
        Height = 151
        Caption = #26222#36890#20889#31867#22411#36879#26126#21629#20196#65306
        TabOrder = 1
        object Label39: TLabel
          Left = 20
          Top = 38
          Width = 66
          Height = 12
          Caption = #21629#20196#25968#25454#65306' '
        end
        object Label40: TLabel
          Left = 21
          Top = 107
          Width = 66
          Height = 12
          Caption = #21709#24212#25968#25454#65306' '
        end
        object Button55: TButton
          Left = 524
          Top = 20
          Width = 145
          Height = 25
          Action = Action_TransparentWrite
          TabOrder = 0
        end
        object Memo_TransparentWriteData: TMemo
          Left = 85
          Top = 20
          Width = 431
          Height = 51
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object Memo_TransparentWriteRspData: TMemo
          Left = 85
          Top = 90
          Width = 433
          Height = 51
          Color = clScrollBar
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 2
        end
      end
      object GroupBox21: TGroupBox
        Left = 8
        Top = 329
        Width = 683
        Height = 153
        Caption = #32473#23450#21709#24212#26102#38388#30340#36879#26126#21629#20196#65306
        TabOrder = 2
        object Label47: TLabel
          Left = 22
          Top = 38
          Width = 66
          Height = 12
          Caption = #21629#20196#25968#25454#65306' '
        end
        object Label48: TLabel
          Left = 20
          Top = 100
          Width = 66
          Height = 12
          Caption = #21709#24212#25968#25454#65306' '
        end
        object Button57: TButton
          Left = 519
          Top = 18
          Width = 157
          Height = 25
          Action = Action_TransparentCustomizedCmd
          Caption = #32473#23450#21709#24212#26102#38388#30340#36879#26126#21629#20196
          TabOrder = 0
        end
        object Memo_TransparentCustomizedData: TMemo
          Left = 83
          Top = 18
          Width = 431
          Height = 51
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object Memo_TransparentCustomizedRspData: TMemo
          Left = 83
          Top = 84
          Width = 433
          Height = 51
          Color = clScrollBar
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 2
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #21151#29575#37197#32622
      ImageIndex = 5
      object GroupBox18: TGroupBox
        Left = 8
        Top = 8
        Width = 741
        Height = 297
        Caption = #20869#37096
        TabOrder = 0
        Visible = False
        object Label33: TLabel
          Left = 228
          Top = 97
          Width = 84
          Height = 12
          Caption = #35774#32622#21151#29575#32423#25968#65306
        end
        object Label34: TLabel
          Left = 228
          Top = 170
          Width = 72
          Height = 12
          Caption = #35835#21151#29575#32423#25968#65306
        end
        object Label35: TLabel
          Left = 229
          Top = 62
          Width = 72
          Height = 12
          Caption = #35843#25972#20540#22823#23567#65306
        end
        object Label36: TLabel
          Left = 228
          Top = 138
          Width = 96
          Height = 12
          Caption = #36755#20986#24133#24230#27979#37327#20540#65306
        end
        object Label37: TLabel
          Left = 509
          Top = 24
          Width = 36
          Height = 12
          Caption = #21151#29575#25968
        end
        object Label38: TLabel
          Left = 559
          Top = 24
          Width = 48
          Height = 12
          Caption = #21151#29575#32423#25968
        end
        object Label41: TLabel
          Left = 623
          Top = 24
          Width = 36
          Height = 12
          Caption = #24133#24230#20540
        end
        object Label42: TLabel
          Left = 676
          Top = 24
          Width = 24
          Height = 12
          Caption = #29366#24577
        end
        object Label53: TLabel
          Left = 228
          Top = 202
          Width = 60
          Height = 12
          Caption = #35835#21151#29575#25968#65306
        end
        object Edit1_PW: TEdit
          Left = 73
          Top = 235
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          OnDblClick = Edit1_PWDblClick
        end
        object RB2: TRadioButton
          Left = 16
          Top = 211
          Width = 33
          Height = 17
          Caption = '2W'
          TabOrder = 1
        end
        object Edit2_PW: TEdit
          Left = 73
          Top = 211
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          OnDblClick = Edit2_PWDblClick
        end
        object RB1: TRadioButton
          Left = 16
          Top = 235
          Width = 41
          Height = 17
          Caption = '1W'
          TabOrder = 3
        end
        object RB4: TRadioButton
          Left = 16
          Top = 164
          Width = 33
          Height = 17
          Caption = '4W'
          TabOrder = 4
        end
        object Edit4_PW: TEdit
          Left = 73
          Top = 164
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 5
          Text = '0'
          OnDblClick = Edit4_PWDblClick
        end
        object RB6: TRadioButton
          Left = 16
          Top = 118
          Width = 33
          Height = 17
          Caption = '6W'
          TabOrder = 6
        end
        object Edit6_PW: TEdit
          Left = 73
          Top = 118
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 7
          Text = '0'
          OnDblClick = Edit6_PWDblClick
        end
        object RB8: TRadioButton
          Left = 16
          Top = 70
          Width = 41
          Height = 17
          Caption = '8W'
          TabOrder = 8
        end
        object Edit8_PW: TEdit
          Left = 73
          Top = 70
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 9
          Text = '0'
          OnDblClick = Edit8_PWDblClick
        end
        object RB9: TRadioButton
          Left = 16
          Top = 46
          Width = 41
          Height = 17
          Caption = '9W'
          TabOrder = 10
        end
        object Edit9_PW: TEdit
          Left = 73
          Top = 46
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 11
          Text = '0'
          OnDblClick = Edit9_PWDblClick
        end
        object RB10: TRadioButton
          Left = 16
          Top = 22
          Width = 41
          Height = 17
          Caption = '10W'
          TabOrder = 12
        end
        object Edit10_PW: TEdit
          Left = 73
          Top = 22
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 13
          Text = '0'
          OnDblClick = Edit10_PWDblClick
        end
        object Button58: TButton
          Left = 231
          Top = 21
          Width = 36
          Height = 19
          Caption = #26368#22823
          Enabled = False
          TabOrder = 14
          OnClick = Button58Click
        end
        object BT_add: TButton
          Left = 294
          Top = 21
          Width = 36
          Height = 19
          Caption = #8593
          Enabled = False
          TabOrder = 15
          OnClick = BT_addClick
        end
        object BT_sort: TButton
          Left = 353
          Top = 20
          Width = 36
          Height = 20
          Caption = #8595
          Enabled = False
          TabOrder = 16
          OnClick = BT_sortClick
        end
        object ComboBox2: TComboBox
          Left = 316
          Top = 92
          Width = 73
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 17
        end
        object Edit_PwrbyValue: TEdit
          Left = 321
          Top = 164
          Width = 65
          Height = 20
          Color = clMenu
          TabOrder = 18
        end
        object Button56: TButton
          Left = 401
          Top = 196
          Width = 84
          Height = 21
          Action = Action1
          Caption = #20272#31639#21151#29575#34920
          TabOrder = 19
        end
        object Button51: TButton
          Left = 402
          Top = 56
          Width = 84
          Height = 21
          Caption = #28165#38646
          TabOrder = 20
          OnClick = Button51Click
        end
        object Button53: TButton
          Left = 402
          Top = 19
          Width = 84
          Height = 21
          Caption = #37325#35774
          TabOrder = 21
          OnClick = Button53Click
        end
        object Edit1: TEdit
          Left = 316
          Top = 55
          Width = 73
          Height = 20
          MaxLength = 2
          TabOrder = 22
          Text = '1'
          OnKeyPress = Edit1KeyPress
        end
        object ComboBox3: TComboBox
          Left = 320
          Top = 130
          Width = 68
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 23
        end
        object BT_ReadPwrByValue: TButton
          Left = 401
          Top = 163
          Width = 84
          Height = 21
          Caption = #35835#21462#36755#20986#21151#29575
          Enabled = False
          TabOrder = 24
          OnClick = BT_ReadPwrByValueClick
        end
        object ListBox1: TListBox
          Left = 507
          Top = 37
          Width = 221
          Height = 213
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 25
        end
        object Button59: TButton
          Left = 401
          Top = 225
          Width = 84
          Height = 21
          Action = Action2
          Caption = #22266#21270#21151#29575#34920
          TabOrder = 26
        end
        object Edit6: TEdit
          Left = 321
          Top = 196
          Width = 65
          Height = 20
          Color = clScrollBar
          TabOrder = 27
        end
        object Button64: TButton
          Left = 404
          Top = 130
          Width = 81
          Height = 22
          Caption = #35835#21462#24133#24230#20540
          Enabled = False
          TabOrder = 28
          OnClick = Button64Click
        end
        object RB7: TRadioButton
          Left = 16
          Top = 94
          Width = 33
          Height = 17
          Caption = '7W'
          TabOrder = 29
        end
        object Edit7_PW: TEdit
          Left = 73
          Top = 94
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 30
          Text = '0'
          OnDblClick = Edit7_PWDblClick
        end
        object RB5: TRadioButton
          Left = 16
          Top = 142
          Width = 33
          Height = 17
          Caption = '5W'
          TabOrder = 31
        end
        object Edit5_PW: TEdit
          Left = 73
          Top = 142
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 32
          Text = '0'
          OnDblClick = Edit5_PWDblClick
        end
        object RB3: TRadioButton
          Left = 16
          Top = 187
          Width = 33
          Height = 17
          Caption = '3W'
          TabOrder = 33
        end
        object Edit3_PW: TEdit
          Left = 73
          Top = 187
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 34
          Text = '0'
          OnDblClick = Edit3_PWDblClick
        end
        object Edit1_CP: TEdit
          Left = 121
          Top = 234
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 35
          Text = '0'
        end
        object Edit2_CP: TEdit
          Left = 121
          Top = 211
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 36
          Text = '0'
        end
        object Edit3_CP: TEdit
          Left = 121
          Top = 187
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 37
          Text = '0'
        end
        object Edit4_CP: TEdit
          Left = 121
          Top = 164
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 38
          Text = '0'
        end
        object Edit5_CP: TEdit
          Left = 121
          Top = 142
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 39
          Text = '0'
        end
        object Edit6_CP: TEdit
          Left = 121
          Top = 118
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 40
          Text = '0'
        end
        object Edit7_CP: TEdit
          Left = 121
          Top = 94
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 41
          Text = '0'
        end
        object Edit8_CP: TEdit
          Left = 121
          Top = 70
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 42
          Text = '0'
        end
        object Edit9_CP: TEdit
          Left = 121
          Top = 46
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 43
          Text = '0'
        end
        object Edit10_CP: TEdit
          Left = 121
          Top = 22
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 44
          Text = '0'
        end
        object Button65: TButton
          Left = 168
          Top = 22
          Width = 47
          Height = 19
          Caption = #33267'10W'
          Enabled = False
          TabOrder = 45
          OnClick = Button65Click
        end
        object Button66: TButton
          Left = 168
          Top = 46
          Width = 47
          Height = 19
          Caption = #33267'9W'
          Enabled = False
          TabOrder = 46
          OnClick = Button66Click
        end
        object Button67: TButton
          Left = 168
          Top = 70
          Width = 47
          Height = 19
          Caption = #33267'8W'
          Enabled = False
          TabOrder = 47
          OnClick = Button67Click
        end
        object Button68: TButton
          Left = 168
          Top = 94
          Width = 47
          Height = 19
          Caption = #33267'7W'
          Enabled = False
          TabOrder = 48
          OnClick = Button68Click
        end
        object Button69: TButton
          Left = 168
          Top = 118
          Width = 47
          Height = 19
          Caption = #33267'6W'
          Enabled = False
          TabOrder = 49
          OnClick = Button69Click
        end
        object Button70: TButton
          Left = 168
          Top = 142
          Width = 47
          Height = 19
          Caption = #33267'5W'
          Enabled = False
          TabOrder = 50
          OnClick = Button70Click
        end
        object Button71: TButton
          Left = 168
          Top = 186
          Width = 47
          Height = 19
          Caption = #33267'3W'
          Enabled = False
          TabOrder = 51
          OnClick = Button71Click
        end
        object Button72: TButton
          Left = 168
          Top = 163
          Width = 47
          Height = 19
          Caption = #33267'4W'
          Enabled = False
          TabOrder = 52
          OnClick = Button72Click
        end
        object Button73: TButton
          Left = 168
          Top = 209
          Width = 47
          Height = 19
          Caption = #33267'2W'
          Enabled = False
          TabOrder = 53
          OnClick = Button73Click
        end
        object Button74: TButton
          Left = 168
          Top = 234
          Width = 47
          Height = 19
          Caption = #33267'1W'
          Enabled = False
          TabOrder = 54
          OnClick = Button74Click
        end
        object RB0: TRadioButton
          Left = 17
          Top = 262
          Width = 56
          Height = 17
          Caption = '0.25W'
          TabOrder = 55
        end
        object Edit0_PW: TEdit
          Left = 74
          Top = 262
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 56
          Text = '0'
          OnDblClick = Edit0_PWDblClick
        end
        object Edit0_CP: TEdit
          Left = 122
          Top = 261
          Width = 39
          Height = 20
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 57
          Text = '0'
        end
        object Button75: TButton
          Left = 169
          Top = 261
          Width = 47
          Height = 19
          Caption = #33267'0.25W'
          Enabled = False
          TabOrder = 58
          OnClick = Button75Click
        end
      end
      object GroupBox19: TGroupBox
        Left = 8
        Top = 307
        Width = 741
        Height = 113
        TabOrder = 1
        object Label43: TLabel
          Left = 16
          Top = 29
          Width = 72
          Height = 12
          Caption = #35774#32622#21151#29575#25968#65306
        end
        object Label44: TLabel
          Left = 16
          Top = 61
          Width = 84
          Height = 12
          Caption = #35774#32622#21151#29575#32423#25968#65306
        end
        object Label49: TLabel
          Left = 295
          Top = 27
          Width = 60
          Height = 12
          Caption = #35835#21151#29575#25968#65306
        end
        object Label50: TLabel
          Left = 295
          Top = 61
          Width = 72
          Height = 12
          Caption = #35835#21151#29575#32423#25968#65306
        end
        object Label51: TLabel
          Left = 487
          Top = 24
          Width = 60
          Height = 12
          Caption = #26159#21542#26631#23450#65306
        end
        object Label_Alarm: TLabel
          Left = 551
          Top = 11
          Width = 30
          Height = 30
          Caption = #9679
          Color = clBtnFace
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -30
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object Label52: TLabel
          Left = 17
          Top = 89
          Width = 60
          Height = 12
          Caption = #22825#32447#29366#24577#65306
        end
        object ComboBox4: TComboBox
          Left = 104
          Top = 21
          Width = 73
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 0
        end
        object ComboBox5: TComboBox
          Left = 104
          Top = 53
          Width = 73
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 1
        end
        object Edit2: TEdit
          Left = 388
          Top = 19
          Width = 65
          Height = 20
          Color = clScrollBar
          TabOrder = 2
        end
        object Edit3: TEdit
          Left = 388
          Top = 53
          Width = 65
          Height = 20
          Color = clScrollBar
          TabOrder = 3
        end
        object Button60: TButton
          Left = 484
          Top = 52
          Width = 84
          Height = 21
          Caption = #33719#21462#21151#29575#20449#24687
          Enabled = False
          TabOrder = 4
          OnClick = Button60Click
        end
        object Edit4: TEdit
          Left = 101
          Top = 83
          Width = 76
          Height = 20
          Color = clScrollBar
          TabOrder = 5
        end
        object Edit5: TEdit
          Left = 196
          Top = 83
          Width = 82
          Height = 20
          Color = clScrollBar
          TabOrder = 6
        end
        object Button61: TButton
          Left = 293
          Top = 82
          Width = 84
          Height = 20
          Caption = #26816#27979#22825#32447#29366#24577
          Enabled = False
          TabOrder = 7
          OnClick = Button61Click
        end
        object Button62: TButton
          Left = 196
          Top = 20
          Width = 84
          Height = 21
          Caption = #35774#32622#21151#29575#25968
          Enabled = False
          TabOrder = 8
          OnClick = Button62Click
        end
        object Button63: TButton
          Left = 196
          Top = 52
          Width = 84
          Height = 21
          Caption = #35774#32622#21151#29575#32423#25968
          Enabled = False
          TabOrder = 9
          OnClick = Button63Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TCPIP'#37197#32622
      ImageIndex = 6
      object GroupBox24: TGroupBox
        Left = 1
        Top = 5
        Width = 773
        Height = 427
        TabOrder = 0
        object ListView1: TListView
          Left = 8
          Top = 15
          Width = 604
          Height = 402
          Columns = <
            item
              Caption = #24207'    '#21495
              Width = 60
            end
            item
              Caption = 'MAC'
              Width = 180
            end
            item
              Caption = 'IP'
              Width = 180
            end
            item
              Caption = #29992#25143#21517'/'#35774#22791#21517
              Width = 180
            end>
          GridLines = True
          Items.Data = {1D000000010000000000000000000000FFFFFFFF000000000000000000}
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object Button77: TButton
          Left = 633
          Top = 29
          Width = 131
          Height = 25
          Caption = #25628'        '#32034
          TabOrder = 1
          OnClick = Button77Click
        end
        object Button78: TButton
          Left = 633
          Top = 69
          Width = 131
          Height = 25
          Caption = #25351#23450#25628#32034
          TabOrder = 2
          OnClick = Button78Click
        end
        object Button79: TButton
          Left = 633
          Top = 112
          Width = 131
          Height = 25
          Caption = #35774'         '#32622
          TabOrder = 3
          OnClick = Button79Click
        end
        object Button80: TButton
          Left = 633
          Top = 155
          Width = 131
          Height = 25
          Caption = #20462'  '#25913'  IP'
          TabOrder = 4
          OnClick = Button80Click
        end
        object Button81: TButton
          Left = 633
          Top = 231
          Width = 131
          Height = 25
          Caption = #35774#22791#38378#28783
          TabOrder = 5
          OnClick = Button81Click
        end
      end
      object GroupBox25: TGroupBox
        Left = 0
        Top = 439
        Width = 774
        Height = 173
        Caption = #35828'   '#26126
        TabOrder = 1
        object Label54: TLabel
          Left = 24
          Top = 26
          Width = 402
          Height = 12
          Caption = #25628'    '#32034#65306' '#36890#36807#24191#25773#21327#35758#26597#25214#26412#22320#23616#22495#32593#35774#22791#65292#35813#25805#20316#26080#27861#26597#25214#36328#32593#27573#35774#22791
        end
        object Label55: TLabel
          Left = 24
          Top = 54
          Width = 342
          Height = 12
          Caption = #25351#23450#25628#32034#65306' '#36890#36807'IP'#22320#22336#26597#25214#25351#23450#35774#22791#65292#22810#25968#29992#20110#26597#25214#36328#32593#27573#35774#22791
        end
        object Label56: TLabel
          Left = 24
          Top = 85
          Width = 186
          Height = 12
          Caption = #35774'    '#32622#65306' '#29992#20110#37197#32622#25351#23450#35774#22791#21442#25968
        end
        object Label57: TLabel
          Left = 24
          Top = 112
          Width = 198
          Height = 12
          Caption = #20462' '#25913' IP'#65306' '#22312#32447#20462#25913#25351#23450#35774#22791'IP'#22320#22336
        end
        object Label58: TLabel
          Left = 24
          Top = 143
          Width = 390
          Height = 12
          Caption = #35774#22791#38378#28783#65306' '#28857#20987#35813#25353#32445#65292#25351#23450#35774#22791#23558#20250#24555#36895#38378#28783#65292#29992#20110#29616#22330#24555#36895#35782#21035#35774#22791
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 525
    object Action_GetReaderInformation: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #33719#24471#35835#20889#22120#20449#24687
      OnExecute = Action_GetReaderInformationExecute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_OpenCOM: TAction
      Category = #36890#35759
      Caption = #25171#24320#31471#21475
      OnExecute = Action_OpenCOMExecute
    end
    object Action_OpenRf: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #25171#24320#23556#39057
      OnExecute = Action_OpenRfExecute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_CloseCOM: TAction
      Category = #36890#35759
      Caption = #20851#38381#31471#21475
      OnExecute = Action_CloseCOMExecute
    end
    object Action_CloseRf: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #20851#38381#23556#39057
      OnExecute = Action_CloseRfExecute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_WriteComAdr: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #20889#20837#35835#20889#22120#22320#22336
      OnExecute = Action_WriteComAdrExecute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_WriteInventoryScanTime: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #20889#20837
      Hint = #20889#20837#35810#26597#21629#20196#26368#22823#21709#24212#26102#38388
      OnExecute = Action_WriteInventoryScanTimeExecute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_StayQuiet: TAction
      Tag = 2
      Category = 'Address'#27169#24335'(TAG=4)'
      Caption = #38745#40664#27169#24335
      OnExecute = Action_StayQuietExecute
      OnUpdate = Action_StayQuietUpdate
    end
    object Action_Select: TAction
      Tag = 2
      Category = 'Address'#27169#24335'(TAG=4)'
      Caption = #36827#20837#36873#23450#29366#24577
      OnExecute = Action_SelectExecute
      OnUpdate = Action_StayQuietUpdate
    end
    object Action_ResetToReady: TAction
      Tag = 2
      Category = #36820#22238#20934#22791#29366#24577'(TAG=5)'
      Caption = #36820#22238#20934#22791#27169#24335
      OnExecute = Action_ResetToReadyExecute
      OnUpdate = Action_ResetToReadyUpdate
    end
    object Action_Inventory_00: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #35810#26597#21629#20196
      OnExecute = Action_Inventory_00Execute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_Inventory_01: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #35810#26597#21629#20196'(AFI)'
      OnExecute = Action_Inventory_00Execute
      OnUpdate = Action_GetReaderInformationUpdate
    end
    object Action_Inventory_06: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #26032#30340#35810#26597
      OnExecute = Action_Inventory_00Execute
      OnUpdate = Action_Inventory_06Update
    end
    object Action_Inventory_07: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #26032#30340#35810#26597'(AFI)'
      OnExecute = Action_Inventory_00Execute
      OnUpdate = Action_Inventory_06Update
    end
    object Action_OpenTestMode: TAction
      Category = #27979#35797#27169#24335
      Caption = #25171#24320#27979#35797#27169#24335
      OnExecute = Action_OpenTestModeExecute
      OnUpdate = Action_OpenTestModeUpdate
    end
    object Action_CloseTestMode: TAction
      Category = #27979#35797#27169#24335
      Caption = #20851#38381#27979#35797#27169#24335
      OnExecute = Action_OpenTestModeExecute
      OnUpdate = Action_OpenTestModeUpdate
    end
    object Action_GetSystemInformation: TAction
      Tag = 2
      Category = #21345#29255#25805#20316'(TAG=2)'
      Caption = #33719#21462#30005#23376#26631#31614#35814#32454#20449#24687
      OnExecute = Action_GetSystemInformationExecute
      OnUpdate = Action_GetSystemInformationUpdate
    end
    object Action_LockBlock: TAction
      Tag = 3
      Category = #22359#25805#20316'(TAG=3)'
      Caption = #38145#23450'Block'
      OnExecute = Action_LockBlockExecute
      OnUpdate = Action_LockBlockUpdate
    end
    object Action_ReadSingleBlock: TAction
      Tag = 3
      Category = #22359#25805#20316'(TAG=3)'
      Caption = #35835#21462#25351#23450#22359#25968#25454
      OnExecute = Action_ReadSingleBlockExecute
      OnUpdate = Action_LockBlockUpdate
    end
    object Action_WriteSingleBlock: TAction
      Tag = 3
      Category = #22359#25805#20316'(TAG=3)'
      Caption = #21521#25351#23450#22359#20889#20837#25968#25454
      OnExecute = Action_WriteSingleBlockExecute
      OnUpdate = Action_LockBlockUpdate
    end
    object Action_WriteAFI: TAction
      Tag = 2
      Category = #21345#29255#25805#20316'(TAG=2)'
      Caption = #20889'AFI'
      OnExecute = Action_WriteAFIExecute
      OnUpdate = Action_WriteAFIUpdate
    end
    object Action_LockAFI: TAction
      Tag = 2
      Category = #21345#29255#25805#20316'(TAG=2)'
      Caption = #38145#23450' AFI'
      OnExecute = Action_LockAFIExecute
      OnUpdate = Action_WriteAFIUpdate
    end
    object Action_WriteDSFID: TAction
      Tag = 2
      Category = #21345#29255#25805#20316'(TAG=2)'
      Caption = #20889'DSFID'
      OnExecute = Action_WriteDSFIDExecute
      OnUpdate = Action_WriteAFIUpdate
    end
    object Action_LockDSFID: TAction
      Tag = 2
      Category = #21345#29255#25805#20316'(TAG=2)'
      Caption = #38145#23450'DSFID'
      OnExecute = Action_LockDSFIDExecute
      OnUpdate = Action_WriteAFIUpdate
    end
    object Action_Inventory_02: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #32487#32493#35810#26597
      OnExecute = Action_Inventory_00Execute
      OnUpdate = Action_Inventory_06Update
    end
    object Action_Inventory_03: TAction
      Tag = 1
      Category = #20018#21475#25171#24320#21363#21487#25191#34892'(TAG=1)'
      Caption = #32487#32493#35810#26597'(AFI)'
      OnExecute = Action_Inventory_00Execute
      OnUpdate = Action_Inventory_06Update
    end
    object ActionSetGeneralOutput: TAction
      Category = #29256#26412'0310'#20197#19978
      Caption = #35774#32622
      Hint = #35774#32622#36890#29992#36755#20986#31471#21475#29366#24577
      OnExecute = ActionSetGeneralOutputExecute
      OnUpdate = ActionSetGeneralOutputUpdate
    end
    object ActionGetGeneralInput: TAction
      Category = #29256#26412'0310'#20197#19978
      Caption = #35835#21462
      Hint = #35835#21462#36890#29992#36755#20837#31471#21475#29366#24577
      OnExecute = ActionGetGeneralInputExecute
      OnUpdate = ActionSetGeneralOutputUpdate
    end
    object ActionSetRelay: TAction
      Category = #29256#26412'0310'#20197#19978
      Caption = #35774#32622
      Hint = '7.2.8.'#9#35774#32622#32487#30005#22120#29366#24577
      OnExecute = ActionSetRelayExecute
      OnUpdate = ActionSetGeneralOutputUpdate
    end
    object Action_ReadMultipleBlock: TAction
      Category = #22359#25805#20316'(TAG=3)'
      Caption = #35835#21462#22810#22359#25968#25454
      OnExecute = Action_ReadMultipleBlockExecute
      OnUpdate = Action_ReadMultipleBlockUpdate
    end
    object Action_GetANTStatus: TAction
      Category = #22825#32447#25805#20316
      Caption = #35835#21462
      Hint = #35835#21462#22825#32447#29366#24577
      OnExecute = Action_GetANTStatusExecute
      OnUpdate = Action_GetANTStatusUpdate
    end
    object Action_SetActiveANT: TAction
      Category = #22825#32447#25805#20316
      Caption = #35774#32622#22825#32447#26377#25928
      Hint = #35774#32622#24403#21069#26377#25928#22825#32447
      OnExecute = Action_SetActiveANTExecute
      OnUpdate = Action_GetANTStatusUpdate
    end
    object Action_SetBlockLength: TAction
      Category = #25195#25551#27169#24335
      Caption = #35774#32622
      Hint = #35774#32622#33258#23450#20041#25968#25454#22359#38271#24230
      OnExecute = Action_SetBlockLengthExecute
      OnUpdate = Action_SetBlockLengthUpdate
    end
    object Action_OpenScanModeDataShow: TAction
      Category = #25195#25551#27169#24335
      Caption = #25171#24320#25968#25454#26174#31034
      OnExecute = Action_OpenScanModeDataShowExecute
      OnUpdate = Action_OpenScanModeDataShowUpdate
    end
    object Action_ReadScanModeData: TAction
      Category = #25195#25551#27169#24335
      Caption = 'ReadScanModeData'
      OnExecute = Action_ReadScanModeDataExecute
    end
    object Action_CloseScanMode: TAction
      Category = #25195#25551#27169#24335
      Caption = #36864#20986#25195#25551#27169#24335
      OnExecute = Action_CloseScanModeExecute
      OnUpdate = Action_SetScanModeUpdate
    end
    object Action_SetScanModeCMD: TAction
      Category = #25195#25551#27169#24335
      Caption = 'Action_SetScanModeCmd'
      OnExecute = Action_SetScanModeCMDExecute
    end
    object Action_CloseSetScanMode: TAction
      Category = #25195#25551#27169#24335
      Caption = 'CloseScanMode'
      Hint = 'CloseScanMode'
      OnExecute = Action_CloseSetScanModeExecute
    end
    object Action_SetScanMode: TAction
      Category = #25195#25551#27169#24335
      Caption = 'Set'#36827#20837#25195#25551#27169#24335
      OnExecute = Action_SetScanModeExecute
      OnUpdate = Action_SetScanModeUpdate
    end
    object Action_GetUserDefineBlocklength: TAction
      Category = #25195#25551#27169#24335
      Caption = #35835#21462
      Hint = #33719#21462#29992#25143#33258#23450#20041#25968#25454#22359#38271#24230
      OnExecute = Action_GetUserDefineBlocklengthExecute
    end
    object Action_GetScanModeStatus: TAction
      Category = #25195#25551#27169#24335
      Caption = 'GetScanModeStatus'
      OnExecute = Action_GetScanModeStatusExecute
    end
    object Action_CloseScanModeDataShow: TAction
      Category = #25195#25551#27169#24335
      Caption = #20851#38381#25968#25454#26174#31034
      OnExecute = Action_CloseScanModeDataShowExecute
    end
    object Action_InitScanMode: TAction
      Category = #25195#25551#27169#24335
      Caption = 'Initial Scan Mode'
      OnExecute = Action_InitScanModeExecute
    end
    object Action_ReadUserSingleBlock: TAction
      Category = #29992#25143#33258#23450#20041
      Caption = #35835#21462#25351#23450#22359#25968#25454
      OnExecute = Action_ReadUserSingleBlockExecute
      OnUpdate = Action_ReadUserSingleBlockUpdate
    end
    object Action_WriteUserSingleBlock: TAction
      Category = #29992#25143#33258#23450#20041
      Caption = #20889#20837#25351#23450#22359#25968#25454
      OnExecute = Action_WriteUserSingleBlockExecute
    end
    object Action_ReadUserMultipleBlock: TAction
      Category = #29992#25143#33258#23450#20041
      Caption = #35835#21462#22810#22359#25968#25454
      OnExecute = Action_ReadUserMultipleBlockExecute
    end
    object Action_SetAccessTime: TAction
      Category = 'AccessTime'
      Caption = #35774#32622
      Hint = 'Set AccessTime'
      OnExecute = Action_SetAccessTimeExecute
      OnUpdate = Action_SetAccessTimeUpdate
    end
    object Action_GetAccessTime: TAction
      Category = 'AccessTime'
      Caption = #35835#21462
      Hint = #33719#21462#36890#36807#26102#38388
      OnExecute = Action_GetAccessTimeExecute
      OnUpdate = Action_SetAccessTimeUpdate
    end
    object Action_SetReceiveANT: TAction
      Category = 'ReceiveANT'
      Caption = #35774#32622
      Hint = 'Set ANT'
      OnExecute = Action_SetReceiveANTExecute
      OnUpdate = Action_SetReceiveANTUpdate
    end
    object Action_GetReceiveANTStatus: TAction
      Category = 'ReceiveANT'
      Caption = 'Get'
      Hint = #35835#21462#22825#32447
      OnExecute = Action_GetReceiveANTStatusExecute
    end
    object Action_TransparentRead: TAction
      Category = 'TransparentMode'
      Caption = #35835#31867#22411#36879#26126#21629#20196
      OnExecute = Action_TransparentReadExecute
      OnUpdate = Action_TransparentReadUpdate
    end
    object Action_TransparentWrite: TAction
      Category = 'TransparentMode'
      Caption = #20889#31867#22411#36879#26126#21629#20196
      OnExecute = Action_TransparentWriteExecute
    end
    object Action_TransparentCustomizedCmd: TAction
      Category = 'TransparentMode'
      Caption = #32473#28857#21709#24212#26102#38388#30340#36879#26126#21629#20196
      OnExecute = Action_TransparentCustomizedCmdExecute
    end
    object Action_SetParseMode: TAction
      Category = 'Parsemode'
      Caption = #28145#24230#20248#20808
      OnExecute = Action_SetParseModeExecute
      OnUpdate = Action_SetParseModeUpdate
    end
    object Action_GetParseMode: TAction
      Category = 'Parsemode'
      Caption = 'GetParseMode'
      OnExecute = Action_GetParseModeExecute
    end
    object Action_SetDepth: TAction
      Category = 'Parsemode'
      Caption = #35774#32622'100%'
      OnExecute = Action_SetDepthExecute
      OnUpdate = Action_SetDepthUpdate
    end
    object Action1: TAction
      Caption = 'Action1'
      OnUpdate = Action1Update
    end
    object Action2: TAction
      Caption = 'Action2'
      OnUpdate = Action2Update
    end
  end
  object Timer_Test_: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_Test_Timer
    Left = 498
  end
  object Timer_ScanMode: TTimer
    Enabled = False
    OnTimer = Timer_ScanModeTimer
    Left = 552
  end
  object IdUDPServer1: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 11
    OnUDPRead = IdUDPServer1UDPRead
    Left = 728
    Top = 320
  end
  object IdUDPServer2: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = IdUDPServer2UDPRead
    Left = 730
    Top = 373
  end
end
