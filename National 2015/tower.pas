const fi = 'tower.inp';
      fo = 'tower.out';
      maxn = 1000001;

type peice = record
    x,y,h,index:longint;
    end;

    arr = array[1..maxn] of peice;

var n:longint;
    a:array[1..maxn] of peice;
    b:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do
    begin
        read(f,x,y,h);
        index:=i;
    end;
    close(f);
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j,mid:longint;
    tmp:peice;
begin
    i:=c; j:=d; mid:=x[(c + d) div 2].y;
    repeat
        while x[i].y > mid do inc(i);
        while x[j].y < mid do dec(j);
        if i <= j then
        begin
            tmp:=x[i];
            x[i]:=x[j];
            x[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(x,c,j);
    if i < d then quicksort(x,i,d);
end;

function binarySearch(i,j,x:longint);
var mid:longint;
begin
    res:=-1;
    mid:=(i + j) div 2;
    if b[mid]

procedure main;
var i:longint;
begin
    quicksort(a,1,n);
    for 
end;

begin
    input;
    main;
end.
