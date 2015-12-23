const fi = 'boxstack.inp';
      fo = 'boxstack.out';
      maxn = 1001;

type thing = record
    h,x,y:longint;
    end;

var n:longint;
    a:array[0..maxn] of thing;

procedure swapVal(var x,y:longint);
var tmp:longint;
begin
    tmp:=x;
    x:=y;
    y:=tmp;
end;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do
    begin
        read(f,x,y);
        if x < y then swapVal(x,y);
    end;
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=a[c + random(d - c + 1)].x;
    repeat
        while a[i].x > mid do inc(i);
        while a[j].x < mid do dec(j);
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
