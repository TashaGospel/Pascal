uses math;
const fi = 'activity.inp';
      fo = 'activity.out';
      maxn = 1000001;

type thing = record
    x,y,index:longint;
    end;

    arr = array[1..maxn] of thing;

var n,res,resPos:longint;
    a:array[1..maxn] of thing;
    b,tr:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do
    begin
        read(f,x,y);
        index:=i;
    end;
    close(f);
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=x[(c + d) div 2].x;
    repeat
        while x[i].x < mid do inc(i);
        while x[j].x > mid do dec(j);
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

{
function binarySearch(x:longint):longint;
var posi,mid:longint;
begin
    posi:=1; l:=1; r:=res;
    while l <= r do
    begin
        mid:=(l + r) div 2;
        if (a[i].y <= a[b[mid]].y then
        begin
            posi:=max(posi,mid);
            l:=mid+1;
        end
        else r:=mid - 1;
    end;
    exit(posi);
end;
}
            
procedure main;
var i,j,tmp:longint;
begin
    quicksort(a,1,n);

    for i:=1 to n do
    begin
        b[i]:=1;
        for j:=i-1 downto 1 do
            if (a[i].x >= a[j].y) and (b[j] + 1 > b[i]) then
            begin
                b[i]:=b[j] + 1;
                tr[i]:=j;
                res:=max(res,b[i]);
                resPos:=i;
            end;
    end;


{
    for i:=1 to n do
    begin
        if a[i].x >= a[b[res]].y then
        begin
            tr[i]:=b[res];
            inc(res);
            b[res]:=i;
        end
        else
        begin
            tmp:=binarySearch(i);

    end;
}
end;

procedure path(var f:text);
var i:longint;
begin
    i:=resPos;
    while i <> 0 do
    begin
        writeln(f,a[i].index);
        i:=tr[i];
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    path(f);
    close(f);
end;

begin
    input;
    main;
    output;
end.
