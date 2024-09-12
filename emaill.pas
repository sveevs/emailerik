{
Пример программы, работающей с SMTP   ///
  протоколом через сокеты на основе     ///
  компонента Light SMTP.                ///
                                        ///
  Copyright 2010 svet
Сайт разработчика www.sv-pt.ru



}

unit emaill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdMessage, StdCtrls, Mask, XPMan,
  ExtCtrls, RzTabs, RzEdit, RzStatus, RzLabel,shellapi, RzShellDialogs,
  RzBckgnd, RzCmboBx, IdMessageCoder,kodir,RUSCOD, RzSpnEdt;


type
   PidMessage =  ^TidMessage;
    TSMTP_SV = class(TForm)
    idSMTP1: TIdSMTP;
    IdMessage: TIdMessage;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    ImiaReg: TRzEdit;
    PassReg: TRzEdit;
    DomenReg: TRzEdit;
    ContentReg: TRzMemo;
    RzEdit4: TRzEdit;
    RzButton2: TRzButton;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    TabSheet3: TRzTabSheet;
    RzMarqueeStatus2: TRzMarqueeStatus;
    ImiaRegMas: TRzEdit;
    DomenRegMas: TRzEdit;
    PassRegMas: TRzEdit;
    RzMemo2: TRzMemo;
    RzLabel5: TRzLabel;
    SpisEmail: TRzMemo;
    RzOpenDialog1: TRzOpenDialog;
    RzButton1: TRzButton;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzButton3: TRzButton;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzSeparator1: TRzSeparator;
    ZagalovokReg: TRzComboBox;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzComboBox2: TRzComboBox;
    RzLabel14: TRzLabel;
    KolCopyReg: TRzSpinEdit;
    procedure RzButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Send;
    procedure SendMas;
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzMarqueeStatus2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
{       function WinToKoi(str:string):string;
   function WinToDos(str:string):string;
   function WinToIso(str:string):string;
   function WinToCirLat(str:string):string;
   function KoiToWin(str:string):string;
   function KoiToDos(str:string):string;
   function KoiToIso(str:string):string;
   function KoiToCirLat(str:string):string;
   function DosToWin(str:string):string;
   function DosToKoi(str:string):string;
   function DosToIso(str:string):string;
   function DosToCirLat(str:string):string;
   function IsoToWin(str:string):string;
   function IsoToKoi(str:string):string;
   function IsoToDos(str:string):string;
   function IsoToCirLat(str:string):string;
  published
    constructor Create(aowner:TComponent);override;
}  end;



var
  SMTP_SV: TSMTP_SV;
  ch:Integer;
implementation

//uses emaill;

{$R *.dfm}

{
const
Win:array[0..65] of string=
('А', 'Б', 'В', 'Г', 'Д', 'Е',
 'Ё', 'Ж', 'З', 'И', 'Й', 'К',
 'Л', 'М', 'Н', 'О', 'П', 'Р',
 'С', 'Т', 'У', 'Ф', 'Х', 'Ц',
 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь',
 'Э', 'Ю', 'Я', 'а', 'б', 'в' ,
 'г', 'д', 'е', 'ё', 'ж', 'з',
 'и', 'й', 'к', 'л', 'м', 'н',
 'о', 'п', 'р', 'с', 'т', 'у',
 'ф', 'х', 'ц', 'ч', 'ш', 'щ',
 'ъ', 'ы', 'ь', 'э', 'ю', 'я');
Koi:array[0..65] of string=
('б', 'в', 'ч', 'з', 'д', 'е',
 'і', 'ц', 'ъ', 'й', 'к', 'л',
 'м', 'н', 'о', 'п', 'р', 'т',
 'у', 'ф', 'х', 'ж', 'и', 'г',
 'ю', 'ы', 'э', 'я', 'щ', 'ш',
 'ь', 'а', 'с', 'Б', 'В', 'Ч' ,
 'З', 'Д', 'Е', 'Ј', 'Ц', 'Ъ',
 'Й', 'К', 'Л', 'М', 'Н', 'О',
 'П', 'Р', 'Т', 'У', 'Ф', 'Х',
 'Ж', 'И', 'Г', 'Ю', 'Ы', 'Э',
 'Я', 'Щ', 'Ш', 'Ь', 'А', 'С');
Dos:array[0..65] of string=
('Ђ', 'Ѓ', '‚', 'ѓ', '„', '…',
 'р', '†', '‡', '€', '‰', 'Љ',
 '‹', 'Њ', 'Ќ', 'Ћ', 'Џ', 'ђ',
 '‘', '’', '“', '”', '•', '–',
 '—', '', '™', 'љ', '›', 'њ',
 'ќ', 'ћ', 'џ', ' ', 'Ў', 'ў' ,
 'Ј', '¤', 'Ґ', 'с', '¦', '§',
 'Ё', '©', 'Є', '«', '¬', '­',
 '®', 'Ї', 'а', 'б', 'в', 'г',
 'д', 'е', 'ж', 'з', 'и', 'й',
 'к', 'л', 'м', 'н', 'о', 'п');
ISO:array[0..65] of string=
('°', '±', 'І', 'і', 'ґ', 'µ',
 'Ў', '¶', '·', 'ё', '№', 'є',
 '»', 'ј', 'Ѕ', 'ѕ', 'ї', 'А',
 'Б', 'В', 'Г', 'Д', 'Е', 'Ж',
 'З', 'И', 'Й', 'К', 'Л', 'М',
 'Н', 'О', 'П', 'Р', 'С', 'Т' ,
 'У', 'Ф', 'Х', 'с', 'Ц', 'Ч',
 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э',
 'Ю', 'Я', 'а', 'б', 'в', 'г',
 'д', 'е', 'ж', 'з', 'и', 'й',
 'к', 'л', 'м', 'н', 'о', 'п');
CirLat:array[0..65] of string=
('A', 'B', 'V', 'G', 'D', 'E',
 'E', 'ZH', 'Z', 'I', 'Y', 'K',
 'L', 'M', 'N', 'O', 'P', 'R',
 'S', 'T', 'U', 'F', 'H', 'C',
 'CH', 'SH', 'SH', '""', 'I', '"',
 'E', 'IU', 'IA', 'a', 'b', 'v' ,
 'g', 'd', 'e', 'e', 'zh', 'z',
 'i', 'y', 'k', 'l', 'm', 'n',
 'o', 'p', 'r', 's', 't', 'u',
 'f', 'h', 'c', 'ch', 'sh', 'sh',
 '""', 'y', '"', 'e', 'iu', 'ia');

constructor TSMTP_SV.Create(aowner:TComponent);
begin
inherited Create(aowner);
end;
 //Windows
//Win >> Koi
function TSMTP_SV.WinToKoi(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Win) to High(Win) do
if Win[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Koi[Index];
end;
end;

//Win >> Dos
function TSMTP_SV.WinToDos(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Win) to High(Win) do
if Win[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Dos[Index];
end;
end;

//Win >> Iso
function TSMTP_SV.WinToIso(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Win) to High(Win) do
if Win[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Iso[Index];
end;
end;

//Win >> CirLat
function TSMTP_SV.WinToCirLat(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Win) to High(Win) do
if Win[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+CirLat[Index];
end;
end;

//Koi
//Koi >> Win
function TSMTP_SV.KoiToWin(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Koi) to High(Koi) do
if Koi[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Win[Index];
end;
end;

//Koi >> Dos
function TSMTP_SV.KoiToDos(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Koi) to High(Koi) do
if Koi[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Dos[Index];
end;
end;

//Koi >> Iso
function TSMTP_SV.KoiToIso(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Koi) to High(Koi) do
if Koi[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Iso[Index];
end;
end;

//Koi >> CirLat
function TSMTP_SV.KoiToCirLat(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Koi) to High(Koi) do
if Koi[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Cirlat[Index];
end;
end;

//Dos
//Dos >> Win
function TSMTP_SV.DosToWin(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Dos) to High(Dos) do
if Dos[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Win[Index];
end;
end;

//Dos >> Koi
function TSMTP_SV.DosToKoi(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Dos) to High(Dos) do
if Dos[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Koi[Index];
end;
end;

//Dos >> Iso
function TSMTP_SV.DosToIso(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Dos) to High(Dos) do
if Dos[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Iso[Index];
end;
end;

//Dos >> CirLat
function TSMTP_SV.DosToCirLat(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Dos) to High(Dos) do
if Dos[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Cirlat[Index];
end;
end;

//Iso
//Iso >> Win
function TSMTP_SV.IsoToWin(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Iso) to High(Iso) do
if Iso[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Win[Index];
end;
end;

//Iso >> Koi
function TSMTP_SV.IsoToKoi(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Iso) to High(Iso) do
if Iso[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Koi[Index];
end;
end;

//Iso >> Dos
function TSMTP_SV.IsoToDos(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Iso) to High(Iso) do
if Iso[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Dos[Index];
end;
end;

//Iso >> CirLat
function TSMTP_SV.IsoToCirLat(str:string):string;
var
count,x,y,Index: Integer;
begin
Result := '';
count:=length(Str);
for x:=1 to count do
begin
index:=-1;
for y:=Low(Iso) to High(Iso) do
if Iso[y] = Str[x] then
begin
Index:=y;
Break;
end;
if Index=-1 then Result:=Result+Str[x]
else Result:=Result+Cirlat[Index];
end;
end;
procedure Register;
begin
  RegisterComponents('AComponents', [TRusCod]);
end;
}

procedure TSMTP_SV.Send;
var
SendMsg: TIdMessage;
txt:TIdText;
Body:string;
kolsht:Integer;
begin

// for kolsht:=1 to round(KolCopyReg.Value) do
  begin
//    Application.ProcessMessages;
//    Sleep(10);
    idSMTP1:=TIdSMTP.Create(Self);
    idSMTP1.AuthenticationType:=atLogin;
    idSMTP1.Host:='smtp.'+DomenReg.Text;
    idSMTP1.Password:=PassReg.Text;
    idSMTP1.Username:=ImiaReg.Text;// 'halv';//'password.q@mail.ru';
    idSMTP1.Port:=25;
    IdMessage:=TIdMessage.Create(Self);
// IdMessage.AfterConstruction;
//  IdMessage.ContentTransferEncoding:='base64';
    IdMessage.ContentType:= 'text/plain';
    IdMessage.CharSet:='windows-1251';
    IdMessage.Subject:=(ZagalovokReg.Text); //'Zagalovok';
    IdMessage.From.Text:=ImiaReg.Text+'@'+DomenReg.Text; //'hal@narod.ru';
    IdMessage.Recipients.Add;;
    IdMessage.Recipients.Items[0].Text:=RzEdit4.Text; //'sv@ya.ru';//'brok.qwer@mail.ru';   кому отсылаем
    IdMessage.Body.Add(ContentReg.Lines.Text);
    //Atch:=TIdAttachmentfile.Create(msg.MessageParts,sp);
    //Atch.FileName:=(sp);
    idSMTP1.Connect();
      if idSMTP1.Connected then
        begin
         idSMTP1.Send(IdMessage);
        end;
    idSMTP1.Disconnect;
  end;
end;

procedure TSMTP_SV.SendMas;
var
i:Integer;
begin
for i:=0 to SpisEmail.Column-1 do
  begin

  idSMTP1:=TIdSMTP.Create(Self);
  idSMTP1.AuthenticationType:=atLogin;
  idSMTP1.Host:='smtp.'+DomenRegMas.Text;
  idSMTP1.Password:=PassRegMas.Text;
  idSMTP1.Username:=ImiaRegMas.Text;// 'hala';//'password.q@mail.ru';
  idSMTP1.Port:=25;
  IdMessage:=TIdMessage.Create(Self);
//  IdMessage.AfterConstruction;
  IdMessage.Subject:='Zagalovok';
  IdMessage.From.Text:=ImiaRegMas.Text+'@'+DomenRegMas.Text; //'hal@narod.ru';
  IdMessage.Recipients.Add;
  IdMessage.Recipients.Items[0].Text:=SpisEmail.Lines.Strings[i]; //'sv@ya.ru';//'brok.qwer@mail.ru';   кому отсылаем
  IdMessage.Body.Add(rzMemo2.Lines.Text);
  //Atch:=TIdAttachmentfile.Create(msg.MessageParts,sp);
  //Atch.FileName:=(sp);
  idSMTP1.Connect();
       if idSMTP1.Connected then
         begin
          idSMTP1.Send(IdMessage);
         end;
      idSMTP1.Disconnect;
//      ShowMessage('Письма отправлены');
   end;
end;


procedure TSMTP_SV.RzButton1Click(Sender: TObject);
var
M:PidMessage;// TIdMessage;
begin
 if RzOpenDialog1.Execute then
   begin
    SpisEmail.Lines.LoadFromFile(RzOpenDialog1.FileName);
   end;





//M:=IdMessage.Create(Form1);

{M^.Body.Add('Мыло:' + ' ' + Edit1.Text + '@' + ComboBox1.Text + #10#13 + #10#13 + 'Pасс:' + ' ' + MaskEdit1.Text); // тело письма
M^.From.Text := Edit1.text + '@' + ComboBox1.Text; // от кого
M^.Recipients.Add; // получателей может быть несколько
M^.Recipients.Items[0].Text :='sv@narod.ru'; //'\мыло получателя\';
// M.Recipients.Items[1].Text := \'мыло второго получателя, если нужно\';
M^.Subject := 'Mail.ru Agent'; // тема письма
M^.Body.Text:=Memo1.Lines.Text;

IdSMTP1.AuthenticationType :=atLogin; // если сервер требует авторизации
IdSMTP1.Host := 'smtp.' + ComboBox1.text; // хост сервера
IdSMTP1.Username := Edit1.text; // логин
IdSMTP1.Password := MaskEdit1.Text; // пасс
IdSMTP1.Connect(10000);
// отправка мыла будет произведена от имени юзера
// то есть он должен правильно заполнить логин и пасс, иначе мыло не отправится
if IdSMTP1.Connected then
begin
try
IdSMTP1.Send(M^);
Application.MessageBox('Невозможно соединиться с сервером. Проверьте настройки вашего соединия','Error!',MB_ICONERROR);
// ошибка появится, если письмо успешно отправлено
except
Application.MessageBox('Неправильная пара Логин-Пароль','Error!',MB_ICONERROR);
// ошибка появится, если юзер ввёл неправильный логин или пасс
end;
IdSMTP1.Disconnect;
end; }
end;


procedure TSMTP_SV.Button1Click(Sender: TObject);
var
  M: TIdMessage;
begin
{  M := TIdMessage.Create(Form1);

  M.Body.Add('Типа первая строчка собщения');
  M.Body.Add('Типа вторая строчка собщения');
  M.From.Text := '"лёлик"'+Edit1.Text+'@'+ComboBox1.Text; //<boris@uacity.com>'; //отправитель
  M.Recipients.Add;
  M.Recipients.Items[0].Text := '"Тест" <sv@narod.ru>'; //Получатель
  M.Subject := 'Ну потестим? =)'; //Тема письма

  IdSMTP1.AuthenticationType := atLogin;
  IdSMTP1.Host :=Edit1.Text;// 'uacity.com';
  IdSMTP1.Username :=ComboBox1.Text;// 'boris';
  IdSMTP1.Password :=MaskEdit1.Text;// '1234'; // - ну свой пароль я те не выдам :-Р
  IdSMTP1.Connect(10000);
  if IdSMTP1.Connected then
   try
  begin
    IdSMTP1.Send(M);
    IdSMTP1.Disconnect;
  end
   except ShowMessage('облом');
 //  else
  IdSMTP1.Disconnect;
end;}end;

procedure TSMTP_SV.Button2Click(Sender: TObject);
begin
send;
end;

procedure TSMTP_SV.FormCreate(Sender: TObject);
begin
ch:=0;
Timer1.Enabled:=True;
end;

procedure TSMTP_SV.Timer1Timer(Sender: TObject);
begin

ch:=ch+1;
   case ch of
    4000:ShowMessage('Пашка Пашка блюм блюм блюм');
    5000:ShowMessage('Пашка Пашка гам гам гам');
    6000:ShowMessage('Пашка Пашка ла ла ла');
    7000:ch:=0;
   end;

end;



procedure TSMTP_SV.RzButton2Click(Sender: TObject);
begin
send;
end;

procedure TSMTP_SV.RzMarqueeStatus2Click(Sender: TObject);
begin
 ShellExecute(Handle, 'open', PChar('http://sv-pt.ru/'), nil, nil, SW_SHOW);
end;

procedure TSMTP_SV.RzButton3Click(Sender: TObject);
begin
SendMas;
end;

end.
