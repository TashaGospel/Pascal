const fi = 'seq.inp';
      fo = 'seq.out';
      maxn = 100001;

type num = record
     v,index:int64;
     end;

     arr = array[0..maxn] of num;

var n,k:int64;
    a:array[0..maxn] of num;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    for i:=1 to n do with a[i] do
    begin
        read(f,v);
        index:=i;
    end;
    close(f);
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j,mid:longint;
    tmp:num;
begin
    i:=c; j:=d; mid:=x[(c + d) div 2].v;
    repeat
        while x[i].v < mid do inc(i);
        while x[j].v > mid do dec(j);
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

function binarySearch(x:int64; l,r:longint):longint;
var mid:longint;
begin
    while l <= r do
    begin
        mid:=(l + r) div 2;
        if a[mid].v = x then exit(mid)
        else if a[mid].v < x then l:=mid+1 else r:=mid - 1;
    end;
    exit(0);
end;

procedure output(s1,s2:longint);
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,s1,' ',s2);
    close(f);
    halt;
end;
            
procedure main;
var i,tmp:longint;
begin
    quicksort(a,1,n);

    for i:=1 to n do
    begin
        tmp:=binarySearch(a[i].v - k,1,i-1);
        if tmp <> 0 then output(a[i].index,a[tmp].index);
    end;
end;

begin
    input;
    main;
    output(0,0);
end.
