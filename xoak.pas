const fi = 'xoak.inp';
	  fo = 'xoak.out';
	  maxn = 11;
	  dx:array[1..4] of integer = (0,0,-1,1);
	  dy:array[1..4] of integer = (1,-1,0,0);
var n,x,y,k:longint;
	a,b:array[1..maxn,1..maxn] of longint;

function input:boolean;
var f:text;
	i,j:longint;
begin	
	assign(f,fi);
	reset(f);
	read(f,n,x,y,k);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	b:=a;
	if a[x,y] <> 0 then exit(false) else exit(true);
end;

procedure main(x,y:longint);
var i,u,v:longint;
begin
	b[x,y]:=0;
	for i:=1 to 4 do 
	begin
		u:=x+dx[i]; v:=y+dy[i];
		if (1<=u) and (u<=n) and (1<=v) and (v<=n) and (b[u,v] = k) then main(u,v);
	end;
end;

procedure output;
var f:text;
	i,j:longint;
begin
	assign(f,fo);
	rewrite(f);
	if input then 
	begin
		main(x,y);
		for i:=1 to n do
		begin
			for j:=1 to n do write(f,a[i,j],' ');
			writeln(f);
		end;
		writeln(f);
		for i:=1 to n do
		begin
			for j:=1 to n do write(f,b[i,j],' ');
			writeln(f);
		end;
	end
	else writeln(f,-1);
	close(f);
end;

begin
	output;
end.
