uses math;
const fi = 'll-1.inp';
      fo = 'll-1.out';
      maxn = 1001;

type job = record
    x,y,index:longint;
    end;

var n,k,res:longint;
    a:array[1..maxn] of job;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do 
    begin
        read(f,a[i].x,a[i].y);
        a[i].index:=i;
    end;
    close(f);
end;

procedure swap(var c,d:job);
var tmp:job;
begin
    tmp:=c;
    c:=d;
    d:=tmp;
end;

procedure prep;
var i:longint;
begin
    for i:=1 to n do if a[i].x <= a[i].y then
    begin
        inc(k);
        swap(a[i],a[k]);
    end;
end;

procedure quicksort1(c,d:longint);
var i,j,mid:longint;
begin
    i:=c; j:=d; mid:=a[(c + d) div 2].x;
    repeat
        while a[i].x < mid do inc(i);
        while a[j].x > mid do dec(j);
        if i <= j then
        begin
            swap(a[i],a[j]);
            inc(i);
            dec(j);
        end;
    until i>j;
    if c < j then quicksort1(c,j);
    if i < d then quicksort1(i,d);
end;

procedure quicksort2(c,d:longint);
var i,j,mid:longint;
begin
    i:=c; j:=d; mid:=a[(c + d) div 2].y;
    repeat
        while a[i].y > mid do inc(i);
        while a[j].y < mid do dec(j);
        if i <= j then
        begin
            swap(a[i],a[j]);
            inc(i);
            dec(j);
        end;
    until i>j;
    if c < j then quicksort1(c,j);
    if i < d then quicksort1(i,d);
end;

procedure main;
var i,t1,t2:longint;
begin
    prep;
    quicksort1(1,k);
    quicksort2(k+1,n);

    t1:=0; t2:=0;
    for i:=1 to n do
    begin
        t1:=t1+a[i].x;
        t2:=max(t1,t2) + a[i].y;
    end;

    res:=t2;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    for i:=1 to n do write(f,a[i].index,' ');
    close(f);
end;

begin 
    input;
    main;
    output;
end. 
