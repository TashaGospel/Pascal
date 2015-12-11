const fi = 'ballgmvn.inp';
      fo = 'ballgmvn.out';
      maxn = 2001;

type point = record
    x,y,index:longint;
    end;

    point2 = record
    ctg:real;
    index:longint;
    end;

var n:longint;
    s1,s2:array[0..maxn] of point;
    a:array[0..maxn] of point2;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with s1[i] do
    begin
        read(f,x,y);
        index:=i;
    end;
    for i:=1 to n do with s2[i] do
    begin
        read(f,x,y);
        index:=i + n;
    end;
    close(f);
end;

{
function comp(c,d:real):longint;
begin
    if abs(c - d) <= eps then exit(0)
    else if c < d then exit(-1)
    else exit(1);
end;

function compare(p1,p2:point):longint;
begin
    if (p1.y = 0) and (p2.y = 0) then exit(comp(p1.x,p2.x))
    else if (p1.y = 0) then exit(1)
    else if (p2.y = 0) then exit(-1)
    else exit(comp(p1.x/p1.y,p2.x/p2.y));
end;
}

procedure quicksort(c,d:longint);
var i,j:longint;
    mid:real;
    tmp:point2;
begin
    i:=c; j:=d; mid:=a[c + random(d-c+1)].ctg;
    repeat
        while a[i].ctg < mid do inc(i);
        while mid < a[j].ctg do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

procedure output(x1,x2,x3:longint; ok:boolean);
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if ok then write(f,x1,' ',x2,' ',x3)
    else write(f,-1);
    close(f);
    halt;
end;

procedure main;
var i,k,u,v:longint;
begin
    for k:=1 to n do
    begin
        for i:=1 to n do
        begin
            u:=s1[i].x-s2[k].x;
            v:=s1[i].y-s2[k].y;
            a[i].index:=s1[i].index;
            if v = 0 then a[i].ctg:=maxlongint else a[i].ctg:=u / v;
        end;

        quicksort(1,n);

        for i:=1 to n-1 do
            if a[i].ctg = a[i+1].ctg then
                output(s2[k].index,a[i].index,a[i+1].index,true);
    end;

    for k:=1 to n do
    begin
        for i:=1 to n do
        begin
            u:=s2[i].x-s1[k].x;
            v:=s2[i].y-s1[k].y;
            a[i].index:=s2[i].index;
            if v = 0 then a[i].ctg:=maxlongint else a[i].ctg:=u / v;
        end;

        quicksort(1,n);

        for i:=1 to n-1 do
            if a[i].ctg = a[i+1].ctg then
                output(s1[k].index,a[i].index,a[i+1].index,true);
    end;
end;

begin
    input;
    main;
    output(0,0,0,false);
end.
