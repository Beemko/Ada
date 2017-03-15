with CP;
use CP;

procedure ProducerConsumer is

  Producers: array(1..2) of tProducer;
  Consumers: array(1..3) of tConsumer;
 
begin

      Producers(1).Start(1);
      Producers(2).Start(2);

      Consumers(1).Start(1);
      Consumers(2).Start(2);
      Consumers(3).Start(3);


end ProducerConsumer;