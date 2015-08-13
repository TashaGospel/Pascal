const fi = '15-3.inp';
	  fo = '15-3.out';
	  maxn = 1000;

var n,m:longint;
	a,b:array[1..maxn] of longint;
	c:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do read(f,a[i]);
	for i:=1 to m do read(f,b[i]);
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
		for j:=1 to m do
		begin
			if a[i] = b[j] then c[i,j]:=c[i-1,j-1] + 1
			else c[i,j]:=max(c[i-1,j],c[i,j-1]);
		end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
	if (i <= 0) or (j <= 0) then exit('');
	if a[i] = b[j] then 
	begin
		str(a[i],tmp);
		exit(path(i-1,j-1) + tmp + ' ');
	end
	else if c[i-1,j] >= c[i,j-1] then exit(path(i-1,j))
	else exit(path(i,j-1));
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,c[n,m]);
	write(f,path(n,m));
	close(f);
end;

begin
	input;
	main;
	output;
end.
