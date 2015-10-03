const fi = 'sub.inp';
      fo = 'sub.out';
      maxn = 101;

var n,t:longint;
    a:array[1..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,t);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;
