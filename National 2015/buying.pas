const fi = 'buying.inp';
      fo = 'buying.out';
      maxn = 100001;

type item = record
    p,c:qword;
    end;

var n:longint;
    s,res:qword;
    a:array[1..maxn] of item;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s);
    for i:=1 to n do with a[i] do read(f,p,c);
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j:longint;
    mid:qword;
    tmp:item;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2].p;
    repeat
        while a[i].p < mid do inc(i);
        while a[j].p > mid do dec(j);
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

function min(c,d:qword):qword;
begin
    if c <= d then exit(c) else exit(d);
end;

procedure main;
var i:longint;
    tmp:qword;
begin
    quicksort(1,n);
    for i:=1 to n do
    begin
        tmp:=min(a[i].c, s div a[i].p);
        res:=res + tmp;
        s:=s - tmp * a[i].p;
        if tmp < a[i].c then break;
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
