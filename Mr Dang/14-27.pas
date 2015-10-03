const s:string = 'DHSP2';
var a:array[1..1000] of longint;
	count:longint;

procedure output;
var i,j,rightpos:longint;
begin
	inc(count);
	rightpos:=1;
	writeln(count,':');
	write(' ',s[1]);
	for i:=2 to length(s) do
	begin
		if a[i] = 1 then
		begin
			write(' ',s[i]);
			inc(rightpos);
		end
		else
		begin
			writeln;
			for j:=1 to 2*rightpos-1 do write(' ');
			write(s[i]);
		end;
	end;
	writeln;
	readln;
end;

procedure main(c:longint);
var i:longint;
begin
	for i:=0 to 1 do
	begin
		a[c]:=i;
		if c < length(s) then main(c+1)
		else output;
	end;
end;

begin
	main(2);
end.
