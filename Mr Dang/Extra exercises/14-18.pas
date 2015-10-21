var n:longint;
	a:array[0..101] of longint;

procedure input;
begin
	readln(n);
end;

procedure output;
var i:longint;
begin
	for i:=1 to n do if a[i]=0 then write('A') else write('B');
	write(' ');
end;

procedure main(i:longint);
begin
	if i > n then output
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
end.

