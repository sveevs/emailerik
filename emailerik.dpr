program emailerik;

uses
  Forms,
  emaill in 'emaill.pas' {SMTP_SV},
  kodir in 'kodir.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSMTP_SV, SMTP_SV);
  Application.Run;
end.
