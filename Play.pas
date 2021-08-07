unit Play;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, ConservationPlaySquares,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
    TPlayForm = class(TForm)
        FirstSquareGrid: TStringGrid;
        SecondSquareGrid: TStringGrid;
        TextLabel2: TLabel;
        TextLabel3: TLabel;
        TextLabel1: TLabel;
        ExitButton: TButton;
        procedure FormCreate(Sender: TObject);

        procedure Fire(X, Y: integer; NSquare: Byte);
        procedure FirstSquareGridSelectCell(Sender: TObject;
          ACol, ARow: integer; var CanSelect: Boolean);
        procedure SecondSquareGridSelectCell(Sender: TObject;
          ACol, ARow: integer; var CanSelect: Boolean);
        function CheckReplayFirstSquare(X, Y: integer): Boolean;
        function CheckReplaySecondSquare(X, Y: integer): Boolean;
        procedure ExitButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    PlayForm: TPlayForm;
    MoveNumber: Byte;
    FirstCount, SecondCount: integer;

implementation

{$R *.dfm}

procedure TPlayForm.FormCreate(Sender: TObject);
var
    i: integer;
begin
    MoveNumber := 1;
    FirstCount := 0;
    SecondCount := 0;
    TextLabel1.Caption := 'Очередь хода: игрок ' + IntToStr(MoveNumber);
    For i := 1 to FirstSquareGrid.ColCount - 1 do
    begin
        FirstSquareGrid.Cells[i, 0] := chr(ord('а') + i - 1);
        SecondSquareGrid.Cells[i, 0] := chr(ord('а') + i - 1);
    end;
    For i := 1 to FirstSquareGrid.RowCount - 1 do
    begin
        FirstSquareGrid.Cells[0, i] := IntToStr(i);
        SecondSquareGrid.Cells[0, i] := IntToStr(i);
    end;

end;

procedure TPlayForm.Fire(X, Y: integer; NSquare: Byte);
begin
    if (NSquare = 1) and (MoveNumber = 2) then
    begin
        if (FirstUnitSquare[X, Y] = 'X') then
        begin
            FirstSquareGrid.Cells[X, Y] := 'X';
            Inc(SecondCount);
            MoveNumber := 2;
        end
        else
        begin
            FirstSquareGrid.Cells[X, Y] := '  •';
            MoveNumber := 1;
        end;
        TextLabel1.Caption := 'Очередь хода: игрок ' + IntToStr(MoveNumber);
    end
    else if (NSquare = 2) and (MoveNumber = 1) then
    begin
        if (SecondUnitSquare[X, Y] = 'X') then
        begin
            SecondSquareGrid.Cells[X, Y] := 'X';
            Inc(FirstCount);
            MoveNumber := 1;
        end
        else
        begin
            SecondSquareGrid.Cells[X, Y] := '  •';
            MoveNumber := 2;
        end;
        TextLabel1.Caption := 'Очередь хода: игрок ' + IntToStr(MoveNumber);
    end;
    if FirstCount = 20 then
        ShowMessage('Победил первый игрок!')
    else if (SecondCount = 20) then
        ShowMessage('Победил второй игрок!');

end;

function TPlayForm.CheckReplayFirstSquare(X, Y: integer): Boolean;
begin
    if (FirstSquareGrid.Cells[X, Y] <> '') and (MoveNumber=2) then
    begin
        Result := False;
        ShowMessage
          ('Выбранная ячейка уже проверена на наличие кораблей. Повторите попытку');
    end
    else
        Result := True;
end;

function TPlayForm.CheckReplaySecondSquare(X, Y: integer): Boolean;
begin
    if (SecondSquareGrid.Cells[X, Y] <> '') and  (MoveNumber=1) then
    begin
        Result := False;
        ShowMessage
          ('Выбранная ячейка уже проверена на наличие кораблей. Повторите попытку');
    end
    else
        Result := True;
end;

procedure TPlayForm.ExitButtonClick(Sender: TObject);
begin
    if (MoveNumber = 1) then
        ShowMessage('Победил второй игрок!')
    else
        ShowMessage('Победил первый игрок!');
end;

procedure TPlayForm.FirstSquareGridSelectCell(Sender: TObject;
  ACol, ARow: integer; var CanSelect: Boolean);
begin
    CanSelect := CheckReplayFirstSquare(ACol, ARow);
    if CanSelect = True then
        Fire(ACol, ARow, 1);
end;

procedure TPlayForm.SecondSquareGridSelectCell(Sender: TObject;
  ACol, ARow: integer; var CanSelect: Boolean);
begin
    CanSelect := CheckReplaySecondSquare(ACol, ARow);
    if CanSelect = True then
        Fire(ACol, ARow, 2);

end;

end.
