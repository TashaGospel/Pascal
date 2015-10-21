const fi = 'phantich.inp';
      fo = 'phantich.out';
      maxn = 101;

var n:longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    close(f);
end;

{a[i,j] is number of ways to separate number i into sum of numbers lower or equal to j}
procedure main;
var i,j:longint;
begin
    a[0,0]:=1;
    for i:=0 to n do
        for j:=0 to n do
            if i < j then a[i,j]:=a[i,j-1]
            else a[i,j]:=a[i,j-1] + a[i-j,j];
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[n,n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
