const fi = 'qbdivseq.inp';
      fo = 'qbdivseq.out';
      maxn = 100001;

var n, res:longint;
    a,h:array[0..maxn] of longint;

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

function binarySearch(i:longint):longint;
var l,r,mid:longint;
begin
    l:=1; r:=res;
    while l <> r do
    begin
        mid:=(l + r) div 2;
        if a[i] < a[h[mid]] then l:=mid + 1 else r:=mid;
    end;
    exit(l);
end;

procedure main;
var i:longint;
begin
    h[1]:=1; res:=1;
    for i:=2 to n do if a[i] < a[h[res]] then
    begin
        inc(res);
        h[res]:=i;
    end
    else h[binarySearch(i)]:=i;
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
