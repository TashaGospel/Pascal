uses math;
const fi = 'auction.inp';
      fo = 'auction.out';
      maxn = 1001;

var n, m, res, resPos:longint;
    a:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,m,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid,tmp:longint;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2];
    repeat
        while a[i] < mid do inc(i);
        while a[j] > mid do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

procedure main;
var i:longint;
begin
    quicksort(1,n);

    for i:=1 to n do if min(n - i + 1, m) * a[i] > res then
    begin
        res:=min(n - i + 1, m) * a[i];
        resPos:=i;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[resPos], ' ', res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
