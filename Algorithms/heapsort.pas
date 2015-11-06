const fi = 'heapsort.inp';
      fo = 'heapsort.out';
      maxn = 1000;

var n:longint;
    a:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure swap(var c,d:longint);
var tmp:longint;
begin
    tmp:=c;
    c:=d;
    d:=tmp;
end;

procedure downheap(i,n:longint);
var j:longint;
begin
    j:= i * 2;
    if j > n then exit;
    if (j + 1 <= n) and (a[j] < a[j+1]) then inc(j);
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
        swap(a[i],a[1]);
        downheap(1,i-1);
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do write(f,a[i],' ');
    close(f);
end;

begin
    input;
    heapsort;
    output;
end.
