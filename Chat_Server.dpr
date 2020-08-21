program Chat_Server;

uses
  Vcl.Forms,
  Server in 'Server.pas' {Servidor},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TServidor, Servidor);
  Application.Run;
end.
