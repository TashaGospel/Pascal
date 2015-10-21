const fi = '15-6.inp';
      fo = '15-6.out';
      maxn = 1000;

var m,n:longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,m,n);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do a[0,i]:=1;
    for i:=1 to m do
        for j:=1 to n do 
        begin
            if i < j then a[i,j]:=a[i,j-1]
            else a[i,j]:=a[i,j-1] + a[i-j,j];
        end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[m,n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
