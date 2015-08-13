const fi = 'c11bc2.inp';
	  fo = 'c11bc2.out';
	  maxn = 100001;

type edge = record
	u,v:longint;
	end;
	  
var n,m,count,edgeCount:longint;
	adj,head,t:array[1..maxn] of longint;
	a:array[1..maxn] of edge;
	avail:array[1..maxn] of boolean;

procedure toAdjacency;
var i:longint;
begin
	for i:=1 to edgeCount do
	begin
		inc(head[a[i].u]);
		inc(head[a[i].v]);
	end;

	for i:=2 to n do head[i]:=head[i-1]+head[i];
	
	for i:=1 to edgeCount do
	begin
		adj[head[a[i].u]]:=a[i].v;
		adj[head[a[i].v]]:=a[i].u;
		dec(head[a[i].u]);
		dec(head[a[i].v]);
	end;

	head[n+1]:=edgeCount*2;
end;

procedure DFS(c:longint);
var i:longint;
begin
	avail[c]:=false;
	t[c]:=count;
	for i:=head[c]+1 to head[c+1] do if avail[adj[i]] then DFS(adj[i]);	
end;

procedure process;
var i:longint;
begin
	for i:=1 to n do if avail[i] then
	begin
		inc(count);
		DFS(i);
	end;
end;

procedure parseFile;
var f,g:text;
	i,v,k:longint;
begin
	fillchar(avail,sizeof(avail),true);
	assign(f,fi);
	assign(g,fo);
	reset(f);
	rewrite(g);
	read(f,n,m);
	edgeCount:=0;
	for i:=2 to n do
   	begin
		read(f,v,k);
		if k = 1 then 
		begin
			inc(edgeCount);
			a[edgeCount].u:=i;
			a[edgeCount].v:=v;
		end;
	end;		

	toAdjacency;
	process;

	for i:=1 to m do
	begin
		read(f,v,k);
		if t[v] = t[k] then writeln(g,'NO')
		else writeln(g,'YES');
	end;
	close(f);
	close(g);
end;


begin
	parseFile;
end.
