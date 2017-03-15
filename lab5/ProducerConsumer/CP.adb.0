--with Gnat.io;
--use Gnat.io;

package body CP is
 
 task body tBuffer is
            --resource
      POOL_SIZE: constant integer := 50;
      POOL        : array(1..POOL_SIZE) of Integer;
      OUT_INDEX: INTEGER := 1;
      IN_INDEX: INTEGER := 1;
      CUR_IND: INTEGER := 1;
      TMP: INTEGER := 0;
  begin 
            loop -- /* цикл обслуживания */ 
               --/* выбор из наступивших событий */ 
               select when CUR_IND < POOL_SIZE => 
                  --/* если буфер не полон, обслуживается запись */ 
                  accept Produce(C:in INTEGER) do
                     POOL(IN_INDEX):= C;-- /* запись */ 
--                     Put("P");
 --                    Put(C);
  --                   Put(" ");
                  end Produce; 
                 -- /* модификация счетчиков */ 
                  IN_INDEX := IN_INDEX mod POOL_SIZE + 1; 
                  CUR_IND := CUR_IND + 1; 
               or 
                  --/* или если буфер не пуст, обслуживается выборка */ 
                  accept Consume(C:in INTEGER) do
                     TMP := POOL(OUT_INDEX); 
    --                 Put("C");
     --                Put(C);
       --              Put(" ");
                  end Consume; 
                  --/* модификация счетчиков */ 
                  OUT_INDEX := OUT_INDEX mod POOL_SIZE + 1; 
                  CUR_IND := CUR_IND - 1;
               end select; -- /* конец выбора */ 
           end loop; --/* конец цикла обслуживания */ 
   end tBuffer; --/* конец тела сервера */ 
   
   task body tProducer is
      tProducer_id: integer;
   begin
   accept Start(p_id: in integer) do   
         tProducer_id := p_id;
      end Start;
      loop
         Buffer.Produce(tProducer_id);
  --       Buffer.Fin;
      end loop;
   end tProducer;
   
   task body tConsumer is
      tConsumer_id: integer; 
   begin
      accept Start(c_id: in integer) do
         tConsumer_id := c_id;
       end Start;
       loop
          Buffer.Consume(tConsumer_id);
--          Buffer.Fin;
       end loop;
   end tConsumer ;

end CP;
