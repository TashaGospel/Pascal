const fi = 'cover.inp'
      fo = 'cover.out';
      maxn = 100001;

type thing = record
    l,r,index:longint;
    end;

var n,s,t:longint;
    a:array[0..maxn] of thing;
    res:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s,t);
    for i:=1 to n do
    begin
        read(f,a[i].l,a[i].r);
        a[i].index:=i;
    end;
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=a[c + random(d - c + 1)].r;
    repeat
        while a[i].r < mid do inc(i);
        while a[j].r > mid do dec(j);
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

function main:boolean;
var i:longint;
begin
    quicksort(1,n);
    for i:=1 to n do
    begin
        if a[i].r >= s and a[i].l <= t then
        begin
            
        
