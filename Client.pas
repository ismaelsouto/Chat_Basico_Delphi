unit Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TForm2 = class(TForm)
    ClientSocket1: TClientSocket;
    Button2: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    Str: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Str := Edit1.Text;
  Memo1.Text := Memo1.Text + 'Yo: ' + Str + #13#10;
  Edit1.Text := ''; // Clears the edit box
  ClientSocket1.Socket.SendText(Str); // Send the messages to the server
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  // 127.0.0.1 is the standard IP address to loop back to your own machine
  ClientSocket1.Address := '127.0.0.1';
  ClientSocket1.Port := 39888;
  ClientSocket1.Active := True; // Activates the client

  if (ClientSocket1.Socket.Connected = True) then
  begin
    Str := 'Desconectado';
    ClientSocket1.Active := False; // Disconnects the client
    Button2.Caption := 'Conectado';
  end;
end;

procedure TForm2.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Text := Memo1.Text + 'Desconectado' + #13#10;
  Socket.SendText(Str); // Send the “Disconnected” message to the server
  // str is set to “Disconnected” when the Disconnect button is pressed
  // A client cannot send messages if it is not connected to a server
  Button1.Enabled := False;
  Edit1.Enabled := False;
  Button2.Caption := 'Conectado';
end;

procedure TForm2.ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  ClientSocket1.Active := False;
  // This can happen when no active server is started
  Memo1.Text := Memo1.Text + 'No se encontró conexión' + #13#10;
end;

procedure TForm2.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
  // Reads and displays the message received from the server;
  Memo1.Text := Memo1.Text + 'Servidor: ' + Socket.ReceiveText + #13#10;
end;

end.
