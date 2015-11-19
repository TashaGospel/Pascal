uses math;
const fi = 'hermes.inp';
      fo = 'hermes.out';
      maxn = 20001;

type point = record
    x,y:longint;
    end;

var n:longint;
    a:array[0..maxn] of point;
    b,c:array[0..maxn] of longint;

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

procedure main;
var i:longint;
begin
    for i:=1 to n do
    begin
        b[i]:=min(b[i-1],c[i-1]) + abs(a[i].x - a[i-1].x);
        c[i]:=min(b[i-1],c[i-1]) + abs(a[i].y - a[i-1].y);
    end
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,min(b[n],c[n]));
    close(f);
end;

begin
    input;
    main;
    output;
end.
