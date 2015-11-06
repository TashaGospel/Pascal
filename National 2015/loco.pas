const fi = 'loco.inp';
      fo = 'loco.out';
      maxn = 1001;

var n,dmax:longint;
    b:array[1..maxn,1..maxn] of boolean;
    a,d:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure swap(var i,j:longint);
var tmp:longint;
begin
    tmp:=i;
    i:=j;
    j:=tmp;
end;

procedure downheap(i,n:longint);
var j:longint;
begin
    j:= 2 * i;
    if j > n then exit;
    if (j+1 <= n) and (a[j+1] > a[j]) then inc(j);
    if a[i] < a[j] then
    begin
        swap(a[i],a[j]);
        downheap(j,n);
    end;
end;

procedure heapsort;
var i:longint;
begin
    for i:=n div 2 downto 1 do downheap(i,n);

    for i:=n downto 2 do
    begin
        swap(a[1],a[i]);
        downheap(1,i-1);
    end;
end;

function binarySearch(l,r,x:longint):longint;
var mid:longint;
begin
    if l > r then exit(-1);
    mid:=(l + r) div 2;
    if a[mid] = x then exit(mid)
    else if x < a[mid] then exit(binarySearch(l,mid-1,x))
    else exit(binarySearch(mid+1,r,x));
end;
    
procedure main;
var i,j,k:longint;
begin
    heapsort;
    for i:=1 to n-2 do
        for j:=i+1 to n-1 do
        begin
            k:=binarySearch(j+1,n,a[i] + a[j]);
            if k <> -1 then
            begin
                b[i,k]:=true;
                b[j,k]:=true;
            end;
        end;

    for i:=1 to n-1 do
        for j:=i+1 to n do if b[i,j] then
        begin
            if d[j] < d[i] + 1 then d[j]:=d[i] + 1;
            if dmax < d[j] then dmax:=d[j];
        end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,dmax + 1);
    close(f);
end;

begin
    input;
    main;
    output;
end.
