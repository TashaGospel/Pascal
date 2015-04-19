const fi = '4-4.inp';
	  fo = '4-4.out';
var n:longint;
	a:array[0..10000] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	close(f);
	a[0]:=1;
end;

procedure output;
var f:text;
procedure main(i:longint);
var j:longint;
begin
	if i <= n then
	begin
	a[i]:=1;
	main(i+1);
	if a[i-1] = 1 then
	begin
		a[i]:=2;
		main(i+1);
	end;
	end
	else
	begin
		for j:=1 to n do 
			if a[j] = 1 then write(f,'A')
			else write(f,'B');
			writeln(f);
	end;
end;
begin
	assign(f,fo);
	rewrite(f);
	main(1);
	close(f);
end;

begin
	input;
	output;
end.
