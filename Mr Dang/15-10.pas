uses math;
const fi = '15-10.inp';
      fo = '15-10.out';
      maxn = 1000;

var n,m,res:longint;
    a:array[1..maxn,1..maxn] of longint;
    b:array[1..maxn,1..maxn,1..4] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
        for j:=1 to m do read(f,a[i,j]);
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            for k:=1 to 4 do if a[i,j] = 1 then 
            begin
                if k = 4 then b[i,j,k]:=b[i,j-1,k]+1
                else b[i,j,k]:=b[i-1,j+k-2,k]+1;
                if b[i,j,k] > res then res:=b[i,j,k];
            end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.    
