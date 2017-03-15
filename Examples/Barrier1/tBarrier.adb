with Text_IO; use Text_IO;
package body tBarrier  is
protected body t4Barrier is
  entry Arrive when timeTL = false is
    begin
      count := count + 1;
    if count < 4  then 
           requeue Go;
    else
     count := count - 1; timeTL := True;  Put("   !!!!");
    end if;
   end;

  entry Go  when timeTL = true is
begin
       
count := count - 1;
     if count = 0 
          then timeTL := False; 
     end if;
   end ;
end t4Barrier;
end tBarrier;