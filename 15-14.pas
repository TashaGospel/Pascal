const fi = '15-14.inp';
	  fo = '15-14.out';
	  maxn = 101;

var n:longint;
	a,b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
end;

function min(i,j:longint):longint;
begin
	if i <= j then exit(i) else exit(j);
end;

procedure main;
var i,j:longint;
begin
	for i:=2 to n do
	begin
		b[0,i]:=maxint;
		b[i,0]:=maxint;
	end;
	for i:=1 to n do
		for j:=1 to n do b[i,j]:= min(b[i-1,j],b[i,j-1]) + a[i,j];
end;

function path(i,j:longint):string;
var tmp1,tmp2:string;
begin
	str(i,tmp1);
	str(j,tmp2);
	if (i = 1) and (j = 1) then exit(tmp1 + tmp2)
	else if b[i-1,j] <= b[i,j-1] then exit(path(i-1,j) + ' ' + tmp1 + tmp2)
	else exit(path(i,j-1)  + ' ' + tmp1 + tmp2);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n,n]);
	write(f,path(n,n));
	close(f);
end;

begin
	input;
	main;
	output;
end.
