const fi = '16-16.inp';
	  fo = '16-16.out';
	  maxn = 1000;
type edge = record
	u,v,w:longint;
	end;
var n,m,treeNum,res:longint;
	a:array[1..maxn] of edge;
	t:array[1..maxn] of longint; // tree
	chosen:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m); // n vertices, m edges
	for i:=1 to m do 
	begin
		with a[i] do read(f,u,v,w);
		t[i]:=i;
	end;
	close(f);
	treeNum:=n;
	fillchar(chosen,sizeof(chosen),false);
end;

// sort edges in ascending weight
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

// unite two trees
procedure union(c,d:longint);
var i:longint;
begin
	for i:=1 to n do if t[i] = d then t[i]:=c;
	dec(treeNum);
end;

procedure main;
var i:longint;
begin
	quicksort(1,m);
	// unite two sides of an edge, until treeNum = 1
	for i:=1 to m do if treeNum = 1 then break
	else with a[i] do if t[u] <> t[v] then
	begin
		union(t[u],t[v]);
		res:=res+w;
		chosen[i]:=true;
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	if treeNum = 1 then
	begin
		writeln(f,res);
		for i:=1 to m do if chosen[i] then with a[i] do writeln(f,u,' ',v,' ',w);
	end
	else write(f,-1);
	close(f);
end;

begin
	input;
	main;
	output;
end.
