const fi = 'doanso.inp';
      fo = 'doanso.out';
      maxn = 100001;

var n,m,l,res:int64;
    a:array[0..maxn] of int64;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
    begin
        read(f,d1,d2);
        a[i]:=d2-d1;
        l:=l + a[i];
    end;
    close(f);
    l:=l div m;
end;

function sum(len:int64):int64;
var i:longint;
    res:int64;
begin
    res:=0;
    for i:=1 to n do res:=res + (a[i] div len);
    exit(res);
end;

procedure find(c,d:int64);
var mid,x:int64;
begin
    if c > d then exit;
    mid:=(c + d) div 2;
    x:=sum(mid);
    if x >= m then
    begin
        res:=mid;
        find(mid+1,d);
    end
    else find(c,mid-1);
end;

procedure main;
begin
    find(1,l);
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
