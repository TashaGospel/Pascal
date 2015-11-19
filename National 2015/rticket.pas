uses math;
const fi = 'rticket.inp';
      fo = 'rticket.out';
      maxn = 10001;
      maxval = 9223372036854775807 div 2; // max int64

var n,s,t:int64;
    l,c:array[1..3] of int64;
    a,res:array[0..maxn] of int64;

procedure input;
var f:text;
    i:longint;
    tmp:int64;
begin
    assign(f,fi);
    reset(f);
    read(f,l[1],l[2],l[3],c[1],c[2],c[3]);
    read(f,n,s,t);
    if s > t then
    begin
        tmp:=s;
        s:=t;
        t:=tmp;
    end;
    for i:=2 to n do read(f,a[i]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=s + 1 to t do
    begin
        res[i]:=maxval;
        for j:=i - 1 downto s do
        begin
            if a[i] - a[j] > l[3] then break
            else if a[i] - a[j] > l[2] then
                res[i]:=min(res[i],res[j] + c[3])
            else if a[i] - a[j] > l[1] then
                res[i]:=min(res[i],res[j] + c[2])
            else res[i]:=min(res[i],res[j] + c[1])
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res[t]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
