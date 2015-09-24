const fi = 'thantien.inp';
      fo = 'thantien.out';
      maxn = 100001;

type edge = record
    u,v,w:longint;
    end;

var n,m,num:longint;
    res:int64;
    a:array[1..maxn] of edge;
    chosen:array[1..maxn] of boolean;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do read(f,a[i].u,a[i].v,a[i].w);
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:edge;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2].w;
    repeat
        while a[i].w < mid do inc(i);
        while a[j].w > mid do dec(j);
        if i<=j then
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
    chosen[1]:=true;
    while num < n - 1 do
    begin
        for i:=1 to m do if chosen[a[i].u] xor chosen[a[i].v] then
        begin
            chosen[a[i].u]:=true;
            chosen[a[i].v]:=true;
            inc(num);
            res:=res+a[i].w;
            break;
        end;
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
    quicksort(1,m);
    main;
    output;
end.




