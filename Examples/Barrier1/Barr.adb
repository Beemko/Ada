with  tBarrier; use tBarrier;
with Gnat.IO; Use Gnat.IO;
procedure Barr is
 B: t4Barrier;
task T1;
task T2;
task T3;
task T4;

task body T1 is
i : integer := 0;
begin
 loop
   --Put("1 ");
   i :=  i + 1;
   if i = 10 then i := 0; B.Arrive; end if;
 end loop;
end T1;

task body T2 is
i : integer := 0;
begin
 loop
  -- Put("2 ");
   i :=  i + 1;
   if i = 10 then i := 0; B.Arrive; end if;
 end loop;
end T2;
task body T3 is
i : integer := 0;
begin
 loop
  -- Put("3 ");
   i :=  i + 1;
   if i = 10 then i := 0; B.Arrive; end if;
 end loop;
end T3;
task body T4 is
i : integer := 0;
begin
 loop
  -- Put("4 ");
   i :=  i + 1;
   if i = 10 then i := 0; B.Arrive; end if;
 end loop;
end T4;

Begin
 Put_Line("Barrier");
end Barr;