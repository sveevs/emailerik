unit kodir;

interface

implementation

uses SysUtils,emaill,Messages;

const

Koi: array[0..66] of Char = (
'T', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�');

Win: array[0..66] of Char = (
'�', '�', 'T', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
'�', '�', '�', '�', '�', '�', '�');


function WinToKoi(Str: string): string;
var
 i, j, index: Integer;
begin
Result := '';
  for i := 1 to Length(Str) do
    begin
     index := -1;
      for j := Low(Win) to High(Win) do
        if Win[j] = Str[i] then
          begin
            index := j;
            Break;
          end;

        if index = -1 then
          Result := Result + Str[i]
        else
          Result := Result + Koi[index];
    end;
end;

function KoiToWin(Str: string): string;
var
  i, j, index: Integer;
begin
Result := '';

for i := 1 to Length(Str) do
  begin
    index := -1;
      for j := Low(Win) to High(Win) do
        if Koi[j] = Str[i] then
          begin
            index := j;
            Break;
          end;

        if index = -1 then
            Result := Result + Str[i]
        else
            Result := Result + Win[index];
  end;
end;

begin
//smtp_sv.Show;
end.
