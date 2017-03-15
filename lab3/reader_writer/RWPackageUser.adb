with ReadersWritersPackage;
use ReadersWritersPackage;

procedure RWPackageUser is
   Writer: tWriter;
   Readers: array (1..4) of tReader;
begin
   for i in integer range 1..4 loop
      Readers(i).Start(i);
   end loop;
   Writer.Start;
end RWPackageUser;