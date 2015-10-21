var n:longint;

procedure input;
begin
	readln(n);
end;

procedure transfer(num,ori,des,mid1,mid2:longint);
begin
	if num = 1 then writeln(ori,' -> ',des)
	else 
	begin
		transfer(num-1,ori,mid1,mid2,des);
		transfer(1,ori,des,mid1,mid2);
		transfer(num-1,mid1,des,ori,mid2);
	end;
end;

begin
	input;
	transfer(n,1,4,2,3);
end.

