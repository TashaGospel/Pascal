uses math;
const fi = 'asummin.inp';
      fo = 'asummin.out';
      maxn = 100001;

type num = record
     v,index:int64;
     end;

     arr = array[1..maxn] of num;

var n,m,s1,s2:int64;
    res:int64;
    a,b:array[1..maxn] of num;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do with a[i] do
    begin
        read(f,v);
        index:=i;
    end;
    for i:=1 to m do with b[i] do
    begin
        read(f,b[i].v);
        index:=i;
    end;
    close(f);
end;

procedure quicksort(var x:arr; c,d:int64);
var i,j,mid:int64;
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

function binarySearch(x:int64):int64;
var res,l,r,mid:int64;
begin
    res:=1; l:=1; r:=m;
    while l <= r do
    begin
        mid:=(l + r) div 2;
        //writeln(l,' ',r,' ',mid,' ',b[mid].v,' ',abs(x + b[mid].v));
        if abs(x + b[mid].v) < abs(x + b[res].v) then res:=mid;
        if b[mid].v < -x then l:=mid+1 else r:=mid - 1;
    end;
    exit(res);
end;
            
procedure main;
var i:longint;
    tmp:int64;
begin
    quicksort(b,1,m);

    res:=maxlongint * 2;
    for i:=1 to n do
    begin
        tmp:=binarySearch(a[i].v);
        if abs(int64(a[i].v) + b[tmp].v) < res then
        begin
            res:=abs(int64(a[i].v) + b[tmp].v);
            s1:=i; s2:=tmp;
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[s1].index,' ',b[s2].index);
    //write(binarySearch(5));
    close(f);
end;

begin
    input;
    main;
    output;
end.
