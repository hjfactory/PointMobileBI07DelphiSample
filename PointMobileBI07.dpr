program PointMobileBI07;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form1},
  Androidapi.JNI.PM3SDK_BI07 in 'Androidapi.JNI.PM3SDK_BI07.pas',
  System.Android.Bluetooth in 'System.Android.Bluetooth.pas',
  PointMobileBluetoothChatService in 'PointMobileBluetoothChatService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
