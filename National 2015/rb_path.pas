uses math;
const fi = 'rb_path.inp';
      fo = 'rb_path.out';
      maxn = 1001;
      inf = maxlongint div 2;

var n,m,s,t:longint;
    a,c:array[0..maxn,0..maxn] of longint;
    d:array[0..maxn,0..1] of longint;
    chosen:array[0..maxn,0..1] of boolean;
    { B = 1; R = 0}

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    s:=1; t:=n;
    for d1:=1 to n do
        for d2:=1 to n do a[d1,d2]:=inf;
    for i:=1 to m do
    begin
        read(f,d1,d2,a[d1,d2],c[d1,d2]);
        a[d2,d1]:=a[d1,d2];
        c[d2,d1]:=c[d1,d2];
    end;
    close(f);

    for i:=1 to n do d[i,0]:=inf;
    for i:=1 to n do d[i,1]:=inf;
    d[s,0]:=0; d[s,1]:=0;
end;

function main:longint;
var count,i,minVal,minPos,minC,curC:longint;
begin
    for count:=1 to n * 2 do
    begin
        minVal:=inf;
        for curC:=0 to 1 do
            for i:=1 to n do if (not chosen[i,curC]) then
                if (d[i,curC] < minVal) then
                begin
                    minVal:=d[i,curC];
                    minPos:=i;
                    minC:=curC;
                end;

        if minVal = inf then exit(-1);
        if minPos = t then exit(d[minPos,minC]);
        chosen[minPos,minC]:=true;

        for i:=1 to n do
            if (not chosen[i, 1 - minC]) and (c[minPos,i] = 1 - minC) then
                d[i, 1 - minC]:=min(d[i, 1 - minC],
                                    d[minPos, minC] + a[minPos,i]);
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
