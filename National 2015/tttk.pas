const fi = 'tttk.inp';
      fo = 'tttk.out';
      maxn = 100001;

var n,k,x,y,len:qword;
    q:longint;
    a:array[1..maxn] of qword;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(n,q,k,x,y);
    close(f);
end;

procedure main;
var c,d,tmp:qword;
begin
    c:=(x + y) mod q;
    d:=(y + c) mod q;
    inc(a[x mod q]); inc(a[y mod q]); inc(a[c]); inc(a[d]);
    len:=4;
    while not ((x mod q = c) and (y mod q = d)) do
    begin
        inc(len);
        tmp:=(c + d) mod q;
        c:=d;
        d:=tmp;
        inc(a[tmp]);
    end;

    len:=len - 2;


