uses math;
const fi = 'nhahang.inp';
      fo = 'nhahang.out';
      maxn = 1001;

type thing = record
    t, p, c:longint;
    end;

var n, k, res:longint;
    a:array[1..maxn] of thing;
    b:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    for i:=1 to n do with a[i] do read(f,t,p,c);
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=a[(c + d) div 2].t;
    repeat
        while a[i].t < mid do inc(i);
        while a[j].t > mid do dec(j);
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
        b[i]:=a[i].p;
        for j:=i-1 downto 1 do 
            if (a[i].t - a[j].t >= abs(a[i].c - a[j].c)) and (b[j] + a[i].p > b[i]) then
                b[i]:=b[j] + a[i].p;
        res:=max(res,b[i]);
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
