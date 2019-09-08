program thtk_gui;

uses
  Vcl.Forms,
  umain in 'umain.pas' {Main},
  uentry in 'uentry.pas' {Entry},
  uthtkpath in 'uthtkpath.pas' {PathTHTK},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Touhou Toolkit GUI';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TEntry, Entry);
  Application.CreateForm(TPathTHTK, PathTHTK);
  Application.Run;
end.
