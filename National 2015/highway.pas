const fi = 'highway.inp';
      fo = 'highway.out';
      maxn = 751;

type point = record
    x,y:real;
    end;
    edge = record
    x,y:longint;
    end;

var n,m,resCount:longint;
    a:array[0..maxn,0..maxn] of real;
    d:array[0..maxn] of real;
    p:array[0..maxn] of point;
    chosen:array[0..maxn] of boolean;
    res:array[0..maxn] of edge;
    trace:array[0..maxn] of longint;


procedure input;
var f:text;
    i,j,d1,d2:longint;
    tmp:real;
begin
    assign(f,fi);
    reset(f);
    read(f,n);

    for i:=1 to n do with p[i] do read(f,x,y);

    for i:=1 to n do
        for j:=1 to n do
        begin
            tmp:=sqrt(sqr(p[i].x - p[j].x) + sqr(p[i].y - p[j].y));
            a[i,j]:= tmp; a[j,i]:=tmp;
        end;

    read(f,m);
    for i:=1 to m do
    begin
        read(f,d1,d2);
        a[d1,d2]:=0; a[d2,d1]:=0;
    end;

    for i:=1 to n do d[i]:=maxlongint;
    d[1]:=0;

    close(f);
end;

function getVertex:longint;
var i,minPos:longint;
    minVal:real;
begin
    minVal:=maxlongint;
    for i:=1 to n do if (d[i] < minVal) and (not chosen[i]) then
    begin
        minVal:=d[i];
        minPos:=i;
    end;
    exit(minPos);
end;

procedure swapval(var c,d:longint);
var tmp:longint;
begin
    tmp:=c;
    c:=d;
    d:=tmp;
end;

procedure main;
var count,u,i:longint;
begin
    for count:=1 to n do
    begin
        u:=getVertex;
        chosen[u]:=true;

        if d[u] <> 0 then
        begin
            inc(resCount);
            with res[resCount] do
            begin
                x:=trace[u];
                y:=u;
                if x > y then swapval(x,y);
            end;
        end;

        for i:=1 to n do if (a[u,i] < d[i]) and (not chosen[i]) then
        begin
            d[i]:=a[u,i];
            trace[i]:=u;
        end;
    end;
end;

procedure quicksort(c,d:longint);
var i,j:longint;
    mid,tmp:edge;
begin
    i:=c; j:=d; mid:=res[(c + d) div 2];
    repeat
        while (res[i].x < mid.x) or ((res[i].x = mid.x) and (res[i].y < mid.y)) do
            inc(i);
        while (res[j].x > mid.x) or ((res[j].x = mid.x) and (res[j].y > mid.y)) do
            dec(j);
        if i <= j then
        begin
            tmp:=res[i];
            res[i]:=res[j];
            res[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

procedure output;
var f:text;
    i:longint;
begin
    quicksort(1,resCount);
    assign(f,fo);
    rewrite(f);
    writeln(f,resCount);
    for i:=1 to resCount do writeln(f,res[i].x,' ',res[i].y);
    close(f);
end;

begin
    input;
    main;
    output;
end.
