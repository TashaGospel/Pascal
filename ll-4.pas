const fi = 'll-4.inp';
      fo = 'll-4.out';
      maxn = 1000;

type value = record
    v,index:longint;
    end;

var n,m,res:longint;
    a:array[1..maxn] of value;
    b,chosenCount:array[1..maxn] of longint;
    chosen:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do 
    begin
        read(f,a[i].v);
        a[i].index:=i;
    end;
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:value;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2].v;
    repeat
        while a[i].v > mid do inc(i);
        while a[j].v < mid do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i>j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

procedure main;
var i,j,minPos:longint;
begin
    quicksort(1,n);
    
    for i:=1 to n do
    begin
        minPos:=1;
        for j:=2 to m do if b[j] < b[minPos] then minPos:=j;
        b[minPos]:=b[minPos]+a[i].v;
        inc(chosenCount[minPos]);
        chosen[minPos,chosenCount[minPos]]:=a[i].index;
    end;

    res:=b[1];
    for i:=2 to m do if b[i] > res then res:=b[i];
end;

procedure output;
var f:text;
    i,j:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    for i:=1 to m do
    begin
        for j:=1 to chosenCount[i] do write(f,chosen[i,j],' ');
        writeln(f);
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
