const fi = '15-16.inp';
	  fo = '15-16.out';
	  maxn = 1001;

var n,m:longint;
	a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	close(f);
end;

procedure main;
var i,j:longint;
begin
	a[0,1]:=1;
	for i:=1 to n do
		for j:=1 to m do a[i,j]:=a[i-1,j] + a[i,j-1];
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,a[n,m]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
