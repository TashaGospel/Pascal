const fi = 'dao.inp';
      fo = 'dao.out';
      maxn = 51;

type point = record
    x,y:longint;
    end;

var n,m,s,t,res:longint;
    a:array[0..maxn] of point;
    chosen:array[0..maxn] of boolean;
    d:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,s,t);
    for i:=1 to n do with a[i] do read(f,x,y);
    close(f);
    for i:=1 to n do d[i]:=maxlongint div 2;
    d[s]:=0;
end;

function inRange(i,j:longint):boolean;
begin
    exit(sqrt(sqr(a[i].x - a[j].x) + sqr(a[i].y - a[j].y)) <= m);
end;

procedure main;
var i,count,minVal,minPos:longint;
begin
    for count:=1 to n do
    begin
        minVal:=maxlongint div 2;
        for i:=1 to n do if (not chosen[i]) and (d[i] < minVal) then
        begin
            minVal:=d[i];
            minPos:=i;
        end;

        if minVal = maxlongint div 2 then
        begin
            res:=-1;
            exit;
        end;
        if minPos = t then
        begin
            res:=minVal-1;
            exit;
        end;
        chosen[minPos]:=true;

        for i:=1 to n do if (not chosen[i]) and (inRange(minPos,i))
        and (d[minPos] + 1 < d[i]) then
            d[i]:=d[minPos] + 1;
    end;
    res:=d[t]-1;
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
