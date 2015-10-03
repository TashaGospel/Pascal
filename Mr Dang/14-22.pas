var n:longint;

procedure input;
begin
	readln(n);
end;

procedure transfer(ori,des,num:longint);
begin
	if num = 1 then writeln(ori,'->',des)
	else
	begin
		transfer(ori,6-ori-des,num-1);
		writeln(ori,'->',des);
		transfer(6-ori-des,des,num-1);
	end;
end;

begin
	input;
	transfer(1,3,n);
end.
