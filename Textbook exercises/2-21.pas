var n,count:longint;
	a:array[0..101] of longint;

procedure input;
begin
	readln(n);
end;

procedure output;
begin
	write(count);
end;

procedure main(i:longint);
begin
	if i > n then inc(count)
	else
	begin
	a[i]:=0;
	main(i+1);
	a[i]:=1;
	if a[i-1]=0 then main(i+1);
	end;
end;

begin
	input;
	main(1);
	output;
end.

