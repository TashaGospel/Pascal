const maxn = 1000;
var n,count:longint;
	a:array[0..maxn] of longint;

procedure input;
begin
	readln(n);
	a[0]:=1;
end;

procedure output(j:longint);
var i:longint;
begin
	if count = 1 then exit;
	for i:=1 to count-1 do write(a[i],' ');
	writeln(j);
end;

procedure main(c:longint);
var i:longint;
begin
	inc(count);
	for i:=a[count-1] to n-c do
	begin
		a[count]:=i;
		if c+i < n then main(c+i)
		else output(i);
	end;
	dec(count);
end;
	
begin
	input;
	main(0);
end.
