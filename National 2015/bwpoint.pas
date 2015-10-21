uses math;
const fi = 'bwpoint.inp';
      fo = 'bwpoint.out';
      maxn = 100001;

var n,res:longint;
    a,b:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to n do read(f,b[i]);
    close(f);
end;

procedure quicksort1(c,d:longint);
var i,j,mid,tmp:longint;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2];
    repeat
        while a[i] < mid do inc(i);
        while a[j] > mid do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort1(c,j);
    if i < d then quicksort1(i,d);
end;

procedure quicksort2(c,d:longint);
var i,j,mid,tmp:longint;
begin
    i:=c; j:=d; mid:=b[(c+d) div 2];
    repeat
        while b[i] < mid do inc(i);
        while b[j] > mid do dec(j);
        if i <= j then
        begin
            tmp:=b[i];
            b[i]:=b[j];
            b[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort2(c,j);
    if i < d then quicksort2(i,d);
end;

procedure main(l1,l2,r1,r2:longint);
var i1,i2,j1,j2,left,right:longint;
begin
    inc(res);
    left:=max(a[l1],b[l2]); right:=min(a[r1],b[r2]);
    if left < right then inc(res);
    for i1:=l1+1 to r1 do
        if (a[i1] > left) then break;
    for i2:=l2+1 to r2 do
        if (b[i2] > left) then break;
    for j1:=r1-1 downto l1 do
        if (a[j1] < right) then break;
    for j2:=r2-1 downto l2 do
        if (b[j2] < right) then break;
    if (i1 <= j1) and (i2 <= j2) then main(i1,i2,j1,j2);
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
    quicksort1(1,n);
    quicksort2(1,n);
    main(1,1,n,n);
    output;
end.
