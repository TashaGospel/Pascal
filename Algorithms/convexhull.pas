const fi = 'convexhull.inp';
      fo = 'convexhull.out';
      maxn = 100001;

type point = record
    x,y,ctg:real;
    end;

    arr = array[1..maxn] of point;

var n,bCount,stackCount:longint;
    s,offsetX,offsetY:real;
    a,b,stack:array[1..maxn] of point;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do read(f,x,y);
    close(f);
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j:longint;
    mid:real;
    tmp:point;
begin
    i:=c; j:=d; mid:=x[c + random(d - c + 1)].ctg;
    repeat
        while x[i].ctg > mid do inc(i);
        while x[j].ctg < mid do dec(j);
        if i <= j then
        begin
            tmp:=x[i];
            x[i]:=x[j];
            x[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(x,c,j);
    if i < d then quicksort(x,i,d);
end;

procedure push(p:point);
begin
    inc(stackCount);
    stack[stackCount]:=p;
end;

procedure pop;
begin
    dec(stackCount);
end;

function areaTri(p1,p2,p3:point):real;
begin
    exit((p1.x * (p2.y - p3.y)
        +p2.x * (p3.y - p1.y)
        +p3.x * (p1.y - p2.y)) / 2);
end;

procedure main;
var i,minY:longint;
    curPoint:point;
begin
    minY:=1;
    for i:=2 to n do
        if (a[i].y < a[minY].y) or
           ((a[i].y = a[minY].y) and (a[i].x < a[minY].x)) then minY:=i;

    offsetX:=a[minY].x; offsetY:=a[minY].y;

    for i:=1 to n do
    begin
        a[i].x:=a[i].x - offsetX;
        a[i].y:=a[i].y - offsetY;
        if a[i].y <> 0 then a[i].ctg:= a[i].x / a[i].y
        else a[i].ctg:=maxlongint;
    end;

    bCount:=1; b[bCount]:=a[minY];

    quicksort(a,1,n);

    //for i:=1 to n do writeln(a[i].x,' ',a[i].y,' ',a[i].ctg);
    //writeln;

    curPoint.x:=0;
    for i:=1 to n do
    begin
        if abs(a[i].x) >= abs(curPoint.x) then curPoint:=a[i];
        if a[i].ctg <> a[i+1].ctg then
        begin
            inc(bCount);
            b[bCount]:=curPoint;
            //writeln(curPoint.x,' ',curPoint.y);
            curPoint.x:=0;
        end
    end;
    //writeln;

//    write(b[1].x);

    //for i:=1 to bCount do writeln(b[i].x,' ',b[i].y,' ');

    push(b[1]); push(b[2]);
    for i:=3 to bCount do
    begin
        //writeln(i,' ',areaTri(stack[stackCount-1],stack[stackCount],b[i]));
        while areaTri(stack[stackCount-1],stack[stackCount],b[i]) < 0 do pop;
        push(b[i]);
    end;

    //for i:=1 to stackCount do writeln(stack[i].x+offsetX,' ',stack[i].y+offsetY);

    //stack[stackCount+1]:=stack[1];
    //for i:=1 to n do s:=s + (stack[i+1].x - stack[i].x) * (stack[i+1].y + stack[i].y);
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,stackCount);
    //writeln(f,(abs(s) / 2) :0:1);
    for i:=1 to stackCount do
        writeln(f,stack[i].x+offsetX:0:3,' ',stack[i].y+offsetY:0:3);
    close(f);
end;

begin
    input;
    main;
    output;
end.
