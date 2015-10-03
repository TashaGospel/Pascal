uses math;
const fi = '15-4.inp';
	  fo = '15-4.out';
	  maxn = 10001;

var n,l:longint;
	w,v:array[1..maxn] of longint;
	a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,l);
	for i:=1 to n do read(f,w[i],v[i]);
	close(f);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to l do
			if j-w[i] < 0 then a[i,j]:=a[i-1,j]
			else a[i,j]:=max(a[i-1,j],a[i-1,j-w[i]]+v[i]);
end;

function path(i,j:longint):string;
var tmp:string;
begin
	if (i <= 0) or (j <= 0) then exit('');
	if a[i,j] = a[i-1,j] then exit(path(i-1,j))
	else
	begin
		str(i,tmp);
		exit(path(i-1,j-w[i]) + tmp + ' ');
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,a[n,l]);
	write(f,path(n,l));
	close(f);
end;

begin
	input;
	main;
	output;
end.
