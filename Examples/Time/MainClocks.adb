with Text_IO; use Text_IO;
with apClock; use apClock;

procedure MainClocks is
Task c1; Task c2; Task c3;
Task body c1 is
begin
  dtClock(10);
end c1;
Task body c2 is
begin
  dtClock(3);
end c2;
Task body c3 is
begin
  dtClock(1);
end c3;

begin
    NULL;
end MainClocks;