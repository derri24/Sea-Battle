program Sea_Battle;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  CreateSquare in 'CreateSquare.pas' {CreateSquareForm},
  Play in 'Play.pas' {PlayForm},
  ConservationPlaySquares in 'ConservationPlaySquares.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCreateSquareForm, CreateSquareForm);
  Application.CreateForm(TPlayForm, PlayForm);
  Application.Run;
end.
