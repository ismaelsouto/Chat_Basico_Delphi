program Chat_Client;

uses
  Vcl.Forms,
  Client in 'Client.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
