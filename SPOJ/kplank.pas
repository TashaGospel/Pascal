const fi = 'kplank.inp';
      fo = 'kplank.out';
      maxn = 100001;

var n:longint;
    a:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure minHeight(l,r:longint);
var 
