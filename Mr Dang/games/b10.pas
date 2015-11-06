const fi = 'b10.inp';
      fo = 'b10.out';
      maxn = 1000;

var n,res,xorSum:longint;
    a:array[1..maxn] of longint;

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

procedure main;
var i:longint;
begin
    xorSum:=a[1];
    for i:=2 to n do xorSum:=xorSum xor a[i];
    if xorSum = 0 then res:=0
    else res:=1;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    for i:=1 to n do if a[i] > a[i] xor xorSum then
    begin
        write(f,i,' ',a[i] - a[i] xor xorSum);
        break;
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
