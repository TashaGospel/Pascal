uses math;
const fi = '2-2.inp';
	  fo = '2-2.out';
var n,count:longint;
	a:array[1..1000] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	close(f);
end;

function isprime(d:longint):longint;
var i:longint;
begin
	for i:=1 to trunc(sqrt(d)) do if d mod i = 0 then exit(i);
	exit(0);
end;

procedure main(d:longint):
var c:longint;
begin
	if d = 1 then exit;
	c:=isprime(d);
	if c = 0 then
	begin
		inc(count);
		a[count]:=d;
	end
	else 
	begin
		main(c);
		main(d div c);
	end;
end;

procedure output;
var f:text;
begin
	for i:=1 to count do write
