Program Project_game_The_Maze_Runner;
Uses crt, sysutils;
var a, b : integer;
Procedure Map;
  Begin
  writeln('| |---------------|');{1}
  writeln('| |               |');{2}
  writeln('| | |-- | --------|');{3}
  writeln('|   |   |         |');{4}
  writeln('| |-| |-------| | |');{5}
  writeln('| |   |       | | |');{6}
  writeln('| |---| ----| |-| |');{7}
  writeln('|   |       | |   |');{8}
  writeln('|-- | |---| | | | |');{9}
  writeln('|   | |   | | | | |');{10}
  writeln('|-- | | | | | | | |');{11}
  writeln('|   |   | | |   | |');{12}
  writeln('| --|---| |-----|-|');{13}
  writeln('|       | |       |');{14}
  writeln('|---| | | | |---| |');{15}
  writeln('|   | | |   |   | |');{16}
  writeln('| --| | |---| | | |');{17}
  writeln('|     |       | |  ');{18}
  writeln('|-----------------|');{19}
  writeln;
  writeln('Press ESC to pause');
  writeln('Please note that the time will still be counting');
  GotoXY(a,b); write('*');
  end;
Procedure EndApp;
  Begin
  clrscr;
  writeln('Thank you for playing');
  delay(2000);
  halt(0);
  End;
Procedure TheMazeRunner;
  Var HH, MM, SS, MS, timer, stpause, oppause, realtime, gapltime, totalpause : word;
      c, d, e : integer;
      cm : char;
  Begin
  clrscr;
  GotoXY(34,WhereY); writeln('THE MAZE RUNNER');
  GotoXY(34,WhereY); writeln('Timed Game');
  GotoXY(34,WhereY); writeln('Free Game');
  GotoXY(34,WhereY); writeln('Rules');
  GotoXY(20,6); writeln('Move up w and move down s press enter and Esc to exit');
  a := 32; b := 2; GotoXY(a,b); write('->'); 
  Repeat
    cm := readkey;
    If (cm = #119) then
      Begin
      GotoXY(34,7); writeln('           ');
      If ((b - 1) = 1) then
        Begin
        b := 4;
        GotoXY(a,b); write('->');
        GotoXY(a,2); write('  ');
        End
      Else 
        Begin
        b := b - 1;
        GotoXY(a,b); write('->');
        GotoXY(a,b + 1); write('  ');
        End;
      End
    Else if (cm = #115) then
      Begin
      GotoXY(34,7); writeln('           ');
      If ((b + 1) = 5) then
        Begin
        b := 2;
        GotoXY(a,b); write('->');
        GotoXY(a,4); write('  ');
        End
      Else
        Begin
        b := b + 1;
        GotoXY(a,b); write('->');
        GotoXY(a,b - 1); write('  ');
        End;
      End
    Else 
      Begin
      GotoXY(34,7); writeln('Illegal key');
      End;
  Until (cm = #27) or (cm = #13);
  If (cm = #27) then EndApp
  Else if (cm = #13) and (b = 4) then
    Begin
    clrscr;
    Writeln('You will be control a * through a maze by using controls: ');
    writeln('a: left  w: up  s: down  d: right');
    writeln('Timed game will give you 25 seconds');
    Writeln('Free game will give you infinite time');
    writeln('Press any key to return to Main menu or Esc to exit');
    cm := readkey;
    if (cm = #27) then halt
    Else TheMazeRunner;
    End
  Else if (cm = #13) and (b = 3) then
    Begin
    clrscr;
    writeln('FREE GAME PRESS ANY KEY TO START');
    writeln('*NOTE: DO NOT LET CAPLOCK ON');
    cm := readkey;
    DeCodeTime(Time,HH,MM,SS,MS);
    timer := SS;
    totalpause := 0;
    e := 0;
    clrscr;
    a := 2; b := 1;  
    Map;
    Repeat
    cm := readkey;
    DeCodeTime(Time,HH,MM,SS,MS);
    gapltime := SS;
    if (cm = #27) then
    Begin 
      clrscr;
      e := e + 1;
      DeCodeTime(Time,HH,MM,SS,MS);
      stpause := SS;
      GotoXY(3,1); writeln('PAUSE MENU: ');
      GotoXY(3,2); writeln('Main Menu');
      GotoXY(3,3); writeln('Back to game');
      GotoXY(3,4); writeln('Use w for up s for down and press enter');
      c := 1; d :=2; gotoXY(c,d); writeln('->');
      Repeat
      cm := readkey;
      if (cm = #119) and ((d - 1) <> 1) then
        Begin
        d := d - 1;
        gotoXY(c,d); writeln('->');
        gotoXY(c,d + 1); writeln('  ');
        end
      Else if (cm = #115) and ((d + 1) <> 4) then
        Begin
        d := d + 1;
        gotoXY(c,d); writeln('->');
        gotoXY(c,d - 1); writeln('  ');
        end;
      until (cm = #13);
      if (d = 2) then TheMazeRunner
      Else if (d = 3) then
        Begin
        DeCodeTime(Time,HH,MM,SS,MS);
        oppause := SS;
        totalpause := oppause - stpause;
        clrscr;
        Map;
        end;
    end
    Else if (cm = #119) then
    Begin
      if (b = 1) and (a = 2) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if (b = 2) and (a = 2) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 3) or (b = 4)) and ((a = 2) or (a = 4) or (a = 8) or (a = 10)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 5) or (b = 6)) and ((a = 2) or (a = 6) or (a = 16) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 7) or (b = 8)) and ((a = 2) or (a = 8) or (a = 14) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 9) or (b = 10)) and ((a = 4) or (a = 6) or (a = 12) or (a = 14) or (a = 16) or (a =18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 11) or (b = 12)) and ((a = 4) or (a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 13) or (b = 14)) and  ((a = 2) or (a = 10)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 15) or (b = 16)) and ((a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 17) or (b = 18)) and ((a = 2) or (a = 6) or (a = 8) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
    End
    Else if (cm = #115) then
    Begin
      if (a = 2) and (b = 1) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 2) or (b = 3)) and ((a = 2) or (a = 4) or (a = 8) or (a = 10)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 4) or (b = 5)) and ((a = 2) or (a = 6) or (a = 16) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 7) or (b = 6)) and ((a = 2) or (a = 8) or (a = 14) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 9) or (b = 8)) and ((a = 4) or (a = 6) or (a = 12) or (a = 14) or (a = 16) or (a =18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 11) or (b = 10)) and ((a = 4) or (a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 13) or (b = 12)) and  ((a = 2) or (a = 10)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 15) or (b = 14)) and ((a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 17) or (b = 16)) and ((a = 2) or (a = 6) or (a = 8) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end;
    End
    Else if (cm = #97) then
    Begin
      if ((a = 3) or (a = 4)) and ((b = 4) or (b = 8) or (b = 10) or (b = 12) or (b = 14) or (b = 16) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 5) or (a = 6)) and ((b = 2) or (b = 6) or  (b = 14) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 7) or (a = 8)) and ((b = 2) or (b = 4) or (b = 8) or (b = 12) or (b = 14)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 9) or (a = 10)) and ((b = 2) or (b = 6) or (b = 8) or (b = 10) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 11) or (a = 12)) and ((b = 2) or (b = 4) or (b = 6) or (b = 8) or (b = 16) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 13) or (a = 14)) and ((b = 2) or (b = 4) or  (b = 6) or (b = 14) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 15) or (a = 16)) and ((b = 2) or (b = 4) or (b = 12) or (b = 14) or (b = 16)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 17) or (a = 18)) and ((b = 2) or (b = 4) or (b = 8) or (b = 14)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end;
    End
    Else if (cm = #100) then
    Begin
      if ((a = 3) or (a = 2)) and ((b = 4) or (b = 8) or (b = 10) or (b = 12) or (b = 14) or (b = 16) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 5) or (a = 4)) and ((b = 2) or (b = 6) or  (b = 14) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 7) or (a = 6)) and ((b = 2) or (b = 4) or (b = 8) or (b = 12) or (b = 14)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 9) or (a = 8)) and ((b = 2) or (b = 6) or (b = 8) or (b = 10) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 11) or (a = 10)) and ((b = 2) or (b = 4) or (b = 6) or (b = 8) or (b = 16) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 13) or (a = 12)) and ((b = 2) or (b = 4) or  (b = 6) or (b = 14) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 15) or (a = 14)) and ((b = 2) or (b = 4) or (b = 12) or (b = 14) or (b = 16)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 17) or (a = 16)) and ((b = 2) or (b = 4) or (b = 8) or (b = 14)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if (a = 18) and (b = 18) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end;
    End;
    until (a = 19) and (b = 18);
    if (e > 0) then
    realtime := (gapltime - timer) + totalpause
    Else realtime := gapltime - timer;
    gotoXY(1,21); writeln('CONGRATULATION YOU WON');
    gotoXY(1,22); writeln('                                                         ');
    gotoXY(1,22); writeln('Your Time: ',realtime,' seconds');
    gotoXY(1,23); writeln('Press any key to exit');
    cm := readkey;
    EndApp;
    End
  Else if (cm = #13) and (b = 2) then
  Begin
    clrscr;
    writeln('TIMED GAME PRESS ANY KEY TO START');
    writeln('*NOTE: DO NOT LET CAPLOCK ON');
    cm := readkey;
    DeCodeTime(Time,HH,MM,SS,MS);
    timer := SS;
    totalpause := 0;
    e := 0;
    clrscr;
    a := 2; b := 1;  
    Map;
    Repeat
    cm := readkey;
    DeCodeTime(Time,HH,MM,SS,MS);
    gapltime := SS;
    realtime := (gapltime - timer) + totalpause;
    if (cm = #27) then
    Begin 
      clrscr;
      e := e + 1;
      DeCodeTime(Time,HH,MM,SS,MS);
      stpause := SS;
      GotoXY(3,1); writeln('PAUSE MENU: ');
      GotoXY(3,2); writeln('Main Menu');
      GotoXY(3,3); writeln('Back to game');
      GotoXY(3,4); writeln('Use w for up s for down and press enter');
      c := 1; d :=2; gotoXY(c,d); writeln('->');
      Repeat
      cm := readkey;
      if (cm = #119) and ((d - 1) <> 1) then
        Begin
        d := d - 1;
        gotoXY(c,d); writeln('->');
        gotoXY(c,d + 1); writeln('  ');
        end
      Else if (cm = #115) and ((d + 1) <> 4) then
        Begin
        d := d + 1;
        gotoXY(c,d); writeln('->');
        gotoXY(c,d - 1); writeln('  ');
        end;
      until (cm = #13);
      if (d = 2) then TheMazeRunner
      Else if (d = 3) then
        Begin
        DeCodeTime(Time,HH,MM,SS,MS);
        oppause := SS;
        totalpause := oppause - stpause;
        clrscr;
        Map;
        end;
    end
    Else if (cm = #119) then
    Begin
      if (b = 1) and (a = 2) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if (b = 2) and (a = 2) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 3) or (b = 4)) and ((a = 2) or (a = 4) or (a = 8) or (a = 10)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 5) or (b = 6)) and ((a = 2) or (a = 6) or (a = 16) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 7) or (b = 8)) and ((a = 2) or (a = 8) or (a = 14) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 9) or (b = 10)) and ((a = 4) or (a = 6) or (a = 12) or (a = 14) or (a = 16) or (a =18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 11) or (b = 12)) and ((a = 4) or (a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 13) or (b = 14)) and  ((a = 2) or (a = 10)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 15) or (b = 16)) and ((a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
      Else if ((b = 17) or (b = 18)) and ((a = 2) or (a = 6) or (a = 8) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b + 1); writeln(' ');
      end
    End
    Else if (cm = #115) then
    Begin
      if (a = 2) and (b = 1) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 2) or (b = 3)) and ((a = 2) or (a = 4) or (a = 8) or (a = 10)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 4) or (b = 5)) and ((a = 2) or (a = 6) or (a = 16) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 7) or (b = 6)) and ((a = 2) or (a = 8) or (a = 14) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 9) or (b = 8)) and ((a = 4) or (a = 6) or (a = 12) or (a = 14) or (a = 16) or (a =18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 11) or (b = 10)) and ((a = 4) or (a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 13) or (b = 12)) and  ((a = 2) or (a = 10)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 15) or (b = 14)) and ((a = 6) or (a = 8) or (a = 10) or (a = 12) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end
      Else if ((b = 17) or (b = 16)) and ((a = 2) or (a = 6) or (a = 8) or (a = 14) or (a = 16) or (a = 18)) then
      Begin
        b := b + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a,b - 1); writeln(' ');
      end;
    End
    Else if (cm = #97) then
    Begin
      if ((a = 3) or (a = 4)) and ((b = 4) or (b = 8) or (b = 10) or (b = 12) or (b = 14) or (b = 16) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 5) or (a = 6)) and ((b = 2) or (b = 6) or  (b = 14) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 7) or (a = 8)) and ((b = 2) or (b = 4) or (b = 8) or (b = 12) or (b = 14)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 9) or (a = 10)) and ((b = 2) or (b = 6) or (b = 8) or (b = 10) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 11) or (a = 12)) and ((b = 2) or (b = 4) or (b = 6) or (b = 8) or (b = 16) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 13) or (a = 14)) and ((b = 2) or (b = 4) or  (b = 6) or (b = 14) or (b = 18)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 15) or (a = 16)) and ((b = 2) or (b = 4) or (b = 12) or (b = 14) or (b = 16)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end
      Else if ((a = 17) or (a = 18)) and ((b = 2) or (b = 4) or (b = 8) or (b = 14)) then
      Begin
        a := a - 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a + 1,b); writeln(' ');
      end;
    End
    Else if (cm = #100) then
    Begin
      if ((a = 3) or (a = 2)) and ((b = 4) or (b = 8) or (b = 10) or (b = 12) or (b = 14) or (b = 16) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 5) or (a = 4)) and ((b = 2) or (b = 6) or  (b = 14) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 7) or (a = 6)) and ((b = 2) or (b = 4) or (b = 8) or (b = 12) or (b = 14)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 9) or (a = 8)) and ((b = 2) or (b = 6) or (b = 8) or (b = 10) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 11) or (a = 10)) and ((b = 2) or (b = 4) or (b = 6) or (b = 8) or (b = 16) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 13) or (a = 12)) and ((b = 2) or (b = 4) or  (b = 6) or (b = 14) or (b = 18)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 15) or (a = 14)) and ((b = 2) or (b = 4) or (b = 12) or (b = 14) or (b = 16)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if ((a = 17) or (a = 16)) and ((b = 2) or (b = 4) or (b = 8) or (b = 14)) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end
      Else if (a = 18) and (b = 18) then
      Begin
        a := a + 1;
        gotoXY(a,b); writeln('*');
        gotoXY(a - 1,b); writeln(' ');
      end;
    End;
    until ((a = 19) and (b = 18)) or (realtime >= 45);
    if ((a = 19) and (b = 18)) and (realtime < 45) then
    gotoXY(1,21); writeln('CONGRATULATION YOU WON');
    gotoXY(1,22); writeln('                                                         ');
    gotoXY(1,22); writeln('Your Time: ',realtime,'/45 seconds');
    gotoXY(1,23); writeln('Press any key to exit');
    cm := readkey;
    EndApp;
    End
    Else if (realtime >= 45) then
    gotoXY(1,21); writeln('CONGRATULATION YOU COMPLETELY LOST');
    gotoXY(1,22); writeln('                                                         ');
    gotoXY(1,22); writeln('Press any key to exit');
    cm := readkey;
    EndApp;
  End;
Begin
TheMazeRunner;
end. 