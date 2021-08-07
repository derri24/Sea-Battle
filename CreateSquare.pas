unit CreateSquare;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Play, ConservationPlaySquares,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type

    TCreateSquareForm = class(TForm)
        TextLabel1: TLabel;
        SquareGrid: TStringGrid;
        ClearButton: TButton;
        ShipButton: TButton;
        OKButton: TButton;
        TextLabel2: TLabel;
        TextLabel3: TLabel;
        TextLabel5: TLabel;
        TextLabel4: TLabel;
        TextLabel6: TLabel;
        TextLabel7: TLabel;
        procedure FormCreate(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure ShipButtonClick(Sender: TObject);
        Procedure PrintShips;
        procedure ClearButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    CreateSquareForm: TCreateSquareForm;
    ShipArr: TShipArr;
    Size1, Size2, Size3, Size4: Integer;
    Temp: Byte;

implementation

{$R *.dfm}

Procedure TCreateSquareForm.PrintShips;
var
    I, j: Integer;
begin
    for I := 1 to 10 do
        for j := 1 to 10 do
            SquareGrid.Cells[I, j] := ShipArr[I, j];
    TextLabel3.Caption := 'Четурёхпалубные -  ' + IntToStr(Size4);
    TextLabel4.Caption := 'Трёхпалубные -  ' + IntToStr(Size3);
    TextLabel5.Caption := 'Двухпалубные -  ' + IntToStr(Size2);
    TextLabel6.Caption := 'Однопалубные -  ' + IntToStr(Size1);

end;

procedure ClearShips;
var
    I, j: Integer;
begin
    Size1 := 4;
    Size2 := 3;
    Size3 := 2;
    Size4 := 1;
    for I := 1 to 10 do
        for j := 1 to 10 do
            ShipArr[I, j] := #0;
end;

procedure TCreateSquareForm.ClearButtonClick(Sender: TObject);
begin
    ClearShips;
    PrintShips;
end;

procedure TCreateSquareForm.FormCreate(Sender: TObject);
var
    I: Integer;
begin
    Size1 := 4;
    Size2 := 3;
    Size3 := 2;
    Size4 := 1;
    Temp := 1;
    PrintShips;
    For I := 1 to SquareGrid.ColCount - 1 do
        SquareGrid.Cells[I, 0] := chr(ord('а') + I - 1);
    For I := 1 to SquareGrid.RowCount - 1 do
        SquareGrid.Cells[0, I] := IntToStr(I);

end;

Function CheckCountShip: Boolean;
begin
    if ((Size1 + Size2 + Size4 + Size4) <> 0) then
        Result := False
    else
        Result := True;

end;

procedure TCreateSquareForm.OKButtonClick(Sender: TObject);
Var
    PlayForm: TPlayForm;
    I, j: Integer;
    IsCorrectCountShip: Boolean;
begin
    IsCorrectCountShip := CheckCountShip;
    if IsCorrectCountShip = True then
    begin
        if Temp = 1 then
        begin
            FirstUnitSquare := ShipArr;
            ClearShips;
            PrintShips;
            Temp := 2;
            TextLabel7.Caption := 'Игрок: 2';
        end
        else
        begin
            SecondUnitSquare := ShipArr;
            PlayForm := TPlayForm.Create(Self);
            PlayForm.Show;
            ClearShips;
            Self.Hide;
        end;
    end
    else
        ShowMessage('Ошибка! Не все корабли расставлены. Повторите попытку');
end;

Function CheckSelection(Left, Right, Top, Bottom: Integer): Boolean;
begin
    if ((Bottom - Top + 1) > 4) or ((Right - Left + 1) > 4) or
      (((Bottom - Top + 1) > 1) and ((Right - Left + 1) > 1)) then
        Result := False
    else
        Result := True;

end;

Function CheckShipPart(X, Y: Integer): Boolean;

Begin
    if (ShipArr[X, Y] = 'X') or (ShipArr[X - 1, Y + 1] = 'X') or
      (ShipArr[X, Y + 1] = 'X') or (ShipArr[X + 1, Y + 1] = 'X') or
      (ShipArr[X - 1, Y] = 'X') or (ShipArr[X + 1, Y] = 'X') or
      (ShipArr[X - 1, Y - 1] = 'X') or (ShipArr[X, Y - 1] = 'X') or
      (ShipArr[X + 1, Y - 1] = 'X') then
        Result := False
    else
        Result := True;

End;

Function CheckShip(Left, Right, Top, Bottom: Integer): Boolean;
var
    I: Integer;
    IsCorrect1, IsCorrect2: Boolean;
begin
    IsCorrect1 := True;
    IsCorrect2 := True;
    for I := Left to Right do
        if CheckShipPart(I, Top) = False then
            IsCorrect1 := False;
    for I := Top to Bottom do
        if CheckShipPart(Left, I) = False then
            IsCorrect2 := False;
    if (IsCorrect1 = True) And (IsCorrect2 = True) then
        Result := True
    else
        Result := False;

end;

function CheckSize(Left, Right, Top, Bottom: Integer): Boolean;
var
    LenghtShip: Integer;
begin
    Result := True;
    if Left = Right then
        LenghtShip := (Bottom - Top + 1)
    else
        LenghtShip := (Right - Left + 1);
    if LenghtShip = 4 then
    begin
        if Size4 <= 0 then
            Result := False
        else
            Dec(Size4)
    end;
    if LenghtShip = 3 then
    begin
        if Size3 <= 0 then
            Result := False
        else
            Dec(Size3);
    end;
    if LenghtShip = 2 then
    begin
        if Size2 <= 0 then
            Result := False
        else
            Dec(Size2);
    end;
    if LenghtShip = 1 then
    begin
        if Size1 <= 0 then
            Result := False
        else
            Dec(Size1);
    end;
end;

Procedure SetShip(Left, Right, Top, Bottom: Integer);
var
    I: Integer;
begin
    for I := Left to Right do
        ShipArr[I, Top] := 'X';
    for I := Top to Bottom do
        ShipArr[Left, I] := 'X';
end;

procedure TCreateSquareForm.ShipButtonClick(Sender: TObject);
var
    IsCorrect1, IsCorrect2, IsCorrect3: Boolean;
begin
    IsCorrect1 := CheckSelection(SquareGrid.Selection.Left,
      SquareGrid.Selection.Right, SquareGrid.Selection.Top,
      SquareGrid.Selection.Bottom);
    IsCorrect2 := CheckShip(SquareGrid.Selection.Left,
      SquareGrid.Selection.Right, SquareGrid.Selection.Top,
      SquareGrid.Selection.Bottom);
    if (IsCorrect1 = True) and (IsCorrect2 = True) then
    Begin
        IsCorrect3 := CheckSize(SquareGrid.Selection.Left,
          SquareGrid.Selection.Right, SquareGrid.Selection.Top,
          SquareGrid.Selection.Bottom);
        if IsCorrect3 = True then
            SetShip(SquareGrid.Selection.Left, SquareGrid.Selection.Right,
              SquareGrid.Selection.Top, SquareGrid.Selection.Bottom);
        PrintShips;
    End
    else if (IsCorrect1 = False) and (IsCorrect2 = True) then
        ShowMessage('Некорректное выделение корабля. Повторите попытку')
    else if (IsCorrect1 = True) and (IsCorrect2 = False) then
        ShowMessage
          ('Корабль не может касаться других кораблей. Повторите попытку');
    if (IsCorrect3 = False) then
        ShowMessage('Корабля такого вида нет в наличии. Повторите попытку')

end;

end.
