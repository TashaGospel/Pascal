const fi = 'geo-1.inp';
      fo = 'geo-1.out';
      maxn  = 1000;

type point = record
    x,y:extended;
    end;

var n:longint;
    res:extended;
    a:array[1..maxn] of point;

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

function distance(p1,p2:point):real;
begin
    exit(sqrt(sqr(p1.x - p2.x) + sqr(p1.y - p2.y)));
end;

procedure main;
var i:longint;
begin
    for i:=2 to n do res:=res + distance(a[i-1],a[i]);
    res:= res + distance(a[n],a[1]);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res:0:2);
    close(f);
end;

begin
    input;
    main;
    output;
end.
