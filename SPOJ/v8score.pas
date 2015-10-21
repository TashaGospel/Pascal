const fi = 'v8score.inp';
      fo = 'v8score.out';
      maxn = 21;

var n, m, s:longint;
    a, b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f, s, n, k);
    for i:=1 to m do
        for j:=1 to n do read(f,a[j,i]);
    close(f);
end;

procedure main;
var i, j:longint;
begin
    for i:=1 to n do
        for j:=1 to s do
            for k:=1 to m do
            begin
                b[i,j]:=max(b[i-1,j])
