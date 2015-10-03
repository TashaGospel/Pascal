const fi = '15-12.inp';
	  fo = '15-12.out';
	  maxn = 1001;

var n, m, respos:longint;
	a, b:array[0..maxn,0..maxn] of longint;

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

function min(i,j:longint):longint;
begin
	if i <= j then exit(i) else exit(j);
end;

procedure main;
var i,j:longint;
begin
	for j:=1 to m do
	begin b[0,j]:=maxlongint;
		b[n+1,j]:=maxlongint;
	end;
	
	respos:=0;

	for j:=1 to m do
		for i:=1 to n do 
		begin
			b[i,j]:=min(b[i-1,j-1],min(b[i,j-1],b[i+1,j-1])) + a[i,j];
			if b[respos, m] > b[i,j] then respos:=i;
		end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
	str(i, tmp);
	if j = 1 then exit(tmp);
	if (b[i-1,j-1] <= b[i,j-1]) and (b[i-1,j-1] <= b[i+1,j-1]) then
		exit(path(i-1,j-1) + ' ' + tmp)
	else if (b[i,j-1] <= b[i+1,j-1]) then
		exit(path(i,j-1) + ' ' + tmp)
	else
		exit(path(i+1,j-1) + ' ' + tmp);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[respos,m]);
	write(f,path(respos,m));
	close(f);
end;

begin
	input;
	main;
	output;
end.		
