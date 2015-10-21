const fi = '14-37.inp';
	  fo = '14-37.out';
	  dx:array[1..4] of longint = (-1,1,0,0);
	  dy:array[1..4] of longint = (0,0,1,-1);
	  maxn = 1000;
var n,x,y:longint;
	a:array[0..maxn,0..maxn] of longint;

procedure output(x:boolean);
var i,j:longint;
	f:text;
begin
	assign(f,fo);
	rewrite(f);
	if not x then write(f,x)
	else
	for i:=1 to n do
	begin
		for j:=1 to n do write(f,a[i,j]);
		writeln(f);
	end;
	close(f);
	halt;
end;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,x,y);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	if a[x,y] = 1 then output(false);
	a[x,y]:=1;
	for i:=1 to n do
	begin
		a[0,i]:=1;
		a[n+1,i]:=1;
		a[i,0]:=1;
		a[i,n+1]:=1;
	end
end;

procedure main(c,d:longint);
var i,u,v:longint;
begin
	a[c,d]:=2;
	for i:=1 to 4 do
	begin
		u:=c+dx[i];
		v:=d+dy[i];
		if a[u,v] = 0 then main(u,v);
	end;
end;

begin
	input;
	main(x,y);
	output(true);
end.
