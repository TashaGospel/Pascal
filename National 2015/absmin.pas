uses math;
const fi = 'absmin.inp';
      fo = 'absmin.out';
      maxn = 100001;

var n,res:longint;
    a,b:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to n do read(f,b[i]);
    close(f);
end;

procedure swapval(var c,d:longint);
var tmp:longint;
begin
    tmp:=c;
    c:=d;
    d:=tmp;
end;

procedure quicksort1(c,d:longint);
var i,j,mid:longint;
begin
    i:=c; j:=d; mid:=a[(c + d) div 2];
    repeat
        while a[i] < mid do inc(i);
        while a[j] > mid do dec(j);
        if i <= j then
        begin
            swapval(a[i],a[j]);
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort1(c,j);
    if i < d then quicksort1(i,d);
end;

procedure quicksort2(c,d:longint);
var i,j,mid:longint;
begin
    i:=c; j:=d; mid:=b[(c + d) div 2];
    repeat
        while b[i] < mid do inc(i);
        while b[j] > mid do dec(j);
        if i <= j then
        begin
            swapval(b[i],b[j]);
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort2(c,j);
    if i < d then quicksort2(i,d);
end;

procedure main;
var i,j:longint;
begin
    quicksort1(1,n);
    quicksort2(1,n);
    i:=1; j:=1;
    res:=maxlongint;
    while (i <= n) and (j <= n) do
    begin
        res:=min(res, abs(a[i] - b[j]));
        if (a[i] <= b[j]) then inc(i)
        else inc(j);
    end;
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
