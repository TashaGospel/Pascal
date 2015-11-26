const fi = 'nolimit.inp';
      fo = 'nolimit.out';
      maxn = 1000001;

type arr = array[0..50] of byte;

var n:longint;
    a:array[0..50] of longint;
    num:array[0..50] of byte;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    if n >= 25 then n:=(n - 25) mod 6 + 25;
    close(f);
end;

procedure quicksort(var x:arr; l,r:longint);
var i,j,mid,tmp:longint;
begin
    i:=l; j:=r; mid:=x[l + random(r - l + 1)];
    repeat
        while x[i] < mid do inc(i);
        while x[j] > mid do dec(j);
        if i <= j then
        begin
            tmp:=x[i];
            x[i]:=x[j];
            x[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if l < j then quicksort(x,l,j);
    if i < r then quicksort(x,i,r);
end;

function sortNumber(n:longint):longint;
var i,len,res:longint;
begin
    len:=0;
    while n <> 0 do
    begin
        inc(len);
        num[len]:=n mod 10;
        n:=n div 10;
    end;
    quicksort(num,1,len);
    res:=0;
    for i:=1 to len do res:=res * 10 + num[i];
    exit(res);
end;

procedure main;
var i:longint;
begin
    a[1]:=1;
    for i:=2 to n do
    begin
        a[i]:=a[i-1] * 2;
        a[i]:=sortNumber(a[i]);
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
