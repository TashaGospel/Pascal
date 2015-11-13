const fi = 'rtri.inp';
      fo = 'rtri.out';
      maxn = 1000001;

type point = record
    x,y:longint;
    end;

var n:longint;
    res:qword;
    a:array[0..maxn] of point;
    bx,by:array[0..maxn] of longint;

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
        inc(bx[x]);
        inc(by[y]);
    end;
    close(f);
end;

procedure main;
var i:longint;
begin
    for i:=1 to n do
        with a[i] do
            res:=res + qword((bx[x] - 1)) * (by[y] - 1);
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
