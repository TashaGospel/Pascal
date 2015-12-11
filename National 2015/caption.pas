uses math;
const fi = 'caption.inp';
      fo = 'caption.out';
      maxn = 101;
      inf = maxlongint div 2;

var n,m,s,t:longint;
    a:array[0..maxn,0..maxn] of longint;
    d,b:array[0..maxn] of longint;
    chosen:array[0..maxn] of boolean;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,s,t);
    for d1:=1 to n do
        for d2:=1 to n do a[d1,d2]:=inf;
    for i:=1 to n do
    begin
        read(f,b[i]);
        if b[i] = 0 then b[i]:=inf;
    end;
    for i:=1 to m do
    begin
        read(f,d1,d2,a[d1,d2]);
        a[d2,d1]:=a[d1,d2];
    end;
    close(f);

    for i:=1 to n do d[i]:=inf;
    d[s]:=0;
end; 

function main:longint;
var count,i,minVal,minPos:longint;
begin
    for count:=1 to n do
    begin
        minVal:=inf;
        for i:=1 to n do if (not chosen[i]) and (d[i] < minVal) and (d[i] < b[i]) then
        begin
            minVal:=d[i];
            minPos:=i;
        end;

        if minPos = t then exit(d[t]);
        if minVal = inf then exit(-1);
        chosen[minPos]:=true;

        for i:=1 to n do if not chosen[i] then
            d[i]:=min(d[i], d[minPos] + a[minPos,i]);
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,main);
    close(f);
end;

begin
    input;
    output;
end.
