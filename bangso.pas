uses math;
const fi = 'bangso.inp';
      fo = 'bangso.out';
      maxn = 107;

var n,res:longint;
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

{procedure main;
var i,j,minVal:longint;
    b:array[1..maxn] of longint;
begin
    fillchar(b,sizeof(b),0);
    for i:=1 to n do b[i]:=a[i];

    for i:=3 to n do
    begin
        minVal:=maxlongint;
        for j:=i-2 downto 1 do
        begin
            if a[j+1] < minVal then minVal:=a[j+1];
            if b[i] < b[j] - minVal + a[i] then b[i]:=b[j] - minVal + a[i];
        end;
    end;

    for i:=1 to n do if res < b[i] then res:=b[i];
end;}

{procedure main;
var i,j:longint;
    b:array[1..maxn,1..maxn] of longint;
begin
    fillchar(b,sizeof(b),0);
    for i:=1 to n do
        for j:=1 to 2 do
        if j = 1 then b[i,j]:=max(b[i-1,j],b[i-1,2]+a[i])
        else b[i,j]:=max(b[i-1,j],b[i-1,1]-a[i]);

    res:=b[n,1];
end;}

procedure main;
var i,maxS,maxA,tmpA,tmpS:longint;
begin
    maxS:=a[1];
    maxA:=0;

    for i:=2 to n do
    begin
        tmpS:=maxA + a[i];
        tmpA:=maxS - a[i];
        maxS:=max(maxS,tmpS);
        maxA:=max(maxA,tmpA);
    end;

    res:=maxS;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
