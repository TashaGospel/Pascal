uses math;
const fi = 'maxflow.inp';
      fo = 'maxflow.out';
      maxn = 1001;

var n,m,s,t,queueHead,queueTail,res:longint;
    a:array[0..maxn,0..maxn] of longint;
    tr,queue:array[0..maxn] of longint;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,s,t);
    for i:=1 to m do read(f,d1,d2,a[d1,d2]);
    close(f);
end;

procedure enQueue(x:longint);
begin
    inc(queueTail);
    queue[queueTail]:=x;
end;

function deQueue:longint;
begin
    inc(queueHead);
    exit(queue[queueHead-1]);
end;

function isEmpty:boolean;
begin
    exit(queueHead > queueTail);
end;

function findPath:boolean;
var i,u:longint;
begin
    fillchar(tr,sizeof(tr),0);
    queueHead:=0; queueTail:=-1;
    tr[s]:=-1;
    enQueue(s);
    while not isEmpty do
    begin
        u:=deQueue;
        for i:=1 to n do if (a[u,i] > 0) and (tr[i] = 0) then
        begin
            tr[i]:=u;
            if i = t then exit(true);
            enQueue(i);
        end;
    end;
    exit(false);
end;

procedure main;
var u,minA:longint;
begin
    while findPath do
    begin
        minA:=maxlongint;
        u:=t;
        while tr[u] <> -1 do
        begin
            minA:=min(minA, a[tr[u],u]);
            u:=tr[u];
        end;
        u:=t;
        while tr[u] <> -1 do
        begin
            dec(a[tr[u],u],minA);
            inc(a[u,tr[u]],minA);
            u:=tr[u];
        end;
        inc(res,minA);
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
