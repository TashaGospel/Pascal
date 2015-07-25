const fi = 'robot.inp';
	  fo = 'robot.out';
	  dx:array[1..4] of integer = (1,0,-1,0);
	  dy:array[1..4] of integer = (0,1,0,-1);
	  maxn = 100;
var m,n,x,y:longint;
	a:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do
		for j:=1 to m do read(f,a[i,j]);
	read(f,x,y);
	a[1,1]:=1;
	a[x,y]:=2;
	close(f);
end;

procedure output(yes:boolean);
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,yes);
	close(f);
	halt;
end;

procedure main(x,y,k:longint);
var i,u,v:longint;
begin
	for i:=1 to 2 do
	begin
		if i = 2 then
		begin
			inc(k);
			if k > 4 then k:=1;
		end;
		u:=x+dx[k];
		v:=y+dy[k];
		if a[u,v] = 2 then output(true)
		else if (1<=u) and (u<=n) and (1<=v) and (v<=m) then
			if (a[u,v] = 0) then
		begin
			a[u,v]:=1;
			main(u,v,k);
			a[u,v]:=0;
		end;
	end;
end;

begin
	input;
	main(2,1,1);
	main(1,2,1);
	output(false);
end.
