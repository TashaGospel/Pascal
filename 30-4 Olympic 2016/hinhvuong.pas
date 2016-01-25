uses math;
const fi = 'hinhvuong.inp';
      fo = 'hinhvuong.out';
      maxn = 1001;

var n,m,res:longint;
    a:array[0..maxn,0..maxn] of longint;
    b:array[0..maxn,0..maxn,0..1] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
        for j:=1 to m do read(f,a[i,j]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            begin
                b[i,j,a[i,j]]:=min(min(b[i-1,j,a[i,j]],
                                       b[i-1,j-1,a[i,j]]),
                                       b[i,j-1,a[i,j]]) + 1;
                res:=max(res,b[i,j,a[i,j]]);
            end;
end;

procedure output;
var f:text;
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
