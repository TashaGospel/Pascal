const fi = 'kbuild.inp';
      fo = 'kbuild.out';
      maxn = 200005;

type edge = record
    u,v:longint;
    end;

var n,m,res:longint;
    parent,adj,head,height:array[0..maxn] of longint;
    edges,paths:array[0..maxn] of edge;
    chosen:array[0..maxn] of boolean;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n-1 do with edges[i] do read(f,u,v);
    read(f,m);
    for i:=1 to m do with paths[i] do read(f,u,v);
    close(f);
end;

procedure toAdjacency;
var i:longint;
begin
    for i:=1 to n-1 do
    begin
        inc(head[edges[i].u]);
        inc(head[edges[i].v]);
    end;

    for i:=2 to n do head[i]:=head[i-1] + head[i];

    for i:=1 to n-1 do
    begin
        adj[head[edges[i].u]]:=edges[i].v;
        adj[head[edges[i].v]]:=edges[i].u;
        dec(head[edges[i].u]);
        dec(head[edges[i].v]);
    end;

    head[n+1]:=(n-1) * 2;
end;

procedure up(var x:longint);
begin
    chosen[x]:=true;
    x:=parent[x];
end;

function lca(u,v:longint):longint;
begin
    while height[u] < height[v] do up(v);
    while height[u] > height[v] do up(u);
    while u <> v do
    begin
        up(v);
        up(u);
    end;
    exit(u);
end;

procedure makeTree(c:longint);
var i,vertex:longint;
begin
    for i:=head[c]+1 to head[c+1] do
    begin
        vertex:=adj[i];
        if vertex <> parent[c] then
        begin
            parent[vertex]:=c;
            height[vertex]:=height[c] + 1;
            makeTree(vertex);
        end;
    end;
end;

procedure main;
var i:longint;
begin
    toAdjacency;
    makeTree(1);
//    for i:=1 to n do write(height[i],' ');
    for i:=1 to m do chosen[lca(paths[i].v,paths[i].u)]:=true;
    for i:=1 to n do if not chosen[i] then inc(res);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
