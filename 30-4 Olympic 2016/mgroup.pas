uses math;
const fi = 'mgroup.inp';
      fo = 'mgroup.out';
      maxn = 50002;
      maxm = 100002;

type edge = record
    u,v,w:longint;
    end;

var n, m:longint;
    res:int64;
    a:array[0..maxm] of edge;
    b, head:array[0..maxn] of longint;
    adj, ladj:array[0..maxm * 2] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do with a[i] do read(f,u,v,w);
    close(f);
end;

procedure toAdjacency;
var i:longint;
begin
    for i:=1 to m do
    begin
        inc(head[a[i].u]);
        inc(head[a[i].v]);
    end;

    for i:=1 to n do inc(head[i],head[i-1]);

    for i:=1 to m do
    begin
        adj[head[a[i].u]]:=a[i].v;
        adj[head[a[i].v]]:=a[i].u;
        ladj[head[a[i].u]]:=a[i].w;
        ladj[head[a[i].v]]:=a[i].w;
        dec(head[a[i].u]);
        dec(head[a[i].v]);
    end;

    head[n+1]:=m*2;
end;

procedure swapVal(var u,v:longint);
var tmp:longint;
begin
    tmp:=u;
    u:=v;
    v:=tmp;
end;

procedure main;
var i,j,u,v:longint;
begin
    toAdjacency;
    for i:=1 to m do
    begin
        u:=a[i].u;
        v:=a[i].v;
        if head[u+1] - head[u] > head[v+1] - head[v] then swapVal(u,v);
        for j:=head[u]+1 to head[u+1] do b[adj[j]]:=ladj[j];
        for j:=head[v]+1 to head[v+1] do if b[adj[j]] <> 0 then
            res:=max(res, int64(a[i].w) + int64(b[adj[j]]) + int64(ladj[j]));
        for j:=head[u]+1 to head[u+1] do b[adj[j]]:=0;
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

{
procedure gentest;
var n,m,i:longint;
    f:text;
begin
    assign(f,fi);
    rewrite(f);
    n:=random(50000) + 3;
    m:=random(100000) + 3;
    writeln(f,n,' ',m);
    for i:=1 to m do writeln(f,random(n) + 1,' ',
            random(n) + 1,' ', random(1000000000) + 1);
    close(f);
end;
}

begin
//    gentest;
    input;
    main;
    output;
end.
