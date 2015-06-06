const fi = 'bellmanford.inp';
	  fo = 'bellmanford.out';
	  maxn = 1000;
type edge = record
	x,y,l:longint; //x to y is l
	end;
var e:array[1..maxn] of edge; //each edge of graph
	d,trace:array[1..maxn] of longint; //d[i] shortest length from u to i
	m,n,u,v:longint; //m: points, n:edge, u:start, v:end

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,m,n,u,v);
	for i:=1 to n do
		with e[i] do readln(f,x,y,l);
	close(f);
	for i:=1 to m do d[i]:=maxlongint;
	d[u]:=0;
end;

function relax(e:edge):boolean;
begin
	with e do
	begin
		relax:=(d[x] < maxlongint){there is path u -> x} and (d[x] + l < d[y]);{relax-able}
		if relax then
		begin
			d[y]:=d[x]+l;//relaaaaaaaaaaaaaax
			trace[y]:=x;
		end;
	end;
end;

procedure parse;
var stop:boolean;
	i:longint;
begin
	stop:=false;
	while not stop do
	begin
		stop:=true;
		for i:=1 to n do
			if relax(e[i]) then stop:=false;
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


