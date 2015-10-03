const fi = 'select.inp';
      fo = 'select.out';
      maxn = 10001;

var n:longint;
    a:array[1..maxn,1..4] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
        for j:=1 to 4 do read(f,a[i,j]);
    close(f);
end;
