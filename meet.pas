uses math;
const fi = 'meet.inp';
	  fo = 'meet.out';
	  maxn = 100;
var n,m,u,v,mintime,minpos:longint;
	a,t:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j,d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,m,u,v);
	for i:=1 to n do
	for j:=1 to n do
		if i = j then a[i,j]:= 0 else a[i,j]:=maxint;
	for i:=1 to m do readln(f,d1,d2,a[d1,d2]);
	close(f);
end;

procedure shortestpath;
var k,i,j:longint;
begin
	for k:=1 to n do
	for i:=1 to n do
	for j:=1 to n do
		if a[i,k] + a[k,j] < a[i,j] then
		begin
			t[i,j]:=k;
			a[i,j]:=a[i,k] + a[k,j];
		end;
end;

procedure main;
var time,i:longint;
begin
	for i:=1 to n do
	begin
		time:=max(a[u,i],a[v,i]);
		if mintime > time then 
		begin
			mintime:=time;
			minpos:=i;
		end;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,minpos,' ',mintime);
	close(f);
end;

begin
	mintime:=maxlongint;
	input;
	shortestpath;
	main;
	output;
end.

