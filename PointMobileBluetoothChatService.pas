{*******************************************************}
{                                                       }
{           Devgear PointMobile(BI-07) barcorder        }
{ Copyright(c) 2017 Devgear, Inc.                       }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

// Author : Humphrey Kim(hjfactory@gmail.com)
// Date : 2017.03
// Description
//  - 포인트 모바일 바코더 연동 라이브러리
//  - Bluetooth, Blutooth admin 권한 줄 것(프로젝트 옵션)
// History
//  - 2017.03 : Initial creation

// ToDo
//  - 예외처리 보강
//  - 컴포넌트화
//  - Export Event 추가

unit PointMobileBluetoothChatService;

interface

uses
  System.SysUtils,
  System.Classes,

  Androidapi.JNI.PM3SDK_BI07,

  System.Bluetooth,
  System.Android.Bluetooth,
  Androidapi.JNI.Bluetooth,

  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.Widget,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  androidapi.JNIBridge;

const
  MESSAGE_STATE_CHANGE = 1;
  MESSAGE_BARCODE = 2;
  MESSAGE_WRITE = 3;
  MESSAGE_DEVICE_NAME = 4;
  MESSAGE_SEND = 5;
  MESSAGE_TOAST = 6;
  MESSAGE_FAIL = 7;
  MESSAGE_SUCCESS = 8;
  MESSAGE_NOTRESP = 9;
  MESSAGE_FRAMEERROR = 10;
  MESSAGE_BTCANTABALIABLE = 11;
  MESSAGE_RECEIVEDEBUG = 12;
  MESSAGE_DISPLAY = 13;
  MESSAGE_WRITEDEBUG = 14;
  MESSAGE_BATCH = 15;
  MESSAGE_NFC = 16;
  MESSAGE_GPS_NMEA = 17;
  MESSAGE_KEY_EVENT = 18;
  MESSAGE_TIMER_END = 19;
  MESSAGE_NFC_SEND = 20;
  MESSAGE_KEY_STANDARD_EVENT = 21;

  STATE_NONE = 0;
  STATE_LISTEN = 1;
  STATE_CONNECTING = 2;
  STATE_CONNECTED = 3;

type
  TReadBarcordEvent = procedure(AValue: string) of object;
  THandleMessageEvent = procedure(msg: JMessage) of object;

  TCharServiceHandlerCallback = class(TJavaLocal, JHandler_Callback)
  private
    FOnHandleMessage: THandleMessageEvent;
  public
    // 인터페이스 상속받은 메소드는 public에 둘 것
      // private에 두면 Segmentation fault (11) 오류 발생
    function handleMessage(msg: JMessage): Boolean; cdecl;

    property OnHandleMessage: THandleMessageEvent read FOnHandleMessage write FOnHandleMessage;
  end;

  TPointMobileBluetoothChatService = class
  private
    FBluetoothManager: TBluetoothManager;
    FBluetoothAdapter: TBluetoothAdapter;
    FBluetoothDevice: TBluetoothDevice;

    FOnReadBarcord: TReadBarcordEvent;

    procedure ProcessHandlerStateChage;
    procedure ProcessHandlerBarcord(AJObject: JObject; ALen: Integer);

    procedure DoReadBarcord(AValue: string);
//  strict private
  private
    FHandler: JHandler;
    FCallback: TCharServiceHandlerCallback;

    FChatService: JBluetoothChatService;
  public
    procedure InitBluetooth;

    procedure SetUpChatService;
    procedure ChatServiceHandleMessage(msg: JMessage);

    procedure ConnectChatService;

    procedure StartChatService;

    procedure RunScan;

    procedure ClearBluetooth;

    property OnReadBarcord: TReadBarcordEvent read FOnReadBarcord write FOnReadBarcord;
  end;

function JObjectToStr(const AJObject: JObject): string;
procedure ToastMessage(const AValue: string);

implementation

uses
  FMX.Helpers.Android,
  FMX.Types;

function JObjectToStr(const AJObject: JObject): string;
var
  LObj: ILocalObject;
  ObjID: Pointer;
  JBytes: TJavaArray<Byte>;
  JData: JString;
begin
  Result := '';

  if JStringToString(AJObject.getClass.getCanonicalName) <> 'byte[]' then
    Exit;

  if AJObject.QueryInterface(ILocalObject, LObj) = 0  then
    ObjID := LObj.GetObjectID
  else
    Exit;

  JBytes := TJavaArray<Byte>(WrapJNIArray(ObjID, TypeInfo(TJavaArray<Byte>)));
  JData := TJString.JavaClass.init(JBytes, 0, JBytes.Length);
  Result := JStringToString(JData);
end;

procedure ToastMessage(const AValue: string);
var
  Toast: JToast;
begin
  CallInUiThread(procedure
  begin
    Toast := TJToast.JavaClass.makeText(SharedActivityContext, StrToJCharSequence(AValue), TJToast.JavaClass.LENGTH_SHORT);
    Toast.show;
  end);
end;

{ TCharServiceHandler }

function TCharServiceHandlerCallback.handleMessage(msg: JMessage): Boolean;
begin
  Result := True;
  if Assigned(FOnHandleMessage) then
    FOnHandleMessage(msg);
end;

{ TPointMobileBluetoothChatService }

procedure TPointMobileBluetoothChatService.ChatServiceHandleMessage(
  msg: JMessage);
var
  DeviceName, JData: JString;
begin
  Log.d(msg.what.ToString);
  case msg.what of
  MESSAGE_STATE_CHANGE:
    ProcessHandlerStateChage;
  MESSAGE_BARCODE:
    ProcessHandlerBarcord(msg.obj, msg.arg1);
  MESSAGE_DEVICE_NAME:
    begin
      DeviceName := msg.getData.getString(StringToJString('device_name'));
      Log.d('Device name: ' + JStringToString(DeviceName));
    end;

  // 필요한 이벤트 추가 할 것
  end;
end;

procedure TPointMobileBluetoothChatService.InitBluetooth;
begin
  FBluetoothManager := TBluetoothManager.Current;
  if not (FBluetoothManager.ConnectionState = TBluetoothConnectionState.Connected) then
    Exit;

  Log.d('Connected Bluetooth: ' + FBluetoothManager.CurrentAdapter.AdapterName);

  FBluetoothAdapter := FBluetoothManager.CurrentAdapter;

  if not Assigned(FBluetoothAdapter) then
  begin
    Log.d('BlueTooth is not available');
    Exit;
  end;
end;

procedure TPointMobileBluetoothChatService.ProcessHandlerBarcord(
  AJObject: JObject; ALen: Integer);
var
  Data: string;
begin
  Data := JObjectToStr(AJObject);
  DoReadBarcord(Data);
end;

procedure TPointMobileBluetoothChatService.ProcessHandlerStateChage;
begin
  case FChatService.getState of
  STATE_NONE: ToastMessage('STATE_NONE');
  STATE_LISTEN: ToastMessage('STATE_LISTEN');
  STATE_CONNECTING: ToastMessage('STATE_CONNECTING');
  STATE_CONNECTED: ToastMessage('STATE_CONNECTED');
  end;
end;

procedure TPointMobileBluetoothChatService.SetupChatService;
var
  Context: JContext;
  Looper: JLooper;
begin
  if FBluetoothAdapter.State = TBluetoothAdapterState.Off then
  begin
    Log.d('Turn on bluetooth');
    Exit;
  end;

  FCallback := TCharServiceHandlerCallback.Create;
  FCallback.OnHandleMessage := ChatServiceHandleMessage;

  Context := TAndroidHelper.Context;
  Looper := TJLooper.JavaClass.getMainLooper;
  FHandler := TJHandler.JavaClass.init(Looper, FCallback);

  FChatService := TJBluetoothChatService.JavaClass.init(Context, FHandler);

  TJSendCommand.JavaClass.SendCommandInit(FChatService, FHandler);
end;

procedure TPointMobileBluetoothChatService.ConnectChatService;
var
  I: Integer;
  DeviceName: string;
  ChatServiceState: Integer;
begin
  if FBluetoothAdapter.PairedDevices.Count = 0 then
    Exit;

  FBluetoothDevice := FBluetoothAdapter.PairedDevices[0] as TBluetoothDevice;

  FChatService.connectByAddress(StringToJString(FBluetoothDevice.Address));
end;

procedure TPointMobileBluetoothChatService.StartChatService;
begin
  if Assigned(FChatService) then
  begin
    if FChatService.getState = TJBluetoothChatService.JavaClass.STATE_NONE then
      FChatService.start;
  end;
end;

procedure TPointMobileBluetoothChatService.RunScan;
var
  ResultCode: JPMSyncService_Result;
begin
  if FChatService.getState <> TJBluetoothChatService.JavaClass.STATE_CONNECTED then
  begin
    ToastMessage('Not Conneted Bluetooth.');
    Exit;
  end;

  ResultCode := TJSendCommand.JavaClass.ScanSetTrigger;
  if ResultCode = TJPMSyncService_Result.JavaClass.Fail then
  begin
    ToastMessage('Retry scan trigger');
    ResultCode := TJSendCommand.JavaClass.ScanSetTrigger;
    if ResultCode = TJPMSyncService_Result.JavaClass.Fail then
      ToastMessage('Failed scan trigger');
  end;
end;

procedure TPointMobileBluetoothChatService.ClearBluetooth;
begin
  FBluetoothManager.DisposeOf;
end;

procedure TPointMobileBluetoothChatService.DoReadBarcord(AValue: string);
begin
  TThread.Queue(nil, procedure
    begin
      if Assigned(FOnReadBarcord) then
        FOnReadBarcord(AValue);
    end);
end;

end.
