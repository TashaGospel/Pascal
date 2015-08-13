const fi = '15-19.inp';
	  fo = '15-19.out';
	  maxn = 1000;

var n,m:longint;
	a,b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do
		for j:=1 to m do read(f,a[i,j]);
	close(f);
end;

function max(i,j:longint):longint;
begin
	if i >= j then exit(i) else exit(j);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to m do if a[i,j] <> 0 then
			b[i,j]:=max(b[i-1,j],b[i,j-1]) + a[i,j];
end;

function path(i,j:longint):string;
var tmp1,tmp2,tmp:string;
begin
	str(i,tmp1); str(j,tmp2);
	tmp:=tmp1 + tmp2;
	if a[i,j] = 0 then exit('')
	else if b[i-1,j] >= b[i,j-1] then exit(path(i-1,j) + tmp + ' ')
	else exit(path(i,j-1) + tmp + ' ');
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n,m]);
	write(f,path(n,m));
	close(f);
end;

begin
	input;
	main;
	output;
end.
