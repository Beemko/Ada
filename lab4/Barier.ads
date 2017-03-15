package Barier is
      threads_number: integer := 0;
      procedure Start(N : in integer);

   protected type tBarier is
      entry Arrive;
      private entry Go;
	  
      threads: integer := 0;
      release_threads : boolean := false;
   end tBarier;
end Barier;