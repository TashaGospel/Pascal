const fi = '16-22.inp';
	  fo = '16-22.out';
	  maxn = 1000;
var n:longint;
	a,t:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to n do 
		begin
			read(f,a[i,j]);
			if (a[i,j] = 0) and (i <> j) then a[i,j]:= maxlongint div 2;
		end;
	close(f);
end;

procedure main;
var k,i,j:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				if a[i,j] > a[i,k] + a[k,j] then
				begin
					a[i,j]:=a[i,k] + a[k,j];
					t[i,j]:=k;
				end;
end;

function path(c,d:longint):string;
var tmp:string;
begin
	if t[c,d] = 0 then exit(' ')
	else
	begin
		str(t[c,d],tmp);
		exit(path(c,t[c,d]) + tmp + path(t[c,d],d));
	end;
end;

procedure output;
var f:text;
	i,j:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do
		for j:=1 to n do if i <> j then
		begin
			writeln(f,i,'->',j,': ',a[i,j]);
			writeln(f,i,path(i,j),j);
		end;
	close(f);
end;

begin
	input;
	main;
	output;
end.
