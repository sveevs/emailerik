unit kodir;

interface

implementation

uses SysUtils,emaill,Messages;

const

Koi: array[0..66] of Char = (
'T', '¨', '¸', 'À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ',
'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ð',
'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', '×', 'Ø', 'Ù', 'Ú',
'Û', 'Ü', 'Ý', 'Þ', 'ß', 'à', 'á', 'â', 'ã', 'ä',
'å', 'æ', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î',
'ï', 'ð', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', '÷', 'ø',
'ù', 'ú', 'û', 'ü', 'ý', 'þ', 'ÿ');

Win: array[0..66] of Char = (
'¸', '¨', 'T', 'þ', 'à', 'á', 'ö', 'ä', 'å', 'ô',
'ã', 'õ', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï',
'ÿ', 'ð', 'ñ', 'ò', 'ó', 'æ', 'â', 'ü', 'û', 'ç',
'ø', 'ý', 'ù', '÷', 'ú', 'Þ', 'À', 'Á', 'Ö', 'Ä',
'Å', 'Ô', 'Ã', 'Õ', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í',
'Î', 'Ï', 'ß', 'Ð', 'Ñ', 'Ò', 'Ó', 'Æ', 'Â', 'Ü',
'Û', 'Ç', 'Ø', 'Ý', 'Ù', '×', 'Ú');


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
