const fi = 'profesor.inp';
	  fo = 'profesor.out';
	  maxn = 100000;
var a:array[1..maxn,1..2] of integer;
	b:array[1..maxn,1..2] of longint;
	maxnum:integer;
	n,maxsum:longint;


procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do readln(f,a[i,1],a[i,2]);
	close(f);
	fillchar(b,sizeof(b),0);
	maxsum:=0;
	maxnum:=6;
end;

procedure main;
var i:longint;
	j:integer;
begin
	b[1,1]:=1;b[1,2]:=1;
	for i:=2 to n do
	for j:=1 to 2 do
	begin
		if a[i,j] = a[i-1,1] then b[i,j]:=b[i-1,1] + 1
		else if a[i,j] = a[i-1,2] then b[i,j]:=b[i-1,2] + 1
		else b[i,j]:=1;
		if maxsum < b[i,j] then
		begin
			maxsum:= b[i,j];
			maxnum:= a[i,j];
		end
		else if maxsum = b[i,j] then if maxnum > a[i,j] then maxnum:=a[i,j];
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,maxsum,' ',maxnum);
	close(f);
end;

begin
	input;
	main;
	output;
end.
