const fi = '15-5.inp';
	  fo = '15-5.out';
	  maxn = 1001;

var n, m, respos:longint;
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
	for i:=1 to n-1 do
		for j:=1 to n do b[i,j]:=max(b[i-1,j],b[i,j-1]) + a[i,j];

	for j:=1 to m do
	begin
		b[n,j]:=b[n-1,j] + a[n,j];
		if b[n, respos] < b[n,j] then respos:=j;
	end;
end;

function path(i,j:longint):string;
var tmp1,tmp2,tmp:string;
begin
	if (i = 1) and (j = 1) then exit('11');
	str(i,tmp1);
	str(j,tmp2);
	tmp:=tmp1 + tmp2;
	if b[i-1,j] >= b[i,j-1] then exit(path(i-1,j) + ' ' + tmp)
	else exit(path(i,j-1) + ' ' + tmp)
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n, respos]);
	write(f,path(n-1, respos), ' ', n, respos);
	close(f);
end;

begin
	input;
	main;
	output;
end.
