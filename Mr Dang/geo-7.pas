const fi = 'geo-7.inp';
      fo = 'geo-7.out';

type point = record
    x,y:extended;
    end;

    vector = record
    x,y:extended;
    end;

var a:array[1..4] of point;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    for i:=1 to 4 do with a[i] do read(f,x,y);
    close(f);
end;

function check(p1,p2,p3:point):real;
begin
    exit((p3.x - p1.x) * (p2.y - p1.y) - (p3.y - p1.y) * (p2.x - p1.x));
end;

procedure output;
var f:text;
    tmp:real;
begin
    assign(f,fo);
    rewrite(f);
    tmp:= check(a[1],a[2],a[3]) * check(a[1],a[2],a[4]);
    if tmp > 0 then write(f,1)
    else if tmp = 0 then write(f,0)
    else write(f,-1);
    close(f);
end;

begin
    input;
    output;
end.
