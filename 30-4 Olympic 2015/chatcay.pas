uses math;
const fi = 'chatcay.inp';
	  fo = 'chatcay.out';
	  maxn = 1000;
var v,c:array[1..maxn] of longint;
	a:array[0..maxn,0..maxn] of longint;
	n,w:longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,w);
	for i:=1 to n do readln(f,v[i],c[i]);
	close(f);
	fillchar(a,sizeof(a),0);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
	for j:=1 to w do
	begin
		if (j < v[i]) then a[i,j]:=a[i-1,j]
		else a[i,j]:=max(a[i-1,j-v[i]]+c[i],a[i-1,j]);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,a[n,w]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
