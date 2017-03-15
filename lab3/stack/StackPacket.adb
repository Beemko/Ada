package body StackPacket is 
   s: array (1..max) of TElem;
   top: integer := 0;
   
   procedure Push( elem: in TElem ) is
   begin
	if (top < max) then
		top := top + 1;
		s(top) := elem;
	end if;
   end Push;
   
   procedure Pop ( elem: out TElem ) is
   begin
	if (top > 0) then
		elem := s(top);
		top := top - 1;
	else
		elem := nullElem;
	end if;
   end Pop;
   
end StackPacket;