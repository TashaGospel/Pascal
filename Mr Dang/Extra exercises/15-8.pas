uses math;
const fi = '15-8.inp';
      fo = '15-8.out';
      maxn = 101;

var k,n:longint;
    a,b:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,k,n);
    for i:=1 to k do
        for j:=1 to n do read(f,a[i,j]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to k do
        for j:=i to n do
            b[i,j]:=max(b[i-1,j-1]+a[i,j],b[i,j-1]);
end;

function path(c,d:longint):string;
var tmp:string;
begin
    if c <= 0 then exit('');
    if b[c,d] = b[c,d-1] then exit(path(c,d-1));
    str(d,tmp);
    exit(path(c-1,d-1) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[k,n]);
    write(f,path(k,n));
    close(f);
end;

begin
    input;
    main;
    output;
end.
