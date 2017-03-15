with Text_IO; use Text_IO;
with GNat.windows; use Gnat.windows;
with screen; use screen;

Package body APClock is

Procedure dtClock (dt: natural) is
Task Clock;
Task Body Clock is
   I : natural := 0;
Begin --Clock
  Put_Line ( "Time");
  Loop
    Delay 3.0; i := i + dt; MoveCursor(20, 30);
    Put_Line ("Current "&Natural'Image(i)&"  sec");
  End Loop;
End Clock;
Begin
 NULL;
end dtClock;
End APClock ;