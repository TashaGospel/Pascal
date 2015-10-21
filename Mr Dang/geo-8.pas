const fi = 'geo-8.inp';
      fo = 'geo-8.out';
      eps = 0.0001;

type point = record
    x,y:real;
    end;
      
var a,b,c,m:point;
    res1:real;
    res2:longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,a.x,a.y,b.x,b.y,c.x,c.y,m.x,m.y);
    close(f);
end;

function getArea(a,b,c:point):real;
begin
    exit( abs( a.x*(b.y-c.y) + b.x*(c.y - a.y) + c.x*(a.y - b.y) ) / 2 );
end;

function isOnLine(a,b,c:point):boolean;
begin
    if abs((c.x-a.x) * (b.y - a.y) - (c.y - a.y) * (b.x - a.x)) < eps then exit(true)
    else exit(false);
end;

function isInside(a,b,c,m:point):boolean;
begin
    if abs(getArea(a,b,m) + getArea(a,c,m) + getArea(b,c,m) - getArea(a,b,c)) < eps then exit(true)
    else exit(false);
end;

procedure main;
begin
    res1:=getArea(a,b,c);
    if isOnLine(a,b,m) or isOnLine(a,c,m) or isOnLine(b,c,m) then res2:=0
    else if isInside(a,b,c,m) then res2:=1
    else res2:=-1;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res1:0:2);
    write(f,res2);
    close(f);
end;

begin
    input;
    main;
    output;
end.
