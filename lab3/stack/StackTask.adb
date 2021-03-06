--with Gnat.io;
--use Gnat.io;
with Ada.Text_IO; 
use Ada.Text_IO; 

procedure StackTask is
      package Int_Io is new Integer_IO (Integer); use Int_Io;
      type tData is array(0..2, 0..2000) of integer;
      type TElem is new integer range 1..100;      
      --stack.txt
      subtype tFileNameOut is string(1..9);
   
      Data : tData;
      Input_File    : File_Type;
   max: constant integer := 100;
   num: TElem;
      --file
      myFile: tFileNameOut;
      I,N: integer;
      
   task Stack is
      entry Push(elem: in TElem);
      entry Pop(elem: out TElem);
   end Stack;
   
   task body Stack is
      s: array(1..max) of TElem;
      top:integer := 0;
      
      procedure IPush(elem: in TElem) is
      begin
         if top < max then
            top := top + 1;
            s(top) := elem;
         end if;
      end IPush;
      
      procedure IPop(elem: out TElem) is
      begin
         if top > 0 then
            elem := s(top);
            top := top - 1;
         end if;
      end IPop;
      
   begin
      loop
         select
            accept Push(elem: in TElem) do
               IPush(elem);
            end Push;
            or
            accept Pop(elem: out TElem) do
               IPop(elem);
            end Pop;
         end select;
      end loop;
   end Stack;
begin
   
   --Pushing in stack
   Stack.Push(3);
   Stack.Push(4);
   Stack.Push(41);
   Stack.Push(5);
   Stack.Push(1);

-- write in file   
   Put("Input file name: ");
   Get(myFile);
   
   Create ( File => Input_File, Mode => Out_File, Name => myFile);
   N := 5;
   I := 0; 
   
   for i in 1..5 loop
      Stack.Pop(num);
      Data(0,i) := Integer(num);
   end loop;
   
   New_Line; Put("Output in  " & myFile);
     WHILE   I < N LOOP
       I := I + 1;
       Put ( File =>  Input_File, Item => Data(0, i));
       New_Line(File =>Input_File);
     END LOOP;
   Close ( File => Input_File);
      
end StackTask;