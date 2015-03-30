Uses math;
Var a,b:array[0..100,0..100] of longint;
	m,n,res:longint;
	c:array[1..100] of longint;

Procedure Input;
Var f:text;
	i,j:longint;
Begin
	assign(f, 'wtoe.inp');
	reset(f);
	readln(f,m,n);
	for i:=1 to m do
	begin
		for j:=1 to n do read(f, a[j,i]);
		readln(f);
	end;
	close(f);
End;

Procedure Main;
Var i,j:longint;
Begin
	for i:=1 to m do b[1,i]:=a[1,i];
	for i:=2 to n do
		for j:=1 to m do b[i,j]:=max(max(b[i-1,j-1],b[i-1,j]),b[i-1,j+1])+a[i,j];
End;

Procedure Resul;
Var i:longint;
begin
	res:=-maxlongint;
	for i:=1 to m do if res < b[n,i] then
	begin
		res:=b[n,i];
		c[n]:=i;
	end;
	i:=n;
	while i > 1 do
	begin
		dec(i);
		if (b[i,c[i+1]-1] > b[i,c[i+1]]) and (b[i,c[i+1]-1] > b[i,c[i+1]+1]) then c[i]:=c[i+1]-1
		else if b[i,c[i+1]] > b[i,c[i+1]+1] then c[i]:=c[i+1]
		else c[i]:=c[i+1]+1;
	end;
end;

Procedure Output;
var i:longint;
	f:text;
begin
	assign(f, 'wtoe.out');
	rewrite(f);
	writeln(f,res);
	for i:=1 to n do write(f,c[i],' ');
	close(f);
end;

begin
	Input;
	Main;
	Resul;
	Output;
end.
