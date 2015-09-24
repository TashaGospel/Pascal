const fi = 'ackermann.inp';
      fo = 'ackermann.out';
      maxn = 10000;

var n,m:longint;
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
    for i:=0 to m do
        for j:=0 to maxn do
        begin
            if i = 0 then a[i,j]:=j+1
            else if j = 0 then a[i,j]:=a[i-1,1]
            else a[i,j]:=a[i-1,a[i,j-1]];
        end;
end;

procedure output;
var f:text;
    i,j:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=0 to m do
    begin
        for j:=0 to n do write(f,a[i,j],' ');
        writeln(f);
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
