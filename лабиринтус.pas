{$apptype windows}
uses GraphABC, timers, GoodBeginingABC;

const
  usertimer = true;
  size = 32;

var
  n1: Picture;
  n2: Picture;
  n3: Picture;
  n4: Picture;
  n5: Picture;
  n6: Picture;
  n7: Picture;
  Load: Picture;
  toxx: integer;
  toyy: integer;
  levelFile: Text;
  dopLevelFile: Text;
  level: integer := 1;
  x: integer = 1;
  y: integer = 1;
  cont: integer := 0;
  t: Timer;
  m: integer;
  n: integer;
  haveKey: boolean;
  field: array[0..15, 0..31]of integer := (
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),  
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),  
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));

procedure loadPictures;
begin
  n1 := Picture.Create('images/textures/Grass.png');
  n2 := Picture.Create('images/textures/Cobblestone.png');
  n3 := Picture.Create('images/textures/player.png');
  n4 := Picture.Create('images/textures/to.png');
  n5 := Picture.Create('images/textures/Mossy_Cobblestone.png');
  n6 := Picture.Create('images/textures/Grass_iron_bars.png');
  n7 := Picture.Create('images/textures/Grass_key.png');
  n1.Load('images/textures/Grass.png');
  n2.Load('images/textures/Cobblestone.png');
  n3.Load('images/textures/player.png');
  n4.Load('images/textures/to.png');
  n5.Load('images/textures/Mossy_Cobblestone.png');
  n7.Load('images/textures/Grass_key.png');
  n6.Load('images/textures/Grass_iron_bars.png');
end;

procedure arrayRead;
var
  Reader: array[0..31]of integer;
begin
  if(level = 1) then
    Assign(levelFile, 'levels/level1/level.txt');
  if(level = 2) then
    Assign(levelFile, 'levels/level2/level.txt');
  if(level = 3) then
    Assign(levelFile, 'levels/level3/level.txt');
  if(level = 4) then
    Assign(levelFile, 'levels/level4/level.txt');
  if(level = 5) then
    Assign(levelFile, 'levels/level5/level.txt');
  if(level = 6) then
    Assign(levelFile, 'levels/level6/level.txt');
  if(level = 7) then
    Assign(levelFile, 'levels/level7/level.txt');
  if(level = 8) then
    Assign(levelFile, 'levels/level8/level.txt');
  if(level = 9) then
    Assign(levelFile, 'levels/level9/level.txt');
  if(level = 10) then
    Assign(levelFile, 'levels/level10/level.txt');
  Reset(levelFile);
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[0, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[1, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[2, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[3, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[4, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[5, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[6, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[7, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[8, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[9, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[10, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[11, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[12, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[13, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[14, ii] := Reader[ii];
  Readln(levelFile, Reader[0], Reader[1], Reader[2], Reader[3], Reader[4], Reader[5], Reader[6], Reader[7], Reader[8], Reader[9], Reader[10], Reader[11], Reader[12], Reader[13], Reader[14], Reader[15], Reader[16], Reader[17], Reader[18], Reader[19], Reader[20], Reader[21], Reader[22], Reader[23], Reader[24], Reader[25], Reader[26], Reader[27], Reader[28], Reader[29], Reader[30], Reader[31]);
  for var ii: integer := 0 to 31 do
    field[15, ii] := Reader[ii];
  CloseFile(levelFile);
end;

procedure NewLevel;
begin
  var xx, yy, h, w, tox, toy, iskey: integer;
  ClearWindow;
  case level of
    1: begin Assign(dopLevelFile, 'levels/level1/meta.txt'); end;
    2: begin Assign(dopLevelFile, 'levels/level2/meta.txt'); end;
    3: begin Assign(dopLevelFile, 'levels/level3/meta.txt'); end;
    4: begin Assign(dopLevelFile, 'levels/level4/meta.txt'); end;
    5: begin Assign(dopLevelFile, 'levels/level5/meta.txt'); end;
    6: begin Assign(dopLevelFile, 'levels/level6/meta.txt'); end;
    7: begin Assign(dopLevelFile, 'levels/level7/meta.txt'); end;
    8: begin Assign(dopLevelFile, 'levels/level8/meta.txt'); end;
    9: begin Assign(dopLevelFile, 'levels/level9/meta.txt'); end;
    10: begin Assign(dopLevelFile, 'levels/level10/meta.txt'); end;
  end;
  if(level > 10) then
    Window.Close;
  Reset(dopLevelFile);
  Read(dopLevelFile, h, w, xx, yy, toy, tox, isKey);
  n := w;
  m := h;
  x := xx;
  y := yy;
  toxx := tox;
  toyy := toy;
  if iskey = 0 then
    haveKey := false;
  if iskey = 1 then
    haveKey := true;
  CloseFile(dopLevelFile);
  arrayRead;
end;

procedure drawLab;
begin
  SetWindowSize(n, m);
  if usertimer then t.Stop;
  LockDrawing;
  
  Pen.Color := clWhite;
  for var i: integer := 0 to 15 do
  begin
    for var ii: integer := 0 to 31 do
    begin
      case field[i, ii] of
        0: n1.Draw(size * ii, size * i);
        1: n2.Draw(size * ii, size * i);
        2: n3.Draw(size * ii, size * i);
        3: n4.Draw(size * ii, size * i);
        4: n5.Draw(size * ii, size * i);
        5: n6.Draw(size * ii, size * i);
        6: n7.Draw(size * ii, size * i);
      end;
    end;
    Redraw;
    Inc(cont);
  end;
  if usertimer then t.Start;
end;

procedure KeyDown(key: integer);
var
  newx, newy: integer;
begin
    newx := x;
    newy := y;
    case Key of
      VK_Right, VK_D: newx := x + 1;
      VK_Left, VK_A: newx := x - 1;
      VK_Up, VK_W: newy := y - 1;
      VK_Down, VK_S: newy := y + 1;
      27: window.Close;
    end;
    
    if (field[newy, newx] = 6) then begin
      field[y, x] := 0;
      field[newy, newx] := 2;
      haveKey := true;
      x := newx;
      y := newy;
    end;
    
    if (field[newy, newx] = 0) then begin
      field[y, x] := 0;
      field[newy, newx] := 2;
      x := newx;
      y := newy;
    end;
    
    if(field[newy, newx] = 3) then begin
      if haveKey then begin
        field[y, x] := 0;
        field[newy, newx] := 2;
        x := newx;
        y := newy;
      end;
  end;
  
  if (y = toyy) and (x = toxx) then begin
    Inc(level);
    NewLevel;
    drawLab;
  end;
  
end;

////////////////////////////////////////////////////////////////////////////////
//Главный код                                                                 //
////////////////////////////////////////////////////////////////////////////////

begin
  GoodBegining(5);
  loadPictures;
  level := 1;
  NewLevel;
  
  SetWindowSize(n, m);
  
  if(usertimer) then begin
    t := new Timer(100, drawLab);
    t.Start;
  end;
  drawLab;
  OnKeyDown := keyDown;
end.