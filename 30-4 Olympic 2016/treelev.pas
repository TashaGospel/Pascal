const fi = 'treelev.inp';
      fo = 'treelev.out';
      maxn = 1025;

type segment = record
    x,y:longint;
    end;

var n, k, queueL, queueR: longint;
    a: array[0..maxn] of longint;
    queue: array[0..maxn] of segment;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f, k);
    n:=1;
    for i:=1 to k do n:=n * 2;
    dec(n);
    for i:=1 to n do read(f,a[i]);
    close(f);
    queueR:= -1;
end;

procedure enQueue(x, y: longint);
var tmp:segment;
begin
    tmp.x:=x; tmp.y:=y;
    inc(queueR);
    queue[queueR]:=tmp;
end;

function deQueue:segment;
begin
    inc(queueL);
    exit(queue[queueL-1]);
end;

function queueIsEmpty:boolean;
begin
    exit(queueL > queueR);
end;

procedure main(var f:text);
var cur: segment;
    mid:longint;
begin
    enQueue(1, n);
    while not queueIsEmpty do
    begin
        cur:=deQueue;
        mid:= (cur.x + cur.y) div 2;
        if cur.x <= mid - 1 then enQueue(cur.x, mid-1);
        if mid+1 <= cur.y then enQueue(mid+1, cur.y);
        write(f, a[mid]);
        if cur.y = n then writeln(f) else write(f,' ');
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    main(f);
    close(f);
end;

begin
    input;
    output;
end.
