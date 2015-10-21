const fi = '15-5.inp';
      fo = '15-5.out';
      maxn = 1000;

var n,k:longint;
    a:array[1..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    close(f);
end;

procedure main;
var i:longint;
begin
    a[1]:=1;
    for i:=2 to n do a[i]:=a[i-1]*i;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[n] div (a[k]*a[n-k]));
    close(f);
end;

begin
    input;
    main;
    output;
end.
