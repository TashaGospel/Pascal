const fi = 'dijkstra.inp';
	  fo = 'dijkstra.out';
	  maxn = 1000;
type edge = record
	x,y,l:longint;
	end;
var e:array[1..maxn] of edge;
	d,trace:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;
	m,n,u,v:longint; //m:point, n:edge

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,m,n,u,v);
	for i:=1 to n do with e[i] do readln(f,x,y,l);
	close(f);
	for i:=1 to n do d[i]:=maxlongint;
	d[u]:=0;
	fillchar(avail,sizeof(avail),true);
end;

procedure relax(e:edge);
var relaxable:boolean;
begin
	with e do
	begin
		relaxable:=(d[x] < maxlongint) and (d[y] > d[x]+l);
		if relaxable then
		begin
			d[y]:=d[x]+l;
			trace[y]:=x;
		end;
	end;
end;

procedure parse;
var i,min,minpos:longint;
begin
        while avail[v] do
        begin
	//find min of available, make it fixed
	min:=maxlongint;
	for i:=1 to n do
		if (avail[i]) and (d[i] < min) then
		begin
			min:=d[i];
			minpos:=i;
		end;
	if (min = maxlongint) {no path} or (minpos = v) {shortest path found} then exit;
	avail[minpos]:=false;
	//relax edges that start with minpos
	for i:=1 to n do
		if e[i].x = minpos then relax(e[i]);
        end;
end;

function path(i:longint):string;
var tmp:string;
begin
	str(trace[i],tmp);
	if trace[i] <> u then exit(path(trace[i])+' '+tmp);
	exit('');
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,d[v]);
	write(f,u,path(v),' ',v);
	close(f);
end;

begin
	input;
	parse;
	output;
end.