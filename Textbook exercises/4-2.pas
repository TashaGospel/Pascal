const fi = '4-2.inp';
	  fo = '4-2.out';
	  maxn = 1000;
var a:array[1..maxn] of integer;
	n:longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	close(f);
end;

procedure output;
var f:text;
procedure main(d:longint);
var i,j:longint;
begin
	for i:=0 to 1 do
	begin
		a[d]:=i;
		if d < n then main(d+1)
		else
		begin
			for j:=1 to n do write(f,a[j]);
			writeln(f);
		end;
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