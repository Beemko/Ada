with Ada.Text_IO; use Ada.Text_IO; 

procedure FileTest is
package Int_Io is new Integer_IO (Integer); use Int_Io;
type tData is array(1..2, 1..20000) of integer;
   Data : tData;

subtype tFName is string (1..5);
subtype tFileName is string(1..9);
subtype tFileNameOut is string(1..13);

iFN       : tFileName;
iFName : tFName;
oFN       : tFileNameOut;
i           : integer;
Input_File    : File_Type;
Output_File : File_Type;
N                     : integer;

begin
 Put("Input File Name"); New_Line;
 Get(iFName);
 iFN := iFName & ".dat";
 oFn := "Out_" & iFn;
  Open ( File => Input_File, Mode => In_File, Name => iFN );
  I := 0;  Put("Input");
   WHILE NOT End_of_File ( File => Input_File ) AND I < 20000 LOOP
      I := I + 1;
      Get ( File => Input_File, Item => Data(1, i));
       Skip_Line ( File => Input_File );
    END LOOP;
  New_Line; Put("End of File");   
  Close ( File => Input_File );
    
  N := i;
  New_Line; Put ( N);
  Create ( File => Output_File, Mode => Out_File, Name => oFN );
 I := 0; New_Line; Put("Output in  " & oFN);
   WHILE   I < N LOOP
      I := I + 1;
      Put ( File => Output_File, Item => Data(1, i));
      New_Line(File => Output_File);
    END LOOP;
   Close ( File => Output_File );
end;