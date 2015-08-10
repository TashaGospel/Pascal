const fi = 'bclkcoun.inp';
	  fo = 'bclkcoun.out';
	  maxn = 101;
	  dx:array[1..8] of longint = (1,1,1,0,0,-1,-1,-1);
	  dy:array[1..8] of longint = (1,0,-1,1,-1,1,0,-1);

var n,m,count:longint;
	a:array[1..maxn,1..maxn] of longint;

procedure input;
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
		for j:=1 to m do
		begin
			read(f,tmp);
			if tmp = 'W' then a[i,j]:=1;
		end;
		read(f,tmp);
	end;
	close(f);
end;

procedure visit(x,y:longint);
var i,u,v:longint;
begin
	a[x,y]:=0;
	for i:=1 to 8 do
	begin
		u:=x+dx[i];
		v:=y+dy[i];
		if (1 <= u) and (u <= n) and (1 <= v) and (v <= m) and (a[u,v] = 1) then visit(u,v);
	end;
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to m do if a[i,j] = 1 then
		begin
			inc(count);
			visit(i,j);
		end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,count);
	close(f);
end;

begin
	input;
	main;
	output;
end.
