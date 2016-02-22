uses math;
const fi = 'stock.inp';
      fo = 'stock.out';
      maxn = 201;

var n, m:longint;
    a,b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
        for j:=1 to m do read(f,a[j,i]);
    i:=n; n:=m; m:=i;
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            for k:=0 to min(m, j) do
                b[i,j]:=max(b[i,j], b[i-1,j-k] + a[i,k])
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,b[n,m]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
