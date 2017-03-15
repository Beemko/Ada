with Ada.Text_Io;
use Ada.Text_Io;

package body Io is

   procedure ReadStr ( Res : in out String; Last : out Natural ) is
      InFile : File_Type;
      --text : string (1..Res'Length);
      --len : natural;
   begin
      --Put_Line("1");
      Open(
        File => InFile,
        Mode => In_File,
        Name => "test.txt");

      --Put_Line("2 - " & Positive'Image(Res'Length));

      Get_Line(InFile, Res, Last);
      --Res := text(1..Res'Length);

      --Put_Line ("Read" & natural'Image(Last));

      Close(File => InFile);
   end;

   procedure WriteStr ( X : in String ) is
      OutFile : File_Type;
   begin
      Create(
        File => OutFile,
        Mode => Out_File,
        Name => File_Name);

      Put_Line(OutFile, X);

      Put_Line ("Write");

      Close(File => OutFile);
   end;

end Io;



