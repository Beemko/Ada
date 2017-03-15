package body ReadersWritersPackage is 
   book : Unbounded_String;
   
   task body tWriter is
   begin
      accept Start;
      loop  
         Scheduler.Write;
         put("Writer is writing now.");
         new_line;
         delay(0.3);
         Append(book, "Test");
         Scheduler.Fin;
      end loop;
   end tWriter;
   
   task body tReader is
         m_id: integer := -1;
   begin
            accept Start(id: in integer) do
               m_id := id;
      end;
       loop
         Scheduler.Read;
         put("Reader_");
                  put(m_id);
         put(" is reading now. ");
         delay(1.0);
         put(To_String(book));
         new_line;
         Scheduler.Fin;
      end loop;
   end tReader;
   
   task body Scheduler is
      type TState is (Idle, Reading, Writing);
      state : TState := Idle;
      readers : integer := 0;
      writeWaiting : boolean := false;
   begin
      loop
      select
         when state /= Writing =>
            accept Write do
                  while readers /= 0 loop
                     accept Fin do
                        readers := readers - 1;
                        put("Scheduler: Reader STOPED reading. Readers number: ");
                        put(readers);
                        new_line;
                     end Fin;
                  end loop;
                  state := Writing;
                  put("Scheduler: Writer is writing");
                  new_line;
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
   
end ReadersWritersPackage;