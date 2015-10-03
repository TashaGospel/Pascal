const fi = 'seq.inp';
	  fo = 'seq.out';
	  maxn = 10005;
var n,res:longint;
	a,l:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
	begin
		read(f,a[i]);
		if a[i] < 0 then a[i]:=-a[i]
	end;
	close(f);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
	begin
		l[i]:=1;
		for j:=1 to i-1 do if a[j]<>0 then if (a[i] mod a[j] = 0) and (l[i] < l[j]+1) then
			l[i]:=l[j]+1;
	end;
	for i:=1 to n do if l[i] > res then res:=l[i];
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res);
	close(f);
end;

begin
	input;
	main;
	output;
end.
