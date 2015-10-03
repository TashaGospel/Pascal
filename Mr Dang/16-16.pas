const fi = '16-16.inp';
	  fo = '16-16.out';
	  maxn = 1000;
type edge = record
	u,v,w:longint;
	end;
var n,m,res,chosen:longint;
	a:array[1..maxn] of edge;
	availEdge,availVertex:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m); //n vertices, m edges
	for i:=1 to m do with a[i] do read(f,u,v,w);
	close(f);
	fillchar(availEdge,sizeof(availEdge),true);
	fillchar(availVertex,sizeof(availVertex),true);
	availVertex[1]:=false;
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
	tmp:edge;
begin
	i:=c; j:=d; mid:=a[(c+d) div 2].w;
	repeat
		while a[i].w < mid do inc(i);
		while a[j].w > mid do dec(j);
		if i<=j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if c < j then quicksort(c,j);
	if i < d then quicksort(i,d);
end;

procedure main;
var i,count:longint;
begin
	quicksort(1,m);
	for count:=1 to n-1 do
		for i:=1 to m do if availEdge[i] then with a[i] do
			if availVertex[u] xor availVertex[v] then
			begin
				inc(chosen);
				availVertex[u]:=false;
				availVertex[v]:=false;
				availEdge[i]:=false;
				res:=res+w;
				break;
			end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	if chosen = n-1 then
	begin
		writeln(f,res);
		for i:=1 to m do if not availEdge[i] then with a[i] do writeln(f,u,' ',v,' ',w);
	end
	else write(f,-1);
	close(f);
end;

begin
	input;
	main;
	output;
end.
