const fi = 'DFS.inp';
	  fo = 'DFS-adjList.out';
	  maxn = 1000;

type edge = record
	u,v:longint;
	end;

var n,m:longint;
	a:array[1..maxn] of edge;
	adj,head:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to m do read(f,a[i].u,a[i].v);
	close(f);
	fillchar(avail,sizeof(avail),true);
end;

procedure toAdjacency;
var i:longint;
begin
	for i:=1 to m do
	begin
		inc(head[a[i].u]);
		inc(head[a[i].v]);
	end;

	for i:=2 to n do head[i]:=head[i-1]+head[i];
	
	for i:=1 to m do
	begin
		adj[head[a[i].u]]:=a[i].v;
		adj[head[a[i].v]]:=a[i].u;
		dec(head[a[i].u]);
		dec(head[a[i].v]);
	end;

	head[n+1]:=m*2;
end;

procedure DFS(c:longint; var f:text);
var i:longint;
begin
	write(f,c,' ');
	avail[c]:=false;
	for i:=head[c]+1 to head[c+1] do if avail[adj[i]] then DFS(adj[i],f);
end;
		
procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to m*2 do write(f,adj[i], ' ');
	writeln(f);
	for i:=1 to n+1 do write(f,head[i], ' ');
	writeln(f);
	DFS(1,f);
	close(f);
end;

begin
	input;
	toAdjacency;
	output;
end.
