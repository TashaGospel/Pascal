uses math;
const fi = 'robot19.inp';
	  fo = 'robot19.out';
	  maxn = 1000;
var m,n,res,respos:longint;
	a,b,trace:array[1..maxn,1..maxn] of longint;
	respath:array[1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,m,n);
	for i:=1 to n do 
		for j:=1 to n do read(f,a[i,j]);
	close(f);
end;

procedure main;
var i,j,d1,d2,d3:longint;
begin
	for i:=2 to m do
		for j:=1 to n do
		begin
			d1:=abs(a[i,j]-a[i-1,j])+b[i-1,j];
			if j-1 < 1 then d2:=maxlongint else d2:=abs(a[i,j]-a[i-1,j-1])+b[i-1,j-1];
			if j+1 > n then d3:=maxlongint else d3:=abs(a[i,j]-a[i-1,j+1])+b[i-1,j+1];
			if (d1 <= d2) and (d1<=d3) then
			begin
				trace[i,j]:=j;
				b[i,j]:=d1;
			end
			else if d2<=d3 then
			begin
				trace[i,j]:=j-1;
				b[i,j]:=d2;
			end
			else
			begin
				trace[i,j]:=j+1;
				b[i,j]:=d3;
			end;
		end;
end;

procedure result;
var i:longint;
begin
	res:=b[m,1];
	respos:=1;
	for i:=2 to n do if b[m,i] < res then
	begin
		res:=b[m,i];
		respos:=i;
	end;
	respath[m]:=respos;
	for i:=m-1 downto 1 do respath[i]:=trace[i+1,respath[i+1]];
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to m do writeln(f,i,' ',respath[i]);
	close(f);
end;

begin
	input;
	main;
	result;
	output;
end.
