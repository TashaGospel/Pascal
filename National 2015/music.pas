uses math;
const fi = 'music.inp';
      fo = 'music.out';
      maxn = 1001;

type thing = record
    t0,t1,v,index:longint;
    end;

var n,s:longint;
    a:array[0..maxn] of longint;
    b,tr:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s);
    for i:=1 to n do read(f,a[i].t1);
    for i:=1 to n do read(f,a[i].v);
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=a[c + random(d - c + 1)].t1;
    repeat
        while a[i].t1 < mid do inc(i);
        while a[j].t1 > mid do dec(j);
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
var i,j:longint;
begin
    quicksort(1,n);
    for i:=1 to n do if a[i].t1 >= d then
    begin
        b[i]:=a[i].v;
        a[i].t0:=d;
        for j:=i-1 downto 1 do
        begin
            if a[i].t0
            

