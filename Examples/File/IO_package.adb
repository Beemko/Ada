with Ada.Text_Io;
use Ada.Text_Io;
with Ada.Calendar;
use Ada.Calendar;

package body Io_package is

   procedure Read (
         Str     : out String; 
         Strsize :    out Natural ) is 
      Infile : File_Type;  
   begin
      Open(
        File => Infile,   
        Mode => In_File,  
        Name => File_Name);
      Get_Line(Infile, Str, Strsize);
      Close(File => Infile);
   end;

   procedure Write (
         Str : in     String ) is 
      Outfile : File_Type;  
   begin
      Create(
        File => Outfile,  
        Mode => Out_File, 
        Name => File_Name);
      Put_Line(Outfile, Str);
      Close(File => Outfile);
   end;

   procedure Print_Log is 
      File : File_Type;  
   begin
      Create(
        File => File,     
        Mode => Out_File, 
        Name => "Log.csv");
      for J in 1..I loop
         Put_Line(File, Duration'Image(Arr(J).Time) & ";" &
            Integer'Image(Arr(J).Ws) & ";" &
            Integer'Image(Arr(J).Rs(1)) & ";" &
            Integer'Image(Arr(J).Rs(2)) & ";" &
            Integer'Image(Arr(J).Rs(3)) & ";"
            );
      end loop;
            Close(File => File);
   end Print_Log;
   
   procedure Logw (
         W : Integer; Start_Time :  Duration) is 
   begin
      Curs.Time := Seconds(Clock)-Start_Time;
      Arr(I) := Curs;
      I := I+1;
      Curs.Ws := W;
      Arr(I) := Curs;
      I := I+1;
   end Logw;

   procedure Logr (
         Rnum : Integer; 
         R    : Integer ;  Start_Time :  Duration ) is 
   begin
      Curs.Time := Seconds(Clock)-Start_Time;
      Arr(I) := Curs;
      I := I+1;
      Curs.Rs(Rnum) := R;
      Arr(I) := Curs;
      I := I+1;
   end Logr;

end Io_package;
