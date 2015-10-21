uses math;
const fi = 'caothu.inp';
      fo = 'caothu.out';
      maxn = 50001;
      maxm = 200001;

type edge = record
    u,v:longint;
    w:int64;
    end;

var n,m:longint;
    res:int64;
    head, adj:array[0..maxm] of longint;
    adjCost:array[0..maxm] of int64;
    edges:array[0..maxm] of edge;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do with edges[i] do read(f,u,v,w);
    close(f);
end;

procedure toAdjacency;
var i:longint;
begin
    for i:=1 to m do
    begin
        inc(head[edges[i].u]);
        inc(head[edges[i].v]);
    end;

    for i:=2 to n do head[i]:=head[i]+head[i-1];

    for i:=1 to m do
    begin
        adj[head[edges[i].u]]:=edges[i].v;
        adj[head[edges[i].v]]:=edges[i].u;
        adjCost[head[edges[i].u]]:=edges[i].w;
        adjCost[head[edges[i].v]]:=edges[i].w;
        dec(head[edges[i].u]);
        dec(head[edges[i].v]);
    end;

    head[n+1]:=2 * m;
end;

procedure main;
var i,j,k:longint;
    b:array[1..maxn] of longint;
begin
    toAdjacency;
    for i:=1 to n do
    begin
        fillchar(b,sizeof(b),0);
        for j:=head[i]+1 to head[i+1] do b[adj[j]]:=j;
        for j:=head[i]+1 to head[i+1] do
            for k:=head[adj[j]]+1 to head[adj[j]+1] do
                if (adj[k] <> adj[j]) and (adj[k] <> i) and (b[adj[k]] > 0) then
                    res:=max(res, adjCost[j] + adjCost[k] + adjCost[b[adj[k]]]);
    end;
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
