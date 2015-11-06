uses math;
const fi = 'bigc.inp';
      fo = 'bigc.out';
      maxn = 10001;

var n,m,res:longint;
    a:array[1..maxn] of longint;
    chosen:array[1..maxn] of boolean;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
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
    j:=i * 2;
    if j > n then exit;
    if (j + 1 <= n) and (a[j] > a[j+1]) then inc(j);
    if a[i] > a[j] then
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

procedure main;
var i,count,curM:longint;
begin
    heapsort;
    count:=0;
    while count < n do
    begin
        inc(res);
        curM:=m;
        for i:=1 to n do if (not chosen[i]) and (a[i] <= curM) then
        begin
            curM:=curM - a[i];
            chosen[i]:=true;
            inc(count);
        end;
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
