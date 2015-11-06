const fi = 'tours.inp';
      fo = 'tours.out';
      maxn = 20001;

type edge = record
    u,v:longint;
    end;

var n,m:longint;
    a:array[1..maxn] of edge;
    adj,head,tr:array[1..maxn] of longint;
    notAvail:array[1..maxn] of boolean;
    b:array[1..maxn,1..maxn] of boolean;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do with a[i] do read(f,u,v);
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

    for i:=1 to n do head[i]:=head[i] + head[i-1];

    for i:=1 to m do
    begin
        adj[head[a[i].u]]:=a[i].v;
        adj[head[a[i].v]]:=a[i].u;
        dec(head[a[i].u]);
        dec(head[a[i].v]);
    end;

    head[n+1]:=2 * m;
end;

function path(c,d:longint):ansistring;
var tmp:ansistring;
begin
    str(c,tmp);
    if tr[c] = 0 then exit(tmp + ' ');
    if c <> d then exit(tmp + ' ' + path(tr[c],d))
    else exit(tmp + ' ');
end;

procedure main(c:longint; var f:text);
var i,u:longint;
begin
    notAvail[c]:=true;
    for i:=head[c]+1 to head[c+1] do
    begin
        u:=adj[i];
        if not notAvail[u] then
        begin
            tr[u]:=c;
            main(u,f);
        end
        else if (tr[c] <> u) and (not b[c,u]) and (not b[u,c]) then
        begin
            writeln(f,path(c,u),c);
            b[c,u]:=true;
            b[u,c]:=true;
        end;
    end;
end;

procedure DFS(c:longint);
var i:longint;
begin
    notAvail[c]:=true;
    for i:=head[c]+1 to head[c+1] do if not notAvail[adj[i]] then DFS(adj[i]);
end;

function countComponents:longint;
var i,res:longint;
begin
    res:=0;
    for i:=1 to n do if not notAvail[i] then
    begin
        inc(res);
        DFS(i);
    end;
    exit(res);
end;
    
procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    toAdjacency;
    writeln(f,m - n + countComponents);
    fillchar(notAvail,sizeof(notAvail),false);
    main(1,f);
    close(f);
end;

begin
    input;
    output;
end.
