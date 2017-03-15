package tBarrier  is
  protected type t4Barrier is
     entry Arrive;
     private
        entry Go;
     count : integer :=0;
     timeTL : boolean := false;
end t4Barrier;
end tBarrier;