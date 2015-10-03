const fi = 'mien.inp';
	  fo = 'mien.out';
	  maxn = 1000;
	  dx:array[1..4] of integer = (0,0,-1,1);
	  dy:array[1..4] of integer = (1,-1,0,0);
var m,n,count,res,cur:longint;
	a:array[1..maxn,1..maxn] of longint; 
procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,m,n);
	for i:=1 to m do for j:=1 to n do read(f,a[i,j]);
	close(f);
end;

procedure check(x,y:longint);
var i,u,v:longint;
begin
	inc(cur);
	a[x,y]:=1;
	for i:=1 to n do 
	begin
		u:=x+dx[i];
		v:=y+dy[i];
		if (1<=u) and (u<=m) and (1<=v) and (v<=n) and (a[u,v]=0) then check(u,v);
	end;
end;
	
procedure main;
var i,j:longint;
begin
	for i:=1 to m do
		for j:=1 to n do
			if a[i,j]=0 then 
			begin
				cur:=0;
				inc(count);
				check(i,j);
				if cur > res then res:=cur;
			end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,count);
	write(f,res);
	close(f);
end;

begin
	input;
	main;
	output;
end.
