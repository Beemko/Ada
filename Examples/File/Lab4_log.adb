with Ada.Text_Io;
use Ada.Text_Io;

with Ada.Calendar;
use Ada.Calendar;

package body Lab4_log is

   procedure Print_Log is 
      File : File_Type;  
   begin
      Create(
        File => File,     
        Mode => Out_File, 
        Name => "Log.csv");
      for J in 1..I loop
         Put_Line(File, Duration'Image(Arr(J).Time) & ";" &
            Integer'Image(Arr(J).Ps(1)) & ";" &
            Integer'Image(Arr(J).Ps(2)) & ";" &
            Integer'Image(Arr(J).Ps(3)) & ";"  &
            Integer'Image(Arr(J).Ps(4)) & ";" &
            Integer'Image(Arr(J).Ps(5))
            );
      end loop;
            Close(File => File);
   end Print_Log;
   
   procedure LogPhil (
         W : Integer; Start_Time :  Duration) is 
   begin
      Curs.Time := Seconds(Clock)-Start_Time;
      Arr(I) := Curs;
      I := I+1;
      --Curs.Ws := W;
      Arr(I) := Curs;
      I := I+1;
   end LogPhil ;

   procedure LogStick (
         Rnum : Integer; 
         R    : Integer ;  Start_Time :  Duration ) is 
   begin
      Curs.Time := Seconds(Clock)-Start_Time;
      Arr(I) := Curs;
      I := I+1;
      --Curs.Rs(Rnum) := R;
      Arr(I) := Curs;
      I := I+1;
   end LogStick ;

end Lab4_log;