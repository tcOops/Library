unit HFReader_Head;

interface

Const
    COM1 = 1;
    COM2 = 2;
    COM3 = 3;
    COM4 = 4;
    COM5 = 5;
    COM6 = 6;
    COM7 = 7;
    COM8 = 8;
    COM9 = 9;
    COM10 = 10;


    OK			    	= $00;
    LengthError         = $01;
    OperationNotSupport = $02;
    DataRangError       = $03;
    CmdNotOperation     = $04;
    RfClosed            = $05;
    EEPROM              = $06;
    TimeOut             = $0a;
    MoreUID             = $0b;
    ISOError            = $0c;
    NoElectronicTag     = $0e;
    OperationError      = $0f;


    CmdNotSupport                 = $01;
    CmdNotIdentify                = $02;
    OperationNotSupport_          = $03;
    UnknownError                  = $0f;
    BlockError                    = $10;
    BlockLockedAndCntLock         = $11;
    BlockLockedAndCntWrite        = $12;
    BlockCntOperate               = $13;
    BlockCntLock                  = $14;


    
    CommunicationErr = $30;
    RetCRCErr        = $31;
    RetDataErr       = $32;    //数据长度有错误
    CommunicationBusy= $33;
    ExecuteCmdBusy   = $34;
    ComPortOpened    = $35;
    ComPortClose     = $36;
    InvalidHandle    = $37;
    InvalidPort      = $38;


    Function HFReader_GetBlockSize_BlockNum(Firmcode,OtherCode : Byte;
                                          Var FirmName : String;
                                          Var BlockSize,BlockNum : Byte;
                                          Var BlockStyle : String) : Boolean;
    Function HFReader_GetErrorCodeDesc(errorCode : Byte) : String;
    Function HFReader_GetReturnCodeDesc(retCode : Byte) : String;

Function GeteCodeDesc(retCode : string) : String;
implementation

Function GeteCodeDesc(retCode : string) : String;
begin
    result := '';
    if(retCode='C')then
    begin
       result := '命令错误';
    end
    else if(retCode='R')then
    begin
      Result:='设备拒绝执行命令';
    end
    else if(retCode='D')then
    begin
      Result:='与设备连接不上';
    end
    else if(retCode='F') then
    begin
      Result:='命令执行失败';
    end;
end;

{//2006-8-2
生产厂商	厂商代码	 块信息	写类型命令		块个数	块容量	  A类型	B类型
Infineon (ISO Address mode)	0x05	256(用户范围：0～249)	4字节	-	  √
		                            64 (用户范围：0～57)	4字节	-	  √
STMicroelectronics (LRI512)	0x02	16(用户范围：0~15)	    4字节	-	  √
Fujitsu (MB89R116)	        0x08	256(用户范围：0～249)	8字节	√	  √
Philips (I-Code SLI)	    0x04	32(用户范围：0～27)	    4字节	-	  √
Texas Instruments (Tag-it HF-I)	0x07	64(用户范围：0～63)	4字节	√	  -
EM Microelectronic  (EM4034-)   0X16  14(用户范围3-13)       4字节
}
Function HFReader_GetBlockSize_BlockNum(Firmcode,OtherCode : Byte;
                                      Var FirmName : String;
                                      Var BlockSize,BlockNum : Byte;
                                      Var BlockStyle : String) : Boolean;
Begin
   result := true;
   case FirmCode of
       $05 :
           Begin
               FirmName := 'Infineon';   //(ISO Address mode)
               BlockSize:= 4;
               BlockNum := 58;
               if OtherCode=$E0 then BlockNum := 250
               else if OtherCode=$60 then BlockNum := 58;
               BlockStyle := 'B';   //B类
           end;
       $02 :
           Begin
               FirmName := 'STMicroelectronics';   //(LRI512)
               BlockSize:= 4;
               BlockNum := 16;

               BlockStyle := 'B';   //B类
           end;
       $08 :
           Begin
               FirmName := 'Fujitsu';    //(MB89R116)
               BlockSize:= 8;
               BlockNum := 250;

               BlockStyle := 'AB';   //AB类
           end;
       $04 :
           Begin
               FirmName := 'Philips Semiconductors';   //(I-Code SLI)
               BlockSize:= 4;
               BlockNum := 28;

               BlockStyle := 'B';   //B类
           end;
       $07 :
           Begin
               FirmName := 'Texas Instruments';   //(Tag-itHF-I)
               BlockSize:= 4;
               BlockNum := 64;

               BlockStyle := 'A';   //A类
           end;
     //-------------------------------------------------------------------------
      $16 :                           //FirmCode $16
                                       //2006-8-2 修改加入'EM Microelectronic '
            begin
              FirmName := 'EM Microelectronic '  ;  //
              BlockSize:= 4;                      //    ??
              BlockNum := 14;                     // ??
              BlockStyle := 'A';              //AB类//??
            end;
        //------------------------------------------- --------------------------
       else
           result := False;
   end;
end;

Function HFReader_GetErrorCodeDesc(errorCode : Byte) : String;
begin
    result := '';
    case errorCode of
        CmdNotSupport         : result := '命令不被支持';
        CmdNotIdentify        : result := '命令不被识别';
        OperationNotSupport_  : result := '该操作不被支持';
        UnknownError          : result := '未知的错误类型';
        BlockError            : result := '所指定的操作块不能被使用或不存在';
        BlockLockedAndCntLock : result := '所指定的操作块已经被锁定，不能再次被锁定';
        BlockLockedAndCntWrite: result := '所指定的操作块已经被锁定，不能对其内容进行改写';
        BlockCntOperate       : result := '所指定的操作块不能被正常操作';
        BlockCntLock          : result := '所指定的操作块不能被正常锁定';

        CmdNotOperation      :  result := '操作命令当前无法执行';

    end;
end;

Function HFReader_GetReturnCodeDesc(retCode : Byte) : String;
begin
    result := '';
    case retCode of
        LengthError         : result := '命令操作数长度错误';
        OperationNotSupport : result := '操作命令不支持';
        RfClosed            : result := '感应场处于关闭状态';
        EEPROM              : result := 'EEPROM操作出错';
        TimeOut             : result := '指定的Inventory-Scan-Time溢出';
        MoreUID             : result := '在Inventory-Scan-Time时间内无得到所有电子标签的UID';
        ISOError            : result := 'ISO error';
        NoElectronicTag     : result := '无电子标签可操作';
        OperationError      : result := '操作出错';

        CommunicationErr    : result := '通讯错误';
        RetCRCErr           : result := 'CRC校验错误';

        RetDataErr          : result := '';    //数据长度有错误
        CommunicationBusy   : result := '通讯繁忙，设备正在执行其他指令';
        CmdNotOperation     : result := '操作命令当前无法执行';
        DataRangError       : result := '操作数范围不符';
    end;
end;

end.
