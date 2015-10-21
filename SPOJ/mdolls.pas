const fi = 'mdolls.inp';
      fo = 'mdolls.out';
      maxn = 20001;

type thing = record
    w,h:longint;
    end;

var n, res:longint;
    a:array[0..maxn] of thing;
    b:array[0..maxn] of longint;

procedure quicksort(c,d:longint);
var i,j:longint;
    tmp, mid:thing;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2];
    repeat
        while (a[i].w < mid.w) or ((a[i].w = mid.w) and (a[i].h > mid.h)) do inc(i);
        while (a[j].w > mid.w) or ((a[j].w = mid.w) and (a[j].h < mid.h)) do dec(j);
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

function binarySearch(i:longint):longint;
var l,r,mid:longint;
begin
    l:=1; r:=res;
    while l <> r do
    begin
        mid:=(l + r) div 2;
        if a[i].h <= a[b[mid]].h then l:=mid + 1 else r:=mid;
    end;
    exit(l);
end;

procedure main;
var i:longint;
begin
    quicksort(1,n);

    b[1]:=1; res:=1;
    for i:=2 to n do if a[i].h <= a[b[res]].h then
    begin
        inc(res);
        b[res]:=i;
    end
    else b[binarySearch(i)]:=i;
end;

procedure parseFile;
var f,g:text;
    t,i,j:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,t);
    for i:=1 to t do
    begin
        read(f,n);
        for j:=1 to n do read(f,a[j].w,a[j].h);
        main;
        writeln(g,res);
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
