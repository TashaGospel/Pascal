uses math;
const fi = 'qbbishop.inp';
      fo = 'qbbishop.out';
      maxn = 201;
      inf = maxlongint div 2;
      dx:array[1..4] of longint = (1,1,-1,-1);
      dy:array[1..4] of longint = (1,-1,-1,1);

type point = record
    x,y:longint;
    end;

var n,m,p,q,s,t,queueLeft,queueRight:longint;
    a:array[0..maxn,0..maxn] of longint;
    chosen:array[0..maxn,0..maxn] of boolean;
    queue:array[0..maxn * maxn] of point;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,p,q,s,t);
    for i:=1 to m do
    begin
        read(f,d1,d2);
        a[d1,d2]:=inf;
    end;
    close(f);
    queueLeft:=1; queueRight:=0;
end;

procedure enQueue(x:point);
begin
    inc(queueRight);
    queue[queueRight]:=x;
end;

function deQueue:point;
begin
    inc(queueLeft);
    exit(queue[queueLeft - 1]);
end;

function isEmpty:boolean;
begin
    exit(queueLeft > queueRight);
end;

function isInside(x,y:longint):boolean;
begin
    exit((1 <= x) and (x <= n) and (1 <= y) and (y <= n));
end;

procedure update(x,y,d:longint);
var i,u,v:longint;
    tmp:point;
begin
    for i:=1 to 4 do
    begin
        u:=x; v:=y;
        while (a[u,v] <> inf) and isInside(u,v) do
        begin
            if a[u,v] = 0 then a[u,v]:=d
            else a[u,v]:=min(a[u,v], d);
            if not chosen[u,v] then
            begin
                tmp.x:=u; tmp.y:=v;
                enQueue(tmp);
                chosen[u,v]:=true;
            end;
            u:=u + dx[i];
            v:=v + dy[i];
        end;
    end;
end;

procedure main;
var tmp:point;
begin
    tmp.x:=p; tmp.y:=q;
    enQueue(tmp);
    chosen[p,q]:=true;
    while not isEmpty do
    begin
        tmp:=deQueue;
        with tmp do update(x,y,a[x,y] + 1);
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if (p = s) and (q = t) then write(f,0)
    else
    begin
        main;
        if a[s,t] = 0 then write(f,-1)
        else write(f,a[s,t]);
    end;
    close(f);
end;
    
begin
    input;
    output;
end.
