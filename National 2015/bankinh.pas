uses math;
const fi = 'bankinh.inp';
      fo = 'bankinh.out';
      maxn = 101;

type point = record
    x,y:real;
    end;

var n:longint;
    res:real;
    a:array[0..maxn] of point;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i].x,a[i].y);
    close(f);
end;

function distance(p1,p2:point):real;
begin
    exit(sqrt(sqr(p1.x - p2.x) + sqr(p1.y - p2.y)));
end;

function area(p1,p2,p3:point):real;
begin
    exit(abs(p1.x * (p2.y - p3.y)
           + p2.x * (p3.y - p1.y)
           + p3.x * (p1.y - p2.y)) / 2);
end;

function radius(p1,p2,p3:point):real;
var a,b,c:real;
begin
    a:=distance(p1,p2);
    b:=distance(p2,p3);
    c:=distance(p1,p3);
    if sqr(a) >= sqr(b) + sqr(c) then exit(a / 2);
    if sqr(b) >= sqr(c) + sqr(a) then exit(b / 2);
    if sqr(c) >= sqr(a) + sqr(b) then exit(c / 2);

    exit(a * b * c / (area(p1,p2,p3) * 4));
end;

{
function radius(p1,p2,p3:point):real;
var p:array[1..3] of point;
    center:point;
    i,j:longint;
    res,radi:real;
begin
    res:=maxlongint;
    p[1]:=p1; p[2]:=p2; p[3]:=p3;
    for i:=1 to 3 do
        for j:=i+1 to 3 do if (i <> j)  then
        begin
            center.x:=(p[i].x + p[j].x) / 2;
            center.y:=(p[i].y + p[j].y) / 2;
            radi:=distance(p[i],p[j]) / 2;
            if radi >= distance(center,p[6 - i - j]) then
                res:=min(res,radi);
        end;
     
    if area(p[1],p[2],p[3]) <> 0 then
        res:=min(res, distance(p[1],p[2]) * distance(p[1],p[3])
                    * distance(p[2],p[3]) / (area(p[1],p[2],p[3]) * 4));
    exit(res);
end;
}

procedure main;
var i,j,k:longint;
begin
    for i:=1 to n do
        for j:=i+1 to n do
            for k:=j+1 to n do
                res:=max(res,radius(a[i],a[j],a[k]));
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res:0:3);
    close(f);
end;
            
begin
    input;
    main;
    output;
end.
