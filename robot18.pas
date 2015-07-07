const fi = 'robot18.inp';
	  fo = 'robot18.out';
	  maxn = 505;
var m,n:longint;
	a:array[0..maxn,0..maxn] of qword;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,m,n);
	close(f);
end;

procedure main;
var i,j:longint;
begin
	a[0,1]:=1;
	for i:=1 to m do
		for j:=1 to n do a[i,j]:=a[i-1,j] + a[i,j-1];
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,a[m,n]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
