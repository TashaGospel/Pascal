const fi = '16-21.inp';
	  fo = '16-21.out';
	  maxn = 1000;
var n,x:longint;
	a:array[1..maxn,1..maxn] of longint;
	d,trace:array[0..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,x);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	fillchar(avail,sizeof(avail),true);	
	for i:=0 to n do d[i]:=maxlongint;
	d[x]:=0;
end;

// relax the edge
procedure relax(x,y:longint);
begin
	if (a[x,y] > 0) and (d[x] + a[x,y] < d[y]) then
	begin
		d[y]:=d[x] + a[x,y];
		trace[y]:=x;
	end;
end;

// dijkstra
procedure main;
var count,i,minDPos:longint;
begin
	for count:=1 to n-1 do
	begin
		// find smallest d[i]
		minDPos:=0;
		for i:=1 to n do if (d[i] < d[minDPos]) and (avail[i]) then minDPos:=i;
		avail[minDPos]:=false;

		// relax adjacent edges
		for i:=1 to n do if avail[i] then relax(minDPos,i);
	end;
end;

function path(c:longint):string;
var tmp:string;
begin
	str(c,tmp);
	if c = x then exit(tmp) else exit(path(trace[c]) + ' ' + tmp);
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do if i <> x then writeln(f,path(i),': ',d[i]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
