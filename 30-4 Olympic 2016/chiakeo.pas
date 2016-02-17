uses math;
const fi = 'chiakeo.inp';
      fo = 'chiakeo.out';
      maxn = 100000;

var n, m, maxVal:longint;
    leftover, res: qword;
    a:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,m,n);
    for i:=1 to n do
    begin
        read(f,a[i]);
        maxVal:=max(a[i], maxVal);
    end;
    close(f);
end;

function search:longint;
var l,r,mid,i:longint;
    sum: qword;
begin
    l:=1; r:=maxVal;
    while l <> r do
    begin
        mid:=(l + r) div 2;
        sum:=0;
        for i:=1 to n do sum:=sum+max(0, a[i] - mid);
        if sum <= m then
        begin
            r:=mid;
            leftover:=m - sum;
        end
        else l:=mid+1;
    end;
    exit(l);
end;

procedure main;
var i, b:longint;
begin
    b:=search;
    for i:=1 to n do
    begin
        if a[i] >= b then
        begin
            a[i]:=b;
            if leftover > 0 then
            begin
                dec(leftover);
                dec(a[i]);
            end;
        end;
        res:=res+qword(a[i]) * qword(a[i]);
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
