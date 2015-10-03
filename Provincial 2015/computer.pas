const fi = 'computer.inp';
      fo = 'computer.out';
      maxn = 1001;

type edge = record
    x,y,v:longint;
    end;

var n,res:longint;
    a:array[1..maxn] of edge;
    b:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do read(f,x,y,v);
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:edge;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2].x;
    repeat
        while a[i].x < mid do inc(i);
        while a[j].x > mid do dec(j);
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
    for i:=1 to n do
    begin
        b[i]:=a[i].v;
        for j:=i-1 downto 1 do if (a[i].x >= a[j].y) and (b[i] < b[j] + a[i].v) then
            b[i]:=b[j] + a[i].v;
        if res < b[i] then res:=b[i];
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
