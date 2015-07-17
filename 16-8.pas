const fi = '16-8.inp';
	  fo = '16-8.out';
	  maxn = 1000;
var n:longint;
	a:array[1..maxn,1..maxn] of boolean;

procedure input;
var f:text;
	d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	while not eof(f) do
	begin
		read(d1,d2);
		a[d1,d2]:= true;
		a[d2,d1]:= true;
	end;
	close(f);
end;

procedure main(i:longint);
var
begin

