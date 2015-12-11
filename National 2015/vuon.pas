const fi = 'vuon.inp';
      fo = 'vuon.out';
      eps = 0.00001;

type point = record
    x,y:longint;
    end;

var a:array[1..3] of point;

function area(p1,p2,p3:point):real;
begin
    exit(abs(p1.x * (p2.y - p3.y)
           + p2.x * (p3.y - p1.y)
           + p3.x * (p1.y - p2.y)) / 2);
end;

function isInside(p1,p2,p3,p4:point):boolean;
begin
    exit(abs(area(p4,p1,p2) + area(p4,p2,p3) + area(p4,p3,p1)
           - area(p1,p2,p3)) <= eps);
end;

procedure parseFile;
var f,g:text;
    i,t,res:longint;
    cur:point;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    for i:=1 to 3 do with a[i] do read(f,x,y);
    writeln(g,area(a[1],a[2],a[3]):0:1);
    read(f,t);
    res:=0;
    for i:=1 to t do
    begin
        with cur do read(f,x,y);
        if isInside(a[1],a[2],a[3],cur) then inc(res);
    end;
    write(g,res);
    close(f);
    close(g);
end;

begin
    parseFile;
end.
