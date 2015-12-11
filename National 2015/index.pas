const fi = 'index.inp';
      fo = 'index.out';
      maxn = 1000001;

var n,m:longint;
    a:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
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

procedure output;
var f:text;
    i,cur:longint;
begin
    quicksort(1,n);
    assign(f,fo);
    rewrite(f);
    cur:=0;
    i:=1;
    while m > 0 do
    begin
        if cur = a[i] then
        begin
            inc(i);
            cur:=a[i-1]+1;
        end
        else
        begin
            write(f,cur,' ');
            inc(cur);
            dec(m);
        end;
    end;
    close(f);
end;

begin
    input;
    output;
end.
