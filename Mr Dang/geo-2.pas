const fi = 'geo-2.inp';
      fo = 'geo-2.out';

type point = record
    x,y:extended;
    end;

    vector = record
    x,y:extended;
    end;

var res:extended;
    a:array[1..3] of point;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    for i:=1 to 3 do with a[i] do read(f,x,y);
    close(f);
end;

function getVector(p1,p2:point):vector;
var res:vector;
begin
    res.x:= p2.x - p1.x;
    res.y:= p2.y - p1.y;
    exit(res);
end;

function scalar(v1,v2: vector):extended;
begin
    exit(v1.x*v2.x + v1.y*v2.y);
end;

procedure main;
begin
    res:=scalar(getVector(a[1],a[2]),getVector(a[2],a[3]));
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
