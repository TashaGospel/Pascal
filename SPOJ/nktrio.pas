const fi = 'nktrio.inp';
	  fo = 'nktrio.out';
	  maxn = 1001;

var n:longint;
	a:array[1..maxn,1..maxn] of longint;

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

procedure output(i,j,k:longint);
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,i,' ',j,' ',k);
	close(f);
	halt;
end;

{ we can do this because it's only 3 steps }
procedure visit(c, num, start, prev:longint);
var i:longint;
begin
	if num <= 2 then
	begin
		for i:=1 to n do 
			if (a[c,i] = 1) and (i <> prev) then visit(i, num + 1, start, c)
	end
	else
		if (a[c,start] = 1) then output(start, prev, c);
end;

procedure main;
var i:longint;
begin
	for i:=1 to n do visit(i,1,i,0);
end;

begin
	input;
	main;
	output(-1,-1,-1);
end.	
