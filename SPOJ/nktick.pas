uses math;
const fi = 'nktick.inp';
	  fo = 'nktick.out';
	  maxn = 60002;
var n:longint;
	a,b,res:array[0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do read(f,a[i]);
	for i:=1 to n-1 do read(f,b[i]);
	close(f);
end;

procedure main;
var i:longint;
begin
	res[1]:=a[1];
	for i:=2 to n do res[i]:=min(res[i-1]+a[i],res[i-2]+b[i-1]);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res[n]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
