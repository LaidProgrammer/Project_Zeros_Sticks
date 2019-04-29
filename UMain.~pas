unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  Pole_Array = array[0..4,0..4] of integer;
  TMyCustomPanel = class(TPanel);
  TForm1 = class(TForm)
    Left_Panel: TPanel;
    Right_Panel: TPanel;
    First_Player_Panel: TPanel;
    Second_Player_Panel: TPanel;
    Score_Panel: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Memo2: TMemo;
    Button3: TButton;
    Memo3: TMemo;
    Button4: TButton;
    Memo4: TMemo;
    Button5: TButton;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Options_Confirm_Button: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure Memo3Change(Sender: TObject);
    procedure Memo4Change(Sender: TObject);
    procedure Step(Sender: TObject);
    function Check_Field : boolean;
    function Check_Win : boolean;
    procedure End_Round;
    procedure End_Game(turn : integer);
    procedure Paint_Field;
    procedure Output_Field;
    procedure Button5Click(Sender: TObject);
    procedure Options_Confirm_ButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1 : TForm1;
  GamePanel : TMyCustomPanel;
  Player_1_path, Player_2_path, Player_log_1_path, Player_log_2_path : string;
  Player_1_File, Player_2_File,log,history : TextFile;
  MyTimer : TTimer;
  delay, wins, win_x, win_o, turn, awnser : integer;
  delay_float, Cx, Cy : real;
  Pole : Pole_Array;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i, j : integer;
begin
  GamePanel := TMyCustomPanel.Create(Self);
  GamePanel.Parent := Self;
  GamePanel.Anchors := [];
  GamePanel.SetBounds(Self.Left_Panel.ClientWidth,
                      Self.Score_Panel.ClientHeight,
                      Self.ClientWidth-2*Self.Right_Panel.ClientWidth,
                      Self.ClientWidth-2*Self.Right_Panel.ClientWidth);
  GamePanel.BevelOuter := bvLowered;
  delay := 700;
  wins := 3;
  turn := 1;
  Self.Edit1.Text := '0,7';
  Self.Edit3.Text := '3';
  Self.First_Player_Panel.Caption := 'Бот команды №1';
  Self.Second_Player_Panel.Caption := 'Бот команды №2';
  Self.Panel2.Caption := 'X';
  Self.Panel3.Caption := 'O';
  Self.Score_Panel.Caption:='0 : 0';
  for i := 0 to 4 do
    for j := 0 to 4 do
      Pole[j, i] := 0;
  AssignFile(history,'history.txt');
  try
    Append(history);
  except
    try
      Rewrite(history);
      Writeln(history,'X O');
    except
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Self.OpenDialog1.Execute then
  begin
    Player_log_1_path:=Self.OpenDialog1.Files.Text;
    Self.Memo1.Text:=Player_log_1_path;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Self.OpenDialog1.Execute then
  begin
    Player_1_path:=Self.OpenDialog1.Files.Text;
    Self.Memo2.Text:=Player_1_path;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Self.OpenDialog1.Execute then
  begin
    Player_log_2_path:=Self.OpenDialog1.Files.Text;
    Self.Memo3.Text:=Player_log_2_path;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Self.OpenDialog1.Execute then
  begin
    Player_2_path:=Self.OpenDialog1.Files.Text;
    Self.Memo4.Text:=Player_2_path;
  end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Self.Memo1.Text:=Player_log_1_path;
end;

procedure TForm1.Memo2Change(Sender: TObject);
begin
  Self.Memo2.Text:=Player_1_path;
end;

procedure TForm1.Memo3Change(Sender: TObject);
begin
  Self.Memo3.Text:=Player_log_2_path;
end;

procedure TForm1.Memo4Change(Sender: TObject);
begin
  Self.Memo4.Text:=Player_2_path;
end;

function TForm1.Check_Win;
var
  i, j : integer;
  fives : array [0..27,0..3] of integer;
begin
  for i := 0 to 4 do
  begin
    for j := 0 to 3 do
    begin
      fives[i][j] := Pole[i][j];
      fives[i+5][j] := Pole[i][j+1];
    end;
  end;
  for i := 0 to 4 do
  begin
    for j := 0 to 3 do
    begin
      fives[i+10][j] := pole[j][i];
      fives[i+15][j] := pole[j+1][i];
    end;
  end;
  for i := 0 to 3 do
  begin
    fives[20][i] := pole[i][i];
    fives[21][i] := pole[i+1][i+1];
    fives[22][i] := pole[4-i][i];
    fives[23][i] := pole[3-i][i+1];
    fives[24][i] := pole[i+1][i];
    fives[25][i] := pole[i][i+1];
    fives[26][i] := pole[3-i][i];
    fives[27][i] := pole[4-i][i+1];
  end;
  for i:= 0 to 27 do
  begin
    if (fives[i][0] = 1) and (fives[i][1] = 1) and (fives[i][2] = 1) and (fives[i][3] = 1) then
    begin
      result := True;
      win_x := win_x + 1;
      exit;
    end
    else if (fives[i][0] = 2) and (fives[i][1] = 2) and (fives[i][2] = 2) and (fives[i][3] = 2) then
    begin
      result := True;
      win_o := win_o + 1;
      exit;
    end;
  end;
end;
function TForm1.Check_Field;
var
  i, j : integer;
  fives : array [0..27,0..3] of integer;
begin
  for i := 0 to 4 do
  begin
    for j := 0 to 4 do
    begin
      if Pole[i, j] = 0 then
      begin
        result := True;
        exit;
      end
      else continue;
    end;
  end;
  result := False;
end;

procedure TForm1.Paint_Field;
var
  i, j, size_x, size_y : integer;
  col : TColor;
begin
  GamePanel.Canvas.Brush.Color := clWhite;
  GamePanel.Canvas.FillRect(GamePanel.Canvas.ClipRect);
  size_x := round(GamePanel.Width/5);
  size_y := round(GamePanel.Height/5);
  GamePanel.Canvas.Pen.Color := clBlack;
  for i := 1 to 4 do
  begin
    GamePanel.Canvas.MoveTo(i*size_x,0);
    GamePanel.Canvas.LineTo(i*size_x,GamePanel.Height);
    GamePanel.Canvas.MoveTo(0, i*size_y);
    GamePanel.Canvas.LineTo(GamePanel.Width, i*size_y);
  end;
  for j := 0 to 4 do
  begin
    for i := 0 to 4 do
    begin
      if Pole[j, i] = 2 then
      begin
        GamePanel.Canvas.Pen.Color := clRed;
        GamePanel.Canvas.Ellipse(size_x*i+10,size_y*j+10,size_x*(i+1)-10,size_y*(j+1)-10);
      end
      else if Pole[j, i] = 1 then
      begin
        GamePanel.Canvas.Pen.Color := clBlue;
        GamePanel.Canvas.MoveTo(size_x*i+10,size_y*j+10);
        GamePanel.Canvas.LineTo(size_x*(i+1)-10,size_y*(j+1)-10);
        GamePanel.Canvas.MoveTo(size_x*(i+1)-10,size_Y*j+10);
        GamePanel.Canvas.LineTo(size_x*i+10,size_y*(j+1)-10);
      end;
    end;
  end;
end;

procedure TForm1.End_Game(turn: integer);
begin
  CloseFile(log);
  if turn = 1 then
  begin
    MyTimer.Enabled := False;
    MessageBox(0,'Выиграли крестики!','ПОБЕДА',0);
    try
      Writeln(history,IntToStr(win_x),' ',IntToStr(win_o));
    except
    end;
    win_x:=0;
    win_o:=0;
  end
  else if turn = 2 then
  begin
    MyTimer.Enabled := False;
    try
      Writeln(history,IntToStr(win_x),' ',IntToStr(win_o));
    except
    end;
    MessageBox(0,'Выиграли нолики!','ПОБЕДА',0);
    win_x:=0;
    win_o:=0;
  end;
  Self.Enabled := True;
  Self.Score_Panel.Caption:=inttostr(win_x) + ' : ' + inttostr(win_o);
end;

procedure TForm1.End_Round;
var
  i, j : integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      Pole[i, j] := 0;
  Sleep(2000);
  Paint_Field;
  Self.Score_Panel.Caption:=inttostr(win_x) + ' : ' + inttostr(win_o);
  turn := 1;
  try
    Writeln(log,'--------------------------------');
  except
  end;
  if win_x >= wins then End_Game(1)
  else if win_o >= wins then End_Game(2);
end;

procedure TForm1.Output_Field;
var
  dir, path, s : string;
  fir, len, p, i, j : integer;
  temp : string;
begin
  if turn = 1 then
  begin
    temp := Player_1_path;
    p := Pos('\', temp);
    fir := Length(temp) - p;
    while True do
    begin
      temp := Copy(temp, Pos('\', temp) + 1, Length(temp) - Pos('\',temp) + 1);
      p := Pos('\', temp);
      if p = 0 then break;
      fir := Length(temp) - p;
    end;
    fir := Length(Player_1_path) - fir + 1;
    dir := Player_1_path;
    len := Length(Player_1_path) - fir+1;
    Delete(dir, fir, len);
    path := dir + 'pole.txt';
    AssignFile(Output, path);
    Rewrite(Output);
    for i := 0 to 4 do
    begin
      s:='';
      for j := 0 to 4 do
      begin
        s := s + IntToStr(Pole[i][j])
      end;
      Writeln(Output, s);
    end;
    Writeln(Output, 'X');
    CloseFile(Output);
  end
  else
  begin
    temp := Player_2_path;
    p := Pos('\', temp);
    fir := Length(temp) - p;
    while True do
    begin
      temp := Copy(temp, Pos('\', temp) + 1, Length(temp) - Pos('\',temp) + 1);
      p := Pos('\', temp);
      if p = 0 then break;
      fir := Length(temp) - p;
    end;
    fir := Length(Player_2_path) - fir + 1;
    dir := Player_2_path;
    len := Length(Player_2_path) - fir+1;
    Delete(dir, fir, len);
    path := dir + 'pole.txt';
    AssignFile(Output, path);
    Rewrite(Output);
    for i := 0 to 4 do
    begin
      s:='';
      for j := 0 to 4 do
      begin
        s := s + IntToStr(Pole[i][j])
      end;
      Writeln(Output, s);
    end;
    Writeln(Output, 'O');
    CloseFile(Output);
  end;
end;

procedure TForm1.Step(Sender: TObject);
var
  str_x, str_y : string;
  x, y : integer;
  Rlst: LongBool;
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Error: integer;
  ExitCode: Cardinal;
  t : TDateTime;
begin
  if turn = 1 then
  begin
    Output_Field;
    try
      FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
      with StartUpInfo do
      begin
        cb := SizeOf(TStartUpInfo);
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := SW_HIDE;
      end;
      t := Time;
      Rlst := CreateProcess(PChar(Player_1_path), nil, nil, nil, false, REALTIME_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);
      if Rlst then
      with ProcessInfo do begin
        WaitForInputIdle(hProcess, INFINITE);
        sleep(delay-1);
        TerminateProcess(hProcess,NO_ERROR);
        GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
        CloseHandle(hThread);
        CloseHandle(hProcess);
      end
      else raise Exception.Create('');
    except
    begin
      turn := 1;
      win_o := win_o + 1;
      End_Round;
      exit;
    end;
    end;
    try
      AssignFile(Player_1_File, Player_log_1_path);
      Reset(Player_1_File);
      Readln(Player_1_File,str_x);
      Readln(Player_1_File,str_y);
      CloseFile(Player_1_File);
      Rewrite(Player_1_File);
      Writeln(Player_1_File,'0');
      Writeln(Player_1_File,'0');
      CloseFile(Player_1_File);
    except on Exception do
    begin
      turn := 1;
      win_o := win_o + 1;
      End_Round;
      exit;
    end;
    end;
    try
      x := StrToInt(str_y) - 1;
      y := StrToInt(str_x) - 1;
    except
      x := -1;
      y := -1;
    end;
    try
      if (x<0)or(x>4)or(y<0)or(y>4) then raise Exception.Create('');
      if Pole[x, y] = 0 then
      begin
        Pole[x, y] := 1;
        try
          Writeln(log,IntToStr(x),' ',IntToStr(y));
        except
        end;
        Paint_Field;
        if Check_Win then End_Round;
      end
      else
      begin
        turn := 1;
        win_o := win_o + 1;
        End_Round;
      end;
    except
      turn := 1;
      win_o := win_o + 1;
      End_Round;
      exit;
    end;
    if Check_Field <> True then
    begin
      End_Round;
      exit;
    end;
  turn := 2;
  end
  else
  begin
    Output_Field;
    try
      FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
      with StartUpInfo do
      begin
        cb := SizeOf(TStartUpInfo);
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := SW_HIDE;
      end;
      Rlst := CreateProcess(PChar(Player_2_path), nil, nil, nil, false, REALTIME_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);
      if Rlst then
      with ProcessInfo do begin
        WaitForInputIdle(hProcess, INFINITE);
        sleep(delay-1);
        TerminateProcess(hProcess,NO_ERROR);
        GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
        CloseHandle(hThread);
        CloseHandle(hProcess);
      end
      else raise Exception.Create('');
    except
    begin
      turn := 1;
      win_x := win_x + 1;
      End_Round;
      exit;
    end;
    end;
    try
      AssignFile(Player_2_File, Player_log_2_path);
      Reset(Player_2_File);
      Readln(Player_2_File,str_x);
      Readln(Player_2_File,str_y);
      CloseFile(Player_2_File);
      Rewrite(Player_2_File);
      Writeln(Player_2_File,'0');
      Writeln(Player_2_File,'0');
      CloseFile(Player_2_File);
    except on Exception do
    begin
      turn := 1;
      win_x := win_x + 1;
      End_Round;
      exit;
    end;
    end;
    try
      x := StrToInt(str_y) - 1;
      y := StrToInt(str_x) - 1;
    except
      x := -1;
      y := -1;
    end;
    try
      if (x<0)or(x>4)or(y<0)or(y>4) then raise Exception.Create('');
      if Pole[x, y] = 0 then
      begin
        Pole[x, y] := 2;
        try
          Writeln(log,IntToStr(x),' ',IntToStr(y));
        except
        end;
        Paint_Field;
        if Check_Win then End_Round;
      end
      else
      begin
        turn := 1;
        win_x := win_x + 1;
        End_Round;
      end;
    except
      turn := 1;
      win_x := win_x + 1;
      End_Round;
      exit;
    end;
    if Check_Field <> True then
    begin
      End_Round;
    end;
    turn := 1;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (Player_log_1_path <> '') and (Player_log_2_path <> '') and (Player_1_path <> '') and (Player_2_path <> '') then
  begin
    Self.Paint_Field;
    Player_1_path := Trim(Player_2_path);
    Player_2_path := Trim(Player_2_path);
    Player_log_1_path := Trim(Player_log_1_path);
    Player_log_2_path := Trim(Player_log_2_path);
    MyTimer:=TTimer.Create(Self);
    MyTimer.Interval := 1;
    MyTimer.OnTimer := Step;
    MyTimer.Enabled := True;
    try
      AssignFile(log,'history_of_this_game.txt');
      Rewrite(log);
    except
    end;
    Self.Enabled := False;
  end;
end;

procedure TForm1.Options_Confirm_ButtonClick(Sender: TObject);
var
  Flags : TReplaceFlags;
begin
  Flags := [rfReplaceAll];
  try
    wins := StrToInt(Self.Edit3.Text);
  except
    Self.Edit3.Text := '3';
    wins := 3;
  end;
  if (wins < 1) then
  begin
    wins := 1;
    Self.Edit3.Text := '1';
  end;
  if (wins > 100000) then
  begin
    wins := 100000;
    Self.Edit3.Text := '100000';
  end;
  try
    delay_float := StrToFloat(StringReplace(Self.Edit1.Text, '.', ',', Flags));
    Self.Edit1.Text := FloatToStr(delay_float);
    delay := Round(delay_float*1000);
  except
    Self.Edit1.Text := '0,7';
    delay := 700;
  end;
  if (delay < 2) then
  begin
    delay := 2;
    Self.Edit1.Text := '0,002';
  end;
  if (delay > 100000) then
  begin
    delay := 100000;
    Self.Edit1.Text := '100';
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Self.Left_Panel.Width := round(Self.ClientWidth/4);

  Self.Right_Panel.Width := Self.Left_Panel.Width;

  Self.First_Player_Panel.Left := Self.Left_Panel.Width;
  Self.First_Player_Panel.Width := Round(0.15*Self.ClientWidth);
  Self.First_Player_Panel.Height := Round(1/12*Self.ClientHeight);
  Self.First_Player_Panel.Top := 0;

  Self.Second_Player_Panel.Left := Round(Self.ClientWidth*0.6);
  Self.Second_Player_Panel.Height := Self.First_Player_Panel.Height;
  Self.Second_Player_Panel.Width := Self.First_Player_Panel.Width;
  self.Second_Player_Panel.Top := 0;

  Self.Score_Panel.Left := Round((Self.ClientWidth*0.9)/2);
  Self.Score_Panel.Width := Round(Self.ClientWidth*0.1);
  Self.Score_Panel.Height := Self.First_Player_Panel.Height;
  Self.Score_Panel.Top := 0;

  Self.Button1.Left := Round(Self.ClientWidth/200);
  Self.Button1.Width := Round(Self.ClientWidth/4) - 2*Self.Button1.Left;
  Self.Button1.Height := Round(0.05*Self.ClientHeight);
  Self.Button1.Top := Round(Self.ClientHeight*0.01);

  Self.Button2.Left := Round(Self.ClientWidth/200);
  Self.Button2.Width := Round(Self.ClientWidth/4) - 2*Self.Button1.Left;
  Self.Button2.Height := Round(0.05*Self.ClientHeight);
  Self.Button2.Top := Round(Self.ClientHeight*13/60);

  Self.Button3.Left := Round(Self.ClientWidth/200);
  Self.Button3.Width := Round(Self.ClientWidth/4) - 2*Self.Button1.Left;
  Self.Button3.Height := Round(0.05*Self.ClientHeight);
  Self.Button3.Top := Round(Self.ClientHeight*5/12);

  Self.Button4.Left := Round(Self.ClientWidth/200);
  Self.Button4.Width := Round(Self.ClientWidth/4) - 2*Self.Button1.Left;
  Self.Button4.Height := Round(0.05*Self.ClientHeight);
  Self.Button4.Top := Round(Self.ClientHeight*37/60);

  Self.Panel2.Left := Round(Self.ClientWidth*0.4);
  Self.Panel2.Width := Self.First_Player_Panel.Height;
  Self.Panel2.Height := Self.Panel2.Width;
  Self.Panel2.Top := 0;

  Self.Panel3.Left := Round(Self.ClientWidth*0.55);
  Self.Panel3.Width := Self.First_Player_Panel.Height;
  Self.Panel3.Height := Self.Panel2.Width;
  Self.Panel3.Top := 0;

  Self.Memo1.Left := Self.Button1.Left;
  Self.Memo1.Width := Round(Self.ClientWidth*0.24);
  Self.Memo1.Height := Round(Self.ClientHeight*7/60);
  Self.Memo1.Top := Round(Self.ClientHeight*1/12);

  Self.Memo2.Left := Self.Button1.Left;
  Self.Memo2.Width := Round(Self.ClientWidth*0.24);
  Self.Memo2.Height := Round(Self.ClientHeight*7/60);
  Self.Memo2.Top := Round(Self.ClientHeight*17/60);

  Self.Memo3.Left := Self.Button1.Left;
  Self.Memo3.Width := Round(Self.ClientWidth*0.24);
  Self.Memo3.Height := Round(Self.ClientHeight*7/60);
  Self.Memo3.Top := Round(Self.ClientHeight*29/60);

  Self.Memo4.Left := Self.Button1.Left;
  Self.Memo4.Width := Round(Self.ClientWidth*0.24);
  Self.Memo4.Height := Round(Self.ClientHeight*7/60);
  Self.Memo4.Top := Round(Self.ClientHeight*41/60);

  Self.Panel1.Left := Self.Left_Panel.Width;
  Self.Panel1.Width := Self.ClientWidth-Self.Left_Panel.Width*2;
  Self.Panel1.Height := Round(Self.ClientHeight*1/12);
  Self.Panel1.Top := Round(Self.ClientHeight*11/12);

  Self.Button5.Left := Round(Self.ClientWidth*56/1000);
  Self.Button5.Top := Round(Self.ClientHeight*5/6);
  Self.Button5.Width := Round(Self.ClientWidth*0.13);
  Self.Button5.Height := Round(Self.ClientHeight*0.05);

  Self.Edit1.Left := Round(Self.ClientWidth*0.005);
  Self.Edit1.Top := Round(Self.ClientHeight*2/15);
  Self.Edit1.Width := Round(Self.ClientWidth*0.24);

  Self.Edit3.Left := Round(Self.ClientWidth*0.005);
  Self.Edit3.Top := Round(Self.ClientHeight*79/300);
  Self.Edit3.Width := Round(Self.ClientWidth*0.24);

  Self.Options_Confirm_Button.Left := Round(Self.ClientWidth*0.075);
  Self.Options_Confirm_Button.Top := Round(Self.ClientHeight/3);
  Self.Options_Confirm_Button.Width := Round(Self.ClientWidth*0.1);
  Self.Options_Confirm_Button.Height := Round(Self.ClientHeight*0.05);

  Self.Label1.Left := Round(Self.ClientWidth*0.005);
  Self.Label1.Top := Round(Self.ClientHeight/12);
  Self.Label1.Width := Round(Self.ClientWidth*0.24);
  Self.Label1.Height := Round(Self.ClientHeight*0.05);

  Self.Label3.Left := Round(Self.ClientWidth*0.005);
  Self.Label3.Top := Round(Self.ClientHeight*16/75);
  Self.Label3.Width := Round(Self.ClientWidth*0.24);
  Self.Label3.Height := Round(Self.ClientHeight*0.05);

  GamePanel.SetBounds(Self.Left_Panel.ClientWidth,
                      Self.Score_Panel.ClientHeight,
                      Self.ClientWidth-2*Self.Right_Panel.ClientWidth,
                      Self.ClientHeight-Self.Score_Panel.Height-Self.Panel1.Height);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    CloseFile(history);
  except
  end;
  //CloseFile(log);
end;

end.
