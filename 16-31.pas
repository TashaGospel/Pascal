uses math;
const fi = '16-31.inp';
	  fo = '16-31.out';
	  maxn = 21;
	  dx:array[1..4] of longint = (0,0,-1,1);
	  dy:array[1..4] of longint = (1,-1,0,0);
var n,m,sumall,s1,res:longint;
	a,b,c:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do
		for j:=1 to m do
		begin
			read(f,a[i,j]);
			sumall:=sumall+a[i,j];
		end;
	close(f);
	res:=maxlongint;
end;

procedure output;
var f:text;
	i,j:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do
	begin
		for j:=1 to m do write(f,c[i,j],' ');
		writeln(f);
	end;
	close(f);
	halt;
end;

procedure check(sum:longint);
begin
	if abs(sumall - sum*2) < res then
	begin
		res:=abs(sumall - sum*2);
		c:=b;
	end;
end;

procedure main(x,y,sum:longint);
var i,u,v:longint;
begin
	for i:=1 to 4 do
	begin
		u:=x+dx[i];
		v:=y+dy[i];
		if (1<=u) and (u<=n) and (1<=v) and (v<=m) and (b[u,v]=0) then
		begin
			b[u,v]:=1;
			check(sum+a[u,v]);
//			if sum + a[u,v] = s1 then output;
			main(u,v,sum+a[u,v]);
			b[u,v]:=0;
		end;
	end;
end;

begin
	input;
{	for s1:=sumall div 2 downto 1 do
	begin
		b[1,1]:=1;
		main(1,1,a[1,1]);
	end;}
	b[1,1]:=1;
	main(1,1,a[1,1]);
	output;
end.
