const fi = 'test.inp';
	  fo = 'test.out';
	  maxn = 1000;
Var n,m,x:longint;
	a:array[1..maxn,1..maxn] of char;

Procedure Input;
var f:text;
	i,j:longint;
	tmp:char;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	read(f,tmp);
	for i:=1 to n do
	begin
		for j:=1 to m do read(f,a[i,j]);
		read(f,tmp);
	end;
	read(f,x);
	close(f);
end;

Procedure Main;
var i,j:longint;
Begin
	for i:=1 to 5 do
	for j:=1 to 4 do write(a[i,j]);
	writeln(x);
End;

BEGIN
	Input;
	main;
END.
