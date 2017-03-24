{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Layouts,
  PointMobileBluetoothChatService;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FBChatService: TPointMobileBluetoothChatService;

    procedure InitBluetooth;

    procedure SetUpChatService;
//    procedure ChatServiceHandleMessage(msg: JMessage);

    procedure ConnectChatService;

    procedure StartChatService;

    procedure ClearBluetooth;

    procedure ReadBarcord(AValue: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button2Click(Sender: TObject);
begin
  SetUpChatService;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  StartChatService;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  TThread.Synchronize(nil, ConnectChatService);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  InitBluetooth;

  SetUpChatService;

  TThread.Synchronize(nil , ConnectChatService);

  StartChatService;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  FBChatService.RunScan;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  InitBluetooth;
end;

procedure TForm1.InitBluetooth;
begin
  FBChatService := TPointMobileBluetoothChatService.Create;
  FBChatService.OnReadBarcord := ReadBarcord;
  FBChatService.InitBluetooth;
end;

procedure TForm1.ReadBarcord(AValue: string);
begin
  Memo1.Lines.Add(AValue);
  Memo1.ScrollTo(0, Memo1.ViewportPosition.Y, False);
end;

procedure TForm1.ClearBluetooth;
begin
  FBChatService.ClearBluetooth;
  FBChatService.DisposeOf;
end;

procedure TForm1.ConnectChatService;
begin
  FBChatService.ConnectChatService;
end;

procedure TForm1.SetUpChatService;
begin
  FBChatService.SetUpChatService;
end;

procedure TForm1.StartChatService;
begin
  FBChatService.StartChatService;
end;

end.
