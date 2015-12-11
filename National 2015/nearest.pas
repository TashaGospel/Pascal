uses math;
const fi = 'nearest.inp';
      fo = 'nearest.out';
      maxn = 100001;

type point = record
    x,y:real;
    end;

    type arr = array[0..maxn] of point;

var n:longint;
    a:array[0..maxn] of point;
    b,tmp,indexes:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do
    begin
        read(f,x,y);
        b[i]:=i;
    end;
    close(f);
end;

procedure quicksort(var a:arr; c,d:longint);
var i,j:longint;
    mid:real;
    tmp:point;
begin
    i:=c; j:=d; mid:=a[c + random(d-c+1)].x;
    repeat
        while a[i].x < mid do inc(i);
        while mid < a[j].x do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(a,c,j);
    if i < d then quicksort(a,i,d);
end;

procedure merge(c,mid,d:longint);
var i,j,count:longint;
begin
    i:=c; j:=mid+1;
    for count:=c to d do
    begin
        if ((i <= mid) and (a[b[i]].y <= a[b[j]].y)) or (j > d) then
        begin
            tmp[count]:=b[i];
            inc(i);
        end
        else
        begin
            tmp[count]:=b[j];
            inc(j);
        end;
    end;

    for count:=c to d do b[count]:=tmp[count];
end;

function distance(p1,p2:point):real;
begin
    exit(sqrt(sqr(p1.x - p2.x) + sqr(p1.y - p2.y)));
end;

function closestPair(c,d:longint):real;
var mid,count,i,j:longint;
    minLen:real;
begin
    if c >= d then exit(maxlongint);
    mid:=(c + d) div 2;
    minLen:=min(closestPair(c,mid),closestPair(mid+1,d));
    merge(c,mid,d);

    count:=0;
    for i:=c to d do
        if abs(a[b[i]].x - a[mid].x) < minLen then
        begin
            inc(count);
            indexes[count]:=b[i];
        end;

    for i:=1 to count do
        for j:=i+1 to count do
        begin
            if abs(a[indexes[i]].y - a[indexes[j]].y) >= minLen then break;
            minLen:=min(minLen, distance(a[indexes[i]], a[indexes[j]]));
      //      writeln(indexes[i],' ',indexes[j],' ',minLen);
        end;

    exit(minLen);
end;

procedure main;
begin
    quicksort(a,1,n);
end;

procedure output;
var f:text;
    //i:longint;
begin
    assign(f,fo);
    rewrite(f);
    write(f,closestPair(1,n):0:3);
    close(f);
   // for i:=1 to n do writeln(a[i].y);
end;

begin
    input;
    main;
    output;
end.
