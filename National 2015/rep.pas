const fi = 'rep.inp';
      fo = 'rep.out';
      maxn = 100001;

type thing = record
    l,r:longint;
    end;

    arr = array[0..maxn] of thing;

var n,resCount:longint;
    a:array[0..maxn] of thing;
    res:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do read(f,l,r);
    close(f);
    res[0]:=-maxlongint;
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=x[(c + d) div 2].r;
    repeat
        while x[i].r < mid do inc(i);
        while x[j].r > mid do dec(j);
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

procedure main;
var i:longint;
begin
    quicksort(a,1,n);
    
    for i:=1 to n do
        if res[resCount] < a[i].l then
        begin
            inc(resCount); res[resCount]:=a[i].r-1;
            inc(resCount); res[resCount]:=a[i].r;
        end
        else if (res[resCount-1] < a[i].l) then
        begin
            inc(resCount);
            res[resCount]:=a[i].r;
            if res[resCount-1] = a[i].r then res[resCount-1]:=a[i].r-1;
        end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,resCount);
    for i:=1 to resCount do write(f,res[i],' ');
    close(f);
end;

begin
    input;
    main;
    output;
end.
