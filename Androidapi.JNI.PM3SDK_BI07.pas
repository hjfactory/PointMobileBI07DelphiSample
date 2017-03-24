
unit Androidapi.JNI.PM3SDK_BI07;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JAccount = interface;//android.accounts.Account
  JBluetoothChatService = interface;//com.PointMobile.PMSyncService.BluetoothChatService
  JBluetoothChatService_1 = interface;//com.PointMobile.PMSyncService.BluetoothChatService$1
  JBluetoothChatService_ConnectThread = interface;//com.PointMobile.PMSyncService.BluetoothChatService$ConnectThread
  JBluetoothChatService_ConnectedThread = interface;//com.PointMobile.PMSyncService.BluetoothChatService$ConnectedThread
  JProtocol = interface;//com.PointMobile.PMSyncService.Protocol
  JPMSyncService_Result = interface;//com.PointMobile.PMSyncService.Result
  JSendCommand = interface;//com.PointMobile.PMSyncService.SendCommand
  //JStringBuffer = interface;//java.lang.StringBuffer
  //JStringBuilder = interface;//java.lang.StringBuilder

// ===== Interface declarations =====

  JAccountClass = interface(JObjectClass)
    ['{94EE6861-F326-489F-8919-E20B39E3D9C1}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _Getname: JString; cdecl;
    {class} function _Gettype: JString; cdecl;
    {class} function init(name: JString; &type: JString): JAccount; cdecl; overload;//Deprecated
    {class} function init(&in: JParcel): JAccount; cdecl; overload;//Deprecated
    {class} function describeContents: Integer; cdecl;//Deprecated
    {class} function equals(o: JObject): Boolean; cdecl;//Deprecated
    {class} function hashCode: Integer; cdecl;//Deprecated
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property name: JString read _Getname;
    {class} property &type: JString read _Gettype;
  end;

  [JavaSignature('android/accounts/Account')]
  JAccount = interface(JObject)
    ['{71476381-8B6E-471F-9189-9857ECD7508C}']
    function toString: JString; cdecl;//Deprecated
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;//Deprecated
  end;
  TJAccount = class(TJavaGenericImport<JAccountClass, JAccount>) end;

  JBluetoothChatServiceClass = interface(JObjectClass)
    ['{5692402F-3931-4C39-81AB-C6A63DFF35AF}']
    {class} function _GetCleanCnt: Integer; cdecl;
    {class} function _GetNMEAReceiveToString: TJavaArray<Byte>; cdecl;
    {class} function _GetNMEASendCMD: TJavaArray<Byte>; cdecl;
    {class} function _GetNMEAStirng: JString; cdecl;
    {class} function _GetReceiveToString: TJavaArray<Byte>; cdecl;
    {class} function _GetRevBuff: TJavaArray<Byte>; cdecl;
    {class} function _GetRevBuffCnt: Integer; cdecl;
    {class} function _GetSTATE_CONNECTED: Integer; cdecl;
    {class} function _GetSTATE_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_LISTEN: Integer; cdecl;
    {class} function _GetSTATE_NONE: Integer; cdecl;
    {class} function _GetSendCMD: TJavaArray<Byte>; cdecl;
    {class} function _GethexArray: TJavaArray<Char>; cdecl;
    {class} function _GetmContext: JContext; cdecl;
    {class} procedure ClearBuff; cdecl;
    {class} function init(P1: JContext; P2: JHandler): JBluetoothChatService; cdecl;
    {class} property CleanCnt: Integer read _GetCleanCnt;
    {class} property NMEAReceiveToString: TJavaArray<Byte> read _GetNMEAReceiveToString;
    {class} property NMEASendCMD: TJavaArray<Byte> read _GetNMEASendCMD;
    {class} property NMEAStirng: JString read _GetNMEAStirng;
    {class} property ReceiveToString: TJavaArray<Byte> read _GetReceiveToString;
    {class} property RevBuff: TJavaArray<Byte> read _GetRevBuff;
    {class} property RevBuffCnt: Integer read _GetRevBuffCnt;
    {class} property STATE_CONNECTED: Integer read _GetSTATE_CONNECTED;
    {class} property STATE_CONNECTING: Integer read _GetSTATE_CONNECTING;
    {class} property STATE_LISTEN: Integer read _GetSTATE_LISTEN;
    {class} property STATE_NONE: Integer read _GetSTATE_NONE;
    {class} property SendCMD: TJavaArray<Byte> read _GetSendCMD;
    {class} property hexArray: TJavaArray<Char> read _GethexArray;
    {class} property mContext: JContext read _GetmContext;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/BluetoothChatService')]
  JBluetoothChatService = interface(JObject)
    ['{B1A9CDD2-80F6-460E-A3E4-259D6B4948BB}']
    procedure connect(P1: JBluetoothDevice); cdecl;
    procedure connectByAddress(P1: JString); cdecl;
    procedure connected(P1: JBluetoothSocket; P2: JBluetoothDevice); cdecl;
    function getState: Integer; cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure write(P1: TJavaArray<Byte>); cdecl;
  end;
  TJBluetoothChatService = class(TJavaGenericImport<JBluetoothChatServiceClass, JBluetoothChatService>) end;

  JBluetoothChatService_1Class = interface(JBroadcastReceiverClass)
    ['{A4CD379F-468B-468B-91A0-64421994D443}']
    {class} function init(P1: JBluetoothChatService): JBluetoothChatService_1; cdecl;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/BluetoothChatService$1')]
  JBluetoothChatService_1 = interface(JBroadcastReceiver)
    ['{6AB56FA8-4959-4CBB-92C4-10B1F8D4394D}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJBluetoothChatService_1 = class(TJavaGenericImport<JBluetoothChatService_1Class, JBluetoothChatService_1>) end;

  JBluetoothChatService_ConnectThreadClass = interface(JThreadClass)
    ['{115203C9-9BB2-4AA4-8685-9BE5A6F7F98F}']
    {class} function init(P1: JBluetoothChatService; P2: JBluetoothDevice): JBluetoothChatService_ConnectThread; cdecl;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/BluetoothChatService$ConnectThread')]
  JBluetoothChatService_ConnectThread = interface(JThread)
    ['{60DBB27B-7985-44EA-B649-547E8FB8860A}']
    procedure cancel; cdecl;
    procedure run; cdecl;
  end;
  TJBluetoothChatService_ConnectThread = class(TJavaGenericImport<JBluetoothChatService_ConnectThreadClass, JBluetoothChatService_ConnectThread>) end;

  JBluetoothChatService_ConnectedThreadClass = interface(JThreadClass)
    ['{A86A8F57-54B9-4765-ABFA-3482B6CFAF96}']
    {class} function init(P1: JBluetoothChatService; P2: JBluetoothSocket): JBluetoothChatService_ConnectedThread; cdecl;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/BluetoothChatService$ConnectedThread')]
  JBluetoothChatService_ConnectedThread = interface(JThread)
    ['{6DC4C4FF-1069-40A7-AD57-0B352E9214D4}']
    procedure cancel; cdecl;
    procedure run; cdecl;
    procedure write(P1: TJavaArray<Byte>); cdecl;
  end;
  TJBluetoothChatService_ConnectedThread = class(TJavaGenericImport<JBluetoothChatService_ConnectedThreadClass, JBluetoothChatService_ConnectedThread>) end;

  JProtocolClass = interface(JObjectClass)
    ['{7E01D538-A7D9-46ED-831C-90035F022813}']
    {class} function _GetAUSTRALIAPOST: Integer; cdecl;
    {class} function _GetAZTEC: Integer; cdecl;
    {class} function _GetBLUETOOTH_GetFirmwareVersion: TJavaArray<Byte>; cdecl;
    {class} function _GetBLUETOOTH_GetMACAdress: TJavaArray<Byte>; cdecl;
    {class} function _GetBOOKLAND_EAN: Integer; cdecl;
    {class} function _GetBatchMode: Integer; cdecl;
    {class} function _GetCHINA_POST: Integer; cdecl;
    {class} function _GetCHINESE2OF5: Integer; cdecl;
    {class} function _GetCMD: Byte; cdecl;
    {class} function _GetCODABAR: Integer; cdecl;
    {class} function _GetCODE11: Integer; cdecl;
    {class} function _GetCODE128: Integer; cdecl;
    {class} function _GetCODE39: Integer; cdecl;
    {class} function _GetCODE93: Integer; cdecl;
    {class} function _GetCOMPOSITECCAB: Integer; cdecl;
    {class} function _GetCOMPOSITECCC: Integer; cdecl;
    {class} function _GetCOMPOSITETLC39: Integer; cdecl;
    {class} function _GetCheckDLEACK: Boolean; cdecl;
    {class} procedure _SetCheckDLEACK(Value: Boolean); cdecl;
    {class} function _GetDATA: Byte; cdecl;
    {class} function _GetDATAMATRIX: Integer; cdecl;
    {class} function _GetDISCRETE2OF5: Integer; cdecl;
    {class} function _GetDateTime: Boolean; cdecl;
    {class} function _GetEAN13: Integer; cdecl;
    {class} function _GetEAN8: Integer; cdecl;
    {class} function _GetETX: Byte; cdecl;
    {class} function _GetGS1128: Integer; cdecl;
    {class} function _GetGS1DATABAR14: Integer; cdecl;
    {class} function _GetGS1DATABAREXPANDED: Integer; cdecl;
    {class} function _GetGS1DATABARLIMITED: Integer; cdecl;
    {class} function _GetGS1DATABAROMNIDIRECTIONAL: Integer; cdecl;
    {class} function _GetGetBattery: Integer; cdecl;
    {class} function _GetGetFreeMemoryAvailable: Integer; cdecl;
    {class} function _GetGetNumberOfBarcodes: TJavaArray<Byte>; cdecl;
    {class} function _GetGetScannerType: Integer; cdecl;
    {class} function _GetHANXIN: Integer; cdecl;
    {class} function _GetHL: Byte; cdecl;
    {class} function _GetINTERLEAVED2OF5: Integer; cdecl;
    {class} function _GetISBT128: Integer; cdecl;
    {class} function _GetIsASCIIReceived: Boolean; cdecl;
    {class} function _GetJAPANPOSTAL: Integer; cdecl;
    {class} function _GetKOREAN3OF5: Integer; cdecl;
    {class} function _GetKeyEvent: Byte; cdecl;
    {class} function _GetLL: Byte; cdecl;
    {class} function _GetLRCCalcEnable: Boolean; cdecl;
    {class} function _GetMATRIX2OF5: Integer; cdecl;
    {class} function _GetMAXICODE: Integer; cdecl;
    {class} function _GetMICROPDF417: Integer; cdecl;
    {class} function _GetMICROQR: Integer; cdecl;
    {class} function _GetMSI: Integer; cdecl;
    {class} function _GetMT_A: Byte; cdecl;
    {class} function _GetMT_N: Byte; cdecl;
    {class} function _GetMT_Q: Byte; cdecl;
    {class} function _GetMT_R: Byte; cdecl;
    {class} function _GetN4313_EnableSymbologies: Byte; cdecl;
    {class} function _GetNEC2OF5: Integer; cdecl;
    {class} function _GetNETHERLANDSKIXCODE: Integer; cdecl;
    {class} function _GetNFC_DetectInfo: TJavaArray<Byte>; cdecl;
    {class} function _GetNFC_GetFirmwareVersion: TJavaArray<Byte>; cdecl;
    {class} function _GetNFC_ReadBlcok: TJavaArray<Byte>; cdecl;
    {class} function _GetNFC_ReadSector: TJavaArray<Byte>; cdecl;
    {class} function _GetNFC_TypeADataExchange: TJavaArray<Byte>; cdecl;
    {class} function _GetNFC_TypeBDataExchange: TJavaArray<Byte>; cdecl;
    {class} function _GetNID_BARCODE_VAL: Byte; cdecl;
    {class} function _GetNID_DEBUG_MSG: Byte; cdecl;
    {class} function _GetNID_NFC_VAL: Byte; cdecl;
    {class} function _GetNMEAFirst: Boolean; cdecl;
    {class} function _GetNMEAString: JString; cdecl;
    {class} function _GetNULL_Result: Byte; cdecl;
    {class} function _GetNotification_NID: Byte; cdecl;
    {class} function _GetNotification_RC: Byte; cdecl;
    {class} function _GetPARA: Byte; cdecl;
    {class} function _GetPDF417: Integer; cdecl;
    {class} function _GetPLESSEY: Integer; cdecl;
    {class} function _GetQRCODE: Integer; cdecl;
    {class} function _GetRC: Byte; cdecl;
    {class} function _GetReceiveToString: JString; cdecl;
    {class} function _GetResponse_Fail: Byte; cdecl;
    {class} function _GetResponse_Result: Byte; cdecl;
    {class} function _GetResponse_Success: Byte; cdecl;
    {class} function _GetSE4710_EnableSymbologies: Byte; cdecl;
    {class} function _GetSE655_EnableSymbologies: Byte; cdecl;
    {class} function _GetSE965_EnableSymbologies: Byte; cdecl;
    {class} function _GetSTRAIGHT2OF5IATA: Integer; cdecl;
    {class} function _GetSTRAIGHT2OF5INDUSTRIAL: Integer; cdecl;
    {class} function _GetSTX: Byte; cdecl;
    {class} function _GetSYSTEM_GetBoardSerialNumber: TJavaArray<Byte>; cdecl;
    {class} function _GetSYSTEM_GetDeviceFirmwareVersion: TJavaArray<Byte>; cdecl;
    {class} function _GetSYSTEM_GetDeviceSerialNumber: TJavaArray<Byte>; cdecl;
    {class} function _GetSYSTEM_GetExportSettings: TJavaArray<Byte>; cdecl;
    {class} function _GetSYSTEM_GetPartNumber: TJavaArray<Byte>; cdecl;
    {class} function _GetSYSTEM_GetScannerSerialNumber: TJavaArray<Byte>; cdecl;
    {class} function _GetSYSTEM_SetImportSettings: TJavaArray<Byte>; cdecl;
    {class} function _GetScannerType: Integer; cdecl;
    {class} function _GetSymbologyID: Integer; cdecl;
    {class} function _GetTELEPEN: Integer; cdecl;
    {class} function _GetTRIOPTIC_TRIOPTICCODE39: Integer; cdecl;
    {class} function _GetUCCCOUPON: Integer; cdecl;
    {class} function _GetUKPOSTAL: Integer; cdecl;
    {class} function _GetUPCA: Integer; cdecl;
    {class} function _GetUPCE: Integer; cdecl;
    {class} function _GetUPCE1: Integer; cdecl;
    {class} function _GetUPUFICSPOSTAL: Integer; cdecl;
    {class} function _GetUSPLANET: Integer; cdecl;
    {class} function _GetUSPOSTNET: Integer; cdecl;
    {class} function _GetUSPS4CB_ONECODE_INTELLIGENTMAIL: Integer; cdecl;
    {class} function LRCCalculator(P1: TJavaArray<Byte>): Byte; cdecl;
    {class} function init: JProtocol; cdecl;
    {class} property AUSTRALIAPOST: Integer read _GetAUSTRALIAPOST;
    {class} property AZTEC: Integer read _GetAZTEC;
    {class} property BLUETOOTH_GetFirmwareVersion: TJavaArray<Byte> read _GetBLUETOOTH_GetFirmwareVersion;
    {class} property BLUETOOTH_GetMACAdress: TJavaArray<Byte> read _GetBLUETOOTH_GetMACAdress;
    {class} property BOOKLAND_EAN: Integer read _GetBOOKLAND_EAN;
    {class} property BatchMode: Integer read _GetBatchMode;
    {class} property CHINA_POST: Integer read _GetCHINA_POST;
    {class} property CHINESE2OF5: Integer read _GetCHINESE2OF5;
    {class} property CMD: Byte read _GetCMD;
    {class} property CODABAR: Integer read _GetCODABAR;
    {class} property CODE11: Integer read _GetCODE11;
    {class} property CODE128: Integer read _GetCODE128;
    {class} property CODE39: Integer read _GetCODE39;
    {class} property CODE93: Integer read _GetCODE93;
    {class} property COMPOSITECCAB: Integer read _GetCOMPOSITECCAB;
    {class} property COMPOSITECCC: Integer read _GetCOMPOSITECCC;
    {class} property COMPOSITETLC39: Integer read _GetCOMPOSITETLC39;
    {class} property CheckDLEACK: Boolean read _GetCheckDLEACK write _SetCheckDLEACK;
    {class} property DATA: Byte read _GetDATA;
    {class} property DATAMATRIX: Integer read _GetDATAMATRIX;
    {class} property DISCRETE2OF5: Integer read _GetDISCRETE2OF5;
    {class} property DateTime: Boolean read _GetDateTime;
    {class} property EAN13: Integer read _GetEAN13;
    {class} property EAN8: Integer read _GetEAN8;
    {class} property ETX: Byte read _GetETX;
    {class} property GS1128: Integer read _GetGS1128;
    {class} property GS1DATABAR14: Integer read _GetGS1DATABAR14;
    {class} property GS1DATABAREXPANDED: Integer read _GetGS1DATABAREXPANDED;
    {class} property GS1DATABARLIMITED: Integer read _GetGS1DATABARLIMITED;
    {class} property GS1DATABAROMNIDIRECTIONAL: Integer read _GetGS1DATABAROMNIDIRECTIONAL;
    {class} property GetBattery: Integer read _GetGetBattery;
    {class} property GetFreeMemoryAvailable: Integer read _GetGetFreeMemoryAvailable;
    {class} property GetNumberOfBarcodes: TJavaArray<Byte> read _GetGetNumberOfBarcodes;
    {class} property GetScannerType: Integer read _GetGetScannerType;
    {class} property HANXIN: Integer read _GetHANXIN;
    {class} property HL: Byte read _GetHL;
    {class} property INTERLEAVED2OF5: Integer read _GetINTERLEAVED2OF5;
    {class} property ISBT128: Integer read _GetISBT128;
    {class} property IsASCIIReceived: Boolean read _GetIsASCIIReceived;
    {class} property JAPANPOSTAL: Integer read _GetJAPANPOSTAL;
    {class} property KOREAN3OF5: Integer read _GetKOREAN3OF5;
    {class} property KeyEvent: Byte read _GetKeyEvent;
    {class} property LL: Byte read _GetLL;
    {class} property LRCCalcEnable: Boolean read _GetLRCCalcEnable;
    {class} property MATRIX2OF5: Integer read _GetMATRIX2OF5;
    {class} property MAXICODE: Integer read _GetMAXICODE;
    {class} property MICROPDF417: Integer read _GetMICROPDF417;
    {class} property MICROQR: Integer read _GetMICROQR;
    {class} property MSI: Integer read _GetMSI;
    {class} property MT_A: Byte read _GetMT_A;
    {class} property MT_N: Byte read _GetMT_N;
    {class} property MT_Q: Byte read _GetMT_Q;
    {class} property MT_R: Byte read _GetMT_R;
    {class} property N4313_EnableSymbologies: Byte read _GetN4313_EnableSymbologies;
    {class} property NEC2OF5: Integer read _GetNEC2OF5;
    {class} property NETHERLANDSKIXCODE: Integer read _GetNETHERLANDSKIXCODE;
    {class} property NFC_DetectInfo: TJavaArray<Byte> read _GetNFC_DetectInfo;
    {class} property NFC_GetFirmwareVersion: TJavaArray<Byte> read _GetNFC_GetFirmwareVersion;
    {class} property NFC_ReadBlcok: TJavaArray<Byte> read _GetNFC_ReadBlcok;
    {class} property NFC_ReadSector: TJavaArray<Byte> read _GetNFC_ReadSector;
    {class} property NFC_TypeADataExchange: TJavaArray<Byte> read _GetNFC_TypeADataExchange;
    {class} property NFC_TypeBDataExchange: TJavaArray<Byte> read _GetNFC_TypeBDataExchange;
    {class} property NID_BARCODE_VAL: Byte read _GetNID_BARCODE_VAL;
    {class} property NID_DEBUG_MSG: Byte read _GetNID_DEBUG_MSG;
    {class} property NID_NFC_VAL: Byte read _GetNID_NFC_VAL;
    {class} property NMEAFirst: Boolean read _GetNMEAFirst;
    {class} property NMEAString: JString read _GetNMEAString;
    {class} property NULL_Result: Byte read _GetNULL_Result;
    {class} property Notification_NID: Byte read _GetNotification_NID;
    {class} property Notification_RC: Byte read _GetNotification_RC;
    {class} property PARA: Byte read _GetPARA;
    {class} property PDF417: Integer read _GetPDF417;
    {class} property PLESSEY: Integer read _GetPLESSEY;
    {class} property QRCODE: Integer read _GetQRCODE;
    {class} property RC: Byte read _GetRC;
    {class} property ReceiveToString: JString read _GetReceiveToString;
    {class} property Response_Fail: Byte read _GetResponse_Fail;
    {class} property Response_Result: Byte read _GetResponse_Result;
    {class} property Response_Success: Byte read _GetResponse_Success;
    {class} property SE4710_EnableSymbologies: Byte read _GetSE4710_EnableSymbologies;
    {class} property SE655_EnableSymbologies: Byte read _GetSE655_EnableSymbologies;
    {class} property SE965_EnableSymbologies: Byte read _GetSE965_EnableSymbologies;
    {class} property STRAIGHT2OF5IATA: Integer read _GetSTRAIGHT2OF5IATA;
    {class} property STRAIGHT2OF5INDUSTRIAL: Integer read _GetSTRAIGHT2OF5INDUSTRIAL;
    {class} property STX: Byte read _GetSTX;
    {class} property SYSTEM_GetBoardSerialNumber: TJavaArray<Byte> read _GetSYSTEM_GetBoardSerialNumber;
    {class} property SYSTEM_GetDeviceFirmwareVersion: TJavaArray<Byte> read _GetSYSTEM_GetDeviceFirmwareVersion;
    {class} property SYSTEM_GetDeviceSerialNumber: TJavaArray<Byte> read _GetSYSTEM_GetDeviceSerialNumber;
    {class} property SYSTEM_GetExportSettings: TJavaArray<Byte> read _GetSYSTEM_GetExportSettings;
    {class} property SYSTEM_GetPartNumber: TJavaArray<Byte> read _GetSYSTEM_GetPartNumber;
    {class} property SYSTEM_GetScannerSerialNumber: TJavaArray<Byte> read _GetSYSTEM_GetScannerSerialNumber;
    {class} property SYSTEM_SetImportSettings: TJavaArray<Byte> read _GetSYSTEM_SetImportSettings;
    {class} property ScannerType: Integer read _GetScannerType;
    {class} property SymbologyID: Integer read _GetSymbologyID;
    {class} property TELEPEN: Integer read _GetTELEPEN;
    {class} property TRIOPTIC_TRIOPTICCODE39: Integer read _GetTRIOPTIC_TRIOPTICCODE39;
    {class} property UCCCOUPON: Integer read _GetUCCCOUPON;
    {class} property UKPOSTAL: Integer read _GetUKPOSTAL;
    {class} property UPCA: Integer read _GetUPCA;
    {class} property UPCE: Integer read _GetUPCE;
    {class} property UPCE1: Integer read _GetUPCE1;
    {class} property UPUFICSPOSTAL: Integer read _GetUPUFICSPOSTAL;
    {class} property USPLANET: Integer read _GetUSPLANET;
    {class} property USPOSTNET: Integer read _GetUSPOSTNET;
    {class} property USPS4CB_ONECODE_INTELLIGENTMAIL: Integer read _GetUSPS4CB_ONECODE_INTELLIGENTMAIL;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/Protocol')]
  JProtocol = interface(JObject)
    ['{10ED5900-C462-4919-8B63-DC5D65A1385E}']
  end;
  TJProtocol = class(TJavaGenericImport<JProtocolClass, JProtocol>) end;

  JPMSyncService_ResultClass = interface(JEnumClass)
    ['{0816D9B0-E230-429C-89BC-A77A0AC49F27}']
    {class} function _GetFail: JPMSyncService_Result; cdecl;
    {class} function _GetNotConnected: JPMSyncService_Result; cdecl;
    {class} function _GetNotSend: JPMSyncService_Result; cdecl;
    {class} function _GetSuccess: JPMSyncService_Result; cdecl;
    {class} function _GetTimeout: JPMSyncService_Result; cdecl;
    {class} function valueOf(P1: JString): JPMSyncService_Result; cdecl;
    {class} function values: TJavaObjectArray<JPMSyncService_Result>; cdecl;
    {class} property Fail: JPMSyncService_Result read _GetFail;
    {class} property NotConnected: JPMSyncService_Result read _GetNotConnected;
    {class} property NotSend: JPMSyncService_Result read _GetNotSend;
    {class} property Success: JPMSyncService_Result read _GetSuccess;
    {class} property Timeout: JPMSyncService_Result read _GetTimeout;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/Result')]
  JPMSyncService_Result = interface(JEnum)
    ['{02268845-1A0C-420B-BEBB-9FC2EFE16552}']
  end;
  TJPMSyncService_Result = class(TJavaGenericImport<JPMSyncService_ResultClass, JPMSyncService_Result>) end;

  JSendCommandClass = interface(JObjectClass)
    ['{801E77A7-D6CE-4015-9BCF-BF29B4D7585A}']
    {class} function _GetProtocolResult: Integer; cdecl;
    {class} function _GethexArray: TJavaArray<Char>; cdecl;
    {class} function _GetmACKEnable: Boolean; cdecl;
    {class} function _GetmBluetoothChatService: JBluetoothChatService; cdecl;
    {class} procedure _SetmBluetoothChatService(Value: JBluetoothChatService); cdecl;
    {class} function _GetmContext: JContext; cdecl;
    {class} function _GetmHandler: JHandler; cdecl;
    {class} function BTGetFWVersion: JString; cdecl;
    {class} function BTGetMACAddress: JString; cdecl;
    {class} function BTSetConnectAlert(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function BTSetDisconnectButton(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function BTSetPower(P1: Integer): JPMSyncService_Result; cdecl;
    {class} procedure BarcodeAKCMessage(P1: Byte); cdecl;
    {class} function GPSReset: JPMSyncService_Result; cdecl;
    {class} function GPSSetBypassData(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function GPSSetPower(P1: Integer): JPMSyncService_Result; cdecl;
    {class} procedure NFCAKCMessage(P1: Byte); cdecl;
    {class} function NFCEnableAutoDetect(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function NFCEnableTagType(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function NFCGetDetectInfo: TJavaArray<Byte>; cdecl;
    {class} function NFCGetFWVersion: JString; cdecl;
    {class} function NFCMifareClassicAuthenticateBlock(P1: Integer; P2: Byte): JPMSyncService_Result; cdecl;
    {class} function NFCMifareClassicAuthenticateSector(P1: Integer; P2: Byte): JPMSyncService_Result; cdecl;
    {class} function NFCMifareClassicReadBlock(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function NFCMifareClassicReadSector(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function NFCMifareClassicSetKey(P1: TJavaArray<Byte>): JPMSyncService_Result; cdecl;
    {class} function NFCReadComplete: JPMSyncService_Result; cdecl;
    {class} function NFCSetPower(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function NFCTypeADataExchange(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function NFCTypeBDataExchange(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} procedure NotiASCII(P1: TJavaArray<Byte>); cdecl;
    {class} procedure NotificationACK; cdecl;
    {class} procedure PacketData(P1: TJavaArray<Byte>); cdecl;
    {class} function SE4710EnableSymbologies(P1: Integer; P2: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanEnableAutoScan(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanEnableSymbologies(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetAdaptiveScanning(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetAutoScanTimeInterval(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetCheckDuplicate(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetDataFormat(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetEnableScanner(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetHandshake(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetInverse1D(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetLED(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetLinearSecurityLevel(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetLock(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetPickListMode(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetPowerSaveMode(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetPowerSaveTimeout(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetPrefixLabel(P1: JString): JPMSyncService_Result; cdecl;
    {class} function ScanSetRedundancyLevel(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetScanAngle(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetSecurityLevel(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetSuffixLabel(P1: JString): JPMSyncService_Result; cdecl;
    {class} function ScanSetSymbologyOptions(P1: Integer; P2: TJavaArray<Byte>): JPMSyncService_Result; cdecl;
    {class} function ScanSetTerminator(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetTransmitBarcodeID(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function ScanSetTrigger: JPMSyncService_Result; cdecl;
    {class} function ScanSetTriggerTimeout(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function ScanSetWedgeStore(P1: Integer): JPMSyncService_Result; cdecl;
    {class} procedure SendCommandInit(P1: JBluetoothChatService; P2: JHandler); cdecl; overload;
    {class} procedure SendCommandInit(P1: JBluetoothChatService; P2: JHandler; P3: Boolean; P4: Boolean); cdecl; overload;
    {class} function SysFactoryReset: JPMSyncService_Result; cdecl;
    {class} function SysGetBatteryStatus: Integer; cdecl;
    {class} function SysGetDeviceFWVersion: JString; cdecl;
    {class} function SysGetDeviceFirstFWVersion: JString; cdecl;
    {class} function SysGetDeviceSerialNumber: JString; cdecl;
    {class} function SysGetDeviceSettings: JString; cdecl;
    {class} function SysGetFreeMemory: Integer; cdecl;
    {class} function SysGetNumberOfStoredBarcodes: Integer; cdecl;
    {class} function SysGetPartNumber: JString; cdecl;
    {class} function SysGetScannerType: Integer; cdecl;
    {class} function SysRequestAllScanData: JPMSyncService_Result; cdecl;
    {class} function SysResetMemory: JPMSyncService_Result; cdecl;
    {class} function SysSetAlertCommand(P1: Integer; P2: Integer; P3: JString; P4: JString): JPMSyncService_Result; cdecl;
    {class} function SysSetAlertMessage(P1: Integer; P2: Integer; P3: JString; P4: JString): JPMSyncService_Result; cdecl;
    {class} function SysSetAlertMessageEx(P1: Integer; P2: Integer; P3: JString; P4: JString; P5: JString; P6: JString): JPMSyncService_Result; cdecl;
    {class} function SysSetAutoEXIT(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function SysSetBeepVolume(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function SysSetButtonLock(P1: Boolean): JPMSyncService_Result; cdecl;
    {class} function SysSetDateTime(P1: JString): JPMSyncService_Result; cdecl;
    {class} function SysSetDateTimeFirst(P1: JString): JPMSyncService_Result; cdecl;
    {class} function SysSetDeviceSettings(P1: JString): JPMSyncService_Result; cdecl;
    {class} function SysSetDisplayFormat(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function SysSetLanguage(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function SysSetResetMemory: JPMSyncService_Result; cdecl;
    {class} function SysSetScanFailVibration(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function SysSetScanSuccessVibration(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function SysSetVibratorFail(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function SysSetVibratorSuccess(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function USBSetMode(P1: Integer): JPMSyncService_Result; cdecl;
    {class} function bytArrayToHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function init: JSendCommand; cdecl;
    {class} property ProtocolResult: Integer read _GetProtocolResult;
    {class} property hexArray: TJavaArray<Char> read _GethexArray;
    {class} property mACKEnable: Boolean read _GetmACKEnable;
    {class} property mBluetoothChatService: JBluetoothChatService read _GetmBluetoothChatService write _SetmBluetoothChatService;
    {class} property mContext: JContext read _GetmContext;
    {class} property mHandler: JHandler read _GetmHandler;
  end;

  [JavaSignature('com/PointMobile/PMSyncService/SendCommand')]
  JSendCommand = interface(JObject)
    ['{5CF4E157-AEB1-4CC7-8392-FCD83526757D}']
  end;
  TJSendCommand = class(TJavaGenericImport<JSendCommandClass, JSendCommand>) end;

  // java.lang.StringBuffer
  // java.lang.StringBuilder
implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JAccount', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JAccount));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService_1', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService_1));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService_ConnectThread', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService_ConnectThread));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService_ConnectedThread', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JBluetoothChatService_ConnectedThread));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JProtocol', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JProtocol));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JPMSyncService_Result', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JPMSyncService_Result));
  TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JSendCommand', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JSendCommand));
  //TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JStringBuffer', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JStringBuffer));
  //TRegTypes.RegisterType('Androidapi.JNI.PM3SDK_BI07.JStringBuilder', TypeInfo(Androidapi.JNI.PM3SDK_BI07.JStringBuilder));
end;

initialization
  RegisterTypes;
end.

