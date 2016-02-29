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
    RetDataErr       = $32;    //���ݳ����д���
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
       result := '�������';
    end
    else if(retCode='R')then
    begin
      Result:='�豸�ܾ�ִ������';
    end
    else if(retCode='D')then
    begin
      Result:='���豸���Ӳ���';
    end
    else if(retCode='F') then
    begin
      Result:='����ִ��ʧ��';
    end;
end;

{//2006-8-2
��������	���̴���	 ����Ϣ	д��������		�����	������	  A����	B����
Infineon (ISO Address mode)	0x05	256(�û���Χ��0��249)	4�ֽ�	-	  ��
		                            64 (�û���Χ��0��57)	4�ֽ�	-	  ��
STMicroelectronics (LRI512)	0x02	16(�û���Χ��0~15)	    4�ֽ�	-	  ��
Fujitsu (MB89R116)	        0x08	256(�û���Χ��0��249)	8�ֽ�	��	  ��
Philips (I-Code SLI)	    0x04	32(�û���Χ��0��27)	    4�ֽ�	-	  ��
Texas Instruments (Tag-it HF-I)	0x07	64(�û���Χ��0��63)	4�ֽ�	��	  -
EM Microelectronic  (EM4034-)   0X16  14(�û���Χ3-13)       4�ֽ�
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
               BlockStyle := 'B';   //B��
           end;
       $02 :
           Begin
               FirmName := 'STMicroelectronics';   //(LRI512)
               BlockSize:= 4;
               BlockNum := 16;

               BlockStyle := 'B';   //B��
           end;
       $08 :
           Begin
               FirmName := 'Fujitsu';    //(MB89R116)
               BlockSize:= 8;
               BlockNum := 250;

               BlockStyle := 'AB';   //AB��
           end;
       $04 :
           Begin
               FirmName := 'Philips Semiconductors';   //(I-Code SLI)
               BlockSize:= 4;
               BlockNum := 28;

               BlockStyle := 'B';   //B��
           end;
       $07 :
           Begin
               FirmName := 'Texas Instruments';   //(Tag-itHF-I)
               BlockSize:= 4;
               BlockNum := 64;

               BlockStyle := 'A';   //A��
           end;
     //-------------------------------------------------------------------------
      $16 :                           //FirmCode $16
                                       //2006-8-2 �޸ļ���'EM Microelectronic '
            begin
              FirmName := 'EM Microelectronic '  ;  //
              BlockSize:= 4;                      //    ??
              BlockNum := 14;                     // ??
              BlockStyle := 'A';              //AB��//??
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
        CmdNotSupport         : result := '�����֧��';
        CmdNotIdentify        : result := '�����ʶ��';
        OperationNotSupport_  : result := '�ò�������֧��';
        UnknownError          : result := 'δ֪�Ĵ�������';
        BlockError            : result := '��ָ���Ĳ����鲻�ܱ�ʹ�û򲻴���';
        BlockLockedAndCntLock : result := '��ָ���Ĳ������Ѿ��������������ٴα�����';
        BlockLockedAndCntWrite: result := '��ָ���Ĳ������Ѿ������������ܶ������ݽ��и�д';
        BlockCntOperate       : result := '��ָ���Ĳ����鲻�ܱ���������';
        BlockCntLock          : result := '��ָ���Ĳ����鲻�ܱ���������';

        CmdNotOperation      :  result := '�������ǰ�޷�ִ��';

    end;
end;

Function HFReader_GetReturnCodeDesc(retCode : Byte) : String;
begin
    result := '';
    case retCode of
        LengthError         : result := '������������ȴ���';
        OperationNotSupport : result := '�������֧��';
        RfClosed            : result := '��Ӧ�����ڹر�״̬';
        EEPROM              : result := 'EEPROM��������';
        TimeOut             : result := 'ָ����Inventory-Scan-Time���';
        MoreUID             : result := '��Inventory-Scan-Timeʱ�����޵õ����е��ӱ�ǩ��UID';
        ISOError            : result := 'ISO error';
        NoElectronicTag     : result := '�޵��ӱ�ǩ�ɲ���';
        OperationError      : result := '��������';

        CommunicationErr    : result := 'ͨѶ����';
        RetCRCErr           : result := 'CRCУ�����';

        RetDataErr          : result := '';    //���ݳ����д���
        CommunicationBusy   : result := 'ͨѶ��æ���豸����ִ������ָ��';
        CmdNotOperation     : result := '�������ǰ�޷�ִ��';
        DataRangError       : result := '��������Χ����';
    end;
end;

end.
