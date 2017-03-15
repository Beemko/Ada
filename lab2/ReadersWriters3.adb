with Gnat.io;
use Gnat.io;
with Ada.Strings.Unbounded;
use Ada.Strings.unbounded;
procedure ReadersWriters3 is
   
   book : Unbounded_String;
   
   task Scheduler is   
      entry Read;
      entry Write;
      entry Fin;
   end Scheduler;
   
   task Writer;

   task Reader_1;
   task Reader_2;
   task Reader_3;      
   
   task body Scheduler is
      type TState is (Idle, Reading, Writing, ReadingFin, WriteReady);
      state : TState := Idle;
      readers : integer := 0;
      writeWaiting : boolean := false;
   begin
      loop
      select
         when state /= Writing =>
            accept Write do
               if (state = Reading) then
                  while readers /= 0 loop
                     accept Fin do
                        readers := readers - 1;
                        put("Scheduler: Reader STOPED reading. Readers number: ");
                        put(readers);
                        new_line;
                        if (readers = 0) then
                           state := WriteReady;
                        end if;
                     end Fin;
                  end loop;
               else
                  state := Writing;
                  put("Scheduler: Writer is writing");
                  new_line;
               end if;
            end Write;
       or when state /= Writing =>
          accept Read do
             state := Reading;
             readers := readers + 1;
             put("Scheduler: New reader is reading. Readers number: ");
             put(readers);
             new_line;
          end Read;
      or when state /= Idle =>
         accept Fin do
            if (state = Reading) then
               readers := readers - 1;
               put("Scheduler: Reader STOPED reading. Readers number: ");
               put(readers);
               new_line;
               if (readers = 0) then
                  state := Idle;
               end if;
            else
               state := Idle;
               put("Scheduler: Writer STOPED writing.");
               new_line;
            end if;
         end Fin;
      end select;
      end loop;
   end Scheduler;
   
   task body Writer is
   begin
      loop
            
         Scheduler.Write;
         put("Writer is writing now.");
         new_line;
         delay(0.3);
         Append(book, "Test");
         Scheduler.Fin;
      end loop;
   end Writer;

   task body Reader_1 is
   begin
      loop
         Scheduler.Read;
         put("Reader_1 is reading now.     ");
         delay(1.0);
         put(To_String(book));
         new_line;
         Scheduler.Fin;
      end loop;
   end Reader_1;
   
   task body Reader_2 is
   begin
      loop
         Scheduler.Read;
         put("Reader_2 is reading now.     ");
         delay(0.7);
         put(To_String(book));
         new_line;
         Scheduler.Fin;
      end loop;
   end Reader_2;
   
   task body Reader_3 is
   begin
      loop
         Scheduler.Read;
         put("Reader_3 is reading now.     ");
         delay(1.2);
         put(To_String(book));
         new_line;
         Scheduler.Fin;
      end loop;
   end Reader_3;
   
begin
   put("");
end ReadersWriters3;