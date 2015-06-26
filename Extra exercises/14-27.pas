const fi = '14-27.inp';
	  fo = '14-27.out';
	  dx:array[1..4] of longint = (-1,1,0,0);
	  dy:array[1..4] of longint = (0,0,1,-1);
	  maxn = 1000;
var n,x,y:longint;
	a:array[0..maxn,0..maxn] of longint;

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
	for i:=1 to n do 
	begin
		a[0,i]:=2;
		a[n+1,i]:=2;
		a[i,0]:=2;
		a[i,n+1]:=2;
	end;
end;

procedure output(i:boolean);
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,i);
	close(f);
	halt;
end;

procedure main(c,d:longint);
var i,u,v:longint;
begin
	for i:=1 to 4 do
	begin
		u:=c+dx[i]; v:=d+dy[i];
		if a[u,v]=2 then output(true);
		if (a[u,v] = 0) then 
		begin	
			a[u,v]:=1;
			main(u,v);
			a[u,v]:=0;
		end;
	end;
end;
	
begin
	input;
	main(x,y);
	output(false);
end.
