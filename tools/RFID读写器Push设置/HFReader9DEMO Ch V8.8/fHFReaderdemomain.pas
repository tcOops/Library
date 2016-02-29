unit fHFReaderdemomain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, ActnList, HFReader_DLL_Head, HFReader_Head,
  Buttons, DateUtils, IdSocketHandle,IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer;
type
    SP_Pwr=record
      fPwrByVA:Byte ;
      fCalibA : Byte;
    end;
type
  TfrmHFReaderDemoMain = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action_OpenCOM: TAction;
    Action_CloseCOM: TAction;
    Action_GetReaderInformation: TAction;
    Action_OpenRf: TAction;
    Action_CloseRf: TAction;
    Action_StayQuiet: TAction;
    Action_Select: TAction;
    Action_ResetToReady: TAction;
    Action_WriteComAdr: TAction;
    Action_Inventory_00: TAction;
    Action_Inventory_01: TAction;
    Action_Inventory_06: TAction;
    Action_Inventory_07: TAction;
    Action_OpenTestMode: TAction;
    Action_CloseTestMode: TAction;
    Action_GetSystemInformation: TAction;
    Action_WriteInventoryScanTime: TAction;
    Action_LockBlock: TAction;
    Action_ReadSingleBlock: TAction;
    Action_WriteSingleBlock: TAction;
    Action_WriteAFI: TAction;
    Action_LockAFI: TAction;
    Action_WriteDSFID: TAction;
    Action_LockDSFID: TAction;
    Timer_Test_: TTimer;
    PageControl1: TPageControl;
    TabSheet_CMD: TTabSheet;
    TabSheet_TestMode: TTabSheet;
    Panel2: TPanel;
    Label7: TLabel;
    GroupBox_ReaderInfo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit_Version: TEdit;
    Edit_ComAdr: TEdit;
    Edit_InventoryTime: TEdit;
    Button3: TButton;
    Edit_Type: TEdit;
    Edit_TrType: TEdit;
    GroupBox_OperMode: TGroupBox;
    RadioButton_Address: TRadioButton;
    RadioButton_Select: TRadioButton;
    ComboBox_UID: TComboBox;
    RadioButton_Non_Address: TRadioButton;
    GroupBox_Power: TGroupBox;
    Button4: TButton;
    Button5: TButton;
    GroupBox_OtherCMD: TGroupBox;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    GroupBox_ComAdr: TGroupBox;
    Label6: TLabel;
    Edit_NewComAdr: TEdit;
    Button9: TButton;
    GroupBox_Inventory: TGroupBox;
    Button10: TButton;
    Button11: TButton;
    GroupBox_Inventory2: TGroupBox;
    Button12: TButton;
    Button13: TButton;
    ListBox_GroupBox_InventoryList: TListBox;
    GroupBox_Block: TGroupBox;
    Label8: TLabel;
    ComboBox_BlockNum: TComboBox;
    Button18: TButton;
    Edit_R_BlockData: TEdit;
    Button19: TButton;
    Edit_BlockData: TEdit;
    Button20: TButton;
    GroupBox_SystemInformation: TGroupBox;
    Edit_SystemInfo: TEdit;
    Button16: TButton;
    Memo_SystemInfo2: TMemo;
    GroupBox_InventoryScanTime: TGroupBox;
    Label9: TLabel;
    ComboBox_InventoryScanTime: TComboBox;
    GroupBox_AFI: TGroupBox;
    Edit_AFI: TEdit;
    Button21: TButton;
    Button17: TButton;
    GroupBox_DSFID: TGroupBox;
    Edit_DSFID: TEdit;
    Button22: TButton;
    Button23: TButton;
    Panel1: TPanel;
    ListView_UID: TListView;
    Button14: TButton;
    Button15: TButton;
    BitBtn1: TBitBtn;
    Action_Inventory_02: TAction;
    Action_Inventory_03: TAction;
    Button24: TButton;
    Button25: TButton;
    ActionSetGeneralOutput: TAction;
    GroupBox_Output: TGroupBox;
    ActionGetGeneralInput: TAction;
    Button26: TButton;
    GroupBox_Input: TGroupBox;
    Button29: TButton;
    ActionSetRelay: TAction;
    ComboBox_Output1: TComboBox;
    ComboBox_Output0: TComboBox;
    GroupBox_Relay: TGroupBox;
    Button27: TButton;
    ComboBox_Relay0: TComboBox;
    Edit_Input0_State: TEdit;
    Label_LED: TLabel;
    Label_BEEP: TLabel;
    Button28: TButton;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Action_ReadMultipleBlock: TAction;
    ComboBox_BlockAdr: TComboBox;
    ComboBox_MAXBlockNum: TComboBox;
    Label20: TLabel;
    ComboBox_BlockEndAdr: TComboBox;
    ComboBox_Edit_BlockStyle: TComboBox;
    ComboBox_Edit_BlockStyleNum: TComboBox;
    GroupBox1: TGroupBox;
    Edit_ANTStatus: TEdit;
    Button30: TButton;
    Button31: TButton;
    Action_GetANTStatus: TAction;
    Action_SetActiveANT: TAction;
    TabSheet_ScanMode: TTabSheet;
    Panel3: TPanel;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    Action_SetBlockLength: TAction;
    Action_OpenScanModeDataShow: TAction;
    Action_CloseScanMode: TAction;
    Label15: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Button35: TButton;
    Button36: TButton;
    ComboBox_FirstBlockNum: TComboBox;
    ComboBox_NumBlock: TComboBox;
    ComboBox_SepChar: TComboBox;
    ComboBox_EndChar: TComboBox;
    ComboBox_FirstByte: TComboBox;
    ComboBox_NumByte: TComboBox;
    Action_ReadScanModeData: TAction;
    Timer_ScanMode: TTimer;
    Button33: TButton;
    Action_SetScanModeCMD: TAction;
    Action_CloseSetScanMode: TAction;
    GroupBox_UserDefinechar: TGroupBox;
    CheckBox_SepUserbit71: TCheckBox;
    CheckBox_SepUserbit70: TCheckBox;
    Edit_SepUser: TEdit;
    Edit_EndUser: TEdit;
    Action_SetScanMode: TAction;
    Action_GetUserDefineBlocklength: TAction;
    Action_GetScanModeStatus: TAction;
    GroupBox_ScanModeOption: TGroupBox;
    RadioGroup_Reader_Mode_bit0: TRadioGroup;
    RadioGroup_Reader_Mode_bit1: TRadioGroup;
    RadioGroup_Reader_Mode_bit2: TRadioGroup;
    RadioGroup_Reader_Mode_bit3: TRadioGroup;
    RadioGroup_Reader_Mode_bit401: TRadioGroup;
    RadioGroup_Reader_Mode_bit5: TRadioGroup;
    RadioGroup_Reader_Mode_bit6: TRadioGroup;
    RadioGroup_Reader_Mode_bit7: TRadioGroup;
    GroupBox7: TGroupBox;
    Label25: TLabel;
    Button34: TButton;
    Action_CloseScanModeDataShow: TAction;
    Action_InitScanMode: TAction;
    TabSheet_CustomCmd: TTabSheet;
    Panel5: TPanel;
    GroupBox8: TGroupBox;
    Button44: TButton;
    Button45: TButton;
    GroupBox9: TGroupBox;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    GroupBox10: TGroupBox;
    ComboBox_SetBlockLength: TComboBox;
    Button50: TButton;
    GroupBox12: TGroupBox;
    Edit_UserDefineBlocklength: TEdit;
    Button52: TButton;
    GroupBox11: TGroupBox;
    RadioButton_Address1: TRadioButton;
    RadioButton_Select1: TRadioButton;
    ComboBox_UID2: TComboBox;
    RadioButton_Non_Address1: TRadioButton;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    ComboBox_BlockNumUser: TComboBox;
    Edit_R_BlockData2: TEdit;
    Edit_BlockData2: TEdit;
    ComboBox_BlockAdrUser: TComboBox;
    ComboBox_MAXBlockNumuser: TComboBox;
    ComboBox_BlockEndAdrUser: TComboBox;
    ComboBox_Edit_BlockStyleuser: TComboBox;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Action_ReadUserSingleBlock: TAction;
    Action_WriteUserSingleBlock: TAction;
    Action_ReadUserMultipleBlock: TAction;
    Action_SetAccessTime: TAction;
    Action_GetAccessTime: TAction;
    GroupBox2: TGroupBox;
    ComboBox_AccessTime: TComboBox;
    Button32: TButton;
    Edit_AccessTimeRet: TEdit;
    Button37: TButton;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    RadioGroup_ReceiveANT: TRadioGroup;
    Button41: TButton;
    Button42: TButton;
    Action_SetReceiveANT: TAction;
    Action_GetReceiveANTStatus: TAction;
    Edit_ReceiveANTStatus: TEdit;
    CheckBox_RX_ANT: TCheckBox;
    CheckBox_TX_ANT: TCheckBox;
    Label29: TLabel;
    Label32: TLabel;
    GroupBox13: TGroupBox;
    Edit_UserDefineBlocklengthshow: TEdit;
    RadioGroup_ActiveANTNum: TGroupBox;
    RadioButton_ActiveANTNum1: TRadioButton;
    RadioButton_ActiveANTNum2: TRadioButton;
    RadioButton_ActiveANTNum3: TRadioButton;
    RadioButton_ActiveANTNum4: TRadioButton;
    Action_TransparentRead: TAction;
    Action_TransparentWrite: TAction;
    Action_TransparentCustomizedCmd: TAction;
    TabSheet_TransparentCMD: TTabSheet;
    GroupBox20: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Button54: TButton;
    Memo_TransparentReadData: TMemo;
    Memo_TransparentReadRspData: TMemo;
    GroupBox17: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Button55: TButton;
    Memo_TransparentWriteData: TMemo;
    Memo_TransparentWriteRspData: TMemo;
    GroupBox21: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Button57: TButton;
    Memo_TransparentCustomizedData: TMemo;
    Memo_TransparentCustomizedRspData: TMemo;
    Action_SetParseMode: TAction;
    Action_GetParseMode: TAction;
    GroupBox_parsemode: TGroupBox;
    RadioButton_parsemode1: TRadioButton;
    RadioButton_parsemode2: TRadioButton;
    GroupBox_depth: TGroupBox;
    RadioButton_depth1: TRadioButton;
    RadioButton_depth2: TRadioButton;
    Action_SetDepth: TAction;
    GroupBox14: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox15: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox16: TGroupBox;
    ComboBox1: TComboBox;
    Button43: TButton;
    TabSheet1: TTabSheet;
    GroupBox18: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label53: TLabel;
    Edit1_PW: TEdit;
    RB2: TRadioButton;
    Edit2_PW: TEdit;
    RB1: TRadioButton;
    RB4: TRadioButton;
    Edit4_PW: TEdit;
    RB6: TRadioButton;
    Edit6_PW: TEdit;
    RB8: TRadioButton;
    Edit8_PW: TEdit;
    RB9: TRadioButton;
    Edit9_PW: TEdit;
    RB10: TRadioButton;
    Edit10_PW: TEdit;
    Button58: TButton;
    BT_add: TButton;
    BT_sort: TButton;
    ComboBox2: TComboBox;
    Edit_PwrbyValue: TEdit;
    Button56: TButton;
    Button51: TButton;
    Button53: TButton;
    Edit1: TEdit;
    ComboBox3: TComboBox;
    BT_ReadPwrByValue: TButton;
    ListBox1: TListBox;
    Button59: TButton;
    Edit6: TEdit;
    Button64: TButton;
    RB7: TRadioButton;
    Edit7_PW: TEdit;
    RB5: TRadioButton;
    Edit5_PW: TEdit;
    RB3: TRadioButton;
    Edit3_PW: TEdit;
    Edit1_CP: TEdit;
    Edit2_CP: TEdit;
    Edit3_CP: TEdit;
    Edit4_CP: TEdit;
    Edit5_CP: TEdit;
    Edit6_CP: TEdit;
    Edit7_CP: TEdit;
    Edit8_CP: TEdit;
    Edit9_CP: TEdit;
    Edit10_CP: TEdit;
    Button65: TButton;
    Button66: TButton;
    Button67: TButton;
    Button68: TButton;
    Button69: TButton;
    Button70: TButton;
    Button71: TButton;
    Button72: TButton;
    Button73: TButton;
    Button74: TButton;
    GroupBox19: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label_Alarm: TLabel;
    Label52: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button60: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Button61: TButton;
    Button62: TButton;
    Button63: TButton;
    Action1: TAction;
    Action2: TAction;
    RB0: TRadioButton;
    Edit0_PW: TEdit;
    Edit0_CP: TEdit;
    Button75: TButton;
    GroupBox22: TGroupBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    Button_startscan: TButton;
    Button_stopscan: TButton;
    GroupBox23: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Button76: TButton;
    TabSheet2: TTabSheet;
    GroupBox24: TGroupBox;
    ListView1: TListView;
    Button77: TButton;
    Button78: TButton;
    Button79: TButton;
    Button80: TButton;
    Button81: TButton;
    GroupBox25: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    IdUDPServer1: TIdUDPServer;
    IdUDPServer2: TIdUDPServer;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox_COM: TGroupBox;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ComboBox_COM: TComboBox;
    Button1: TButton;
    Button2: TButton;
    StaticText1: TStaticText;
    Edit_CmdComAddr: TEdit;
    ComboBox_AlreadyOpenCOM: TComboBox;
    ComboBox_baud: TComboBox;
    gp_net: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    opnet: TButton;
    closenet: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Action_CloseCOMExecute(Sender: TObject);
    procedure Action_OpenCOMExecute(Sender: TObject);
    procedure Action_GetReaderInformationExecute(Sender: TObject);
    procedure Action_OpenRfExecute(Sender: TObject);
    procedure Action_GetReaderInformationUpdate(Sender: TObject);
    procedure Action_StayQuietUpdate(Sender: TObject);
    procedure Action_CloseRfExecute(Sender: TObject);
    procedure Action_WriteComAdrExecute(Sender: TObject);
    procedure Action_WriteInventoryScanTimeExecute(Sender: TObject);
    procedure Action_Inventory_00Execute(Sender: TObject);
    procedure Action_OpenTestModeUpdate(Sender: TObject);
    procedure Timer_Test_Timer(Sender: TObject);
    procedure Action_OpenTestModeExecute(Sender: TObject);
    procedure Action_LockBlockUpdate(Sender: TObject);
    procedure Action_StayQuietExecute(Sender: TObject);
    procedure ComboBox_UIDChange(Sender: TObject);
    procedure Action_SelectExecute(Sender: TObject);
    procedure Action_ResetToReadyExecute(Sender: TObject);
    procedure Action_GetSystemInformationExecute(Sender: TObject);
    procedure Action_WriteAFIExecute(Sender: TObject);
    procedure Action_LockAFIExecute(Sender: TObject);
    procedure Action_WriteDSFIDExecute(Sender: TObject);
    procedure Action_LockDSFIDExecute(Sender: TObject);
    procedure Action_LockBlockExecute(Sender: TObject);
    procedure Action_ReadSingleBlockExecute(Sender: TObject);
    procedure Action_WriteSingleBlockExecute(Sender: TObject);
    procedure Action_GetSystemInformationUpdate(Sender: TObject);
    procedure Action_ResetToReadyUpdate(Sender: TObject);
    procedure RadioButton_SelectClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit_NewComAdrKeyPress(Sender: TObject; var Key: Char);
    procedure ActionSetGeneralOutputExecute(Sender: TObject);
    procedure ActionSetRelayExecute(Sender: TObject);
    procedure ActionGetGeneralInputExecute(Sender: TObject);
    procedure Action_WriteAFIUpdate(Sender: TObject);
    procedure ActionSetGeneralOutputUpdate(Sender: TObject);
    procedure Action_Inventory_06Update(Sender: TObject);
    procedure Action_ReadMultipleBlockExecute(Sender: TObject);
    procedure Action_ReadMultipleBlockUpdate(Sender: TObject);
    procedure ComboBox_BlockAdrChange(Sender: TObject);
    procedure ComboBox_MAXBlockNumChange(Sender: TObject);
    procedure ComboBox_Edit_BlockStyleNumChange(Sender: TObject);
    procedure ComboBox_Edit_BlockStyleChange(Sender: TObject);
    procedure Action_SetActiveANTExecute(Sender: TObject);
    procedure Action_GetANTStatusExecute(Sender: TObject);
    procedure Action_GetANTStatusUpdate(Sender: TObject);
    procedure Action_SetBlockLengthExecute(Sender: TObject);
    procedure Action_SetScanModeCMDExecute(Sender: TObject);
    procedure Action_CloseSetScanModeExecute(Sender: TObject);
    procedure Action_SetScanModeExecute(Sender: TObject);
    procedure Action_ReadScanModeDataExecute(Sender: TObject);
    procedure Timer_ScanModeTimer(Sender: TObject);
    procedure Action_OpenScanModeDataShowExecute(Sender: TObject);
    procedure Action_CloseScanModeExecute(Sender: TObject);
    procedure Action_GetUserDefineBlocklengthExecute(Sender: TObject);
    procedure Action_GetScanModeStatusExecute(Sender: TObject);
    procedure Action_CloseScanModeDataShowExecute(Sender: TObject);
    procedure Action_InitScanModeExecute(Sender: TObject);
    procedure Action_OpenScanModeDataShowUpdate(Sender: TObject);
    procedure Action_SetScanModeUpdate(Sender: TObject);
    procedure ComboBox_UID2Change(Sender: TObject);

    procedure Action_SetBlockLengthUpdate(Sender: TObject);
    procedure Action_ReadUserSingleBlockExecute(Sender: TObject);
    procedure Action_WriteUserSingleBlockExecute(Sender: TObject);
    procedure Action_ReadUserMultipleBlockExecute(Sender: TObject);
    procedure ComboBox_MAXBlockNumuserChange(Sender: TObject);
    procedure Action_ReadUserSingleBlockUpdate(Sender: TObject);
    procedure Action_SetAccessTimeExecute(Sender: TObject);
    procedure Action_GetAccessTimeExecute(Sender: TObject);
    procedure Action_SetReceiveANTExecute(Sender: TObject);
    procedure Action_GetReceiveANTStatusExecute(Sender: TObject);
    procedure Action_SetReceiveANTUpdate(Sender: TObject);
    procedure Action_SetAccessTimeUpdate(Sender: TObject);
    procedure Action_TransparentReadExecute(Sender: TObject);
    procedure Action_TransparentWriteExecute(Sender: TObject);
    procedure Action_TransparentCustomizedCmdExecute(Sender: TObject);
    procedure HelpshowClick(Sender: TObject);
    procedure Action_SetParseModeExecute(Sender: TObject);
    procedure Action_GetParseModeExecute(Sender: TObject);
    procedure Action_SetParseModeUpdate(Sender: TObject);
    procedure Action_TransparentReadUpdate(Sender: TObject);
    procedure Action_SetDepthExecute(Sender: TObject);
    procedure Action_SetDepthUpdate(Sender: TObject);
    procedure ComboBox_AlreadyOpenCOMCloseUp(Sender: TObject);
    procedure ClearLastInfo();
    procedure Button43Click(Sender: TObject);
 //   procedure RadioButton4Click(Sender: TObject);
 //   procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure ComboBox_COMChange(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button58Click(Sender: TObject);
    procedure BT_addClick(Sender: TObject);
    procedure BT_sortClick(Sender: TObject);
    procedure Button53Click(Sender: TObject);
    procedure Button51Click(Sender: TObject);
    procedure Button64Click(Sender: TObject);
    procedure BT_ReadPwrByValueClick(Sender: TObject);
    procedure Button56Click(Sender: TObject);
    procedure Button59Click(Sender: TObject);
    procedure Button62Click(Sender: TObject);
    procedure Button63Click(Sender: TObject);
    procedure Button61Click(Sender: TObject);
    procedure Button60Click(Sender: TObject);
    procedure Button65Click(Sender: TObject);
    procedure Button66Click(Sender: TObject);
    procedure Button67Click(Sender: TObject);
    procedure Button68Click(Sender: TObject);
    procedure Button69Click(Sender: TObject);
    procedure Button70Click(Sender: TObject);
    procedure Button72Click(Sender: TObject);
    procedure Button71Click(Sender: TObject);
    procedure Button73Click(Sender: TObject);
    procedure Button74Click(Sender: TObject);
    procedure Edit10_PWDblClick(Sender: TObject);
    procedure Edit9_PWDblClick(Sender: TObject);
    procedure Edit8_PWDblClick(Sender: TObject);
    procedure Edit7_PWDblClick(Sender: TObject);
    procedure Edit6_PWDblClick(Sender: TObject);
    procedure Edit5_PWDblClick(Sender: TObject);
    procedure Edit4_PWDblClick(Sender: TObject);
    procedure Edit3_PWDblClick(Sender: TObject);
    procedure Edit2_PWDblClick(Sender: TObject);
    procedure Edit1_PWDblClick(Sender: TObject);
    procedure Action1Update(Sender: TObject);
    procedure Action2Update(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button75Click(Sender: TObject);
    procedure Edit0_PWDblClick(Sender: TObject);
    procedure Button_stopscanClick(Sender: TObject);
    procedure Button_startscanClick(Sender: TObject);
    procedure Button76Click(Sender: TObject);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure IdUDPServer2UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure Button77Click(Sender: TObject);
    procedure Button78Click(Sender: TObject);
    procedure Button79Click(Sender: TObject);
    procedure Button80Click(Sender: TObject);
    procedure Button81Click(Sender: TObject);
    procedure opnetClick(Sender: TObject);
    procedure closenetClick(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
   // procedure ComboBox_BlockAdrChange(Sender: TObject);
  private
    { Private declarations }
    ScanmodeCMD: integer; //设置进入/退出Scanmode模式标记
    isonReadDataExecute: Boolean; //Scanmode模式时读取数据标记
    ISon_ScanMode: Boolean; // Scanmode模式状态标记
    SendScanModeoperation: Boolean; // 模式命令状态标记
    IssetUserBlocklength: Boolean; // 设置自定义数据块长度状态标记
    UserBlocklength: byte; // 自定义数据块长度
     f10Pwr:LongInt;
    f9Pwr:LongInt;
    f8Pwr:LongInt;
    f7Pwr:LongInt;
    f6Pwr:LongInt;
    f5Pwr:LongInt;
    f4Pwr:LongInt;
    f3Pwr:LongInt;
    f2Pwr:LongInt;
    f1Pwr:LongInt;
    f0Pwr:LongInt;
    fAppClosed: Boolean; //在测试模式下响应关闭应用程序
    fComAdr: Byte; //当前操作的ComAdr
    fCmdRet: LongInt; //所有执行指令的返回值
    fOpenComIndex: Integer; //打开的串口索引号
    fIsInventoryScan: Boolean;
    fOperUID: array[0..8] of Char;
    n_Time:LongInt;
    fBaud:byte;
    Get_ParseMode: byte;
    Lun_number:LongInt;
    function GetComIsOpen: Boolean;
    property ComIsOpen: Boolean read GetComIsOpen;
    function GetState: Byte; overload;
    function GetState(BlockSize: Byte; BlockStyle: string; const IsCheckBlockStyle: Boolean): Byte; overload;
    function GetState(BlockStyle: string): Byte; overload;
    function getStr(pStr: pchar; len: Integer): string;
    procedure SetUIDINfo;
    function getVersionEnabled: Boolean;
  private
    fInventory_DSFID_UID_List: string; //存贮询查列表（如果读取的数据没有变化，则不进行刷新）
    Istemps02Save: boolean;
    temps02Save: string; // 存储继续询查前上次已经询查到的卡

    ReaderNotSupportParseMode: boolean; //解析模式支持与否

    procedure InitComList; //初始化串口列表
    procedure InitInventoryScanTimeList; //初始化询查时间列表
    procedure RefreshStatus; //刷新状态显示
    procedure AddCmdLog(cmd, cmdName: string; cmdRet: Byte; errorCode: LongInt = -1);
    function getHexStr(sBinStr: string): string;
    function getBinStr(sHexStr: string): string; overload;
    function getBinStr(pBinStr: pchar; sHexStr: string): Boolean; overload;
    function checkHexStr(s: string): boolean; //判断是否为16进制字符
    //Function  checkUID

    function GetOperUID(const IsMsg: Boolean = True): Boolean;

    procedure InitScanModeList; //扫描模式初始化
    procedure InitAccessTimeList; //Accesstime

    function HexStrToStr(const S: string): string; //2007-5-22
    function StrToHexStr(const S: string): string; //2007-5-22


  public
    { Public declarations }
     fRecvUDPstring:string;
    RemostIP:string;
    IP:string;
    usename:string;
    dsname:string;
    mac:string;
    portnum:string;
    tup:string;
    rm:string;
    cm:string;
    ct:string;
    fc:string;
    dt:string;
    br:string;
    pr:string;
    bb:string;
    rc:string;
    ml:string;
    md:string;
    di:string;
    dp:string;
    gi:string;
    nm:string;
  end;

var
  frmHFReaderDemoMain: TfrmHFReaderDemoMain;
  frmcomportindex :longint;
  SP_PwrA:array[0..39]of SP_Pwr;
implementation

uses  Form_Help, MultipleBlockdata, MBLOCKDATA, locatedlg, Setdlg,
  NhSetDlg, ChangeDlg, PhSetDlg;

{$R *.dfm}

function TfrmHFReaderDemoMain.GetComIsOpen: Boolean;
begin
 result := (ComboBox_AlreadyOpenCOM.Items.Count <> 0)or(fOpenComIndex>1023);
end;

procedure TfrmHFReaderDemoMain.FormCreate(Sender: TObject);
begin
  fOpenComIndex := -1;
  fComAdr := 0;
  InitComList;
  InitInventoryScanTimeList;
  Istemps02Save := false;

  fAppClosed := False;
  PageControl1.ActivePage := TabSheet_CMD;
  InitScanModeList;
  isonReadDataExecute := false;
  IssetUserBlocklength := false;
  InitAccessTimeList;
  ReaderNotSupportParseMode := false;
  ComboBox_baud.ItemIndex:=0;
 // RadioButton2.Checked := true;
//  RadioButton4.Checked := true;
  fBaud:=3;
  ComboBox1.ItemIndex:=0;

  Button43.Enabled:=False;
  RadioButton1.Enabled:=False;
  RadioButton2.Enabled:=False;
  RadioButton3.Enabled:=False;
  RadioButton4.Enabled:=False;
  RadioButton5.Checked:=True;
end;

procedure TfrmHFReaderDemoMain.InitScanModeList;
var
  i: integer;
begin
  ComboBox_FirstBlockNum.Items.Clear;
  ComboBox_NumBlock.Items.Clear;
  ComboBox_FirstByte.Items.Clear;
  ComboBox_NumByte.Items.Clear;

  for i := 0 to 255 do
  begin
    ComboBox_FirstBlockNum.Items.Add(inttostr(i));
    ComboBox_NumBlock.Items.Add(inttostr(i));
    ComboBox_FirstByte.Items.Add(inttostr(i));
    ComboBox_NumByte.Items.Add(inttostr(i));
    ComboBox3.Items.Add(inttostr(i));
  end;
  ComboBox_FirstBlockNum.ItemIndex := 1;
  ComboBox_NumBlock.ItemIndex := 1;
  ComboBox_FirstByte.ItemIndex := 1;
  ComboBox_NumByte.ItemIndex := 1;
   for i := 0 to 99 do
  begin
    ComboBox2.Items.Add(inttostr(i));
    ComboBox5.Items.Add(inttostr(i));
  end;
  for i := 0 to 39 do
  begin
    ComboBox4.Items.Add(IntToStr(i)+'('+FloatToStr(0.25*(i+1))+'W)');
  end;
  ComboBox2.ItemIndex:=99;
  ComboBox4.ItemIndex:=39;
  ComboBox3.ItemIndex:=255;
  ComboBox5.ItemIndex:=99;
end;

procedure TfrmHFReaderDemoMain.InitComList; //串口号初始化列表函数
var
  i: Integer;
begin
  ComboBox_COM.Items.Clear;
  ComboBox_COM.Items.Add(' AUTO');
  for i := 1 to 12 do
    ComboBox_COM.Items.Add(' COM' + IntToStr(i));
  ComboBox_COM.ItemIndex := 0;
  RefreshStatus;
end;

procedure TfrmHFReaderDemoMain.Action_CloseCOMExecute(Sender: TObject); //关闭串口函数,并清空相应的显示
var
port:byte;
SelectCom :string;
begin
ClearLastInfo;
  try
    if ComboBox_AlreadyOpenCOM.itemindex < 0 then
      begin
        Application.MessageBox('请选择要关闭的端口', '信息提示', MB_ICONINFORMATION);
        exit;
      end
    else
    begin
      SelectCom := copy(ComboBox_AlreadyOpenCOM.Items[ComboBox_AlreadyOpenCOM.ItemIndex],4,1);
      port := strtoint(SelectCom);
      fcmdRet :=  CloseSpecComPort(port) ;
      if fcmdRet = 0 then
      begin
        Lun_number:=0;
        RadioButton1.Enabled:=False;
        RadioButton2.Enabled:=False;
        RadioButton3.Enabled:=False;
        RadioButton4.Enabled:=False;
        Button43.Enabled:=False;
        ComboBox_AlreadyOpenCOM.DeleteSelected;
        if ComboBox_AlreadyOpenCOM.items.Count <> 0 then
          begin
            port := strtoint(copy(ComboBox_AlreadyOpenCOM.items[0],4,1));
            CloseSpecComPort(port);
            fComAdr := $FF;
            opencomport(port,fComAdr,fBaud,frmcomportindex);
            fOpenComIndex := frmcomportindex;
            RefreshStatus;
            Action_GetReaderInformationExecute(Sender); //自动执行读取写卡器信息
          end;
      end
      else
      begin
        Application.MessageBox('串口通讯错误', '信息提示', MB_ICONINFORMATION);
        exit;
      end;
    AddCmdLog('Close COM Port', TAction(Sender).Caption, fCmdRet);
    end;
  finally

  end;

  if ComboBox_AlreadyOpenCOM.items.Count <> 0 then
    ComboBox_AlreadyOpenCOM.ItemIndex := 0
  else
    begin
      fOpenComIndex := -1;
      ComboBox_AlreadyOpenCOM.clear;
      ComboBox_AlreadyOpenCOM.Repaint;
      
      RefreshStatus;
    end;
end;

procedure TfrmHFReaderDemoMain.Action_OpenCOMExecute(Sender: TObject); //打开串口函数
var
  i,port: LongInt;
  openresult :byte;
begin
  Screen.Cursor := crHourGlass;
  fComAdr := StrToInt('$' + Edit_CmdComAddr.Text); // $FF;
  ListBox_GroupBox_InventoryList.clear;
  try
      if ComboBox_COM.ItemIndex = 0 then //Auto
      begin
        case ComboBox_baud.ItemIndex of
        0: fBaud:=0;
        1: fBaud:=1;
        2: fBaud:=2;
        3: fBaud:=3;
        end;
        openresult := AutoOpenComPort(port,fComAdr,fBaud,frmcomportindex);
        fOpenComIndex := frmcomportindex;

        if openresult = 0 then
        begin
            ComboBox_baud.ItemIndex:=fBaud;
            ComboBox1.ItemIndex:=ComboBox_baud.ItemIndex;
            //  RadioButton1.Enabled:=True;
            //  RadioButton2.Enabled:=True;
            //  RadioButton3.Enabled:=True;
          // RadioButton4.Enabled:=True;
           Button43.Enabled:=True;
          Action_GetReaderInformationExecute(Sender); //自动执行读取写卡器信息

        end;
      end
      else
      begin
        port := strtoint(copy(ComboBox_COM.items[ComboBox_COM.itemindex],5,2));
        for i:=3 downto 0 do
        begin
           fBaud:=i;
          openresult := opencomport(port,fComAdr,fBaud,frmcomportindex);
          fOpenComIndex := frmcomportindex;
          if openresult= $35 then
          begin
           Application.MessageBox('串口已打开', '信息提示',MB_ICONINFORMATION);
            Exit;
          end;
          if openresult = 0 then
          begin
            //  ComboBox_baud.ItemIndex:=fBaud;
              ComboBox1.ItemIndex:=fBaud;
            //  RadioButton1.Enabled:=True;
            //  RadioButton2.Enabled:=True;
            //  RadioButton3.Enabled:=True;
          // RadioButton4.Enabled:=True;
           Button43.Enabled:=True;
            Action_GetReaderInformationExecute(Sender); //自动执行读取写卡器信息
            Break;
          end;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;

  if (fOpenComIndex <> -1) and
     (openresult <> $35)  and
     (openresult <> $30)  then
  begin
    ComboBox_AlreadyOpenCOM.Items.Add('COM'+inttostr(fOpenComIndex)) ;
    ComboBox_AlreadyOpenCOM.ItemIndex := ComboBox_AlreadyOpenCOM.ItemIndex + 1;
  end;

  RefreshStatus;

  if (fOpenComIndex = -1) and
     (openresult = $30)  then
  begin
    Application.MessageBox('串口通讯错误', '信息提示', MB_ICONINFORMATION);
  end;
  if ComIsOpen then
  begin
    if(Edit_ComAdr.Text<>'')then
    fComAdr := StrToInt('$' +Edit_ComAdr.Text);
    frmcomportindex := strtoint(copy(ComboBox_AlreadyOpenCOM.items[ComboBox_AlreadyOpenCOM.itemindex],4,1));
  end;

end;

procedure TfrmHFReaderDemoMain.RefreshStatus; //Updata ComPort Information
begin
  if fOpenComIndex = -1 then
    StatusBar1.Panels.Items[1].Text := '通讯关闭'
  else
    StatusBar1.Panels.Items[1].Text := ' COM' + IntToStr(fOpenComIndex );
    begin
      StatusBar1.Panels.Items[2].Text :='';
      StatusBar1.Panels.Items[3].Text :='';
      StatusBar1.Panels.Items[4].Text :='';
      StatusBar1.Panels.Items[5].Text :='';
    end;
end;


procedure TfrmHFReaderDemoMain.InitInventoryScanTimeList; //初始化询查命令时间函数
var
  i: Integer;
begin
  ComboBox_InventoryScanTime.ITems.Clear;
  for i := 3 to 255 do
    ComboBox_InventoryScanTime.Items.Add(' ' + IntToStr(i));
  ComboBox_InventoryScanTime.ItemIndex := ComboBox_InventoryScanTime.Items.IndexOf(' 30')
end;

procedure TfrmHFReaderDemoMain.InitAccessTimeList; //初始化询查命令时间函数
var
  i: Integer;
begin
  ComboBox_AccessTime.ITems.Clear;
  for i := 0 to 255 do
    ComboBox_AccessTime.Items.Add(' ' + IntToStr(i));
  ComboBox_AccessTime.ItemIndex := 0;
end;

procedure TfrmHFReaderDemoMain.Action_GetReaderInformationExecute(Sender: TObject); //获得读写器信息函数
  function getNoStr(no: Integer; noLen: Integer): string;
  begin
    result := intToStr(no);
    while Length(result) < noLen do
      result := '0' + result;
  end;
var
  TrType, VersionInfo: array[0..2] of Char;
  ReaderType, InventoryScanTime: Byte;
  TrType2: Byte;
begin
  Edit_Version.Text := '';
  Edit_ComAdr.Text := '';
  Edit_InventoryTime.Text := '';
  Edit_Type.text := '';
  Edit_TrType.text := '';

  RadioButton_parsemode2.OnClick := nil;
 // RadioButton_parsemode2.Checked := true;
  //Use the OnClick event handler to respond when the user clicks the control.
  //If the control has an associated action,
  //and that action has an OnExecute method,
  //the action's OnExecute method responds to click events
  //unless it is superseded by an OnClick event handler.
  RadioButton_parsemode2.OnClick := Action_SetParseModeExecute;

  RadioButton_depth1.onClick := nil;
 // RadioButton_depth1.Checked := true;
  RadioButton_depth1.OnClick := Action_SetdepthExecute;

  fCmdRet := GetReaderInformation(fComAdr, VersionInfo, ReaderType, TrType, InventoryScanTime,frmcomportindex);
  if fCmdRet = 0 then
  begin
    Edit_Version.Text := getNoStr(ord(VersionInfo[0]), 2) + '.' +
      getNoStr(ord(VersionInfo[1]), 2);


    Edit_ComAdr.Text := IntToHex(fComAdr, 2);
    Edit_InventoryTime.Text := IntToStr(InventoryScanTime);

        //而HF001需要根据版本再做些屏蔽，版本在3.10以下的版本需要屏蔽今天新加的3条命令，
        //而且B类型的电子标签不能对所有的写类型命令操作。只有3.10或以上版本有全部功能。
    case ReaderType of
      $45: begin
          Edit_Type.text := 'HF001';
          if not TabSheet_TestMode.TabVisible then
            TabSheet_TestMode.TabVisible := True;
        end;
      $55: begin
          Edit_Type.text := 'HF036';
                      //HF036要屏蔽：询查命令（多张电子标签）的4个命令要屏蔽，
                      //造成的结果是测试模式也要屏蔽。
          TabSheet_TestMode.TabVisible := False;

        end;
      $58 : Begin
              Edit_Type.text := 'HF038';
            end;
      $5C: begin
          Edit_Type.text := 'HF036SC';
                      //HF036要屏蔽：询查命令（多张电子标签）的4个命令要屏蔽，
                      //造成的结果是测试模式也要屏蔽。
          TabSheet_TestMode.TabVisible := False;

        end;
      $46: begin

          Edit_Type.text := 'HF001Lite';
                    // 'HF001Lite '只保留 打开射频 ， 关闭射频，获得读写器信息 ，
                    // 新的查询，继续查询 测试模式 6个功能 其他的功能 要屏蔽 。
        end;

      $47: begin
          Edit_Type.text := 'HF003A';
        end;

      $71: begin
          Edit_Type.text := 'HF003AD';
        end;

      $48: begin
          Edit_Type.text := 'HF036CF';
                      //HF036cf要屏蔽：询查命令（多张电子标签）的4个命令要屏蔽，
                      //造成的结果是测试模式也要屏蔽。
          TabSheet_TestMode.TabVisible := False;
        end;

      $A1: begin
          Edit_Type.text := 'HF201'; //'HF201'
        end;
      $A2: begin
          Edit_Type.text := 'HF203A';
        end;
      $A6: begin
          Edit_Type.text := 'HF201Lite'; //功能与HF001lite相同  2006-11-15
        end;
      $80: begin
          Edit_Type.text := 'HF091D'; // 'HF091'2007-4-7
        end;
      $5B: begin
          Edit_Type.text := 'HF037';
          TabSheet_TestMode.TabVisible := False; //屏蔽测试模式
        end;
      $5D: begin
          Edit_Type.text := 'HF037SC';
          TabSheet_TestMode.TabVisible := False; //屏蔽测试模式
        end;
      $90: begin
          Edit_Type.text := 'HF291';
        end;
      $30: begin
          Edit_Type.text := 'HF091F'; //Access time HF091T
        end;
      $3A: begin
          Edit_Type.text := 'HF296'; // Access time and Receiv ANT
        end;

      $A7: begin
          Edit_Type.text := 'HF201D'; //
        end;
      $4B: begin
          Edit_Type.text := 'HF002AD'; //'HF002A'-- HF002AD
        end;
      $A3: begin
          Edit_Type.text := 'HF202AD'; // 'HF202A' HF202AD
        end;
      $81: begin
          Edit_Type.text := 'HF092A'; //
        end;

      $82: begin
          Edit_Type.text := 'HF093A'; //
        end;
      $93: begin
          Edit_Type.text := 'HF291F'; //HF291T
        end;
      $91: begin
          Edit_Type.text := 'HF292A'; //
        end;
      $92: begin
          Edit_Type.text := 'HF293A'; //
        end;
      $70: begin
          Edit_Type.text := 'HF001D';
          Edit_Version.Text := '06.00'; //2007625
        end;
      $8B: begin
          Edit_Type.text := 'HF203AGD';
        end;
      $72: begin
          Edit_Type.text := 'HF203AD';
        end;
      $97: begin
          Edit_Type.text := 'HF291D';
        end;
      $7E: begin
          Edit_Type.text := 'HF001T';
        end;
      $7F: begin
          Edit_Type.text := 'HF201T';
        end;

      $8E: begin
          Edit_Type.text := 'HF091T';
        end;
      $8F: begin
          Edit_Type.text := 'HF291T';
        end;
      $83: begin
          Edit_Type.text := 'HF092T';
        end;
      $84: begin
          Edit_Type.text := 'HF093T';
        end;

      $74: begin
          Edit_Type.text := 'HF002T';
        end;
      $73: begin
          Edit_Type.text := 'HF003T';
        end;
      $3B: begin
          Edit_Type.text := 'HF296A';
        end;
      $98: begin
          Edit_Type.text := 'HF202T';
        end;
      $99: begin
          Edit_Type.text := 'HF203T';
        end;
      $9A: begin
          Edit_Type.text := 'HF292T';
        end;
      $9B: begin
          Edit_Type.text := 'HF293T';
        end;
      $8A: begin
          Edit_Type.text := 'HF003AGD';
        end;
                // 9101T＝0x50，功能等同于9001T；HF001TSC
                //9191T＝0x51，功能等同于9091T   HF091TSC
      $50: begin
          Edit_Type.text := 'HF001TSC'; //  /2007-10-29 'HF101T'
        end;
      $51: begin
          Edit_Type.text := 'HF191T'; //2007-10-29
        end;
    else
      Edit_Type.text := '';
    end;
    if (Edit_Version.text >= '06.00')
      or (Edit_Type.text = 'HF001T')
      or (Edit_Type.text = 'HF002T')
      or (Edit_Type.text = 'HF003T')
      or (Edit_Type.text = 'HF091T')

    or (Edit_Type.text = 'HF093T')
      or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF092T')
      or (Edit_Type.text = 'HF201T')
      or (Edit_Type.text = 'HF202T')
      or (Edit_Type.text = 'HF203T')
      or (Edit_Type.text = 'HF291T')
      or (Edit_Type.text = 'HF292T')
      or (Edit_Type.text = 'HF293T')
      or (Edit_Type.text = 'HF296')
      or (Edit_Type.text = 'HF296A')
      or (Edit_Type.text = 'HF001TSC')
      or (Edit_Type.text = 'HF091TSC') then
    begin
            //版本号大于6.0 或型号有T的启用透明格式模式
      TabSheet_TransparentCMD.TabVisible := true; //TabVisible
      Action_GetParseModeExecute(Sender);
    end
    else
    begin
      TabSheet_TransparentCMD.TabVisible := false; //TabVisible

    end;

    if ((Edit_Type.text = 'HF001') or (Edit_Type.text = 'HF001D')
      or (Edit_Type.text = 'HF001T')
      or (Edit_Type.text = 'HF001TSC'))
      and (Edit_Version.text >= '03.10') then //版本小
    begin
      ComboBox_Relay0.Enabled := True;
      ComboBox_Output0.Enabled := True;
      ComboBox_Output1.Enabled := True;
    end else
    begin
      ComboBox_Relay0.Enabled := False;

      ComboBox_Output0.Enabled := False;
      ComboBox_Output1.Enabled := False;
    end;

    if (not (((Edit_Type.text = 'HF001') or (Edit_Type.text = 'HF001D')
      or (Edit_Type.text = 'HF001T')
      or (Edit_Type.text = 'HF001TSC'))
      and (Edit_Version.text >= '03.10'))) then
    begin
      if ((Edit_Type.text = 'HF003A')
        or (Edit_Type.text = 'HF201')
        or (Edit_Type.text = 'HF203A')
        or (Edit_Type.text = 'HF091D')
        or (Edit_Type.text = 'HF291')
        or (Edit_Type.text = 'HF091F')
        or (Edit_Type.text = 'HF296')
        or (Edit_Type.text = 'HF296A')
        or (Edit_Type.text = 'HF201D')
        or (Edit_Type.text = 'HF002AD')
        or (Edit_Type.text = 'HF202AD')
        or (Edit_Type.text = 'HF092A')
        or (Edit_Type.text = 'HF093A')
        or (Edit_Type.text = 'HF291F')
        or (Edit_Type.text = 'HF292A')
        or (Edit_Type.text = 'HF293A')
        or (Edit_Type.text = 'HF003AD')
        or (Edit_Type.text = 'HF203AD')
        or (Edit_Type.text = 'HF291D')
        or (Edit_Type.text = 'HF201T')
        or (Edit_Type.text = 'HF091T')
        or (Edit_Type.text = 'HF291T')
        or (Edit_Type.text = 'HF092T')
        or (Edit_Type.text = 'HF093T')
        or (Edit_type.text = 'HF293T')
        or (Edit_Type.text = 'HF202T')
        or (Edit_Type.text = 'HF002T')
        or (Edit_Type.text = 'HF003T')
        or (Edit_Type.text = 'HF191T')) then
                    //or(Edit_Type.text = 'HF203AGD')
      begin
        ComboBox_Relay0.Enabled := True;
        ComboBox_Output0.Enabled := True;
        ComboBox_Output1.Enabled := True;
      end else
      begin
        ComboBox_Relay0.Enabled := False;
        ComboBox_Output0.Enabled := False;
        ComboBox_Output1.Enabled := False;
      end;
    end;

    TrType2 := ord(TrType[1]);
    if (TrType2 and $08) = $08 then //第二个字节低第四位代表支持的协议“ISO/IEC 15693”
      Edit_TrType.text := 'ISO/IEC 15693'
    else
      Edit_TrType.text := '';
  end;
    ////////////
  if (Edit_Type.text = 'HF038')or(Edit_Type.text = 'HF037') or (Edit_Type.text = 'HF036') or (Edit_Type.text = 'HF037SC')
    or (Edit_Type.text = 'HF036SC') or (Edit_Type.text = 'HF036CF') then
  begin
    Label_LED.Caption := 'LED指示';
    Label_BEEP.Caption := '蜂鸣器';
    ComboBox_Output0.Items.Clear;
    ComboBox_Output0.Items.Add('鸣响');
    ComboBox_Output0.Items.Add('静音');
    ComboBox_Output0.ItemIndex := 0;

    ComboBox_Output1.Items.Clear;
    ComboBox_Output1.Items.add('绿色');
    ComboBox_Output1.Items.add('红色');
    ComboBox_Output1.ItemIndex := 0;
  end
  else
  begin
    Label_LED.Caption := '端口2';
    Label_BEEP.Caption := '端口1';
    ComboBox_Output0.Items.Clear;
    ComboBox_Output0.Items.Add('低电平');
    ComboBox_Output0.Items.Add('高电平');
    ComboBox_Output0.ItemIndex := 0;
    ComboBox_Output1.Items.Clear;
    ComboBox_Output1.Items.add('低电平');
    ComboBox_Output1.Items.add('高电平');
    ComboBox_Output1.ItemIndex := 0;
  end;

    ///////////////////
  if (Edit_Type.text = 'HF291') or (Edit_Type.text = 'HF037')
    or (Edit_Type.text = 'HF037SC')
    or (Edit_Type.text = 'HF091D')
    or (Edit_Type.text = 'HF091F')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF093A')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF293A')
    or (Edit_Type.text = 'HF291F')
    or (Edit_Type.text = 'HF291D')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF191T') then
  begin
     //是'HF291''HF037''HF091''HF091t''HF296'型号之一的读写器打开ScanMode模式
    TabSheet_ScanMode.TabVisible := true;
    TabSheet_CustomCmd.TabVisible := true;
  end
  else
  begin
     //非'HF291''HF037''HF091''HF091t''HF296'型号的读写器都屏蔽ScanMode模式 2006-12-15
    TabSheet_ScanMode.TabVisible := false;
    TabSheet_CustomCmd.TabVisible := false; //2007-6-15 屏蔽用户自定义模式
  end;
  AddCmdLog('GetReaderInformation', TAction(Sender).Caption, fCmdRet);
end;
 
procedure TfrmHFReaderDemoMain.Action_OpenRfExecute(Sender: TObject); //打开射频
begin
  fCmdRet := OpenRf(fComAdr,frmcomportindex);
  AddCmdLog('OpenRf', TAction(Sender).Caption, fCmdRet);
end;

procedure TfrmHFReaderDemoMain.AddCmdLog(cmd, cmdName: string; cmdRet: Byte; errorCode: LongInt = -1); //操作状态成功或错误提示函数
var
  s: string;
begin
  if cmdRet <> 0 then
  begin
    s := '指令返回=0x' + IntToHex(cmdRet, 2) + '(' + HFReader_GetReturnCodeDesc(cmdRet) + ')';
    if ErrorCode <> -1 then
    begin
      if ErrorCode <> 0 then
        s := s + #13#10 + 'ErrorCode=0x' + IntToHex(ErrorCode, 2) + '(' + HFReader_GetErrorCodeDesc(ErrorCode) + ')';
    end;
    if ErrorCode <> -1 then
      Application.MessageBox(pchar(s), '错误提示', MB_ICONINFORMATION);
  end;

  if cmdRet = 0 then
    StatusBar1.Panels.Items[0].text := FormatDateTime('hh:mm:ss', Now) + '  “' + cmdName + '” 执行成功'
  else
    StatusBar1.Panels.Items[0].text := FormatDateTime('hh:mm:ss', Now) + '  ' + s;
end;

procedure TfrmHFReaderDemoMain.Action_GetReaderInformationUpdate(
  Sender: TObject);
var
  ComAdrIsValid: Boolean;
begin
  if Sender = Action_WriteComAdr then
  begin
    ComAdrIsValid := (Length(Edit_NewComAdr.Text) = 2) and (UpperCase(Edit_NewComAdr.Text) <> 'FF');
    if ComAdrIsValid then
      ComAdrIsValid := ComAdrIsValid and checkHexStr(Edit_NewComAdr.Text);


TAction(Sender).Enabled := Self.ComIsOpen and ComAdrIsValid;
  end;

  if (Sender = Action_GetReaderInformation) or (Sender = Action_OpenRf) or (Sender = Action_CloseRf) then
  begin
 TAction(Sender).Enabled := Self.ComIsOpen; //
  end;
  if (Sender <> Action_WriteComAdr) and (Sender <> Action_GetReaderInformation) and (Sender <> Action_OpenRf) and (Sender <> Action_CloseRf) then
  begin
   TAction(Sender).Enabled := Self.ComIsOpen
      and (Edit_Type.text <> 'HF001Lite')
      and (Edit_Type.text <> 'HF201Lite'); //2006-11-15
  end; //======2006-10-31

  if ((Edit_Type.text = 'HF001Lite') or (Edit_Type.text = 'HF201Lite')) then
  begin
    ComboBox_UID.Enabled := false;
    GroupBox_OperMode.Enabled := false; //屏避操作模式功能

    ComboBox_Edit_BlockStyle.Enabled := false; // 屏避数据块内的操作功能
    ComboBox_MAXBlockNum.Enabled := false; // 屏避数据块内的操作功能
    ComboBox_Edit_BlockStyleNum.Enabled := false; // 屏避数据块内的操作功能
    ComboBox_BlockNum.Enabled := false; // 屏避数据块内的操作功能
    ComboBox_BlockAdr.Enabled := false; // 屏避数据块内的操作功能
    ComboBox_BlockEndAdr.Enabled := false; // 屏避数据块内的操作功能
  end
  else
  begin
    ComboBox_UID.Enabled := true;
    GroupBox_OperMode.Enabled := true;
    ComboBox_Edit_BlockStyle.Enabled := true;
    ComboBox_MAXBlockNum.Enabled := true;
    ComboBox_Edit_BlockStyleNum.Enabled := true;
    ComboBox_BlockNum.Enabled := true;
    ComboBox_BlockAdr.Enabled := true;
    ComboBox_BlockEndAdr.Enabled := true;
  end;
end;

procedure TfrmHFReaderDemoMain.Action_StayQuietUpdate(Sender: TObject);
var
  UIDValid: Boolean;
begin
  UIDValid := Length(ComboBox_UID.Text) = 16; //16个字节的UID
  TAction(Sender).Enabled := Self.ComIsOpen and UIDValid //要判断当前是否有选定模式
    and RadioButton_Address.Checked; //仅支持Address模式
end;

procedure TfrmHFReaderDemoMain.Action_CloseRfExecute(Sender: TObject); //关闭射频
begin
  fCmdRet := CloseRf(fComAdr,frmcomportindex);
  AddCmdLog('CloseRf', TAction(Sender).Caption, fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Action_WriteComAdrExecute(Sender: TObject); //修改读写器地址函数
var
  aNewComAdr: Byte;
begin
  aNewComAdr := StrToInt('$' + Edit_NewComAdr.Text);
  fCmdRet := WriteComAdr(fComAdr, aNewComAdr,frmcomportindex);
  AddCmdLog('WriteComAdr', TAction(Sender).Caption, fCmdRet);

  if fCmdRet = 0 then //代表修改成功
  begin
    fComAdr := aNewComAdr;
   //再执行一次读取
    Action_GetReaderInformationExecute(Sender);
  end; //2007-1-16
end;

procedure TfrmHFReaderDemoMain.Action_WriteInventoryScanTimeExecute(
  Sender: TObject); //写询查时间函数
var
  InventoryScanTime: Byte;
  s: string;
begin
  s := trim(ComboBox_InventoryScanTime.Text);
  InventoryScanTime := StrToInt(s);

  fCmdRet := WriteInventoryScanTime(fComAdr, InventoryScanTime,frmcomportindex);
  AddCmdLog('WriteInventoryScanTime', TAction(Sender).Hint, fCmdRet);

  if fCmdRet = 0 then
  begin //再执行一次读取
    Action_GetReaderInformationExecute(Sender);
  end; //2007-1-16
end;

procedure TfrmHFReaderDemoMain.Action_Inventory_00Execute(Sender: TObject); //询查命令函数

  procedure ChangeSubItem(aListItem: TListItem; subItemIndex: Integer; ItemText: string);
  begin
    if aListItem.SubItems[subItemIndex] = ItemText then exit; //内容相同则不需要修改，可以不闪烁
    aListItem.SubItems[subItemIndex] := ItemText;
  end;
var
  State, AFI, CardNum: Byte;
  CardIndex: Integer;
  CardNum1:Integer ;
  m_Time:LongInt;
  DSFIDAndUID: array[0..4000] of Char; //接收到的缓冲
  temps: string;
  s, sUID: string;
  aListItem: TListItem;
  BlockStyle: string;
  temps2, temps3: string;
  i, j, m, n: integer;
  isonstring: boolean;
var
  FirmName: string;
  BlockSize, BlockNum: Byte;
  Firmcode, OtherCode: Byte;

var
  StartGetTagTime, GetTagTime1, GetTagTime2, GetTagTime3: TDateTime;
  TagTimeBetween, TagTimeBetween2, TagTimeBetween1: double;
  ReadTagRate: double;
begin
  fIsInventoryScan := true;
  try
    if Sender = Action_Inventory_00 then State := $00 //判断是何种询查命令
    else if Sender = Action_Inventory_01 then State := $01
    else if Sender = Action_Inventory_06 then State := $06
    else if Sender = Action_Inventory_07 then State := $07
    else if Sender = Action_Inventory_02 then State := $02
    else if Sender = Action_Inventory_03 then State := $03;

    AFI := StrToInt('$' + Edit_AFI.Text);
    StartGetTagTime := now; // 2007-6-24
    fCmdRet := Inventory(fComAdr, State, AFI, DSFIDAndUID, CardNum,frmcomportindex);
    GetInventoryTime(m_Time,frmComPortindex);
    CardNum1:= CardNum;
    n_Time:=n_Time+m_Time;
    if (fCmdRet = $0E) then
    begin
      GetTagTime3 := now; //2007-6-24
    end;

    if (fCmdRet = 0) or (fCmdRet = $0A) or (fCmdRet = $0B) or (fCmdRet = $0E) then
    begin
      GetTagTime1 := now; // 2007-6-24
           // temps := getStr(DSFIDAndUID,CardNum *9);
      if Istemps02Save then //把继续询查上次的卡保存
      begin
        temps := temps02Save; //已经询查到的卡
        temps2 := getStr(DSFIDAndUID, CardNum1* 9);
        for j := 1 to CardNum1 do
        begin
          temps3 := copy(temps2, (j - 1) * 9 + 1, 9);
          isonstring := false;
          for i := 1 to (length(temps) div 9) do
          begin
            if copy(temps, (i - 1) * 9 + 1, 9) = temps3 then isonstring := true; //continue;
          end;
          if not isonstring then temps := temps + temps3;
        end;
        Istemps02Save := false;
        CardNum1:= (length(temps) div 9);

      end
      else
      begin
        temps :=getStr(DSFIDAndUID, CardNum1 * 9);
      end;
      if Timer_Test_.Enabled then //代表测试模式
      begin
        if (fcmdRet = $0E) and (fInventory_DSFID_UID_List <> temps) then //代表已查找结束，并且内容有发生变化
        begin
//            for m := 1 to ListView_UID.Items.Count do
//            begin
//              for n := 1 to (length(temps) div 9) do
//              if ListView_UID.it = copy(temps,9*n-8,9)then continue;
//                with (ListView_UID.Items.Add) do
//                begin
//                  caption := inttostr(ListView_UID.Items.Count+1);
//                  subitems.Add(copy(temps,8*n,1)) ;
//                  subitems.Add(copy(temps,9*n-8,8)) ;
//                  subitems.Add(copy(temps,9*n-8,1)) ;
//                end;
//            end;
          fInventory_DSFID_UID_List := tempS;            //存贮记录
          
          while ListView_UID.Items.Count < CardNum1 do    //以下为了不闪烁
          begin
            aListItem := ListView_UID.Items.Add;
            aListItem.Caption := IntToStr(aListItem.Index + 1);
            aListItem.SubItems.Add('');
            aListItem.SubItems.Add('');
            aListItem.SubItems.Add('');
            aListItem.SubItems.Add('');
            aListItem.SubItems.Add('');
          end;

          while ListView_UID.Items.Count > CardNum1 do
            ListView_UID.Items.delete(ListView_UID.Items.Count - 1);


          for CardIndex := 1 to CardNum1 do
          begin
            sUID := copy(tempS, (cardIndex - 1) * 9 + 1, 9);
            if Length(sUID) <> 9 then Continue;
            s := getHexStr(sUID);
            aListItem := ListView_UID.Items[CardIndex - 1];
            Firmcode := Ord(sUID[8]);
            OtherCode := Ord(sUID[9]);
            if HFReader_GetBlockSize_BlockNum(Firmcode, OtherCode, FirmName, BlockSize, BlockNum, BlockStyle) then
              ChangeSubItem(aListItem, 0, FirmName)
            else
              ChangeSubItem(aListItem, 0, '');

            ChangeSubItem(aListItem, 1, copy(s, 3, Length(s)));
            ChangeSubItem(aListItem, 2, IntToHex(ord(sUID[1]), 2));
          end;
          StatusBar1.Panels.Items[2].Text := '张数：'+IntToStr(CardNum1);
          StatusBar1.Panels.Items[3].Text := '询查时间：'+IntToStr(n_Time)+'ms';
          ListView_UID.ItemIndex:=ListView_UID.Items.Count-1;
        end;
         if(fcmdRet = $0E)then
         begin
          Inc(Lun_number);
          StatusBar1.Panels.Items[4].Text := '轮数：'+IntToStr(Lun_number);
         end;
        if fCmdRet = $0B then //说明还未将所有卡读取完
        begin
          Istemps02Save := true;
          temps02Save := temps;
          Action_Inventory_00Execute(Action_Inventory_02);
        end;
      end else              //非测试模式
      begin
                 //if fInventory_DSFID_UID_List<>temps then   //说明有变化
        begin
          fInventory_DSFID_UID_List := tempS; //存贮记录

                     //------------------  2006-8-11
                    // 修改的是使每次的查询后卡的信息都清空
          Edit_SystemInfo.Text := ''; //   获取电子标签的信息栏清空上次记录
          Memo_SystemInfo2.Lines.Clear; //获取电子标签的信息栏清空上次记录
          ComboBox_Edit_BlockStyle.Items.Clear; // 标签写类型
          ComboBox_Edit_BlockStyle.Text := ''; // 标签写类型
          ComboBox_MAXBlockNum.Items.Clear; // 最大块号
          ComboBox_MAXBlockNum.Text := ''; // 最大块号

          ComboBox_Edit_BlockStyleNum.Items.Clear; // 单位块大小
          ComboBox_Edit_BlockStyleNum.Text := ''; // 单位块大小
          ComboBox_BlockNum.Items.Clear; //  块号
          ComboBox_BlockNum.Text := ''; //  块号
          ComboBox_BlockAdr.Items.Clear; // 起始块号
          ComboBox_BlockAdr.Text := ''; // 起始块号

          ComboBox_BlockEndAdr.Items.Clear; // 结束块号
          ComboBox_BlockEndAdr.Text := '';

          Edit_R_BlockData.Text := ''; //读取的指定块号的数据
          Edit_BlockData.Text := ''; //写入指定块号的数据
                    //---------------------------------------2006-8-11
          ComboBox_UID2.Items.Clear;
          ComboBox_Edit_BlockStyleuser.Items.Clear; //

          ComboBox_MAXBlockNumuser.Items.Clear;
          ComboBox_BlockNumUser.Items.Clear;
          Edit_R_BlockData2.Text := '';
          Edit_BlockData2.Text := '';
          ComboBox_BlockAdrUser.Items.Clear;
          ComboBox_BlockEndAdrUser.Items.Clear;

          ComboBox_Edit_BlockStyleuser.Text := '';
          ComboBox_MAXBlockNumuser.Text := '';
          ComboBox_BlockEndAdrUser.Text := '';

                    //---------------------------------------------2006-12-20
          ComboBox_UID.Items.Clear;
          ComboBox_UID2.Items.Clear;
          ListBox_GroupBox_InventoryList.Items.Clear();
          for CardIndex := 1 to CardNum1 do
          begin
            s := getHexStr(copy(tempS, (cardIndex - 1) * 9 + 1, 9));
                        //if ListBox_GroupBox_InventoryList.Items.IndexOf(s)>=0 then Continue;   //已存在

            ListBox_GroupBox_InventoryList.Items.Add(s);
            ComboBox_UID.Items.Add(copy(s, 3, Length(s)));
            ComboBox_UID2.Items.Add(copy(s, 3, Length(s))); //2006-12-16
          end;
          ListBox_GroupBox_InventoryList.ItemIndex:=ListBox_GroupBox_InventoryList.Items.Count-1;
          Inc(Lun_number);
          StatusBar1.Panels.Items[4].Text := '轮数：'+IntToStr(Lun_number);
          StatusBar1.Panels.Items[2].Text := '张数：'+IntToStr(CardNum1);
          StatusBar1.Panels.Items[3].Text := '询查时间：'+IntToStr(n_Time)+'ms';
        end;

      end;
    end;

    if not Timer_Test_.Enabled then //非测试模式

      AddCmdLog('Inventory', TAction(Sender).Caption, fCmdRet);
            //-------------------------------------------------------- --
              // if   ListBox_GroupBox_InventoryList //2006-8-2 修改 一旦寻到卡,状态栏显示寻到卡操作成功
    if s <> '' then
    begin fCmdRet := 0;
      AddCmdLog('Inventory', TAction(Sender).Caption, fCmdRet);
    end;

              //------------------------------------------------------------

    if Timer_Test_.Enabled then
    begin
      if (fCmdRet = 0) or (fCmdRet = $0A) or (fCmdRet = $0B) or (fCmdRet = $0E) then //正确返回
        begin

        end
      else //错误，要显示错误信息，并退出测试模式
      begin
          AddCmdLog('Inventory', '测试模式', fCmdRet);
          Timer_Test_.Enabled := False;
      end;
    end;
  finally
    fIsInventoryScan := False;
  end;
    n_Time:=0;
  if fAppClosed then Close; //在询查模式下按了关闭应用程序，则重新响应此命令
end;

function TfrmHFReaderDemoMain.getHexStr(sBinStr: string): string; //获得十六进制字符串
var
  i: Integer;
begin
  result := '';
  for i := 1 to Length(sBinStr) do
    result := result + IntToHex(ord(sBinStr[i]), 2);
end;


function TfrmHFReaderDemoMain.getBinStr(sHexStr: string): string; //获得二进制字符串
var
  i: Integer;
begin
  result := '';
  for i := 1 to Length(sHexStr) div 2 do
    result := result + Char(StrToInt('$' + copy(sHexStr, (i - 1) * 2 + 1, 2)));
end;

function TfrmHFReaderDemoMain.getBinStr(pBinStr: pchar; sHexStr: string): Boolean;
var
  i: Integer;
begin
  result := False;
  for i := 0 to (Length(sHexStr) div 2) - 1 do
    (pBinStr + i)^ := Char(StrToInt('$' + copy(sHexStr, i * 2 + 1, 2)));
end;



procedure TfrmHFReaderDemoMain.Action_OpenTestModeUpdate(Sender: TObject);
begin
  Action_OpenTestMode.Enabled := Self.ComIsOpen and (not Timer_Test_.Enabled);
  Action_CloseTestMode.Enabled := Self.ComIsOpen and Timer_Test_.Enabled;
end;

procedure TfrmHFReaderDemoMain.Timer_Test_Timer(Sender: TObject);
begin
  if fIsInventoryScan then exit; //正在运行退出
  Action_Inventory_00Execute(Action_Inventory_06);
end;

procedure TfrmHFReaderDemoMain.Action_OpenTestModeExecute(Sender: TObject);
begin
  if Sender = Action_OpenTestMode then
  begin
      //先执行打开射频操作
    fCmdRet := OpenRf(fComAdr,frmcomportindex);
    AddCmdLog('OpenRf', TAction(Sender).Caption, fCmdRet);
    if fCmdRet <> 0 then exit;
    Lun_number:=0;
    fInventory_DSFID_UID_List := ''; //先清除原来的缓冲
    ListView_UID.Items.Clear; // 2006-8-2修改 清除LISTVIEW-UID 列表
  end;
  Timer_Test_.Enabled := not Timer_Test_.Enabled;
end;

procedure TfrmHFReaderDemoMain.Action_LockBlockUpdate(Sender: TObject);
var
  VersionEnabled: Boolean;
  CardEnabled: Boolean;
begin
  VersionEnabled := getVersionEnabled();

  CardEnabled := Self.ComIsOpen and (ComboBox_BlockNum.ItemIndex >= 0) and
    (RadioButton_Address.Checked or RadioButton_Select.Checked);

  Action_ReadSingleBlock.Enabled := CardEnabled;
  Action_WriteSingleBlock.Enabled := CardEnabled and VersionEnabled
    and (Edit_Type.text <> 'HF203AGD')
    and (Edit_Type.text <> 'HF003AGD');
  Action_LockBlock.Enabled := CardEnabled and VersionEnabled;
end;

procedure TfrmHFReaderDemoMain.Action_StayQuietExecute(Sender: TObject);
var
  errorCode: Byte;
begin
   //if Not GetOperUID then exit;
  fCmdRet := StayQuiet(fComAdr, fOperUID, errorCode,frmcomportindex);
  AddCmdLog('StayQuiet', TAction(Sender).Caption, fCmdRet, errorCode);
end;

function TfrmHFReaderDemoMain.GetOperUID(const IsMsg: Boolean = True): Boolean;
var
  i: Integer;
  s: string;
begin
  result := False;
  try
    s := ComboBox_UID.text;
    if Length(s) = 16 then
    begin
      for i := 0 to 7 do
        fOperUID[i] := Char(StrToInt('$' + copy(s, i * 2 + 1, 2)));
      result := true;
    end;
  except
       //
  end;

  if (not result) and IsMsg then
  begin
   Application.MessageBox('UID号码转换错误', '错误提示', MB_ICONINFORMATION);
//    Application.MessageBox('Get UID Error', '错误提示', MB_ICONINFORMATION);
  end;
end;

procedure TfrmHFReaderDemoMain.ComboBox_UIDChange(Sender: TObject); //号码选择改变事件函数
var
  i: integer;
begin
  GetOperUID(False);
  ComboBox_Edit_BlockStyle.Items.Clear; //
  ComboBox_Edit_BlockStyle.Text := '';
  ComboBox_MAXBlockNum.Items.Clear;
  ComboBox_MAXBlockNum.Text := '';
  ComboBox_Edit_BlockStyleNum.Items.Clear;
  ComboBox_Edit_BlockStyleNum.Text := '';
  for i := 0 to 255 do
    ComboBox_MAXBlockNum.Items.Add(inttostr(i)); //   最大块号列表0-255
  ComboBox_Edit_BlockStyle.Items.Add('A 类型'); // 写操作类型A
  ComboBox_Edit_BlockStyle.Items.Add('B 类型'); // 写操作类型B

  ComboBox_Edit_BlockStyleNum.Items.Add(' 4'); //单位块大小列表4
  ComboBox_Edit_BlockStyleNum.Items.Add(' 8'); // 单位块大小列表8
  //----2006-8-4
end;

procedure TfrmHFReaderDemoMain.Action_SelectExecute(Sender: TObject);
var
  errorCode: Byte;
begin
   //if Not GetOperUID then exit;
  fCmdRet := Select(fComAdr, fOperUID, errorCode,frmcomportindex);
  AddCmdLog('Select', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.Action_ResetToReadyExecute(Sender: TObject);
var
  State, errorCode: Byte;
begin
   //if Not GetOperUID then exit;
  State := GetState();
  fCmdRet := ResetToReady(fComAdr, State, fOperUID, errorCode,frmcomportindex);
  AddCmdLog('ResetToReady', TAction(Sender).Caption, fCmdRet, errorCode);
end;

function TfrmHFReaderDemoMain.GetState: Byte;
begin
  if RadioButton_Address.Checked then result := $00
  else result := $01;
end;

function TfrmHFReaderDemoMain.GetState(BlockSize: Byte; BlockStyle: string; const IsCheckBlockStyle: Boolean): Byte;
begin
  if not IsCheckBlockStyle then
  begin
    if BlockSize = 4 then
    begin
      if RadioButton_Address.Checked then result := $00
      else result := $01;
    end else
    begin
      if RadioButton_Address.Checked then result := $04
      else result := $05;
    end;
    exit;
  end;

    //以下需要检测写数据块类型
  if BlockSize = 4 then
  begin
    if Pos('A', BlockStyle) >= 1 then //A类型
    begin
      if RadioButton_Address.Checked then result := $00
      else result := $01;
    end else //B类型
    begin
      if RadioButton_Address.Checked then result := $08
      else result := $09;
    end;
  end else
  begin
    if Pos('A', BlockStyle) >= 1 then //A类型
    begin
      if RadioButton_Address.Checked then result := $04
      else result := $05;
    end else
    begin
      if RadioButton_Address.Checked then result := $0C
      else result := $0D;
    end;
  end;
end;

function TfrmHFReaderDemoMain.getStr(pStr: pchar; len: Integer): string;
var
  i: Integer;
begin
  result := '';
  for i := 0 to len - 1 do
    result := result + (pStr + i)^;
end;

procedure TfrmHFReaderDemoMain.Action_GetSystemInformationExecute(
  Sender: TObject);
var
  State, errorCode: Byte;

  UIDO: array[0..8] of char;
  InformationFlag, DSFID, AFI: byte;
  MemorySize: array[0..2] of char;
  ICReference: Byte;
  i: integer;
begin
   //if Not GetOperUID then exit;
  Edit_SystemInfo.Text := '';
  Memo_SystemInfo2.Text := '';
    //----2006-8-3
   //Edit_MAXBlockNum.Text := '';
    //Edit_BlockStyleNum.Text :='';
  ComboBox_MAXBlockNum.Text := '';

    //-------------0226-8-15

  ComboBox_BlockAdr.Items.Clear;
  ComboBox_BlockAdr.Text := '';

  ComboBox_BlockNum.Items.Clear;
  ComboBox_BlockNum.Text := '';

  ComboBox_BlockEndAdr.Items.Clear;
  ComboBox_BlockEndAdr.Text := '';

  Edit_R_BlockData.Text := '';
  Edit_BlockData.Text := '';
  ComboBox_Edit_BlockStyle.Items.Clear; //
  ComboBox_Edit_BlockStyle.Text := '';
  ComboBox_MAXBlockNum.Items.Clear;
  ComboBox_MAXBlockNum.Text := '';
  ComboBox_Edit_BlockStyleNum.Items.Clear;
  ComboBox_Edit_BlockStyleNum.Text := '';
  for i := 0 to 255 do
    ComboBox_MAXBlockNum.Items.Add(inttostr(i)); //   最大块号列表0-255
  ComboBox_Edit_BlockStyle.Items.Add('A 类型'); // 写操作类型A
  ComboBox_Edit_BlockStyle.Items.Add('B 类型'); // 写操作类型B

  ComboBox_Edit_BlockStyleNum.Items.Add(' 4'); //单位块大小列表4
  ComboBox_Edit_BlockStyleNum.Items.Add(' 8'); // 单位块大小列表8

    //--------------2006-8-15
    //----2006-8-3
  State := GetState();
  fCmdRet := GetSystemInformation(fComAdr, State, fOperUID, InformationFlag,
    UIDO, DSFID, AFI, MemorySize, ICReference,
    errorCode,frmcomportindex);
  AddCmdLog('GetSystemInformation', TAction(Sender).Caption, fCmdRet, errorCode);
  if fCmdRet = 0 then
  begin
    Edit_SystemInfo.Text := //IntToHex(InformationFlag,2)+' '+
      getHexStr(getStr(UIDO, 8)) + ' ' +
      IntToHex(DSFID, 2) + ' ' +
      IntToHex(AFI, 2) + ' ' +
      IntToHex(Ord(MemorySize[0]), 2) + IntToHex(Ord(MemorySize[1]), 2) + ' ' +
      IntToHex(ICReference, 2);

    Memo_SystemInfo2.Text := //'InformationFlag='+IntToHex(InformationFlag,2)+' '+
      'UIDO=' + getHexStr(getStr(UIDO, 8)) + ' ' +
      'DSFID=0x' + IntToHex(DSFID, 2) + ' ' +
      'AFI=0x' + IntToHex(AFI, 2) + ' ' +
      'MemorySize=0x' + IntToHex(Ord(MemorySize[0]), 2) + IntToHex(Ord(MemorySize[1]), 2) + ' ' +
      'ICReference=0x' + IntToHex(ICReference, 2);
     //----------------2006-8-3
      //Edit_MAXBlockNum.Text :='0x'+IntToHex(Ord(MemorySize[0]),2) ;
     // Edit_MAXBlockNum.Text :=  inttostr(Ord(MemorySize[0]));
     // Edit_BlockStyleNum.Text :='0x'+ IntToHex(Ord(MemorySize[1]),2) ;
      //Edit_BlockStyleNum.Text := IntTostr(Ord(MemorySize[1])+1) ;
      //----------------2006-8-3
      //ComboBox1.Items.Add(INTTOSTR(1)) ;
       // ComboBox1.Items.Add(INTTOSTR(2));

       //---2006-8-4 修改 标签写操作类型/最大块号
     //  ComboBox_Edit_BlockStyle.Text :=
    if (IntToHex(Ord(MemorySize[1]), 2) = '03') then //2006-10-20
    begin
      ComboBox_Edit_BlockStyleNum.Text := IntTostr(Ord(MemorySize[1]) + 1); //; //得到单位块大小
      ComboBox_Edit_BlockStyleNum.ItemIndex := 0;
    end
    else
    begin
      ComboBox_Edit_BlockStyleNum.Text := '8';
      ComboBox_Edit_BlockStyleNum.ItemIndex := 1; //2006-10-20
    end;
    ComboBox_MAXBlockNum.Text := inttostr(Ord(MemorySize[0])); // 得到最大块号


   //// 设置标签块信息
    SetUIDINfo;
      //===============2006-10-21
    if (ord(fOperUID[6]) = $16) then
    begin
      ComboBox_Edit_BlockStyle.Text := 'A' + ' 类型';
      StatusBar1.Panels.Items[5].text := '写类型(' + 'A' + ')';

    end
    else
    begin
            // ComboBox_Edit_BlockStyle.Text := BlockStyle + ' 类型';
            //  StatusBar1.Panels.Items[5].text := '写类型('+BlockStyle+')';
    end;
            //===============2006-10-21

  end;
end;

procedure TfrmHFReaderDemoMain.Action_WriteAFIExecute(Sender: TObject);
var
  AFI, State, errorCode: Byte;
begin
  State := GetState(ComboBox_Edit_BlockStyle.Text); //ComboBox_Edit_BlockStyle 2006-8-4
  AFI := StrToInt('$' + Edit_AFI.Text);
  fCmdRet := WriteAFI(fComAdr, State, fOperUID, AFI, errorCode,frmcomportindex);
  AddCmdLog('WriteAFI', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.Action_LockAFIExecute(Sender: TObject);
var
  State, errorCode: Byte;
  LockOk: Integer;
begin
//  LockOk := Application.MessageBox('AFI Lock Confirmed？', '是否锁定', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
 LockOk := Application.MessageBox('是否锁定AFI？', '是否锁定', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
  if LockOK <> IDYES then exit;
  State := GetState(ComboBox_Edit_BlockStyle.Text); //ComboBox_Edit_BlockStyle 2006-8-4
  fCmdRet := LockAFI(fComAdr, State, fOperUID, errorCode,frmcomportindex);
  AddCmdLog('LockAFI', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.Action_WriteDSFIDExecute(Sender: TObject);
var
  DSFID, State, errorCode: Byte;
begin
  State := GetState(ComboBox_Edit_BlockStyle.Text); //ComboBox_Edit_BlockStyle2006-8-4
  DSFID := StrToInt('$' + Edit_DSFID.Text);
  fCmdRet := WriteDSFID(fComAdr, State, fOperUID, DSFID, errorCode,frmcomportindex);
  AddCmdLog('WriteDSFID', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.Action_LockDSFIDExecute(Sender: TObject);
var
  State, errorCode: Byte;
  LockOk: Integer;
begin
//  LockOk := Application.MessageBox('是否锁定DSFID？', '是否锁定', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
  LockOk := Application.MessageBox('是否锁定DSFID？', '是否锁定', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
  if LockOK <> IDYES then exit;
  State := GetState(ComboBox_Edit_BlockStyle.Text); //ComboBox_Edit_BlockStyle2006-8-4
  fCmdRet := LockDSFID(fComAdr, State, fOperUID, errorCode,frmcomportindex);
  AddCmdLog('LockDSFID', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.SetUIDINfo;
var
  Firmcode, OtherCode: Byte;
  FirmName: string;
  BlockSize, BlockNum: Byte;
  BlockStyle: string;
  s: string;
  s2: string;
  i: Integer;
begin
  StatusBar1.Panels.Items[2].text := '';
  StatusBar1.Panels.Items[3].text := '';
  StatusBar1.Panels.Items[4].text := '';
  StatusBar1.Panels.Items[5].text := '';
  // Edit_BlockStyle.text := '';
   //---2006-8-4
  ComboBox_Edit_BlockStyle.text := '';
   //------2006-8-4

  s := ComboBox_BlockNum.Text;
  s2 := ComboBox_MAXBlockNum.Text;
  ComboBox_BlockNum.Items.Clear;
   //---- -----------------  2006-8-3
  ComboBox_BlockAdr.Items.Clear;
  ComboBox_BlockEndAdr.Items.Clear;
   // ComboBox_MultipleBlockNum.Items.Clear;
   //------------------ 2006-8-3
  if HFReader_GetBlockSize_BlockNum(ord(fOperUID[6]), ord(fOperUID[7]), FirmName, BlockSize, BlockNum, BlockStyle) then
  begin
    StatusBar1.Panels.Items[2].text := '厂商：' + FirmName;
    StatusBar1.Panels.Items[3].text := '块字节：' + IntToStr(BlockSize);
    StatusBar1.Panels.Items[4].text := '块范围(0-' + IntToSTr(BlockNum - 1) + ')';
      // StatusBar1.Panels.Items[5].text := '写类型('+BlockStyle+')';

    ComboBox_MAXBlockNum.ItemIndex := ComboBox_MAXBlockNum.items.indexof(s2); //2006-10-20
    for i := 0 to ComboBox_MAXBlockNum.items.indexof(s2) do
    begin
      ComboBox_BlockNum.Items.Add(IntToStr(i));
      ComboBox_BlockAdr.Items.Add(IntToStr(i));
      ComboBox_BlockEndAdr.Items.Add(IntToStr(i)); //2006-10-20
    end;
    if s <> '' then
      COmboBox_BlockNum.ItemIndex := ComboBox_BlockNum.Items.IndexOf(s);

    Edit_BlockData.MaxLength := (ComboBox_Edit_BlockStyleNum.ItemIndex * 4 + 4) * 2;

      //===============2006-10-21
    if (ord(fOperUID[6]) = $16) then
    begin
    end
    else
    begin
      ComboBox_Edit_BlockStyle.Text := BlockStyle + ' 类型';
      StatusBar1.Panels.Items[5].text := '写类型(' + BlockStyle + ')';
    end;
        //===============2006-10-21
  end;
end;



procedure TfrmHFReaderDemoMain.Action_LockBlockExecute(Sender: TObject);
var
  State, BlockNum, ErrorCode: Byte;
  LockOk: Integer;
begin
//  LockOk := Application.MessageBox('是否锁定数据块？', '是否锁定', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
 LockOk := Application.MessageBox('是否锁定数据块？', '是否锁定', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
  if LockOK <> IDYES then exit;
  State := GetState(ComboBox_Edit_BlockStyle.Text); //ComboBox_Edit_BlockStyle2006-8-4v2.32
  BlockNum := ComboBox_BlockNum.ItemIndex; //块号
  fCmdRet := LockBlock(fComAdr, State, fOperUID, BlockNum, errorCode,frmcomportindex);
  AddCmdLog('LockBlock', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.Action_ReadSingleBlockExecute(
  Sender: TObject);
var
  State, BlockNum, Blocklength, BlockSecStatus, ErrorCode: Byte;
  BlockData: array[0..8] of Char;
  BlockSize: Byte;
  i: Integer;
  s: string;
begin
  Edit_R_BlockData.Text := '';

  BlockSize := ComboBox_Edit_BlockStyleNum.ItemIndex * 4 + 4; //数据块的大小
                                         //2006-8-14修改的数据块大小 ，使得直接的填入标签的信息即可读写
  State := GetState(BlockSize, ComboBox_Edit_BlockStyle.Text, False); //ComboBox_Edit_BlockStyle

  BlockNum := ComboBox_BlockNum.ItemIndex; //块号
  fCmdRet := ReadSingleBlock(fComAdr, State, fOperUID, BlockNum, BlockSecStatus, BlockData, errorCode,frmcomportindex);
  AddCmdLog('ReadSingleBlock', TAction(Sender).Caption, fCmdRet, errorCode);
  if fCmdRet = 0 then
  begin
    s := IntToHEx(BlockSecStatus, 2) + ' ';
    for i := 0 to BlockSize - 1 do
      s := s + IntToHex(ord(BlockData[i]), 2);
    Edit_R_BlockData.Text := s;
  end;

end;
//=========================================================
//--------------------------   2006-8-3修改的读取多块数据
// 0F ，FF ，23 00 UID8 BLOCKADR BLOCKNUM CRC2
// 2006-8-11 修改 为0F ，FF ，23 00 UID8 BLOCKNUM BLOCKCOUNT CRC2
// BLOCKNUM   代表数据块的起始块号
//BLOCKCOUNT 代表读取的数据块个数

procedure TfrmHFReaderDemoMain.Action_ReadMultipleBlockExecute(
  Sender: TObject);
var
  State, BlockNum, ErrorCode: Byte; //BlockSecStatus,2006-8-14
  BlockAdr: Byte;
  BlockCount: Byte;
  BlockData: array[0..320] of Char;
  BlockSecStatus: array[0..64] of char; //2006-8-14
  BlockSize: Byte;
  i: Integer;
  s: string;
  s_BlockSecStatus: string;
  BlockNumsize: longint;
  BlockNum2, BlockSize2: longint;
  j1, j2: integer;
  BlockNumdata_s: string;
  aListItem2: TListItem;
  Blocklength: byte;
begin
    //  // 检查起始块号 与结束块号的合理性
  if (ComboBox_BlockAdr.ItemIndex > ComboBox_BlockEndAdr.ItemIndex)
    then
  begin
//    Application.MessageBox('数据块号选择错误', '信息提示', MB_ICONINFORMATION);
      Application.MessageBox('数据块号选择错误', '信息提示', MB_ICONINFORMATION);
    exit;
  end;
    //清除上次的列表内容
  Form_Mbdata.ListView_MBlockData.Items.Clear; //清除上次的列表内容

  BlockSize := Edit_BlockData.MaxLength div 2; //Edit_BlockData.MaxLength div 2 ;代表块字节
      //  //数据块的大小
      //2006-8-14修改的数据块大小 ，使得直接的填入标签的信息即可读写
       //----------------
  State := GetState(BlockSize, ComboBox_Edit_BlockStyle.Text, False); //ComboBox_Edit_BlockStyle2006-8-4 v2.32
  BlockNum := ComboBox_BlockAdr.ItemIndex; // 起始块号  BlockNum
  BlockCount := ComboBox_BlockEndAdr.ItemIndex + 1 - (ComboBox_BlockAdr.ItemIndex + 1) + 1; //读取块数

  fCmdRet := ReadMultipleBlock(fComAdr, State, fOperUID, BlockNum, BlockCount, BlockSecStatus, BlockData, errorCode,frmcomportindex);
  AddCmdLog('ReadMultipleBlock', TAction(Sender).Caption, fCmdRet, errorCode);
  if fCmdRet = 0 then
  begin
    for i := 0 to BlockCount - 1 do
      s_BlockSecStatus := s_BlockSecStatus + IntToHEx(ord(BlockSecStatus[i]), 2); //+' '

    BlockNum2 := ComboBox_BlockEndAdr.ItemIndex + 1 - (ComboBox_BlockAdr.ItemIndex + 1) + 1;
    BlockSize2 := BlockSize;
    BlockNumsize := BlockNum2 * BlockSize2; //+(BlockNum2-1) 2006-8-14

        // BlockNumsize :=  BlockNum *4+(BlockNum-1) ;
    for i := 0 to BlockNumsize - 1 do
      s := s + IntToHex(ord(BlockData[i]), 2);
      //整理数据S使一行一行的显示
     //==========================
    for j1 := 1 to BlockCount do //2006-8-14
    begin
      BlockNumdata_s := s_BlockSecStatus[(j1 - 1) * 2 + 1];
      BlockNumdata_s := BlockNumdata_s + s_BlockSecStatus[(j1 - 1) * 2 + 1 + 1] + '  ';
      for j2 := 1 to BlockSize * 2 do // for j2 := 1 to 8 do   //BlockSize*2 2006-10-20修改
        BlockNumdata_s := BlockNumdata_s + s[j2 + (j1 - 1) * BlockSize * 2]; //BlockNumdata_s:=BlockNumdata_s +s[j2+(j1-1)*8];

      FrmMBlocKData.Memo_MBlockData.Lines.Add('BLOCK ' + inttoStr(BlockNum) + ': ' + BlockNumdata_s);
      aListItem2 := Form_Mbdata.ListView_MBlockData.Items.Add;
      aListItem2.Caption := inttostr(BlockNum);

      aListItem2.SubItems.Add(BlockNumdata_s);
      BlockNum := BlockNum + 1;
    end;
     //=============================
    Form_Mbdata.Show;
  end;

end;
//==================================================

procedure TfrmHFReaderDemoMain.Action_WriteSingleBlockExecute(
  Sender: TObject);
var
  State, BlockNum, BlockSecStatus, ErrorCode: Byte;
  BlockData: array[0..8] of Char;
  BlockSize: Byte;
   //i : Integer;
  s: string;
  BlockLength: byte;
begin
  BlockSize := Edit_BlockData.MaxLength div 2; //代表块字节
    //数据块的大小
     //2006-8-14修改的数据块大小 ，使得直接的填入标签的信息即可读写
  State := GetState(BlockSize, ComboBox_Edit_BlockStyle.Text, true); //ComboBox_Edit_BlockStyle2006-8-4 v2.32
  BlockNum := ComboBox_BlockNum.ItemIndex; //块号
  s := Trim(Edit_BlockData.text);
  if Length(s) <> Edit_BlockData.MaxLength then
  begin
//    Application.MessageBox('请输入相应字节个数的数据', '信息提示', MB_ICONINFORMATION);
    Application.MessageBox('请输入相应字节个数的数据', '信息提示', MB_ICONINFORMATION);
    Exit;
  end;
  getBinStr(BlockData, s);
  fCmdRet := WriteSingleBlock(fComAdr, State, fOperUID, BlockNum, BlockData, errorCode,frmcomportindex);
  AddCmdLog('WriteSingleBlock', TAction(Sender).Caption, fCmdRet, errorCode);
end;

function TfrmHFReaderDemoMain.checkHexStr(s: string): boolean; //判断是不是十六进制函数
var
  i: Integer;
begin
  result := False;
  for i := 1 to Length(s) do
  begin
    case s[i] of
      '0'..'9', 'a'..'f', 'A'..'F': Continue;
    else
      exit;
    end;
  end;
  result := true;
end;

procedure TfrmHFReaderDemoMain.Action_GetSystemInformationUpdate(
  Sender: TObject);
var
  UIDValid: Boolean;
begin
  if RadioButton_Address.Checked then
  begin
    UIDValid := Length(ComboBox_UID.Text) = 16; //16个字节的UID
    TAction(Sender).Enabled := Self.ComIsOpen and UIDValid; //要判断当前是否有选定模式
  end else if RadioButton_Select.Checked then
  begin
    TAction(Sender).Enabled := Self.ComIsOpen; //要判断当前是否有选定模式
  end else
  begin
    TAction(Sender).Enabled := False;
  end;
  if ComboBox_UID.Items[ComboBox_UID.ItemIndex] = '' then
    begin
     // StatusBar1.Panels[3].Text := '';
     // StatusBar1.Panels[4].Text := '';
    //  StatusBar1.Panels[2].Text := '';
      StatusBar1.Panels[5].Text := '';
    end;
end;

procedure TfrmHFReaderDemoMain.Action_ResetToReadyUpdate(Sender: TObject);
var
  UIDValid: Boolean;
begin
  UIDValid := Length(ComboBox_UID.Text) = 16; //16个字节的UID
  if RadioButton_Address.Checked then //支持Address模式
    TAction(Sender).Enabled := Self.ComIsOpen and UIDValid //要判断当前是否有选定模式
  else if RadioButton_Non_Address.Checked then //支持Non_Address模式
    TAction(Sender).Enabled := Self.ComIsOpen //要判断当前是否有选定模式
  else //支持Address模式
    TAction(Sender).Enabled := False;
end;

procedure TfrmHFReaderDemoMain.RadioButton_SelectClick(Sender: TObject);
begin
  ComboBox_UID.Enabled := RadioButton_Address.Checked;
end;

procedure TfrmHFReaderDemoMain.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabSheet_CMD)
    or (PageControl1.ActivePage = TabSheet_ScanMode)
    or (PageControl1.ActivePage = TabSheet_CustomCmd)
    or (PageControl1.ActivePage = TabSheet1)
    or (PageControl1.ActivePage = TabSheet2)
    or (PageControl1.ActivePage = TabSheet_TransparentCMD) then //指令模式，及其他模式 要关闭“测试模式”
  begin
    Timer_Test_.Enabled := False;
    Lun_number:=0;
    ListView_UID.Items.Clear; // 2006-8-2修改切换叶面 清除LISTVIEW-UID 列表
  end; //or(PageControl1.ActivePage = TabSheet_ScanMode)
  if (PageControl1.ActivePage <> TabSheet_ScanMode) then //关闭扫描模式的数据显示
  begin
    Timer_ScanMode.Enabled := False;
    Memo1.Text := '';
  end;
  if (PageControl1.ActivePage = TabSheet_ScanMode) and Self.ComIsOpen then
  begin
    Action_GetScanModeStatusExecute(Sender);
    Action_GetUserDefineBlocklengthExecute(Sender);
  end;
   if (PageControl1.ActivePage = TabSheet1) and Self.ComIsOpen then
  begin
     Button58.Enabled:=True;
     BT_add.Enabled:=True;
     BT_sort.Enabled:=True;
     BT_ReadPwrByValue.Enabled:=True;
     Label_Alarm.Visible:=True;
     Label_Alarm.Font.Color:=clMenu;
     Button64.Enabled:=True;
   //  Button56.Enabled:=True;
   //  Button59.Enabled:=True;
     ListBox1.Items.Clear;
     Button60.Enabled:=True;
     Button61.Enabled:=True;
     Button62.Enabled:=True;
     Button63.Enabled:=True;
     RB10.Enabled:=True;
     RB9.Enabled:=True;
     RB8.Enabled:=True;
     RB7.Enabled:=True;
     RB6.Enabled:=True;
     RB5.Enabled:=True;
     RB4.Enabled:=True;
     RB3.Enabled:=True;
     RB2.Enabled:=True;
     RB1.Enabled:=True;
     RB0.Enabled:=True;
     Button65.Enabled:=True;
     Button66.Enabled:=True;
     Button67.Enabled:=True;
     Button68.Enabled:=True;
     Button69.Enabled:=True;
     Button70.Enabled:=True;
     Button71.Enabled:=True;
     Button72.Enabled:=True;
     Button73.Enabled:=True;
     Button74.Enabled:=True;
     Button75.Enabled:=True;
  end;
end;

procedure TfrmHFReaderDemoMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Timer_Test_.Enabled then
  begin
    Timer_Test_.Enabled := False;
    CanClose := True;
    fAppClosed := true;
  end;
end;

procedure TfrmHFReaderDemoMain.Edit_NewComAdrKeyPress(Sender: TObject; //地址键盘输入判断是不是符合十六进制
  var Key: Char);
var
  s: string;
  keyValue: Byte;
begin
  keyValue := Ord(key);
   //SHowMessage(IntToStr(keyValue));
  if keyValue <> 8 then //删除键
  begin
    s := key;
    if not checkHexStr(s) then
    begin
      key := char($00);
      beep();
    end;
  end;
end;

function TfrmHFReaderDemoMain.GetState(BlockStyle: string): Byte;
begin
  if Pos('A', BlockStyle) >= 1 then //A类型
  begin
    if RadioButton_Address.Checked then result := $00
    else result := $01;
  end else //B类型
  begin
    if RadioButton_Address.Checked then result := $08
    else result := $09;
  end;
end;

procedure TfrmHFReaderDemoMain.ActionSetGeneralOutputExecute(
  Sender: TObject);
var
  _Output: Byte;
begin
  _Output := 0;
  if ComboBox_Output0.ItemIndex = 1 then _Output := _Output + 1;
  if ComboBox_Output1.ItemIndex = 1 then _Output := _Output + 2;

  fCmdRet := SetGeneralOutput(fComAdr, _Output,frmcomportindex);
  AddCmdLog('SetGeneralOutput', TAction(Sender).Hint, fCmdRet);
end;

procedure TfrmHFReaderDemoMain.ActionSetRelayExecute(Sender: TObject);
var
  _Relay: Byte;
begin
  _Relay := 0;
  if ComboBox_Relay0.ItemIndex = 1 then _Relay := _Relay + 1;

  fCmdRet := SetRelay(fComAdr, _Relay,frmcomportindex);
  AddCmdLog('SetRelay', TAction(Sender).Hint, fCmdRet);
end;

procedure TfrmHFReaderDemoMain.ActionGetGeneralInputExecute(Sender: TObject);
var
  _Input: Byte;
begin
  fCmdRet := GetGeneralInput(fComAdr, _Input,frmcomportindex);
  AddCmdLog('GetGeneralInput', TAction(Sender).Hint, fCmdRet);

  if fCmdRet = 0 then
  begin
    if (_Input and $01) = $01 then //最低位为1
      Edit_Input0_State.Text := '高电平'
    else
      Edit_Input0_State.Text := '低电平';
  end;
end;

procedure TfrmHFReaderDemoMain.Action_WriteAFIUpdate(Sender: TObject);
var
  UIDValid: Boolean;
  VersionEnabled: Boolean;
begin
  VersionEnabled := getVersionEnabled();

  if RadioButton_Address.Checked then
  begin
    UIDValid := Length(ComboBox_UID.Text) = 16; //16个字节的UID
    TAction(Sender).Enabled := Self.ComIsOpen and UIDValid
      and VersionEnabled
      and (Edit_Type.text <> 'HF203AGD')
      and (Edit_Type.text <> 'HF003AGD'); //要判断当前是否有选定模式
  end else if RadioButton_Select.Checked then
  begin
    TAction(Sender).Enabled := Self.ComIsOpen and VersionEnabled
      and (Edit_Type.text <> 'HF203AGD')
      and (Edit_Type.text <> 'HF003AGD'); //要判断当前是否有选定模式
  end else
  begin
    TAction(Sender).Enabled := False;
  end;
end;


function TfrmHFReaderDemoMain.getVersionEnabled: Boolean;
var
  NewVersionEnabled: boolean;
begin
  NewVersionEnabled := false;
   {if Edit_Version.Text>='03.10' then
      result := true
   else
     // result := Pos('A',Edit_BlockStyle.Text)>=1;   //03.10的版本仅支持A类 //ComboBox_Edit_BlockStyle
      result := Pos('A',ComboBox_Edit_BlockStyle.Text)>=1;   //03.10的版本仅支持A类//ComboBox_Edit_BlockStyle
       }//2006-10-28  修改，添加新版本的使用权限设置
  NewVersionEnabled := (Edit_Type.text = 'HF003A')
    or (Edit_Type.text = 'HF201')
    or (Edit_Type.text = 'HF203A')
    or (Edit_Type.text = 'HF036CF')
    or (Edit_Type.text = 'HF036')
    or (Edit_Type.text = 'HF038')
    or (Edit_Type.text = 'HF036SC')
    or (Edit_Type.text = 'HF291')
    or (Edit_Type.text = 'HF091D')
    or (Edit_Type.text = 'HF091F')
    or (Edit_Type.text = 'HF037')
    or (Edit_Type.text = 'HF037SC')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF201D')
    or (Edit_Type.text = 'HF002AD')
    or (Edit_Type.text = 'HF202AD')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF093A')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF293A')
    or (Edit_Type.text = 'HF203AGD')
    or (Edit_Type.text = 'HF003AD')
    or (Edit_Type.text = 'HF203AD')
    or (Edit_Type.text = 'HF291D')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

  or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF003AGD')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC');
  if ((Edit_Version.text >= '03.10')) or NewVersionEnabled then
    result := true
  else
     // result := Pos('A',Edit_BlockStyle.Text)>=1;   //03.10的版本仅支持A类 //ComboBox_Edit_BlockStyle
    result := Pos('A', ComboBox_Edit_BlockStyle.Text) >= 1; //03.10的版本仅支持A类//ComboBox_Edit_BlockStyle
end;

procedure TfrmHFReaderDemoMain.ActionSetGeneralOutputUpdate(Sender: TObject);
begin

  TAction(Sender).Enabled := Self.ComIsOpen
    and (((Edit_Version.Text >= '03.10')
    and ((Edit_Type.text = 'HF001') or (Edit_Type.text = 'HF001D') or (Edit_Type.text = 'HF001T') or (Edit_Type.text = 'HF001TSC')))
    or (Edit_Type.text = 'HF003A')
    or (Edit_Type.text = 'HF203A')
    or (Edit_Type.text = 'HF201')
    or (Edit_Type.text = 'HF291')
    or (Edit_Type.text = 'HF091D')
    or (Edit_Type.text = 'HF091F')
    or (Edit_Type.text = 'HF002AD')
    or (Edit_Type.text = 'HF201D')
    or (Edit_Type.text = 'HF202AD')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF093A')
    or (Edit_Type.text = 'HF291F')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF293A')
    or (Edit_Type.text = 'HF003AD')
    or (Edit_Type.text = 'HF203AD')
    or (Edit_Type.text = 'HF291D')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF036')
    or (Edit_Type.text = 'HF036SC')
    or (Edit_Type.text = 'HF036CF')
    or (Edit_Type.text = 'HF037')
    or (Edit_Type.text = 'HF038')
    or (Edit_Type.text = 'HF037SC')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC'));
  ComboBox_Output1.Enabled := TAction(Sender).Enabled;
  ComboBox_Output0.Enabled := TAction(Sender).Enabled;
  Edit_Input0_State.Enabled := TAction(Sender).Enabled;
  ComboBox_Relay0.Enabled := TAction(Sender).Enabled;

end;


procedure TfrmHFReaderDemoMain.Action_Inventory_06Update(Sender: TObject);
begin
   //TAction(Sender).Enabled := Self.ComIsOpen and (Edit_Type.text = 'HF001')    //2006622修改使在HF001lite时使新的查询和继续查询起作用
  TAction(Sender).Enabled := Self.ComIsOpen and ((Edit_Type.text = 'HF001')
    or (Edit_Type.text = 'HF001D')
    or (Edit_Type.text = 'HF001Lite')
    or (Edit_Type.text = 'HF038')
    or (Edit_Type.text = 'HF003A')
    or (Edit_Type.text = 'HF201')
    or (Edit_Type.text = 'HF203A')
    or (Edit_Type.text = 'HF201Lite')
    or (Edit_Type.text = 'HF291')
    or (Edit_Type.text = 'HF091D')
    or (Edit_Type.text = 'HF091F')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF201D')
    or (Edit_Type.text = 'HF002AD')
    or (Edit_Type.text = 'HF202AD')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF093A')
    or (Edit_Type.text = 'HF291F')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF293A')
    or (Edit_Type.text = 'HF203AGD')
    or (Edit_Type.text = 'HF003AD')
    or (Edit_Type.text = 'HF203AD')
    or (Edit_Type.text = 'HF291D')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF003AGD')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //or(Edit_Type.text = 'HF037')

end;
//-----------------2006-8-3

procedure TfrmHFReaderDemoMain.Action_ReadMultipleBlockUpdate(
  Sender: TObject);
var
  CardEnabled2: Boolean;
begin
  CardEnabled2 := Self.ComIsOpen and (ComboBox_BlockAdr.ItemIndex >= 0)
    and (ComboBox_BlockEndAdr.ItemIndex >= 0) and
    (RadioButton_Address.Checked or RadioButton_Select.Checked);

  Action_ReadMultipleBlock.Enabled := CardEnabled2;

end;
//-----------2006-8-3

procedure TfrmHFReaderDemoMain.ComboBox_BlockAdrChange(Sender: TObject);
var

  BlockAdr: integer;
  Blocknum: integer;
  MAXBlockNum: integer;
begin
  BlockAdr := ComboBox_BlockAdr.ItemIndex;
  MAXBlockNum := ComboBox_BlockAdr.Items.Count;
  Blocknum := MAXBlockNum - BlockAdr;
end;
 //-----------2006-8-3

procedure TfrmHFReaderDemoMain.ComboBox_MAXBlockNumChange(Sender: TObject);
var
  i: integer;

begin

  GetOperUID(False);
     //--要修改的标签块号的列表，当标签支持读取标签信息命令时 自动显示标签的块号 2006-8-12
    //-- 但当标签不支持读取标签信息时，填写最大块号后 将显示标签块号  ？？？
  ComboBox_BlockNum.Items.Clear;
  ComboBox_BlockNum.Text := '';

  ComboBox_BlockAdr.Items.Clear;
  ComboBox_BlockAdr.Text := '';
  ComboBox_BlockEndAdr.Items.Clear;
  ComboBox_BlockEndAdr.Text := '';

  Edit_R_BlockData.Text := '';
  Edit_BlockData.Text := '';
  //--------- 2006-8-15

  ComboBox_BlockNum.Items.Clear; //2006-8-14
  ComboBox_BlockAdr.Items.Clear;
  ComboBox_BlockEndAdr.Items.Clear; //2006-8-14

  for i := 0 to ComboBox_MAXBlockNum.ItemIndex do
  begin
    ComboBox_BlockNum.Items.Add(inttostr(i));
    ComboBox_BlockAdr.Items.Add(inttostr(i));
    ComboBox_BlockEndAdr.Items.Add(inttostr(i));
  end;
    ////2006-8-14 修改 是为在不执行获得标签信息的时候也能读写标签
    //
 //----------------------2006-8-12
end;
 //----------2006-8-4

procedure TfrmHFReaderDemoMain.ComboBox_Edit_BlockStyleNumChange(
  Sender: TObject);
var
  i: integer;
begin
     // --------2006-8-15
  ComboBox_BlockNum.Items.Clear;
  ComboBox_BlockNum.Text := '';

  ComboBox_BlockAdr.Items.Clear;
  ComboBox_BlockAdr.Text := '';
  ComboBox_BlockEndAdr.Items.Clear;
  ComboBox_BlockEndAdr.Text := '';

  Edit_R_BlockData.Text := '';
  Edit_BlockData.Text := '';
  if ComboBox_MAXBlockNum.ItemIndex > 0 then
  begin
    for i := 0 to ComboBox_MAXBlockNum.ItemIndex do
    begin
      ComboBox_BlockNum.Items.Add(inttostr(i));
      ComboBox_BlockAdr.Items.Add(inttostr(i));
      ComboBox_BlockEndAdr.Items.Add(inttostr(i));
    end;
  end;
  //------------2006-8-15
  Edit_BlockData.MaxLength := (ComboBox_Edit_BlockStyleNum.ItemIndex * 4 + 4) * 2; //BlockSize*2 /2006-8-14 修改 是为是在不执行获得标签信息的时候也能读写标签
  GetOperUID(False); //2006-8-12
  //SetUIDINfo;
end;
 //-----------2006-8-15
 //类型更新 时 清空

procedure TfrmHFReaderDemoMain.ComboBox_Edit_BlockStyleChange(
  Sender: TObject);
var
  i: integer;
begin
  ComboBox_BlockNum.Items.Clear;
  ComboBox_BlockNum.Text := '';

  ComboBox_BlockAdr.Items.Clear;
  ComboBox_BlockAdr.Text := '';
  ComboBox_BlockEndAdr.Items.Clear;
  ComboBox_BlockEndAdr.Text := '';

  Edit_R_BlockData.Text := '';
  Edit_BlockData.Text := '';
  if ComboBox_MAXBlockNum.ItemIndex > 0 then
  begin
    for i := 0 to ComboBox_MAXBlockNum.ItemIndex do
    begin
      ComboBox_BlockNum.Items.Add(inttostr(i));
      ComboBox_BlockAdr.Items.Add(inttostr(i));
      ComboBox_BlockEndAdr.Items.Add(inttostr(i));
    end;
  end;
end;
//========================================2006-10-26
//设置有效天线

procedure TfrmHFReaderDemoMain.Action_SetActiveANTExecute(Sender: TObject);
var
  _ANT_Status: Byte;
  fReadType: Byte;
begin
  if RadioButton_ActiveANTNum1.Checked then _ANT_Status := $01;
  if RadioButton_ActiveANTNum2.Checked then _ANT_Status := $02;
  if RadioButton_ActiveANTNum3.Checked then _ANT_Status := $04;
  if RadioButton_ActiveANTNum4.Checked then _ANT_Status := $08;
  fCmdRet := SetActiveANT(fComAdr, _ANT_Status,frmcomportindex);
  AddCmdLog('SetActiveANT', TAction(Sender).Hint, fCmdRet);
end;
//===================================2006-10-26

procedure TfrmHFReaderDemoMain.Action_GetANTStatusExecute(Sender: TObject);
var
  Get_ANT_Status: Byte;
  fReadType: Byte;
begin
  fCmdRet := GetANTStatus(fComAdr, Get_ANT_Status,frmcomportindex);
  AddCmdLog('GetANTStatus', TAction(Sender).Hint, fCmdRet);
  if fCmdRet = 0 then
  begin
    if (Get_ANT_Status and $01) = $01 then Edit_ANTStatus.Text := '天线1'; //01
    if (Get_ANT_Status and $02) = $02 then Edit_ANTStatus.Text := '天线2'; //02
    if (Get_ANT_Status and $04) = $04 then Edit_ANTStatus.Text := '天线3'; //04
    if (Get_ANT_Status and $08) = $08 then Edit_ANTStatus.Text := '天线4'; //08
  end;
end;
//===================================2006-10-26

procedure TfrmHFReaderDemoMain.Action_GetANTStatusUpdate(Sender: TObject);
var
  RadioButton_ActiveANTNum34: boolean;
begin
  TAction(Sender).Enabled := Self.ComIsOpen and ((Edit_Type.text = 'HF003A')
    or (Edit_Type.text = 'HF203A')
    or (Edit_Type.text = 'HF002AD')
    or (Edit_Type.text = 'HF202AD')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF093A')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF293A')
    or (Edit_Type.text = 'HF203AGD')
    or (Edit_Type.text = 'HF003AD')
    or (Edit_Type.text = 'HF203AD')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF003AGD'));


  RadioGroup_ActiveANTNum.Enabled := Self.ComIsOpen and ((Edit_Type.text = 'HF003A')
    or (Edit_Type.text = 'HF203A')
    or (Edit_Type.text = 'HF002AD')
    or (Edit_Type.text = 'HF202AD')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF093A')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF293A')
    or (Edit_Type.text = 'HF203AGD')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF003AD')
    or (Edit_Type.text = 'HF203AD')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF003AGD'));

  RadioButton_ActiveANTNum34 := (Edit_Type.text = 'HF002AD') //Self.ComIsOpen and
    or (Edit_Type.text = 'HF202AD')
    or (Edit_Type.text = 'HF292A')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF092A')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF002T');

  RadioButton_ActiveANTNum1.Enabled := Self.ComIsOpen
    and RadioGroup_ActiveANTNum.Enabled;

  RadioButton_ActiveANTNum2.Enabled := Self.ComIsOpen
    and RadioGroup_ActiveANTNum.Enabled;

  RadioButton_ActiveANTNum3.Enabled := Self.ComIsOpen
    and RadioGroup_ActiveANTNum.Enabled
    and (not RadioButton_ActiveANTNum34);

  RadioButton_ActiveANTNum4.Enabled := Self.ComIsOpen
    and RadioGroup_ActiveANTNum.Enabled
    and (not RadioButton_ActiveANTNum34);
end;



procedure TfrmHFReaderDemoMain.Action_SetBlockLengthExecute(Sender: TObject);
var
  _Block_len: Byte;
  cmd: byte;
begin
  IssetUserBlocklength := true;

  if ComboBox_SetBlockLength.ItemIndex = 0 then _Block_len := $01;
  if ComboBox_SetBlockLength.ItemIndex = 1 then _Block_len := $02;
  if ComboBox_SetBlockLength.ItemIndex = 2 then _Block_len := $03;
  if ComboBox_SetBlockLength.ItemIndex = 3 then _Block_len := $04;
  if ComboBox_SetBlockLength.ItemIndex = 4 then _Block_len := $05;
  if ComboBox_SetBlockLength.ItemIndex = 5 then _Block_len := $06;
  if ComboBox_SetBlockLength.ItemIndex = 6 then _Block_len := $07;
  if ComboBox_SetBlockLength.ItemIndex = 7 then _Block_len := $08;

  UserBlocklength := _Block_len;
  Edit_BlockData2.MaxLength := UserBlocklength * 2;

  fCmdRet := SetUserDefinedBlockLength(fComAdr, _Block_len,frmcomportindex);
  AddCmdLog('SetBlockLength', TAction(Sender).Hint, fCmdRet);
end;
  //=========================================2006-11-25

procedure TfrmHFReaderDemoMain.Action_SetScanModeCMDExecute(Sender: TObject);
var
  _Scan_mode_Data: array[0..10] of Char;

  Reader_Mode_bit0: integer;
  Reader_Mode_bit1: integer;
  Reader_Mode_bit2: integer;
  Reader_Mode_bit3: integer;
  Reader_Mode_bit4: integer;
  Reader_Mode_bit5: integer;
  Reader_Mode_bit6: integer;
  Reader_Mode_bit7: integer;
  
  Reader_bit0: integer;
  Reader_bit1: integer;
  Reader_bit2: integer;
  Reader_bit3: integer;
  Reader_bit4: integer;
  Reader_bit5: integer;
  Reader_bit6: integer;
  Reader_bit7: integer;

  Reader_Mode: byte;
  Reader_Mode_Status: byte;
  First_Block_Number: byte;
  Number_of_Block: byte;
  First_Byte: byte;
  Number_of_Byte: byte;
  Sep_Char: byte;
  Sep_User: byte;
  End_Char: byte;
  End_User: byte;

  byte11: byte; //RFu

  s: string;
  ErrorCode: Byte;
  x: string;
  cmd: byte;
begin
  if ScanmodeCMD = 1 then Reader_bit0 := 1;
  if ScanmodeCMD = 0 then Reader_bit0 := 0;

  if RadioGroup1.ItemIndex=0 then Reader_bit1 := 0;
  if RadioGroup1.ItemIndex=1 then Reader_bit1 := 1;

  if RadioGroup2.ItemIndex=0 then Reader_bit2 := 0;
  if RadioGroup2.ItemIndex=1 then Reader_bit2 := 1;

  if RadioGroup3.ItemIndex=0 then Reader_bit3 := 0;
  if RadioGroup3.ItemIndex=1 then Reader_bit3 := 1;

  if RadioGroup4.ItemIndex=0 then Reader_bit4 := 0;
  if RadioGroup4.ItemIndex=1 then Reader_bit4 := 1;

  if RadioGroup5.ItemIndex=0 then Reader_bit5 := 0;
  if RadioGroup5.ItemIndex=1 then Reader_bit5 := 1;

  if RadioGroup6.ItemIndex=0 then Reader_bit6 := 0;
  if RadioGroup6.ItemIndex=1 then Reader_bit6 := 1;

  if RadioGroup7.ItemIndex=0 then Reader_bit7 := 0;
  if RadioGroup7.ItemIndex=1 then Reader_bit7 := 1;

  if RadioGroup_Reader_Mode_bit0.ItemIndex = 0 then Reader_Mode_bit0 := 1;
  if RadioGroup_Reader_Mode_bit0.ItemIndex = 1 then Reader_Mode_bit0 := 0;

  if RadioGroup_Reader_Mode_bit1.ItemIndex = 0 then Reader_Mode_bit1 := 1;
  if RadioGroup_Reader_Mode_bit1.ItemIndex = 1 then Reader_Mode_bit1 := 0;

  if RadioGroup_Reader_Mode_bit2.ItemIndex = 0 then Reader_Mode_bit2 := 1;
  if RadioGroup_Reader_Mode_bit2.ItemIndex = 1 then Reader_Mode_bit2 := 0;

  if RadioGroup_Reader_Mode_bit3.ItemIndex = 0 then Reader_Mode_bit3 := 1;
  if RadioGroup_Reader_Mode_bit3.ItemIndex = 1 then Reader_Mode_bit3 := 0;

  if RadioGroup_Reader_Mode_bit401.ItemIndex = 0 then Reader_Mode_bit4 := 1;
  if RadioGroup_Reader_Mode_bit401.ItemIndex = 1 then Reader_Mode_bit4 := 0;


  if RadioGroup_Reader_Mode_bit5.ItemIndex = 0 then Reader_Mode_bit5 := 1;
  if RadioGroup_Reader_Mode_bit5.ItemIndex = 1 then Reader_Mode_bit5 := 0;

  if RadioGroup_Reader_Mode_bit6.ItemIndex = 0 then Reader_Mode_bit6 := 1;
  if RadioGroup_Reader_Mode_bit6.ItemIndex = 1 then Reader_Mode_bit6 := 0;

  if RadioGroup_Reader_Mode_bit7.ItemIndex = 0 then Reader_Mode_bit7 := 1;
  if RadioGroup_Reader_Mode_bit7.ItemIndex = 1 then Reader_Mode_bit7 := 0;

//Reader_Mode_bit0 :=ScanmodeCMD;//设置进入扫描模式 /或退出扫描模式
// Reader_Mode字节
//  Reader_Mode:=mooddd
 // Reader_Mode := ScanmodeCMD; //设置进入扫描模式 /或退出扫描模式
 Reader_Mode:= Reader_bit0 * 1 +
    Reader_bit1 * 2 +
    Reader_bit2 * 4 +
    Reader_bit3 * 8 +
    Reader_bit4 * 16 +
    Reader_bit5 * 32 +
    Reader_bit6 * 64 +
    Reader_bit7 * 128;

  Reader_Mode_Status := Reader_Mode_bit0 * 1 +
    Reader_Mode_bit1 * 2 +
    Reader_Mode_bit2 * 4 +
    Reader_Mode_bit3 * 8 +
    Reader_Mode_bit4 * 16 +
    Reader_Mode_bit5 * 32 +
    Reader_Mode_bit6 * 64 +
    Reader_Mode_bit7 * 128;

 //first_Block_Number:byte起始块
  First_Block_Number := ComboBox_FirstBlockNum.ItemIndex;
// Number_of_Block:byte块数
  Number_of_Block := ComboBox_NumBlock.ItemIndex;
// First_Byte:byte起始字节
  First_Byte := ComboBox_FirstByte.ItemIndex;
 ///Number_of_Byte:byte字节数
  Number_of_Byte := ComboBox_NumByte.ItemIndex;
 // Sep_User:byte 自定义的间隔符
  if CheckBox_SepUserbit71.Checked then
  begin
    Sep_Char := $80;
    x := Edit_SepUser.Text;
   //Sep_User := ord(x[1]);     //输入间隔符的ASCII码
    Sep_User := strtoint('$' + Edit_SepUser.Text); //输入间隔符的十六进制码
  end
  else
  begin
       //Sep_Char:byte间隔符
    case ComboBox_SepChar.ItemIndex of
      0: Sep_Char := $00;
      1: Sep_Char := $01;
      2: Sep_Char := $02;
      3: Sep_Char := $04;
      4: Sep_Char := $08;
      5: Sep_Char := $10;
      6: Sep_Char := $20;
    else
    end;
    Sep_User := $0;
  end;

// End_User:byte//自定义结束符
  if CheckBox_SepUserbit70.Checked then
  begin
    End_Char := $80;
    x := Edit_EndUser.Text;
     //Sep_User := ord(x[1]);     //输入结束符的ASCII码
    End_User := strtoint('$' + Edit_EndUser.Text); //输入结束符的十六进制码
  end
  else
  begin
      //End_Char:byte结束符
    case ComboBox_EndChar.ItemIndex of
      0: End_Char := $00;
      1: End_Char := $01;
      2: End_Char := $02;
      3: End_Char := $04;
      4: End_Char := $08;
      5: End_Char := $10;
      6: End_Char := $20;
    else
    end;
    End_User := $0;
  end;

  byte11 := $0;
//---------------------------------------
  s := inttohex(Reader_Mode, 2) +
    inttohex(Reader_Mode_Status, 2) +
    inttohex(First_Block_Number, 2) +
    inttohex(Number_of_Block, 2) +
    inttohex(First_Byte, 2) +
    inttohex(Number_of_Byte, 2) +
    inttohex(Sep_Char, 2) +
    inttohex(Sep_User, 2) +
    inttohex(End_Char, 2) +
    inttohex(End_User, 2) +
    inttohex(byte11, 2); // inttohex(byte10,2)+
  getBinStr(_Scan_Mode_Data, s);

  fCmdRet := SetScanMode(fComAdr, _Scan_Mode_Data,frmcomportindex);

  if fCmdRet = 0 then
  begin
    SendScanModeoperation := true;
    AddCmdLog('SetScanMode', TAction(Sender).Caption, fCmdRet);
  end
  else
  begin
    SendScanModeoperation := false;
          //Application.MessageBox('错误','信息提示',MB_ICONINFORMATION);
    AddCmdLog('SetScanMode', TAction(Sender).Caption, fCmdRet, 0);
  end;
end;
//==================================================================2006-11-25

procedure TfrmHFReaderDemoMain.Action_CloseSetScanModeExecute(
  Sender: TObject);
begin
// Timer_ScanMode.Enabled:=false;
  ScanmodeCMD := 0;
  Action_SetScanModeCMDExecute(Sender);

end;

procedure TfrmHFReaderDemoMain.Action_SetScanModeExecute(Sender: TObject);
begin
  Timer_ScanMode.Enabled := false;
  ScanmodeCMD := 1;
  Action_SetScanModeCMDExecute(Sender);
  if SendScanModeoperation then
  begin
    Timer_ScanMode.Enabled := true; //2006-12-12  打开扫描模式SCANMODE
    ISon_ScanMode := true;
      if(RadioGroup4.ItemIndex=0)then
      begin
        Button_startscan.Enabled:=False;
        Button_stopscan.Enabled:=False;
      end
      else
      begin
        Button_startscan.Enabled:=True;
        Button_stopscan.Enabled:=True;
      end;
  end
  else
  begin
    Timer_ScanMode.Enabled := false;
    ISon_ScanMode := false;
  end;
end;
//============================================================2006-11-25

procedure TfrmHFReaderDemoMain.Action_ReadScanModeDataExecute(
  Sender: TObject);
var
  i: integer;
  ErrorCode: Byte;
  NoDatacode: Byte;
  ReadData: array[0..40960] of char;
  ReaddataLength: longint;
  s: string;
  listltemstring: TlistItem;
  ReadDatatime: TdateTime;
  logReadTimestring: string;
  s2, s_Result: string;
begin
  isonReadDataExecute := true;
  ReadDatatime := Now;

  logReadTimestring := formatdatetime('hh:mm:ss:zzz', ReadDatatime);
  fCmdRet := ReadScanModeData(ReadData, ReaddataLength,frmcomportindex);
   //AddCmdLog ('ReadScanModeData',TAction(Sender).Caption,fCmdRet);

  if fCmdRet = 0 then //处理读取的数据 有数据时显示数据   NoDatacode=$0
  begin
     //根据设置的数据间隔符及结束符处理数据并显示出来
    if(RadioGroup_Reader_Mode_bit401.ItemIndex=0)then
    begin
      if(RadioButton5.Checked)then
      begin
           for i := 0 to ReaddataLength - 1 do
           begin
           if I = 0 then
              s := IntToHex(Ord(ReadData[i]),2)
           else
              s := s +' '+ IntToHex(Ord(ReadData[i]), 2);
           end;
      end
      else
      begin
         for i := 0 to ReaddataLength - 1 do
         s := s +char(ReadData[i]);
      end;
    end
    else
    begin
      if(RadioButton5.Checked)then
      begin
         for i := 0 to ReaddataLength - 1 do
           begin
           if I = 0 then
              s := IntToHex(Ord(ReadData[i]),2)
           else
              s := s +' '+ IntToHex(Ord(ReadData[i]), 2);
           end;
      end
      else
      begin
        for i := 0 to ReaddataLength - 1 do
         s := s +char(ReadData[i]);
      //   s := s + ReadData[i];
      end;
    end;
      Memo1.Text := Memo1.Text + s;
     Memo1.Lines.Add('');
      s := '';
  end;
  if fCmdRet = 1 then //处理读取的数据 无数据时显示无数据
  begin
    Memo1.Text := Memo1.Text + logReadTimestring + #13#10;
    Memo1.Text := Memo1.Text + 'No New Data';
    Memo1.Lines.Add('');

  end;
  isonReadDataExecute := false;
 
end;
{ function HexStrToStr(const S:string):string;
//16进制字符串转换成字符串
var
  t:Integer;
  ts:string;
  M,Code:Integer;
begin
  t:=1;
  Result:='';
  while t<=Length(S) do
  begin
    while not (S[t] in ['0'..'9','A'..'F','a'..'f']) do
      inc(t);
    if (t+1>Length(S))or(not (S[t+1] in ['0'..'9','A'..'F','a'..'f'])) then
      ts:='$'+S[t]
    else
      ts:='$'+S[t]+S[t+1];
    Val(ts,M,Code);
    if Code=0 then
      Result:=Result+Chr(M);
    inc(t,2);
  end;
end;
}
//===========================================================2006-11-25

procedure TfrmHFReaderDemoMain.Timer_ScanModeTimer(Sender: TObject);
var
  i: integer;

begin
  if isonReadDataExecute then exit;
  Action_ReadScanModeDataExecute(Sender);
end;
//============================================================2006-12-6

procedure TfrmHFReaderDemoMain.Action_OpenScanModeDataShowExecute(Sender: TObject);
var
  i: integer;
begin
   //Action_SetScanModeExecute(Sender);
  Timer_ScanMode.Enabled := false;
  Timer_ScanMode.Enabled := true;
    
end;
//============================================================2006-12-6

procedure TfrmHFReaderDemoMain.Action_CloseScanModeExecute(Sender: TObject);
begin
  Timer_ScanMode.Enabled := false;
  Action_CloseSetScanModeExecute(Sender);
  ISon_ScanMode := false;
    Button_startscan.Enabled:=False;
    Button_stopscan.Enabled:=False;

end;
//=============================================================2006-12-6

procedure TfrmHFReaderDemoMain.Action_GetUserDefineBlocklengthExecute(
  Sender: TObject);
var
  _Block_len: Byte;
  cmd: byte;
begin

  fcmdRet := GetUserDefinedBlocklength(fComAdr, _Block_len,frmcomportindex);
  AddCmdLog('GetUserDefineBlocklength', TAction(Sender).Hint, fCmdRet);
  if fcmdRet = 0 then
  begin
    Edit_UserDefineBlocklength.Text := '0X' + inttohex(_Block_len, 2); //
    UserBlocklength := _Block_len; //
    Edit_BlockData2.MaxLength := UserBlocklength * 2;
    Edit_UserDefineBlocklengthshow.Text := ' 0X' + inttohex(UserBlocklength, 2) + '  ';
  end;
end;
//============================================================2006-12-8

procedure TfrmHFReaderDemoMain.Action_GetScanModeStatusExecute(
  Sender: TObject);
var
  _Scan_Mode: array[0..10] of char;
  ErrorCode: byte;
  s: string;
  i: integer;
  cmd: byte;
begin
  Timer_ScanMode.Enabled := false; //先关闭扫描显示

  fcmdRet := GetScanModeStatus(fComAdr, _Scan_Mode,frmcomportindex);
  AddCmdLog('GetScanModeStatus', TAction(Sender).Caption, fCmdRet);
  if fcmdRet = 0 then
  begin
    for i := 0 to 10 do
      s := s + IntToHex(ord(_Scan_Mode[i]), 2) + ' ';
      // Edit_ScanModeState.Text:= s;

    if(ord(_Scan_Mode[0]) and $01) = $01 then
    begin
    Label25.Caption := '处于扫描模式状态';

    end;
    if(ord(_Scan_Mode[0]) and $01) = $00 then
    begin
      Label25.Caption := '处于非扫描模式状态';

    end;
    if(ord(_Scan_Mode[0]) and $02) = $00 then
    RadioGroup1.ItemIndex:=0
    else
    RadioGroup1.ItemIndex:=1;

    if(ord(_Scan_Mode[0]) and $04) = $00 then
    RadioGroup2.ItemIndex:=0
    else
    RadioGroup2.ItemIndex:=1;

    if(ord(_Scan_Mode[0]) and $08) = $00 then
    RadioGroup3.ItemIndex:=0
    else
    RadioGroup3.ItemIndex:=1;

    if(ord(_Scan_Mode[0]) and $10) = $00 then
    RadioGroup4.ItemIndex:=0
    else
    RadioGroup4.ItemIndex:=1;

    if(ord(_Scan_Mode[0]) and $01) = $01 then
    begin
     if(RadioGroup4.ItemIndex=0)then
     begin
       Button_startscan.Enabled:=False;
       Button_stopscan.Enabled:=False;
     end;
    end;
    if(ord(_Scan_Mode[0]) and $01) = $00 then
    begin
      if(RadioGroup4.ItemIndex=1)then
     begin
       Button_startscan.Enabled:=True;
       Button_stopscan.Enabled:=True;
     end;
    end;
    if(ord(_Scan_Mode[0]) and $20) = $00 then
    RadioGroup5.ItemIndex:=0
    else
    RadioGroup5.ItemIndex:=1;
    if(ord(_Scan_Mode[0]) and $40) = $00 then
    RadioGroup6.ItemIndex:=0
    else
    RadioGroup6.ItemIndex:=1;
    if(ord(_Scan_Mode[0]) and $80) = $00 then
    RadioGroup7.ItemIndex:=0
    else
    RadioGroup7.ItemIndex:=1;
    if (ord(_Scan_Mode[0]) and $FF) = $00 then ISon_ScanMode := false;
    if (ord(_Scan_Mode[0]) and $01) = $01 then
    begin
      ISon_ScanMode := true;
      Timer_ScanMode.Enabled := true; //是扫描打开数据显示
    end;
    if (ord(_Scan_Mode[1]) and $01) = $01 then
      RadioGroup_Reader_Mode_bit0.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit0.ItemIndex := 1;

    if (ord(_Scan_Mode[1]) and $02) = $02 then
      RadioGroup_Reader_Mode_bit1.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit1.ItemIndex := 1;
    if (ord(_Scan_Mode[1]) and $04) = $04 then
      RadioGroup_Reader_Mode_bit2.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit2.ItemIndex := 1;
    if (ord(_Scan_Mode[1]) and $08) = $08 then
      RadioGroup_Reader_Mode_bit3.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit3.ItemIndex := 1;
    if (ord(_Scan_Mode[1]) and $10) = $10 then
      RadioGroup_Reader_Mode_bit401.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit401.ItemIndex := 1;
    if (ord(_Scan_Mode[1]) and $20) = $20 then
      RadioGroup_Reader_Mode_bit5.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit5.ItemIndex := 1;
    if (ord(_Scan_Mode[1]) and $40) = $40 then
      RadioGroup_Reader_Mode_bit6.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit6.ItemIndex := 1;

    if (ord(_Scan_Mode[1]) and $80) = $80 then
      RadioGroup_Reader_Mode_bit7.ItemIndex := 0
    else
      RadioGroup_Reader_Mode_bit7.ItemIndex := 1;

    ComboBox_FirstBlockNum.ItemIndex := ord(_Scan_Mode[2]);
    ComboBox_NumBlock.ItemIndex := ord(_Scan_Mode[3]);
    ComboBox_FirstByte.ItemIndex := ord(_Scan_Mode[4]);
    ComboBox_NumByte.ItemIndex := ord(_Scan_Mode[5]);
    
    if (ord(_Scan_Mode[6]) and $FF) = $00 then
      ComboBox_SepChar.ItemIndex := 0;
    if (ord(_Scan_Mode[6]) and $01) = $01 then
      ComboBox_SepChar.ItemIndex := 1;
    if (ord(_Scan_Mode[6]) and $02) = $02 then
      ComboBox_SepChar.ItemIndex := 2;
    if (ord(_Scan_Mode[6]) and $04) = $04 then
      ComboBox_SepChar.ItemIndex := 3;
    if (ord(_Scan_Mode[6]) and $08) = $08 then
      ComboBox_SepChar.ItemIndex := 4;
    if (ord(_Scan_Mode[6]) and $10) = $10 then
      ComboBox_SepChar.ItemIndex := 5;
    if (ord(_Scan_Mode[6]) and $20) = $20 then
      ComboBox_SepChar.ItemIndex := 6;
    if (ord(_Scan_Mode[6]) and $40) = $40 then
      ComboBox_SepChar.ItemIndex := 7;
    if (ord(_Scan_Mode[6]) and $80) = $80 then
      ComboBox_SepChar.ItemIndex := 8;

     // Edit_SepUser
   //ComboBox_EndChar.ItemIndex := ord(_Scan_Mode[8]);
    if (ord(_Scan_Mode[8]) and $FF) = $00 then
      ComboBox_EndChar.ItemIndex := 0;
    if (ord(_Scan_Mode[8]) and $01) = $01 then
      ComboBox_EndChar.ItemIndex := 1;
    if (ord(_Scan_Mode[8]) and $02) = $02 then
      ComboBox_EndChar.ItemIndex := 2;
    if (ord(_Scan_Mode[8]) and $04) = $04 then
      ComboBox_EndChar.ItemIndex := 3;
    if (ord(_Scan_Mode[8]) and $08) = $08 then
      ComboBox_EndChar.ItemIndex := 4;
    if (ord(_Scan_Mode[8]) and $10) = $10 then
      ComboBox_EndChar.ItemIndex := 5;
    if (ord(_Scan_Mode[8]) and $20) = $20 then
      ComboBox_EndChar.ItemIndex := 6;
    if (ord(_Scan_Mode[8]) and $40) = $40 then
      ComboBox_EndChar.ItemIndex := 7;
    if (ord(_Scan_Mode[8]) and $80) = $80 then
      ComboBox_EndChar.ItemIndex := 8;
   //Edit_EndUser
   //  Timer_ScanMode.Enabled:=true; // 打开扫描显示
  // end;
  end //;
  else
  begin
    ISon_ScanMode := false;
  end;
end;
//================================================================2006-12-8

procedure TfrmHFReaderDemoMain.Action_CloseScanModeDataShowExecute(
  Sender: TObject);
begin
  Timer_ScanMode.Enabled := false;
end;

procedure TfrmHFReaderDemoMain.Action_InitScanModeExecute(Sender: TObject);
var
  s: string;
  _Scan_mode_Data: array[0..10] of Char;
  ErrorCode: byte;
  cmd: byte;
begin
  Timer_ScanMode.Enabled := false;

  s := inttohex($00, 2) +
    inttohex($F2, 2) +
    inttohex($00, 2) +
    inttohex($01, 2) +
    inttohex($01, 2) +
    inttohex($01, 2) +
    inttohex($20, 2) +
    inttohex($00, 2) +
    inttohex($01, 2) +
    inttohex($00, 2) +
    inttohex($00, 2); // inttohex(byte10,2)+
  getBinStr(_Scan_Mode_Data, s);

  fCmdRet := SetScanMode(fComAdr, _Scan_Mode_Data,frmcomportindex);
  AddCmdLog('SetScanMode', TAction(Sender).Caption, fCmdRet, errorCode);
end;

procedure TfrmHFReaderDemoMain.Action_OpenScanModeDataShowUpdate(
  Sender: TObject);
begin
  Action_OpenScanModeDataShow.Enabled := Self.ComIsOpen and (not Timer_ScanMode.Enabled) and (ISon_ScanMode);
  Action_CloseScanModeDataShow.Enabled := Self.ComIsOpen and (Timer_ScanMode.Enabled) and (ISon_ScanMode); ;


end;

procedure TfrmHFReaderDemoMain.Action_SetScanModeUpdate(Sender: TObject);
begin
  Action_SetScanMode.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  Action_CloseScanMode.Enabled := Self.ComIsOpen and (ISon_ScanMode);

  if ISon_ScanMode then Label25.Caption := '处于扫描模式状态';
  if not ISon_ScanMode then Label25.Caption := '处于非扫描模式状态';
  GroupBox_ScanModeOption.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_FirstBlockNum.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_NumBlock.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_FirstByte.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_NumByte.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_SepChar.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_EndChar.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  GroupBox_UserDefinechar.Enabled := Self.ComIsOpen and (not ISon_ScanMode);

  RadioGroup_Reader_Mode_bit0.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=0);
  RadioGroup_Reader_Mode_bit1.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=0);
  RadioGroup_Reader_Mode_bit2.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=0);
 //  RadioGroup_Reader_Mode_bit3.Enabled :=  Self.ComIsOpen and  (not ISon_ScanMode);
  RadioGroup_Reader_Mode_bit401.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=0);
  RadioGroup_Reader_Mode_bit5.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  RadioGroup_Reader_Mode_bit6.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  RadioGroup_Reader_Mode_bit7.Enabled := Self.ComIsOpen and (not ISon_ScanMode);


  RadioGroup7.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=1);
  RadioGroup1.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  RadioGroup2.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=1);
 //  RadioGroup_Reader_Mode_bit3.Enabled :=  Self.ComIsOpen and  (not ISon_ScanMode);
  RadioGroup3.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  RadioGroup4.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  RadioGroup5.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  RadioGroup6.Enabled := Self.ComIsOpen and (not ISon_ScanMode)and(RadioGroup1.ItemIndex=1);
  CheckBox_SepUserbit71.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  CheckBox_SepUserbit70.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  Edit_SepUser.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  Edit_EndUser.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  Edit_UserDefineBlocklength.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  ComboBox_SetBlockLength.Enabled := Self.ComIsOpen and (not ISon_ScanMode);

  if (RadioGroup_Reader_Mode_bit2.ItemIndex = 1)
    then RadioGroup_Reader_Mode_bit3.ItemIndex := 1;
  RadioGroup_Reader_Mode_bit3.Enabled := Self.ComIsOpen
    and (not ISon_ScanMode)
    and (RadioGroup_Reader_Mode_bit2.ItemIndex = 0);
    //////////////// 2007611
end;
//=====================================================================2006-12-18

procedure TfrmHFReaderDemoMain.ComboBox_UID2Change(Sender: TObject);
var
  i: integer;
  s: string;
begin
   //GetOperUID(False);
  try
    s := ComboBox_UID2.text;
    if Length(s) = 16 then
    begin
      for i := 0 to 7 do
        fOperUID[i] := Char(StrToInt('$' + copy(s, i * 2 + 1, 2)));
    end;
  except
       //
  end;
   //ComboBox_Edit_BlockStyleuser ;
  ComboBox_Edit_BlockStyleuser.Items.Clear;
  ComboBox_MAXBlockNumuser.Items.Clear;

  ComboBox_Edit_BlockStyleuser.Text := '';
  ComboBox_MAXBlockNumuser.Text := '';

  ComboBox_BlockNumUser.Items.Clear;
  ComboBox_BlockNumUser.Text := '';
  ComboBox_BlockAdrUser.Items.Clear;
  ComboBox_BlockAdrUser.Text := '';
  ComboBox_BlockEndAdrUser.Items.Clear;
  ComboBox_BlockEndAdrUser.Text := '';
  Edit_R_BlockData2.Text := '';
  Edit_BlockData2.Text := '';


  for i := 0 to 255 do
    ComboBox_MAXBlockNumuser.Items.Add(inttostr(i)); //   最大块号列表0-255
  ComboBox_Edit_BlockStyleuser.Items.Add('A 类型'); // 写操作类型A
  ComboBox_Edit_BlockStyleuser.Items.Add('B 类型'); // 写操作类型B
  if IssetUserBlocklength then
  begin
    Edit_BlockData2.MaxLength := UserBlocklength * 2;
  end
  else
  begin
    UserBlocklength := ComboBox_SetBlockLength.ItemIndex + 1;
    Edit_BlockData2.MaxLength := UserBlocklength * 2;

  end;


end;
//============================================================================2006-12-18

procedure TfrmHFReaderDemoMain.Action_SetBlockLengthUpdate(Sender: TObject);
begin
  Action_SetBlockLength.Enabled := Self.ComIsOpen and (not ISon_ScanMode);
  Action_GetUserDefineBlocklength.Enabled := Self.ComIsOpen and (not ISon_ScanMode);

  if IssetUserBlocklength then
  begin
    Edit_UserDefineBlocklengthshow.Text := ' 0X' + inttohex(UserBlocklength, 2) + '  ';
  end
  else
  begin
     // Edit_UserDefineBlocklengthshow.Text  := ' 0X'+inttohex( UserBlocklength,2)+'  ';
  end;

end;

procedure TfrmHFReaderDemoMain.Action_ReadUserSingleBlockExecute(
  Sender: TObject);
var
  State, BlockNum, Blocklength, BlockSecStatus, ErrorCode: Byte;
  BlockData: array[0..8] of Char;
  i: Integer;
  s: string;
begin

  if RadioButton_Address1.Checked then State := $A0
  else State := $A1;

  BlockNum := ComboBox_BlockNumUser.ItemIndex; //块号
  Blocklength := UserBlocklength; //块长度
  fCmdRet := CustomizedReadSingleBlock(fComAdr, State, fOperUID, BlockNum, BlockData, errorCode,frmcomportindex);
  AddCmdLog('ReadSingleBlock', TAction(Sender).Caption, fCmdRet, errorCode);

  if fCmdRet = 0 then
  begin
    s := IntToHEx(ord(BlockData[0]), 2) + ' ';
    for i := 1 to Blocklength do
      s := s + IntToHex(ord(BlockData[i]), 2);
    Edit_R_BlockData2.Text := s;
  end;

  // end

end;

procedure TfrmHFReaderDemoMain.Action_WriteUserSingleBlockExecute(
  Sender: TObject);
var
  State, BlockNum, BlockSecStatus, ErrorCode: Byte;
  BlockData: array[0..8] of Char;
  BlockSize: Byte;
  s: string;
  BlockLength: byte;
begin
  s := Trim(Edit_BlockData2.text);
  if Length(s) <> Edit_BlockData2.MaxLength then
  begin
//    Application.MessageBox('请输入相应字节个数的数据', '信息提示', MB_ICONINFORMATION);
    Application.MessageBox('请输入相应字节个数的数据', '信息提示', MB_ICONINFORMATION);
    Exit;
  end;
  if Pos('A', ComboBox_Edit_BlockStyleUser.Text) >= 1 then //A类型
  begin
    if RadioButton_Address1.Checked then State := $A0
    else State := $A1;
  end else //B类型
  begin
    if RadioButton_Address1.Checked then State := $A8
    else State := $A9;
  end;

  BlockNum := ComboBox_BlockNumUser.ItemIndex; //块号
  BlockLength := UserBlocklength;

  getBinStr(BlockData, s);
  fCmdRet := CustomizedWriteSingleBlock(fComAdr, State, fOperUID, BlockNum, BlockData, Blocklength, errorCode,frmcomportindex);
  AddCmdLog('WriteSingleBlock', TAction(Sender).Caption, fCmdRet, errorCode);
   // end
end;

procedure TfrmHFReaderDemoMain.Action_ReadUserMultipleBlockExecute(
  Sender: TObject);
var
  State, BlockNum, ErrorCode: Byte; //BlockSecStatus,2006-8-14
  BlockAdr: Byte;
  BlockCount: Byte;
  BlockData: array[0..40960] of Char;
  BlockDatabuffer: array[0..40960] of char;
  BlockSecStatus: array[0..5120] of char; //2006-8-14
  BlockSize: Byte;
  i: Integer;
  s: string;
  s_BlockSecStatus: string;
  BlockNumsize: longint;
  BlockNum2, BlockSize2, BlockSize3: longint;
  j1, j2: integer;
  BlockNumdata_s: string;
  aListItem2: TListItem;
  Blocklength: byte;
begin
      // if  IssetUserBlocklength then    //用户自定义数据块长度--   2006-12-16
    // begin
  if (ComboBox_BlockAdrUser.ItemIndex > ComboBox_BlockEndAdrUser.ItemIndex)
    then begin
//    Application.MessageBox('数据块号选择错误', '信息提示', MB_ICONINFORMATION);
   Application.MessageBox('数据块号选择错误', '信息提示', MB_ICONINFORMATION);
    exit;
  end;

  if RadioButton_Address1.Checked then State := $A0
  else State := $A1;

  BlockNum := ComboBox_BlockAdrUser.ItemIndex; // 起始块号  BlockNum
  BlockCount := ComboBox_BlockEndAdrUser.ItemIndex + 1 - (ComboBox_BlockAdrUser.ItemIndex + 1) + 1; //读取块数
  Blocklength := UserBlocklength; //块长度
  fCmdRet := CustomizedReadMultipleBlock(fComAdr, State, fOperUID, BlockNum, BlockCount, BlockDatabuffer, errorCode,frmcomportindex);

  AddCmdLog('ScanModeReadMultipleBlock', TAction(Sender).Caption, fCmdRet, errorCode);
  if fCmdRet = 0 then
  begin
                    //----------------------------------------------------------
    Form_Mbdata.ListView_MBlockData.Items.Clear; //清除上次的列表内容
    blockSize := BlockLength;
    BlockSize2 := (BlockLength + 1) * BlockCount; //数据总长度 （）

    BlockSize3 := BlockSize2 - BlockCount; // 没有安全字的数据长度

    for i := 0 to BlockCount - 1 do //2006-12-16
      BlockSecStatus[i] := BlockDatabuffer[i * (blockSize + 1)]; //2006-12-16

    for i := 0 to BlockSize3 - 1 do //2006-8-14
      BlockData[i] := BlockDatabuffer[1 + (i div blockSize) * (blockSize + 1) + i mod (blockSize)]; // 2006-8-14  取到读到的块数据

                 //---------------------------------------------------
    for i := 0 to BlockCount - 1 do
      s_BlockSecStatus := s_BlockSecStatus + IntToHEx(ord(BlockSecStatus[i]), 2); //+' ';

    BlockNum2 := ComboBox_BlockEndAdrUser.ItemIndex + 1 - (ComboBox_BlockAdrUser.ItemIndex + 1) + 1;
    BlockSize2 := Blocklength;
    BlockNumsize := BlockNum2 * BlockSize2; //+(BlockNum2-1) 2006-8-14

    for i := 0 to BlockNumsize - 1 do
      s := s + IntToHex(ord(BlockData[i]), 2);
                //Edit_R_BlockData.Text := s;
                //整理数据S使一行一行的显示
              //==========================
    for j1 := 1 to BlockCount do //
    begin
      BlockNumdata_s := s_BlockSecStatus[(j1 - 1) * 2 + 1];
      BlockNumdata_s := BlockNumdata_s + s_BlockSecStatus[(j1 - 1) * 2 + 1 + 1] + '  ';
      for j2 := 1 to BlockSize2 * 2 do //
        BlockNumdata_s := BlockNumdata_s + s[j2 + (j1 - 1) * BlockSize2 * 2]; //BlockNumdata_s:=BlockNumdata_s +s[j2+(j1-1)*8];

      FrmMBlocKData.Memo_MBlockData.Lines.Add('BLOCK ' + inttoStr(BlockNum) + ': ' + BlockNumdata_s);
      aListItem2 := Form_Mbdata.ListView_MBlockData.Items.Add;
      aListItem2.Caption := inttostr(BlockNum);

      aListItem2.SubItems.Add(BlockNumdata_s);
      BlockNum := BlockNum + 1;
    end; //
                //=============================
    Form_Mbdata.Show;
  end;

end;

procedure TfrmHFReaderDemoMain.ComboBox_MAXBlockNumuserChange(
  Sender: TObject);
var
  i: integer;
begin
  ComboBox_BlockNumUser.Items.Clear;
  ComboBox_BlockAdrUser.Items.Clear;
  ComboBox_BlockEndAdrUser.Items.Clear;
  ComboBox_BlockNumUser.Text := '';
  ComboBox_BlockAdrUser.Text := '';
  ComboBox_BlockEndAdrUser.Text := '';

  Edit_R_BlockData2.Text := '';
  Edit_BlockData2.Text := '';

  for i := 0 to ComboBox_MAXBlockNumuser.ItemIndex do
  begin
    ComboBox_BlockNumUser.Items.Add(inttostr(i));
    ComboBox_BlockAdrUser.Items.Add(inttostr(i));
    ComboBox_BlockEndAdrUser.Items.Add(inttostr(i));
  end;

end;

procedure TfrmHFReaderDemoMain.Action_ReadUserSingleBlockUpdate(
  Sender: TObject);
begin
  Action_ReadUserSingleBlock.Enabled := Self.ComIsOpen and (ComboBox_BlockNumUser.ItemIndex >= 0)
    and (not ISon_ScanMode)
    and (Edit_Type.text <> 'HF296A'); //;   //and
  Action_WriteUserSingleBlock.Enabled := Self.ComIsOpen and (ComboBox_BlockNumUser.ItemIndex >= 0)
    and (not ISon_ScanMode)
    and (Edit_Type.text <> 'HF296A'); //;

  Action_ReadUserMultipleBlock.Enabled := Self.ComIsOpen and (ComboBox_BlockAdrUser.ItemIndex >= 0)
    and (ComboBox_BlockEndAdrUser.ItemIndex >= 0)
    and (not ISon_ScanMode)
    and (Edit_Type.text <> 'HF296A');

end;

//===============================================================2006-12-30

procedure TfrmHFReaderDemoMain.Action_SetAccessTimeExecute(Sender: TObject);
var
  AccessTime: Byte;
begin
     // AccessTime :=   $ //???
  AccessTime := ComboBox_AccessTime.ItemIndex;
  fCmdRet := SetAccessTime(fComAdr, AccessTime,frmcomportindex);
  AddCmdLog('SetAccessTime', TAction(Sender).Hint, fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Action_GetAccessTimeExecute(Sender: TObject);
var
  Get_AccessTime: Byte;
begin
   // GetAccessTime:= $0;
  fCmdRet := GetAccessTime(fComAdr, Get_AccessTime,frmcomportindex);
  AddCmdLog('GetAccessTime', TAction(Sender).Hint, fCmdRet);
  if fCmdRet = 0 then
  begin
    Edit_AccessTimeRet.Text := ' ' + inttostr(Get_AccessTime);
  end;
end;

procedure TfrmHFReaderDemoMain.Action_SetReceiveANTExecute(Sender: TObject);
var
  ReceiveANT: byte;
  R1, T1: byte;
begin
     //ReceiveANT???
  if (not CheckBox_TX_ANT.Checked) and (not CheckBox_RX_ANT.Checked) then
  begin
//  Application.MessageBox('请选择主从天线', '信息提示', MB_ICONINFORMATION);
    Application.MessageBox('请选择主从天线', '信息提示', MB_ICONINFORMATION);
    exit;
  end;
  if CheckBox_TX_ANT.Checked then T1 := $02
  else T1 := $00;
  if CheckBox_RX_ANT.Checked then R1 := $01
  else R1 := $00;

  ReceiveANT := (T1 or R1);
  fCmdRet := SetReceiveChannel(fComAdr, ReceiveANT,frmcomportindex);
  AddCmdLog('SetReceiveANT', TAction(Sender).Hint, fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Action_GetReceiveANTStatusExecute(
  Sender: TObject);
var
  ReceiveANTStatus: byte;
begin
  fCmdRet := GetReceiveChannelStatus(fComAdr, ReceiveANTStatus,frmcomportindex);
  AddCmdLog('GetReceiveANTStatus', TAction(Sender).Hint, fCmdRet);
  if fCmdRet = 0 then
  begin
     //???
    if (ReceiveANTStatus and $01) = $01 then Edit_ReceiveANTStatus.Text := 'RX '; //'RX ANT';
    if (ReceiveANTStatus and $02) = $02 then Edit_ReceiveANTStatus.Text := 'TX/RX ';
    if (ReceiveANTStatus and $03) = $03 then Edit_ReceiveANTStatus.Text := 'TX/RX+RX ';

  end;
end;

procedure TfrmHFReaderDemoMain.Action_SetReceiveANTUpdate(Sender: TObject);
var
  i: integer;
  ActionEnable: boolean;
begin
  ActionEnable := (Edit_Type.text = 'HF296') or (Edit_Type.text = 'HF296A');
  Action_SetReceiveANT.Enabled := Self.ComIsOpen and ActionEnable;
  Action_GetReceiveANTStatus.Enabled := Self.ComIsOpen and ActionEnable;
  RadioGroup_ReceiveANT.Enabled := Self.ComIsOpen and ActionEnable;
  CheckBox_RX_ANT.Enabled := Self.ComIsOpen and ActionEnable;
  CheckBox_TX_ANT.Enabled := Self.ComIsOpen and ActionEnable;
end;

procedure TfrmHFReaderDemoMain.Action_SetAccessTimeUpdate(Sender: TObject);
var
  i: integer;
begin
  Action_SetAccessTime.Enabled := Self.ComIsOpen and ((Edit_Type.Text = 'HF091F')
    or (Edit_Type.Text = 'HF291F')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF191T'));


  Action_GetAccessTime.Enabled := Self.ComIsOpen and ((Edit_Type.Text = 'HF091F')
    or (Edit_Type.Text = 'HF291F')
    );
                                                        //or(Edit_Type.text = 'HF091T')
                                                       //or(Edit_Type.text = 'HF291T')

  ComboBox_AccessTime.Enabled := Action_SetAccessTime.Enabled;
  Edit_AccessTimeRet.Enabled := Action_GetAccessTime.Enabled;

end;
 //====================================================================2007-5-22

procedure TfrmHFReaderDemoMain.Action_TransparentReadExecute(
  Sender: TObject);
var
  RspLength, CustomDatalength, RspDataBufferLength: Byte;
  ErrorCode: Byte;
  CustomData: array[0..256] of char;
  FeedbackData: array[0..256] of char;
  FeedbackDataLength: byte;
  i: integer;
  s: string;
begin
  Memo_TransparentReadRspData.text := '';
  s := Trim(Memo_TransparentReadData.text);
  if ((s = '') or (length(s) < 3)) then
  begin
//    Application.MessageBox('请输入正确的数据', '信息提示', MB_ICONINFORMATION);
    Application.MessageBox('请输入正确的数据', '信息提示', MB_ICONINFORMATION);
    Exit;
  end;
  s := HexStrToStr(s); //2007-5-22
  s := strToHexStr(s); //2007-5-22
  RspLength := strtoint('$' + s[1] + s[2]);
  s := copy(s, 3, Length(s) - 2);
  CustomDatalength := (Length(s) div 2);
  getBinStr(CustomData, s);
  fCmdRet := TransparentRead(fComAdr,
    RspLength,
    CustomDatalength,
    CustomData,
    FeedbackDataLength,
    FeedbackData,
    errorCode,frmcomportindex);
  AddCmdLog('TransparentRead', TAction(Sender).Caption, fCmdRet, errorCode);
  if fCmdRet = 0 then
  begin
    s := '';
           //RspDataBufferLength := ord(CustomDataBuffer[1]);
    RspDataBufferLength := FeedbackDataLength;
    if RspDataBufferLength <> 0 then
    begin
      s := IntToHex(ord(FeedbackData[0]), 2);
      for i := 1 to RspDataBufferLength - 1 do //-1
        s := s + ' ' + IntToHex(ord(FeedbackData[i]), 2);

    end;
    Memo_TransparentReadRspData.text := s;
  end;
end;

procedure TfrmHFReaderDemoMain.Action_TransparentWriteExecute(
  Sender: TObject);
var
  RspLength, CustomDatalength, RspDataBufferLength: Byte;
  ErrorCode: Byte;
  option: array[0..4] of char;
  CustomData: array[0..256] of char;
  FeedbackData: array[0..256] of char;
  FeedbackDataLength: byte;
  i: integer;
  s: string;
  s1: string;
begin
  Memo_TransparentWriteRspData.text := '';
  s := Trim(Memo_TransparentWriteData.text);
  if ((s = '') or (length(s) < 12)) then
  begin
//    Application.MessageBox('请输入正确的数据', '信息提示', MB_ICONINFORMATION);
    Application.MessageBox('请输入正确的数据', '信息提示', MB_ICONINFORMATION);
    Exit;
  end;
  s := HexStrToStr(s); //2007-5-22
  s := strToHexStr(s); //2007-5-22
  for i := 0 to 3 do
    (option + i)^ := Char(StrToInt('$' + copy(s, i * 2 + 1, 2)));
         //getBinStr(option,s1);
  RspLength := strtoint('$' + s[9] + s[10]); //Length(s);//RspLength
  s := copy(s, 11, Length(s) - 10);
  getBinStr(CustomData, s);
  CustomDatalength := (Length(s) div 2);

  fCmdRet := TransparentWrite(fComAdr,
    option,
    RspLength,
    CustomDatalength,
    CustomData,
    FeedbackDataLength,
    FeedbackData,
    errorCode,frmcomportindex);
  AddCmdLog('TransparentWrite', TAction(Sender).Caption, fCmdRet, errorCode);
  if fCmdRet = 0 then
  begin
    s := '';
    RspDataBufferLength := FeedbackDataLength;
    if RspDataBufferLength <> 0 then
    begin
      s := IntToHex(ord(FeedbackData[0]), 2);
      for i := 1 to RspDataBufferLength - 1 do
        s := s + ' ' + IntToHex(ord(FeedbackData[i]), 2);
    end;
    Memo_TransparentWriteRspData.text := s;
  end;

end;


procedure TfrmHFReaderDemoMain.Action_TransparentCustomizedCmdExecute(
  Sender: TObject);
var
  RspLength, CustomDatalength, RspDataBufferLength: Byte;
  ErrorCode: Byte;
  RspTime: array[0..2] of char;
  CustomData: array[0..256] of char;
  FeedbackData: array[0..256] of char;
  FeedbackDataLength: byte;
  i: integer;
  s: string;
  s1: string;
begin
  Memo_TransparentCustomizedRspData.text := '';
  s := Trim(Memo_TransparentCustomizedData.text);
  if ((s = '') or (length(s) < 8)) then
  begin
//    Application.MessageBox('请输入正确的数据', '信息提示', MB_ICONINFORMATION);
    Application.MessageBox('请输入正确的数据', '信息提示', MB_ICONINFORMATION);
    Exit;
  end;
  s := HexStrToStr(s); //2007-5-22
  s := strToHexStr(s); //2007-5-22
  s1 := copy(s, 1, 4);
  getBinStr(RspTime, s1);
  RspLength := strtoint('$' + s[5] + s[6]); //Length(s);//RspLength
  s := copy(s, 7, Length(s) - 6);
  getBinStr(CustomData, s);
  CustomDatalength := (Length(s) div 2);

  fCmdRet := TransparentCustomizedCmd(fComAdr,
    RspTime,
    RspLength,
    CustomDatalength,
    CustomData,
    FeedbackDataLength,
    FeedbackData,
    errorCode,frmcomportindex);
  AddCmdLog('TransparentCustomizedCmd', TAction(Sender).Caption, fCmdRet, errorCode);

  if fCmdRet = 0 then
  begin
    s := '';
    RspDataBufferLength := FeedbackDataLength;
    if RspDataBufferLength <> 0 then
    begin
      s := IntToHex(ord(FeedbackData[0]), 2);
      for i := 1 to RspDataBufferLength - 1 do
        s := s + ' ' + IntToHex(ord(FeedbackData[i]), 2);
    end;
    Memo_TransparentCustomizedRspData.text := s;
  end;
end;
/////////////////////////////////////////////////////////////////2007-5-22

function TfrmHFReaderDemoMain.HexStrToStr(const S: string): string;
//16进制字符串转换成字符串
var
  t: Integer;
  ts: string;
  M, Code: Integer;
begin
  t := 1;
  Result := '';
  while t <= Length(S) do
  begin
    while not (S[t] in ['0'..'9', 'A'..'F', 'a'..'f']) do
      inc(t);
    if (t + 1 > Length(S)) or (not (S[t + 1] in ['0'..'9', 'A'..'F', 'a'..'f'])) then
      ts := '$' + S[t]
    else
      ts := '$' + S[t] + S[t + 1];
    Val(ts, M, Code);
    if Code = 0 then
      Result := Result + Chr(M);
    inc(t, 2);
  end;
end;

function TfrmHFReaderDemoMain.StrToHexStr(const S: string): string;
//字符串转换成16进制字符串
var
  I: Integer;
begin
  for I := 1 to Length(S) do
  begin
    if I = 1 then
      Result := IntToHex(Ord(S[1]), 2)
    else Result := Result + IntToHex(Ord(S[I]), 2);
       //else Result:=Result+' '+IntToHex(Ord(S[I]),2);
  end;
end;
 ////////////////////////////////////////////////////////////////////



procedure TfrmHFReaderDemoMain.HelpshowClick(Sender: TObject);
begin
  Form_Helpshow.show;
end;

//=======================================2007-6-17

procedure TfrmHFReaderDemoMain.Action_SetParseModeExecute(Sender: TObject);
var
  _ParseMode: Byte;
  fCmdRet2:Integer;
begin
  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
  if(fCmdRet2=0)then
  begin
  if RadioButton_parsemode1.Checked and Radiobutton_depth1.Checked then
  begin
    _ParseMode := Get_ParseMode and $7F or 01;
    fCmdRet := SetParseMode(fComAdr,_ParseMode, frmcomportindex);
    AddCmdLog('SetParseMode', '设置深度优先模式', fCmdRet);
    if (fCmdRet <> 0) then
    begin
      RadioButton_parsemode1.Checked := false;
      Radiobutton_depth1.Checked := false;
    end;
  end;

  if RadioButton_parsemode1.Checked and Radiobutton_depth2.Checked then
  begin
    _ParseMode :=Get_ParseMode or $81;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    AddCmdLog('SetParseMode', '设置深度优先模式', fCmdRet);
    if (fCmdRet <> 0) then
    begin
      RadioButton_parsemode1.Checked := false;
      Radiobutton_depth2.Checked := false;
    end;
  end;

  if RadioButton_parsemode2.Checked and Radiobutton_depth1.Checked then
  begin
    _ParseMode :=Get_ParseMode and $7E;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    AddCmdLog('SetParseMode', '设置宽度优先模式', fCmdRet);
    if (fCmdRet <> 0) then
    begin
      RadioButton_parsemode2.Checked := false;
      Radiobutton_depth1.Checked := false;
    end;
  end;

  if RadioButton_parsemode2.Checked and Radiobutton_depth2.Checked then
  begin
    _ParseMode :=Get_ParseMode and $FE or $80 ;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
     AddCmdLog('SetParseMode', '设置宽度优先模式', fCmdRet);
    if (fCmdRet <> 0) then
    begin
      RadioButton_parsemode2.Checked := false;
      Radiobutton_depth2.Checked := false;
    end;
  end;
  end;
  // fCmdRet := SetParseMode(fComAdr,_ParseMode) ;
  // AddCmdLog ('SetParseMode','设置解析模式',fCmdRet); //  TAction(Sender).caption
end;

procedure TfrmHFReaderDemoMain.Action_GetParseModeExecute(Sender: TObject);
var
  fCmdRet2: integer;
begin

  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
   //AddCmdLog ('GetParseMode',TAction(Sender).Hint,fCmdRet);
  if fCmdRet2 = 0 then
  begin
   // if ( ReceiveANTStatus  and $01)=$01  then  Edit_ReceiveANTStatus.Text := 'RX ANT';
    if (Get_parseMode and $81 = $01) then
    begin
      RadioButton_parsemode1.Checked := true;
      RadioButton_depth1.checked := true;
    end;
    if (Get_parseMode and $81 = $81) then
    begin
      RadioButton_parsemode1.Checked := true;
      RadioButton_depth2.checked := true;
    end;
    if (Get_parseMode and $81= $00) then
    begin
      RadioButton_parsemode2.Checked := true;
      RadioButton_depth1.checked := true;
    end;
    if (Get_parseMode and $81 = $80) then
    begin
      RadioButton_parsemode2.Checked := true;
      RadioButton_depth2.checked := true;
    end;
     if (Get_parseMode and $20= $20) then
    begin
      RadioButton1.Checked := true;
      RadioButton1.Enabled:=False;
      RadioButton2.Enabled:=True ;
    end;
    if (Get_parseMode and $20= $00) then
    begin
      RadioButton2.Checked := true;
      RadioButton1.Enabled:=True;
      RadioButton2.Enabled:=False;
    end;
     if (Get_parseMode and $08= $08) then
    begin
      RadioButton3.Checked := true;
      RadioButton3.Enabled:=False;
      RadioButton4.Enabled:=True ;
    end;
     if (Get_parseMode and $08= $00) then
    begin
      RadioButton4.Checked := true;
      RadioButton3.Enabled:=True;
      RadioButton4.Enabled:=False;
    end;
  end;

  if fCmdRet2 <> 0 then
  begin
    ReaderNotSupportParseMode := true;
  end
  else
  begin
    ReaderNotSupportParseMode := false;
  end;
end;
//========================================================2007-6-17

procedure TfrmHFReaderDemoMain.Action_SetParseModeUpdate(Sender: TObject);
begin
  RadioButton_parsemode1.Enabled := Self.ComIsOpen and (not ReaderNotSupportParseMode)
    and (not RadioButton_parsemode1.Checked)
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //

  RadioButton_depth1.Enabled := Self.ComIsOpen and (not ReaderNotSupportParseMode)
    and (not RadioButton_depth1.Checked)
    and (Edit_Version.text >= '02.80')
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //


  RadioButton_parsemode2.Enabled := Self.ComIsOpen and (not RadioButton_parsemode2.Checked)
    and (not ReaderNotSupportParseMode)
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //

  RadioButton_depth2.Enabled := Self.ComIsOpen and (not ReaderNotSupportParseMode)
    and (not RadioButton_depth2.Checked)
    and (Edit_Version.text >= '02.80')
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //

end;
 //======================================================2007-6-17


procedure TfrmHFReaderDemoMain.Action_TransparentReadUpdate(Sender: TObject);
begin
//版本号大于6.0 或型号有T的启用透明格式模式
  Action_TransparentRead.Enabled := Self.ComIsOpen and ((Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC'));
  Action_TransparentWrite.Enabled := Self.ComIsOpen and ((Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC'));

  Action_TransparentCustomizedCmd.Enabled := Self.ComIsOpen and ((Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF091T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC'));

end;


procedure TfrmHFReaderDemoMain.Action_SetDepthExecute(Sender: TObject);
var
  _ParseMode: Byte;
  fCmdRet2:Integer;
begin
   fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
   if(fCmdRet2=0)then
   begin
    if RadioButton_parsemode1.Checked and Radiobutton_depth1.Checked then
    begin
      _ParseMode := Get_ParseMode and $7F or 01;;
      fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
      AddCmdLog('SetParseMode', '设置调制度10％', fCmdRet);
      if (fCmdRet <> 0) then
      begin
        RadioButton_parsemode1.Checked := false;
        Radiobutton_depth1.Checked := false;
      end;
    end;

    if RadioButton_parsemode1.Checked and Radiobutton_depth2.Checked then
    begin
      _ParseMode :=Get_ParseMode or $81;
      fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
       AddCmdLog('SetParseMode', '设置调制度100％', fCmdRet);
      if (fCmdRet <> 0) then
      begin
        RadioButton_parsemode1.Checked := false;
        Radiobutton_depth2.Checked := false;
      end;
    end;

    if RadioButton_parsemode2.Checked and Radiobutton_depth1.Checked then
    begin
      _ParseMode :=Get_ParseMode and $7E;
      fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
      AddCmdLog('SetParseMode', '设置调制度10％', fCmdRet);
      if (fCmdRet <> 0) then
      begin
        RadioButton_parsemode2.Checked := false;
        Radiobutton_depth1.Checked := false;
      end;
    end;

    if RadioButton_parsemode2.Checked and Radiobutton_depth2.Checked then
    begin
      _ParseMode :=Get_ParseMode and $FE or $80 ;
      fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
      AddCmdLog('SetParseMode', '设置调制度100％', fCmdRet);
      if (fCmdRet <> 0) then
      begin
        RadioButton_parsemode2.Checked := false;
        Radiobutton_depth2.Checked := false;
      end;
    end;
   end;
  // fCmdRet := SetParseMode(fComAdr,_ParseMode) ;
  // AddCmdLog ('SetParseMode','设置解析模式',fCmdRet); //  TAction(Sender).caption
end;

procedure TfrmHFReaderDemoMain.Action_SetDepthUpdate(Sender: TObject);
begin

  RadioButton_parsemode1.Enabled := Self.ComIsOpen and (not ReaderNotSupportParseMode)
    and (not RadioButton_parsemode1.Checked)
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //

  RadioButton_depth1.Enabled := Self.ComIsOpen and (not ReaderNotSupportParseMode)
    and (not RadioButton_depth1.Checked)
    and (Edit_Version.text >= '02.80')
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //


  RadioButton_parsemode2.Enabled := Self.ComIsOpen and (not RadioButton_parsemode2.Checked)
    and (not ReaderNotSupportParseMode)
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')

    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //

  RadioButton_depth2.Enabled := Self.ComIsOpen and (not ReaderNotSupportParseMode)
    and (not RadioButton_depth2.Checked)
    and (Edit_Version.text >= '02.80')
    and ((Edit_Type.text = 'HF091T')
    or (Edit_Version.text >= '06.00')
    or (Edit_Type.text = 'HF001T')
    or (Edit_Type.text = 'HF002T')
    or (Edit_Type.text = 'HF003T')
    or (Edit_Type.text = 'HF203T')
    or (Edit_Type.text = 'HF201T')
    or (Edit_Type.text = 'HF093T')
    or (Edit_type.text = 'HF293T')
    or (Edit_Type.text = 'HF202T')
    or (Edit_Type.text = 'HF092T')
    or (Edit_Type.text = 'HF291T')
    or (Edit_Type.text = 'HF292T')
    or (Edit_Type.text = 'HF293T')
    or (Edit_Type.text = 'HF296')
    or (Edit_Type.text = 'HF296A')
    or (Edit_Type.text = 'HF001TSC')
    or (Edit_Type.text = 'HF091TSC')); //


end;

procedure TfrmHFReaderDemoMain.ComboBox_AlreadyOpenCOMCloseUp(
  Sender: TObject);
var
  SelectCom:string;
  port :byte;
begin
  if ComboBox_AlreadyOpenCOM.items.count <>0 then
    begin
      SelectCom := copy(ComboBox_AlreadyOpenCOM.Items[ComboBox_AlreadyOpenCOM.ItemIndex],4,1);
      port := strtoint(SelectCom);
      CloseSpecComPort(port);
      fComAdr := $FF;
      if opencomport(port,fComAdr,fBaud,frmcomportindex) <> 0 then
          begin
//            Application.MessageBox('Serial Communication Error', '信息提示',MB_ICONINFORMATION);
            Application.MessageBox('串口通讯错误', '信息提示',MB_ICONINFORMATION);
            exit;
          end;
      fOpenComIndex := frmcomportindex;
      ClearLastInfo;
      RefreshStatus;
      Action_GetReaderInformationExecute(Action_GetReaderInformation); //自动执行读取写卡器信息
    end;
end;

procedure TfrmHFReaderDemoMain.ClearLastInfo;
var
  i:Integer;
begin
    ListBox_GroupBox_InventoryList.Clear;
    ComboBox_AlreadyOpenCOM.Repaint;
    RefreshStatus;
    Edit_Type.Text := '';
    Edit_Version.Text := '';
    Edit_TrType.text := '';
    Edit_ComAdr.Text := '';
    Edit_InventoryTime.Text := '';
    ComboBox_UID.Items.clear;
    Edit_SystemInfo.Text := '';
    Memo_SystemInfo2.text := '';
    Edit_R_BlockData.Text := '';
    Edit_BlockData.text := '';
    ListBox_GroupBox_InventoryList.Items.Clear;
    Edit_Input0_State.Text :='';
    fInventory_DSFID_UID_List := '';
      //-------------2006-8-3
    ComboBox_BlockAdr.Items.Clear;
    ComboBox_BlockNum.Items.Clear;
    ComboBox_MAXBlockNum.Items.Clear;
    ComboBox_MAXBlockNum.Text := '';

      //---------------------2006-8-3
    ComboBox_Edit_BlockStyle.Items.Clear;
    ComboBox_Edit_BlockStyleNum.Items.Clear;
    ComboBox_Edit_BlockStyle.Text := '';
    ComboBox_Edit_BlockStyleNum.Text := '';
      //-----2006-8-4
    ComboBox_BlockEndAdr.Items.Clear;
    ComboBox_BlockEndAdr.Text := '';
      //------2006-8-4 ComboBox_MAXBlockNum  //ComboBox_Edit_BlockStyleNum
    TabSheet_TestMode.TabVisible := true; //恢复9036关闭的测试模式
    TabSheet_ScanMode.tabVisible := true;
    TabSheet_CustomCmd.tabVisible := true;
    TabSheet_TransparentCMD.tabVisible := true;
    TabSheet_CMD.tabVisible := true;
    PageControl1.TabIndex := 0;
    Edit_ANTStatus.Text := '';
    Edit_ReceiveANTStatus.Text := '';
    ListBox1.Items.Clear;
         Button58.Enabled:=False;
     BT_add.Enabled:=False;
     BT_sort.Enabled:=False;

     BT_ReadPwrByValue.Enabled:=False;
     Button64.Enabled:=False;
     Button56.Enabled:=False;
     Button59.Enabled:=False;
     Button60.Enabled:=False;
     Button61.Enabled:=False;
     Button62.Enabled:=False;
     Button63.Enabled:=False;
     Button65.Enabled:=False;
     Button66.Enabled:=False;
     Button67.Enabled:=False;
     Button68.Enabled:=False;
     Button69.Enabled:=False;
     Button70.Enabled:=False;
     Button71.Enabled:=False;
     Button72.Enabled:=False;
     Button73.Enabled:=False;
     Button74.Enabled:=False;
     Button75.Enabled:=False;
     RB10.Enabled:=False;
     RB9.Enabled:=False;
     RB8.Enabled:=False;
     RB7.Enabled:=False;
     RB6.Enabled:=False;
     RB5.Enabled:=False;
     RB4.Enabled:=False;
     RB3.Enabled:=False;
     RB2.Enabled:=False;
     RB1.Enabled:=False;
     RB0.Enabled:=False;
     f10Pwr:=0;
    f9Pwr:=0;
    f8Pwr:=0;
    f7Pwr:=0;
    f6Pwr:=0;
    f5Pwr:=0;
    f4Pwr:=0;
    f3Pwr:=0;
    f2Pwr:=0;
    f1Pwr:=0;
    f0Pwr:=0;
      Edit10_CP.Text:='0';
  Edit10_PW.Text:='0';
  Edit9_CP.Text:='0';
  Edit9_PW.Text:='0';
  Edit8_CP.Text:='0';
  Edit8_PW.Text:='0';
  Edit7_CP.Text:='0';
  Edit7_PW.Text:='0';
  Edit6_CP.Text:='0';
  Edit6_PW.Text:='0';
  Edit5_CP.Text:='0';
  Edit5_PW.Text:='0';
  Edit4_CP.Text:='0';
  Edit4_PW.Text:='0';
  Edit3_CP.Text:='0';
  Edit3_PW.Text:='0';
  Edit2_CP.Text:='0';
  Edit2_PW.Text:='0';
  Edit1_CP.Text:='0';
  Edit1_PW.Text:='0';
   Edit0_CP.Text:='0';
  Edit0_PW.Text:='0';
   for i:=0 to 39 do
    begin
      SP_PwrA[i].fPwrByVA:=0;
      SP_PwrA[i].fCalibA:=0;
    end;
end;

procedure TfrmHFReaderDemoMain.Button43Click(Sender: TObject);
var
  _ParseMode: Byte;
  fCmdRet2:Integer;
begin
  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
  if(RadioButton3.Checked)then
  begin
     Get_ParseMode:=Get_ParseMode or $08;
     case ComboBox1.ItemIndex of
      0: _ParseMode:= Get_ParseMode and $F9 ;
      1: _ParseMode:=Get_ParseMode and $FB or $02 ;
      2: _ParseMode:=Get_ParseMode and $FD or $04 ;
      3: _ParseMode:= Get_ParseMode or $06;
     end;
  end
  else
  _ParseMode:=Get_ParseMode;
  if(fCmdRet2=0)then
  begin
    fCmdRet := SetParseMode(fComAdr,_ParseMode, frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton_parsemode1.Checked := false;
      Radiobutton_depth1.Checked := false;
    end;
  end;
  AddCmdLog('SetParseMode', '设置波特率', fCmdRet);
end;

{procedure TfrmHFReaderDemoMain.RadioButton4Click(Sender: TObject);
var
   _ParseMode :Byte;
   fCmdRet2:Integer;
begin
   fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
   if(fCmdRet2=0)then
   begin
  if(RadioButton4.Checked)then
  begin
    RadioButton3.Enabled:=True;
    RadioButton4.Enabled:=False;
    _ParseMode := Get_ParseMode or $00;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton4.Checked := false;
      RadioButton4.Enabled := True ;
    end;
  end;
  end;
     AddCmdLog('Enabled Baud Setting', 'Enabled Baud Setting ', fCmdRet);
end;  }

{procedure TfrmHFReaderDemoMain.RadioButton3Click(Sender: TObject);
var
   _ParseMode :Byte;
   fCmdRet2:Integer;
begin
    fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
    if(fCmdRet2=0)then
 begin
   if(RadioButton3.Checked)then
  begin
    RadioButton3.Enabled:=False;
    RadioButton4.Enabled:=True;
    _ParseMode := Get_ParseMode or $08;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton3.Checked := false;
      RadioButton3.Enabled := True ;
    end;
  end;
  end;
  AddCmdLog('Enabled Baud Setting', 'Enabled Baud Setting ', fCmdRet);
end; }

procedure TfrmHFReaderDemoMain.RadioButton2Click(Sender: TObject);
var
   _ParseMode :Byte;
   fCmdRet2:Integer;
begin
  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
  if(fCmdRet2=0)then
  begin
  if(RadioButton2.Checked)then
  begin
    RadioButton1.Enabled:=True;
    RadioButton2.Enabled:=False;
    _ParseMode :=Get_ParseMode and $DF;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton2.Checked := false;
      RadioButton2.Enabled := True ;
    end;
  end;
  end;
  AddCmdLog('Set Inventory Acceleration', '禁止加速功能 ', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.RadioButton1Click(Sender: TObject);
var
   _ParseMode :Byte;
   fCmdRet2:Integer;
begin
  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
  if(fCmdRet2=0)then
  begin
  if(RadioButton1.Checked)then
  begin
    RadioButton1.Enabled:=False;
    RadioButton2.Enabled:=True;
     _ParseMode := Get_ParseMode or$20;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton1.Checked := false;
      RadioButton1.Enabled := True ;
    end;
  end;
  end;
  AddCmdLog('Set Inventory Acceleration', '启动加速功能 ', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.ComboBox_COMChange(Sender: TObject);
begin
ComboBox_baud.Items.Clear;
if(ComboBox_COM.ItemIndex=0)then
begin
  ComboBox_baud.Items.Add('19200bps');
  ComboBox_baud.Items.Add('38400bps');
  ComboBox_baud.Items.Add('57600bps');
  ComboBox_baud.Items.Add('115200bps');
  ComboBox_baud.ItemIndex:=3;
end
else
begin
  ComboBox_baud.Items.Add('Auto');
  ComboBox_baud.ItemIndex:=0;
end;
end;


procedure TfrmHFReaderDemoMain.RadioButton3Click(Sender: TObject);
var
   _ParseMode :Byte;
   fCmdRet2:Integer;
begin
  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
  if(fCmdRet2=0)then
  begin
  if(RadioButton3.Checked)then
  begin
    RadioButton3.Enabled:=False;
    RadioButton4.Enabled:=True;
     _ParseMode := Get_ParseMode or $08;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton1.Checked := false;
      RadioButton1.Enabled := True ;
    end;
  end;
  end;
  AddCmdLog('Setting Effective', '使设置有效', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.RadioButton4Click(Sender: TObject);
var
   _ParseMode :Byte;
   fCmdRet2:Integer;
begin
  fCmdRet2 := GetParseMode(fComAdr, Get_ParseMode,frmcomportindex);
  if(fCmdRet2=0)then
  begin
  if(RadioButton4.Checked)then
  begin
    RadioButton4.Enabled:=False;
    RadioButton3.Enabled:=True;
     _ParseMode := Get_ParseMode and $F7;
    fCmdRet := SetParseMode(fComAdr, _ParseMode,frmcomportindex);
    if (fCmdRet <> 0) then
    begin
      RadioButton1.Checked := false;
      RadioButton1.Enabled := True ;
    end;
  end;
  end;
  AddCmdLog('Setting Effective', '使设置无效 ', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button58Click(Sender: TObject);
var
   _Pwr,_PwrVal,_VRMS: Byte;
begin
  _PwrVal:=99;
  fCmdRet:=SetPwrByValue(fComAdr,_PwrVal,frmcomportindex);
  Edit10_PW.Text:=IntToStr(_PwrVal);
  ComboBox2.ItemIndex:=_PwrVal;
 { if(fCmdRet=0) then
  begin
  fCmdRet:=GetPwr(fComAdr, _Pwr,_PwrVal,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Edit10_PW.Text:=IntToStr(_PwrVal);
  ComboBox2.ItemIndex:=_PwrVal;
  end;
   AddCmdLog('SetPwrByValue', '读取功率值', fCmdRet);
  end;
  if(fCmdRet=0) then
  begin
  fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
   ComboBox3.ItemIndex:=_VRMS;
  AddCmdLog('SetPwrByValue', '读取幅度测量值', fCmdRet);
  end;  }
  AddCmdLog('SetPwrByValue', '最大', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.BT_addClick(Sender: TObject);
var
  _DirStep,_Pwr,_PwrVal,_VRMS: Byte;
begin
if(Edit1.Text='')then
Exit;
 _DirStep:=StrToInt(Edit1.Text);
 ComboBox2.ItemIndex := ComboBox2.ItemIndex + _DirStep ;
{ if((ComboBox2.ItemIndex+_DirStep) < 100)  then
  begin
      ComboBox2.ItemIndex := ComboBox2.ItemIndex + _DirStep;
  end
 else
 begin
  _DirStep:= 0;
  ComboBox2.ItemIndex:=99;
 end;}
 _DirStep:=_DirStep and $7F;
  fCmdRet:=AdjustPwr(fComAdr, _DirStep,frmcomportindex) ;
{  if(fCmdRet=0) then
  begin
    if(fCmdRet=0) then
    begin
    fCmdRet:=GetPwr(fComAdr, _Pwr,_PwrVal,frmcomportindex) ;
    Edit_PwrbyValue.Text:=IntToStr(_PwrVal);
    ComboBox2.ItemIndex:=_PwrVal;
    end;
      AddCmdLog('SetPwrByValue', '读取功率', fCmdRet);
  end;
  if(fCmdRet=0) then
  begin
  fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
   ComboBox3.ItemIndex:=_VRMS;
     AddCmdLog('SetPwrByValue', '获取幅度测量值', fCmdRet);
  end; }
    AddCmdLog('AdjustPwr', '上调功率级数', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.BT_sortClick(Sender: TObject);
var
  _DirStep,_Pwr,_PwrVal,_VRMS: Byte;
begin
  if(Edit1.Text='')then
Exit;
 _DirStep:=StrToInt(Edit1.Text);
 if((ComboBox2.ItemIndex-_DirStep) <0)  then
  ComboBox2.ItemIndex:=0
 else
 ComboBox2.ItemIndex := ComboBox2.ItemIndex - _DirStep ;
 {if((ComboBox2.ItemIndex-_DirStep) >=0)  then
  begin
      ComboBox2.ItemIndex := ComboBox2.ItemIndex - _DirStep;
  end
 else
 begin
   _DirStep:= ComboBox2.ItemIndex;
   ComboBox2.ItemIndex:=0;
 end;  }
 _DirStep:=_DirStep or $80;
  fCmdRet:=AdjustPwr(fComAdr, _DirStep,frmcomportindex) ;
{  if(fCmdRet=0) then
  begin
  fCmdRet:=GetPwr(fComAdr, _Pwr,_PwrVal,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Edit_PwrbyValue.Text:=IntToStr(_PwrVal);
  ComboBox2.ItemIndex:=_PwrVal;
  end;
    AddCmdLog('SetPwrByValue', '读取功率', fCmdRet);
  end;
  if(fCmdRet=0) then
  begin
  fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
   ComboBox3.ItemIndex:=_VRMS;
    AddCmdLog('SetPwrByValue', '获取幅度测量值', fCmdRet);
  end; }
  AddCmdLog('AdjustPwr', '下调功率级数', fCmdRet);
end;


procedure TfrmHFReaderDemoMain.Button53Click(Sender: TObject);
begin
ListBox1.Items.Clear;
if(Self.ComIsOpen)then
begin
  RB10.Enabled:=True;
  RB9.Enabled:=True;
  RB8.Enabled:=True;
  RB7.Enabled:=True;
  RB6.Enabled:=True;
  RB5.Enabled:=True;
  RB4.Enabled:=True;
  RB3.Enabled:=True;
  RB2.Enabled:=True;
  RB1.Enabled:=True;
  RB0.Enabled:=True;
  Button65.Enabled:=True;
 Button66.Enabled:=True;
 Button67.Enabled:=True;
 Button68.Enabled:=True;
 Button69.Enabled:=True;
 Button70.Enabled:=True;
 Button71.Enabled:=True;
 Button72.Enabled:=True;
 Button73.Enabled:=True;
 Button74.Enabled:=True;
 Button75.Enabled:=True;
end;
end;

procedure TfrmHFReaderDemoMain.Button51Click(Sender: TObject);
var
  i:Integer;
begin
  Edit10_CP.Text:='0';
  Edit10_PW.Text:='0';
  Edit9_CP.Text:='0';
  Edit9_PW.Text:='0';
  Edit8_CP.Text:='0';
  Edit8_PW.Text:='0';
  Edit7_CP.Text:='0';
  Edit7_PW.Text:='0';
  Edit6_CP.Text:='0';
  Edit6_PW.Text:='0';
  Edit5_CP.Text:='0';
  Edit5_PW.Text:='0';
  Edit4_CP.Text:='0';
  Edit4_PW.Text:='0';
  Edit3_CP.Text:='0';
  Edit3_PW.Text:='0';
  Edit2_CP.Text:='0';
  Edit2_PW.Text:='0';
  Edit1_CP.Text:='0';
  Edit1_PW.Text:='0';
   Edit0_CP.Text:='0';
  Edit0_PW.Text:='0';
 for i:=0 to 39 do
  begin
    SP_PwrA[i].fPwrByVA:=0;
    SP_PwrA[i].fCalibA:=0;
  end;
end;

procedure TfrmHFReaderDemoMain.Button64Click(Sender: TObject);
var
_VRMS: Byte;
begin
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
   ComboBox3.ItemIndex:=_VRMS;
 AddCmdLog('SetPwrByValue', '读取幅度测量值', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.BT_ReadPwrByValueClick(Sender: TObject);
var
  _DirStep,_Pwr,_PwrVal,_VRMS: Byte;
begin
  fCmdRet:=GetPwr(fComAdr, _Pwr,_PwrVal,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
    Edit_PwrbyValue.Text:=IntToStr(_PwrVal);
   // ComboBox2.ItemIndex:=_PwrVal;
    if(_Pwr and $80)=0then
    begin
      Edit6.Text:=IntToStr(_Pwr and $7F);
    end
    else
      Edit6.Text:=IntToStr(_Pwr and $7F)+'+128';
  end;
  AddCmdLog('GetPwr', '读取输出功率', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button56Click(Sender: TObject);
var
  i:Integer;
begin
  ListBox1.Items.Clear;
  Button59.Enabled:=True;
  Button55.Enabled:=False;
  f10Pwr:=StrToInt(Edit10_PW.Text);
  f9Pwr:=StrToInt(Edit9_PW.Text);
  f8Pwr:=StrToInt(Edit8_PW.Text);
  f7Pwr:=StrToInt(Edit7_PW.Text);
  f6Pwr:=StrToInt(Edit6_PW.Text);
  f5Pwr:=StrToInt(Edit5_PW.Text);
  f4Pwr:=StrToInt(Edit4_PW.Text);
  f3Pwr:=StrToInt(Edit3_PW.Text);
  f2Pwr:=StrToInt(Edit2_PW.Text);
  f1Pwr:=StrToInt(Edit1_PW.Text);
  f0Pwr:=StrToInt(Edit0_PW.Text);
   // ListBox1.Items.Add(Format('%-3d',[10])+'   '+Format('%-3d',[10])+'     '+Format('%-3d',[20])+'    '+'X');
    if(f10Pwr>f9Pwr)and(f9Pwr>f8Pwr)and(f8Pwr>f7Pwr)and (f7Pwr>f6Pwr)and(f6Pwr>f5Pwr)and (f5Pwr>f4Pwr)and(f4Pwr>f3Pwr)and (f3Pwr>f2Pwr)and(f2Pwr>f1Pwr)and(f1Pwr>f0Pwr)then
    begin
      if(RB10.Enabled=False)and(RB9.Enabled=False)and(RB8.Enabled=False)and (RB7.Enabled=False)and(RB6.Enabled=False)and(RB5.Enabled=False)and(RB4.Enabled=False)and(RB3.Enabled=False)and(RB2.Enabled=False)and(RB1.Enabled=False)and(RB0.Enabled=False)then
      begin
        for i:=1 to 3 do
        begin
          SP_PwrA[i+35].fPwrByVA:=Trunc(SP_PwrA[35].fPwrByVA+(SP_PwrA[39].fPwrByVA-SP_PwrA[35].fPwrByVA)/4*i);
          SP_PwrA[i+35].fCalibA:=Trunc(SP_PwrA[35].fCalibA+(SP_PwrA[39].fCalibA-SP_PwrA[35].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
        for i:=1 to 3 do
        begin
          SP_PwrA[i+31].fPwrByVA:=Trunc(SP_PwrA[31].fPwrByVA+(SP_PwrA[35].fPwrByVA-SP_PwrA[31].fPwrByVA)/4*i);
          SP_PwrA[i+31].fCalibA:=Trunc(SP_PwrA[31].fCalibA+(SP_PwrA[35].fCalibA-SP_PwrA[31].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
        for i:=1 to 3 do
        begin
          SP_PwrA[i+27].fPwrByVA:=Trunc(SP_PwrA[27].fPwrByVA+(SP_PwrA[31].fPwrByVA-SP_PwrA[27].fPwrByVA)/4*i);
          SP_PwrA[i+27].fCalibA:=Trunc(SP_PwrA[27].fCalibA+(SP_PwrA[31].fCalibA-SP_PwrA[27].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
        for i:=1 to 3 do
        begin
          SP_PwrA[i+23].fPwrByVA:=Trunc(SP_PwrA[23].fPwrByVA+(SP_PwrA[27].fPwrByVA-SP_PwrA[23].fPwrByVA)/4*i);
          SP_PwrA[i+23].fCalibA:=Trunc(SP_PwrA[23].fCalibA+(SP_PwrA[27].fCalibA-SP_PwrA[23].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
        for i:=1 to 3 do
        begin
          SP_PwrA[i+19].fPwrByVA:=Trunc(SP_PwrA[19].fPwrByVA+(SP_PwrA[23].fPwrByVA-SP_PwrA[19].fPwrByVA)/4*i);
          SP_PwrA[i+19].fCalibA:=Trunc(SP_PwrA[19].fCalibA+(SP_PwrA[23].fCalibA-SP_PwrA[19].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
        for i:=1 to 3 do
        begin
          SP_PwrA[i+15].fPwrByVA:=Trunc(SP_PwrA[15].fPwrByVA+(SP_PwrA[19].fPwrByVA-SP_PwrA[15].fPwrByVA)/4*i);
          SP_PwrA[i+15].fCalibA:=Trunc(SP_PwrA[15].fCalibA+(SP_PwrA[19].fCalibA-SP_PwrA[15].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
        for i:=1 to 3 do
        begin
          SP_PwrA[i+11].fPwrByVA:=Trunc(SP_PwrA[11].fPwrByVA+(SP_PwrA[15].fPwrByVA-SP_PwrA[11].fPwrByVA)/4*i);
          SP_PwrA[i+11].fCalibA:=Trunc(SP_PwrA[11].fCalibA+(SP_PwrA[15].fCalibA-SP_PwrA[11].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
         for i:=1 to 3 do
        begin
          SP_PwrA[i+7].fPwrByVA:=Trunc(SP_PwrA[7].fPwrByVA+(SP_PwrA[11].fPwrByVA-SP_PwrA[7].fPwrByVA)/4*i);
          SP_PwrA[i+7].fCalibA:=Trunc(SP_PwrA[7].fCalibA+(SP_PwrA[11].fCalibA-SP_PwrA[7].fCalibA)/4*i);
          ListBox1.ItemIndex:=ListBox1.Count-1;
        end;
         for i:=1 to 3 do
         begin
            SP_PwrA[i+3].fPwrByVA:=Trunc(SP_PwrA[3].fPwrByVA+(SP_PwrA[7].fPwrByVA-SP_PwrA[3].fPwrByVA)/4*i);
            SP_PwrA[i+3].fCalibA:=Trunc(SP_PwrA[3].fCalibA+(SP_PwrA[7].fCalibA-SP_PwrA[3].fCalibA)/4*i);
         end;
         for i:=1 to 2 do
         begin
            SP_PwrA[i].fPwrByVA:=Trunc(SP_PwrA[0].fPwrByVA+(SP_PwrA[3].fPwrByVA-SP_PwrA[0].fPwrByVA)/3*i);
            SP_PwrA[i].fCalibA:=Trunc(SP_PwrA[0].fCalibA+(SP_PwrA[3].fCalibA-SP_PwrA[0].fCalibA)/3*i);
         end;
      end;

       for i:=0 to 39 do
       begin
         ListBox1.Items.Add(Format('%-3d',[i])+'   '+Format('%-3d',[SP_PwrA[i].fPwrByVA])+'     '+Format('%-3d',[SP_PwrA[i].fCalibA])) ;
       end;
     //  ListBox1.Items.Add(Format('%-3d',[40])+'   '+Format('%-3d',[99])+'     '+Format('%-3d',[200])) ;
    end;
end;

procedure TfrmHFReaderDemoMain.Button59Click(Sender: TObject);
var
  i,SP_PwrA_index:Integer;
  _Pwr,_PwrVal,_VRMS:Byte;
  return1:LongInt;
begin
  Button59.Enabled:=False;
  Button55.Enabled:=True;
  return1:=MessageDlg('确定要固化功率表吗？', mtInformation, [mbOK, mbCancel], 0);
  if return1 = IDCancel then
    Exit;
  StatusBar1.Panels[0].Text:='正在固化。。。。。';
  for i:=0 to 39 do
  begin
    if(fAppClosed)then
    Break;
    SP_PwrA_index := ListBox1.Items.IndexOf(Format('%-3d',[i])+'   '+Format('%-3d',[SP_PwrA[i].fPwrByVA])+'     '+Format('%-3d',[SP_PwrA[i].fCalibA]));
    if(SP_PwrA_index>=0)then
    begin
    fCmdRet:=ProgramPwrTable(fComAdr,i,SP_PwrA[i].fPwrByVA,SP_PwrA[i].fCalibA,frmcomportindex) ;
    if(fCmdRet=0)then
    begin
      ListBox1.Items[SP_PwrA_index] := Format('%-3d',[i])+'   '+Format('%-3d',[SP_PwrA[i].fPwrByVA])+'     '+Format('%-3d',[SP_PwrA[i].fCalibA])+'    '+'√';
    end
    else
    begin
      ListBox1.Items[SP_PwrA_index] := Format('%-3d',[i])+'   '+Format('%-3d',[SP_PwrA[i].fPwrByVA])+'     '+Format('%-3d',[SP_PwrA[i].fCalibA])+'    '+'X';
      Break;
    end;
    ListBox1.ItemIndex:=SP_PwrA_index;
    end;
     AddCmdLog('SetPwr', '固化', fCmdRet)
  end;
 { _Pwr:=40;
  _PwrVal:=99;
  _VRMS:=200;

   SP_PwrA_index := ListBox1.Items.IndexOf(Format('%-3d',[40])+'   '+Format('%-3d',[99])+'     '+Format('%-3d',[200]));
    if(SP_PwrA_index>=0)then
    begin
    fCmdRet:=ProgramPwrTable(fComAdr,_Pwr,_PwrVal,_VRMS,frmcomportindex) ;
    if(fCmdRet=0)then
    begin
      ListBox1.Items[SP_PwrA_index] := Format('%-3d',[40])+'   '+Format('%-3d',[99])+'     '+Format('%-3d',[200])+'    '+'√';
    end
    else
      ListBox1.Items[SP_PwrA_index] := Format('%-3d',[40])+'   '+Format('%-3d',[99])+'     '+Format('%-3d',[200])+'    '+'X';
    ListBox1.ItemIndex:=SP_PwrA_index;
    end;   }
  if(fAppClosed)then
    close;

 // StatusBar1.Panels[0].Text:='固化结束';
end;

procedure TfrmHFReaderDemoMain.Button62Click(Sender: TObject);
var
   _Pwr,_PwrVal,_VRMS: Byte;
begin
   _Pwr:=ComboBox4.ItemIndex;
  fCmdRet:=SetPwr(fComAdr,_Pwr,frmcomportindex);
   AddCmdLog('SetPwr', '设置功率数', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button63Click(Sender: TObject);
var
   _PwrVal: Byte;
begin
   _PwrVal:=ComboBox5.ItemIndex;
   fCmdRet:=SetPwrByValue(fComAdr,_PwrVal,frmcomportindex);
   AddCmdLog('SetPwrByValue', '设置功率级数', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button61Click(Sender: TObject);
var
  _AntValid: Byte;
begin
   fCmdRet:=CheckAntenna(fComAdr,_AntValid,frmcomportindex) ;
   if(fCmdRet=0)then
   begin
     if(_AntValid and $80)=0then
     begin
      Edit4.Text:='已标定';
     end
     else
      Edit4.Text:='未标定';
     if(_AntValid and $01)=0then
     begin
       Edit5.Text:='正常';
     end
     else
     begin
     if(_AntValid and $02)=0then
      Edit5.Text:='异常(超上限)';
     if(_AntValid and $02)=2then
      Edit5.Text:='异常(超下限)';
     end;
   end;
   AddCmdLog('CheckAntenna', '检测天线状态', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button60Click(Sender: TObject);
var
  _DirStep,_Pwr,_PwrVal,_VRMS: Byte;
begin
  fCmdRet:=GetPwr(fComAdr, _Pwr,_PwrVal,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
   if(_Pwr and $80)=0then
   begin
      Label_Alarm.Font.Color:=clLime;
   end
   else
   begin
      Label_Alarm.Font.Color:=clRed;
   end;
   Edit2.Text:=IntToStr(_Pwr and $7F);
   Edit3.Text:=IntToStr(_PwrVal);
  end;
  AddCmdLog('GetPwr', '获取功率信息', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button65Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit10_CP.Text:='0';
  Edit10_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
   Button65.Enabled:=False;
   Edit10_CP.Text:=IntToStr(_VRMS);
    Edit10_PW.Text:= ComboBox2.Text;
   SP_PwrA[39].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[39].fCalibA:=StrToInt(Edit10_CP.Text);
   RB10.Checked:=False;
   RB10.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);
 AddCmdLog('SetPwrByValue', '标记10W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button66Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit9_CP.Text:='0';
  Edit9_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button66.Enabled:=False;
   Edit9_CP.Text:=IntToStr(_VRMS);
    Edit9_PW.Text:= ComboBox2.Text;
   SP_PwrA[35].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[35].fCalibA:=StrToInt(Edit9_CP.Text);
   RB9.Checked:=False;
   RB9.Enabled:=False;
  end;
 //f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记9W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button67Click(Sender: TObject);
var
  _VRMS:Byte;
begin
Edit8_CP.Text:='0';
Edit8_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button67.Enabled:=False;
   Edit8_CP.Text:=IntToStr(_VRMS);
   Edit8_PW.Text:= ComboBox2.Text;
   SP_PwrA[31].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[31].fCalibA:=StrToInt(Edit8_CP.Text);
   RB8.Checked:=False;
   RB8.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记8W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button68Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit7_CP.Text:='0';
  Edit7_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button68.Enabled:=False;
   Edit7_CP.Text:=IntToStr(_VRMS);
    Edit7_PW.Text:= ComboBox2.Text;
   SP_PwrA[27].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[27].fCalibA:=StrToInt(Edit7_CP.Text);
   RB7.Checked:=False;
   RB7.Enabled:=False;
  end;
 //f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记7W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button69Click(Sender: TObject);
var
  _VRMS:Byte;
begin
Edit6_CP.Text:='0';
Edit6_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button69.Enabled:=False;
   Edit6_CP.Text:=IntToStr(_VRMS);
   Edit6_PW.Text:= ComboBox2.Text;
   SP_PwrA[23].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[23].fCalibA:=StrToInt(Edit6_CP.Text);
   RB6.Checked:=False;
   RB6.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记6W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button70Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit5_CP.Text:='0';
  Edit5_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button70.Enabled:=False;
   Edit5_CP.Text:=IntToStr(_VRMS);
   Edit5_PW.Text:= ComboBox2.Text;
   SP_PwrA[19].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[19].fCalibA:=StrToInt(Edit5_CP.Text);
   RB5.Checked:=False;
   RB5.Enabled:=False;
  end;
 //f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记5W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button72Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit4_CP.Text:='0';
  Edit4_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button72.Enabled:=False;
   Edit4_CP.Text:=IntToStr(_VRMS);
   Edit4_PW.Text:= ComboBox2.Text;
   SP_PwrA[15].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[15].fCalibA:=StrToInt(Edit4_CP.Text);
   RB4.Checked:=False;
   RB4.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记4W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button71Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit3_CP.Text:='0';
  Edit3_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
   Button71.Enabled:=False;
   Edit3_CP.Text:=IntToStr(_VRMS);
    Edit3_PW.Text:= ComboBox2.Text;
   SP_PwrA[11].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[11].fCalibA:=StrToInt(Edit3_CP.Text);
   RB3.Checked:=False;
   RB3.Enabled:=False;
  end;
 //f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记3W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button73Click(Sender: TObject);
var
  _VRMS:Byte;
begin
  Edit2_CP.Text:='0';
  Edit2_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button73.Enabled:=False;
   Edit2_CP.Text:=IntToStr(_VRMS);
   Edit2_PW.Text:= ComboBox2.Text;
   SP_PwrA[7].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[7].fCalibA:=StrToInt(Edit2_CP.Text) ;
   RB2.Checked:=False;
   RB2.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记2W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button74Click(Sender: TObject);
var
  _VRMS:Byte;
begin
 Edit1_CP.Text:='0';
 Edit1_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button74.Enabled:=False;
   Edit1_CP.Text:=IntToStr(_VRMS);
    Edit1_PW.Text:= ComboBox2.Text;
   SP_PwrA[3].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[3].fCalibA:=StrToInt(Edit1_CP.Text);
   RB1.Checked:=False;
   RB1.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);

 AddCmdLog('SetPwrByValue', '标记1W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Edit10_PWDblClick(Sender: TObject);
begin
RB10.Enabled:=True;
f10Pwr:=0;
Button65.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit9_PWDblClick(Sender: TObject);
begin
RB9.Enabled:=True;
f9Pwr:=0;
Button66.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit8_PWDblClick(Sender: TObject);
begin
RB8.Enabled:=True;
f8Pwr:=0;
Button67.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit7_PWDblClick(Sender: TObject);
begin
RB7.Enabled:=True;
f7Pwr:=0;
Button68.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit6_PWDblClick(Sender: TObject);
begin
RB6.Enabled:=True;
f6Pwr:=0;
Button69.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit5_PWDblClick(Sender: TObject);
begin
RB5.Enabled:=True;
f5Pwr:=0;
Button70.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit4_PWDblClick(Sender: TObject);
begin
RB4.Enabled:=True;
f4Pwr:=0;
Button72.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit3_PWDblClick(Sender: TObject);
begin
RB3.Enabled:=True;
f3Pwr:=0;
Button71.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit2_PWDblClick(Sender: TObject);
begin
RB2.Enabled:=True;
f2Pwr:=0;
Button73.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Edit1_PWDblClick(Sender: TObject);
begin
RB1.Enabled:=True;
f1Pwr:=0;
Button74.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Action1Update(Sender: TObject);
begin
  if(RB10.Enabled=False)and(RB9.Enabled=False)and(RB8.Enabled=False)and (RB7.Enabled=False)and(RB6.Enabled=False)and(RB5.Enabled=False)and(RB4.Enabled=False)and(RB3.Enabled=False)and(RB2.Enabled=False)and(RB1.Enabled=False)and(RB0.Enabled=False)and(Self.ComIsOpen)then
  begin
    if(Button59.Enabled)then
    begin
    Button56.Enabled:=False;
    end
    else
    Button56.Enabled:=True;
  end
  else
    Button56.Enabled:=False;
end;

procedure TfrmHFReaderDemoMain.Action2Update(Sender: TObject);
begin
 if(RB10.Enabled=False)and(RB9.Enabled=False)and(RB8.Enabled=False)and (RB7.Enabled=False)and(RB6.Enabled=False)and(RB5.Enabled=False)and(RB4.Enabled=False)and(RB3.Enabled=False)and(RB2.Enabled=False)and(RB1.Enabled=False)and(RB0.Enabled=False)and(Self.ComIsOpen)then
  begin
     if(Button56.Enabled)then
     begin
      Button59.Enabled:=False;
     end
     else
      Button59.Enabled:=True;
  end
 else
  begin
    Button59.Enabled:=False;
  end;
end;

procedure TfrmHFReaderDemoMain.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  i:Integer;
    s: string;
  keyValue: Byte;
begin
  keyValue := Ord(key);
   //SHowMessage(IntToStr(keyValue));
  if keyValue <> 8 then //删除键
  begin
    s := key;
     for i := 1 to Length(s) do
    begin
      case s[i] of
        '0'..'9': Continue;
      else
        begin
          key := char($00);
          beep();
          exit;
        end;
      end;
    end;
  end;

end;

procedure TfrmHFReaderDemoMain.Button75Click(Sender: TObject);
var
  _VRMS:Byte;
begin
 Edit0_CP.Text:='0';
 Edit0_PW.Text:='0';
 fCmdRet:=CalibratePwr(fComAdr, _VRMS,frmcomportindex) ;
  if(fCmdRet=0) then
  begin
  Button75.Enabled:=False;
   Edit0_CP.Text:=IntToStr(_VRMS);
    Edit0_PW.Text:= ComboBox2.Text;
   SP_PwrA[0].fPwrByVA:=StrToInt(ComboBox2.Text);
   SP_PwrA[0].fCalibA:=StrToInt(Edit0_CP.Text);
   RB0.Checked:=False;
   RB0.Enabled:=False;
  end;
// f10Pwr:=StrToInt(ComboBox2.Text);
 AddCmdLog('SetPwrByValue', '标记0.25W', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Edit0_PWDblClick(Sender: TObject);
begin
  RB0.Enabled:=True;
  f0Pwr:=0;
  Button75.Enabled:=True;
end;

procedure TfrmHFReaderDemoMain.Button_stopscanClick(Sender: TObject);
var
  _Sync:Byte;
begin
  _Sync:=0;
  fCmdRet:=SyncScan(fComAdr, _Sync,frmcomportindex) ;
  AddCmdLog('_Sync', '扫描停止', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button_startscanClick(Sender: TObject);
var
  _Sync:Byte;
begin
  _Sync:=1;
  fCmdRet:=SyncScan(fComAdr, _Sync,frmcomportindex) ;
  AddCmdLog('_Sync', '扫描进行', fCmdRet);
end;

procedure TfrmHFReaderDemoMain.Button76Click(Sender: TObject);
begin
Memo1.Clear;
end;

procedure TfrmHFReaderDemoMain.IdUDPServer1UDPRead(Sender: TObject;
  AData: TStream; ABinding: TIdSocketHandle);
var DataStringStream:tstringstream;
begin
  //tstringstream这个类是字流类，主要用于在socket中传递大量的字符
 DataStringStream:=tstringstream.Create('');
 TRY
   DataStringStream.CopyFrom(adata,adata.Size);
   fRecvUDPstring:=DataStringStream.DataString;
   RemostIP:= ABinding.PeerIP;
 finally
   DataStringStream.Free;
 end;
end;

procedure TfrmHFReaderDemoMain.IdUDPServer2UDPRead(Sender: TObject;
  AData: TStream; ABinding: TIdSocketHandle);
var
  aDateTime: TDateTime;
  hexstr,str,str1:string;
  i,t,dwNo,bOpt:integer;
  ecode:string;
  aListItem:TListItem;
  DataStringStream:tstringstream;
begin
  //tstringstream这个类是字流类，主要用于在socket中传递大量的字符
 DataStringStream:=tstringstream.Create('');
 TRY
   DataStringStream.CopyFrom(adata,adata.Size);
   fRecvUDPstring:=DataStringStream.DataString;
   RemostIP:= ABinding.PeerIP;
 finally
   DataStringStream.Free;
 end;
  if fRecvUDPstring <> '' then
  begin
    ecode:=Copy(fRecvUDPstring,1,1);
    if(ecode<>'A')then
    begin
     GeteCodeDesc(ecode);
     Exit;
    end;
    str:=Copy(fRecvUDPstring,2,Pos('/',fRecvUDPstring)-2);
    if(ListView1.Items.Count>0)then
    begin
     for i:=0 to ListView1.Items.Count-1 do
     if(ListView1.Items[i].SubItems[0]=str)then
     Exit;
    end;
    dwNo:=ListView1.Items.Count;
    aListItem := ListView1.Items.Add;
    aListItem.SubItems.Add('');
    aListItem.SubItems.Add('');
    aListItem.SubItems.Add('');//
    aListItem.SubItems.Add('');//
    aListItem.Caption:=IntToStr(ListView1.Items.Count);
    ListView1.Items[dwNo].SubItems[0]:=str;
    IP:= RemostIP;
    ListView1.Items[dwNo].SubItems[1]:=IP;
    t :=Pos('*',fRecvUDPstring)+8;
    str1:=Copy(fRecvUDPstring,t,Length(fRecvUDPstring)-t+2)   ;
    t:=Pos('/',str1);
    usename:=Copy(str1,1,t-1);
    dsname:=Copy(str1,t+1,Length(str1)-t+1);
    str:='';
    if((usename = '') and (dsname = '' ))or (dsname = '/')then
     str:=''
    else
    begin
     str:= usename+'/'+dsname;
    end;
    ListView1.Items[dwNo].SubItems[2]:=str;
  end;
end;

procedure TfrmHFReaderDemoMain.Button77Click(Sender: TObject);
var
  comd:string;
  bOpt:Integer;
begin
 ListView1.Items.Clear;
 try
  IdUDPServer2.DefaultPort:=0;
  IdUDPServer2.Active:=True;
 except
  MessageDlg('服务端口冲突！', mtInformation, [mbOK], 0);
 end;
 comd:= 'X';
 IdUDPServer2.Bindings[0].IP:='255.255.255.255';
 IdUDPServer2.Bindings[0].Port:=65535;
 bOpt:=1;
 IdUDPServer2.Bindings[0].SetSockOpt(65535,$20,@bOpt, SizeOf(bOpt));
 IdUDPServer2.Bindings[0].SendTo( IdUDPServer2.Bindings[0].IP,IdUDPServer2.Bindings[0].Port,comd[1],Length(comd));

end;

procedure TfrmHFReaderDemoMain.Button78Click(Sender: TObject);
begin
locateForm.Show ;
end;

procedure TfrmHFReaderDemoMain.Button79Click(Sender: TObject);
var
  select_index:Integer;
  comd:string;
  aDateTime: TDateTime;
  hexstr,str,str1:string;
  i,t,dwNo,bOpt:integer;
  ecode:string;
  aListItem:TListItem;
begin
 if ListView1.Selected = nil then
  begin
    MessageDlg('没有选择设备！', mtWarning, [mbOK], 0);
    exit;
  end;
  if ListView1.Selected.SubItems[0]<>''then
  begin
    IP:=ListView1.Selected.SubItems[1];
    mac:= ListView1.Selected.SubItems[0];
    select_index:= ListView1.Selected.Index;
  end
  else
  begin
    Exit;
  end;

  try
    IdUDPServer1.DefaultPort:=0;
    IdUDPServer1.Active:=True;
  except
    MessageDlg('服务端口冲突！', mtInformation, [mbOK], 0);
  end;
  IdUDPServer1.Bindings[0].IP:=IP;
  IdUDPServer1.Bindings[0].Port:=65535;

  i:=0;
  while(i<3)do
  begin
   comd:='X';
   IdUDPServer1.Bindings[0].SendTo(IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
              mac:=Copy(fRecvUDPstring,2,Pos('/',fRecvUDPstring)-2);
              IP:= RemostIP;
              t :=Pos('*',fRecvUDPstring)+8;
              str1:=Copy(fRecvUDPstring,t,Length(fRecvUDPstring)-t+1)   ;
              t:=Pos('/',str1);
              usename:=Copy(str1,1,t-1);
              dsname:=Copy(str1,t+1,Length(str1)-t+1);
              i:=3;
              Break;
           end;
        end;
    end;
    i:=i+1;
  end;
  i:=0;
  bOpt:=1;
  IdUDPServer1.Bindings[0].SetSockOpt(65535,$20,@bOpt, SizeOf(bOpt));
  while(i<3)do
  begin
   comd:='W';
   comd:=comd+mac;
   IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Sleep(100);
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
      Application.ProcessMessages;
      if fRecvUDPstring <> '' then
      begin
        ecode:=Copy(fRecvUDPstring,1,1);
        if(ecode='A')then
        begin
         i:=3;
         Break;
        end;
      end;
    end;
    i:=i+1;
  end;
  i:=0;
   while(i<3)do
  begin
   comd:='L';
   IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Sleep(50);
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
      Application.ProcessMessages;
      if fRecvUDPstring <> '' then
      begin
        ecode:=Copy(fRecvUDPstring,1,1);
        if(ecode='A')then
        begin
         i:=3;
         Break;
        end;
      end;
    end;
    i:=i+1;
  end;
  i:=0;
   while(i<3)do
  begin
    comd:='GON|1';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
    fRecvUDPstring:='';
    Sleep(10);
    aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
      Application.ProcessMessages;
      if fRecvUDPstring <> '' then
      begin
        ecode:=Copy(fRecvUDPstring,1,1);
        if(ecode='A')then
        begin
         t:=Pos('|',fRecvUDPstring);
         if(Copy(fRecvUDPstring,t+1,1)='1')then
         usename:=Copy(fRecvUDPstring,2,t-2);
         i:=3;
         Break;
        end;
      end;
    end;
    i:=i+1;
  end;
  i:=0;
  while(i<3)do
  begin
   comd:='GDN|2';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Sleep(50);
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
             t:=Pos('|',fRecvUDPstring);
             if(Copy(fRecvUDPstring,t+1,1)='2')then
             dsname:=Copy(fRecvUDPstring,2,t-2);
             i:=3;
             Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GFE|3';
   IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Sleep(50);
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
      Application.ProcessMessages;
      if fRecvUDPstring <> '' then
      begin
         ecode:=Copy(fRecvUDPstring,1,1);
         if(ecode='A')then
         begin
           t:=Pos('|',fRecvUDPstring);
           if(Copy(fRecvUDPstring,t+1,1)='3')then
           mac:=Copy(fRecvUDPstring,2,t-2);
           i:=3;
           Break;
         end;
      end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GIP|4';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Sleep(50);
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,1)='3')then
            IP:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;
  i:=0;
  while(i<3)do
  begin
   comd:='GPN|5';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,1)='5')then
            portnum:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

   i:=0;
  while(i<3)do
  begin
   comd:='GTP|6';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,1)='6')then
            tup:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

   i:=0;
  while(i<3)do
  begin
   comd:='GRM|7';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,1)='7')then
            rm:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GCM|8';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,1)='8')then
            cm:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

   i:=0;
  while(i<3)do
  begin
   comd:='GCT|9';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,1)='9')then
            ct:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GFC|10';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='10')then
            fc:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

   i:=0;
  while(i<3)do
  begin
   comd:='GDT|11';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='11')then
            dt:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GBR|12';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='12')then
            br:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GPR|13';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='13')then
            pr:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

   i:=0;
  while(i<3)do
  begin
   comd:='GBB|14';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='14')then
            bb:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GRC|15';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='15')then
            rc:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GML|16';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='16')then
            ml:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GMD|17';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='17')then
            md:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GDI|18';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='18')then
            di:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GDP|19';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='19')then
            dp:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GGI|20';
    IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='20')then
            gi:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;

        end;
    end;
    i:=i+1;
  end;

  i:=0;
  while(i<3)do
  begin
   comd:='GNM|21';
   IdUDPServer1.Bindings[0].SendTo( IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   Application.ProcessMessages;
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
            t:=Pos('|',fRecvUDPstring);
            if(Copy(fRecvUDPstring,t+1,2)='21')then
            nm:=Copy(fRecvUDPstring,2,t-2);
            i:=3;
            Break;
           end;
        end;
    end;
    i:=i+1;
  end;
  if(''=nm) or (''=mac) or (''=IP) or (''=portnum) or (''=br)
     or (''=bb) or (''=dt) or (''=rm) or (''=tup) or (''=pr)
     or (''=fc) or (''=di) or (''=dp) or (''=gi) then
  begin
	   MessageDlg('请检查设备与pc连线状态!', mtWarning, [mbOK], 0);
     Exit;
  end;
  with fSetdlg do
  begin
    Edit1.Text:=usename;
    Edit2.Text:=dsname;
    Edit3.Text:=mac;
    Edit4.Text:=IP;
    Edit5.Text:=portnum;
    ComboBox1.ItemIndex:=StrToInt(tup);
    ComboBox2.ItemIndex:=StrToInt(rm);
    Edit6.Text:=di;
    Edit7.Text:=dp;
    Edit8.Text:=gi;
    Edit9.Text:=nm;
    ComboBox3.ItemIndex:=StrToInt(br);
    ComboBox4.ItemIndex:=StrToInt(pr);
    ComboBox5.ItemIndex:=StrToInt(bb);
    ComboBox6.ItemIndex:=StrToInt(dt);
    ComboBox7.ItemIndex:=StrToInt(fc);
    if(ComboBox2.ItemIndex=0)then
    begin
      Edit6.Enabled:=False;
      Edit7.Enabled:=False;
      Edit8.Enabled:=False;
      Edit9.Enabled:=False;
      Button1.Enabled:=False;
    end
    else
    begin
      Edit6.Enabled:=True;
      Edit7.Enabled:=True;
      Edit8.Enabled:=True;
      Edit9.Enabled:=True;
      Button1.Enabled:=True;
    end;
  end;
  fNhSetDlg.ComboBox1.ItemIndex:=StrToInt(frmHFReaderdemomain.cm);
  fNhSetDlg.ComboBox2.ItemIndex:=StrToInt(frmHFReaderdemomain.ct);

  fPhSetDlg.Edit1.Text:=frmHFReaderdemomain.ml;
  fPhSetDlg.Edit2.Text:=frmHFReaderdemomain.md;
  fPhSetDlg.ComboBox1.ItemIndex:=StrToInt(frmHFReaderdemomain.rc);
  frmHFReaderdemomain.Enabled:=False;
  fSetdlg.Show;
end;

procedure TfrmHFReaderDemoMain.Button80Click(Sender: TObject);
begin
ChangeIPdlg.Show;
end;

procedure TfrmHFReaderDemoMain.Button81Click(Sender: TObject);
var
  select_index:Integer;
  comd:string;
  aDateTime: TDateTime;
  hexstr,str,str1:string;
  i,t,dwNo,bOpt:integer;
  ecode:string;
  aListItem:TListItem;
begin
  if ListView1.Selected = nil then
  begin
    MessageDlg('没有选择设备！', mtWarning, [mbOK], 0);
    exit;
  end;
  if ListView1.Selected.SubItems[0]<>''then
  begin
    IP:=ListView1.Selected.SubItems[1];
    mac:= ListView1.Selected.SubItems[0];
    select_index:= ListView1.Selected.Index;
  end
  else
  begin
    Exit;
  end;

  try
    IdUDPServer1.DefaultPort:=0;
    IdUDPServer1.Active:=True;
  except
    MessageDlg('服务端口冲突！', mtInformation, [mbOK], 0);
  end;
  IdUDPServer1.Bindings[0].IP:='255.255.255.255';
  IdUDPServer1.Bindings[0].Port:=65535;

  i:=0;
  while(i<3)do
  begin
   comd:='B';
   IdUDPServer1.Bindings[0].SendTo(IdUDPServer1.Bindings[0].IP,IdUDPServer1.Bindings[0].Port,comd[1],Length(comd));
   fRecvUDPstring:='';
   aDateTime := Now;
    while (Now < IncMilliSecond(aDateTime, 1000 )) do //询查时间没有溢出
    begin
        Application.ProcessMessages;
        if fRecvUDPstring <> '' then
        begin
           ecode:=Copy(fRecvUDPstring,1,1);
           if(ecode='A')then
           begin
              mac:=Copy(fRecvUDPstring,2,Pos('/',fRecvUDPstring)-2);
              IP:= RemostIP;
              t :=Pos('*',fRecvUDPstring)+8;
              str1:=Copy(fRecvUDPstring,t,Length(fRecvUDPstring)-t+1)   ;
              t:=Pos('/',str1);
              usename:=Copy(str1,1,t-1);
              dsname:=Copy(str1,t+1,Length(str1)-t+1);
              i:=3;
              Break;
           end;
        end;
    end;
    i:=i+1;
  end;
end;

procedure TfrmHFReaderDemoMain.opnetClick(Sender: TObject);
var
  Port:LongInt;
  IPaddr:string;
  openresult:LongInt;
begin
  Screen.Cursor := crHourGlass;
  try
    if(Edit7.Text='')then
    Exit;
    if(Edit8.Text='')then
    Exit;
    if(Edit9.Text='')then
    Exit;
    fComAdr := StrToInt('$' + Edit9.Text);
    Port:= StrToInt(Edit7.Text);
    IPaddr:=Trim(Edit8.Text);
    openresult:=OpenNetPort(Port,IPaddr,fComAdr,frmcomportindex) ;
    fOpenComIndex := frmcomportindex;
    if(openresult=0)then
    begin
      Button43.Enabled:=True;
      Action_GetReaderInformationExecute(Sender); //自动执行读取写卡器信息
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if (fOpenComIndex <> -1) and
     (openresult <> $35)  and
     (openresult <> $30)  then
  begin

  end;
  if fOpenComIndex = -1 then
  begin
    Application.MessageBox('网口通讯错误', '信息提示', MB_ICONINFORMATION);
  end;
end;

procedure TfrmHFReaderDemoMain.closenetClick(Sender: TObject);
begin
  ClearLastInfo;
  frmcomportindex:=StrToInt(Edit7.Text);
  fCmdRet:=CloseNetPort(frmcomportindex);
  if(fCmdRet=0)then
  begin
    frmcomportindex:=-1;
    fOpenComIndex := -1;
   // ComIsOpen:=False;
  end;
end;

procedure TfrmHFReaderDemoMain.PageControl2Change(Sender: TObject);
begin
  if(fOpenComIndex>0)and(fOpenComIndex<256)then
  begin
     Action_CloseCOMExecute(sender);
  end
  else if(fOpenComIndex>1023)and(fOpenComIndex<65535)then
  begin
      closenetClick(sender);
  end;
end;

end.

