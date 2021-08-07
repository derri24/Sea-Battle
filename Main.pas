unit Main;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, CreateSquare,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
    TMainForm = class(TForm)
    Начать: TButton;
    Image1: TImage;
        procedure НачатьClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.НачатьClick(Sender: TObject);
var
    CreateSquareForm: TCreateSquareForm;
begin
    CreateSquareForm := TCreateSquareForm.Create(Self);
    CreateSquareForm.Show;
end;

end.
