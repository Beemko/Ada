package CP is 

task type tBuffer is   
      entry Consume(C: in integer);
      entry Produce(C: in integer);
     -- entry Fin;
end tBuffer ;   

  Buffer: tBuffer ;  

task type tProducer is
   entry Start(p_id: in integer);   
end tProducer;
   
task type tConsumer is
   entry Start(c_id: in integer);
end tConsumer;   
   
end CP;


