with Gnat.io;
use Gnat.io;
with Ada.Strings.Unbounded;
use Ada.Strings.unbounded;

package ReadersWritersPackage is 
   task type tWriter is
         entry Start;
   end tWriter;
   task type tReader is
         entry Start(id: in integer);
      end tReader;
   task Scheduler is      
            entry Read;
      entry Write;
      entry Fin;
   end Scheduler;
end ReadersWritersPackage;