uses math;
const fi = '15-8.inp';
	  fo = '15-8.out';
	  maxn = 1000; 
var n,res,respos:longint;
	a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to i do read(f,a[i,j]);
	close(f);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to i do 
		begin
			a[i,j]:=max(a[i-1,j-1],a[i-1,j]) + a[i,j];
			if res < a[i,j] then 
			begin
				res:=a[i,j];
				respos:=j;
			end;
		end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
	str(j,tmp);
	if i = 1 then exit(tmp);
	if a[i-1,j-1] >= a[i-1,j] then exit(path(i-1,j-1) + ' ' + tmp)
	else exit(path(i-1,j) + ' ' + tmp);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	write(f,path(n,respos));
	close(f);
end;

begin
	input;
	main;
	output;
end.
