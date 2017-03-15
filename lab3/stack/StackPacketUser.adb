with Gnat.io;
use Gnat.io;
with StackPacket;
use StackPacket;

procedure StackPacketUser is
   num: TElem;
begin
   Push(1);
   Push(2);
   Push(3);
   
   Pop(num);
   put( integer(num) );
   new_line;
   Pop(num);
   put( integer(num) );
   new_line;
   Pop(num);
   put( integer(num) );
   new_line;
end StackPacketUser;