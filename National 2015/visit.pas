uses math;
const fi = 'visit.inp';
      fo = 'visit.out';
      maxn = 20001;

type range = record
    l,r:longint;
    end;

var n:longint;
    a:array[0..maxn] of range;
    b,c:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i].l,a[i].r);
    close(f);
end;

procedure main;
var i:longint;
begin
    b[1]:=a[1].r + (a[1].r - a[1].l) - 1;
    c[1]:=a[1].r - 1;
    for i:=2 to n do
    begin
        b[i]:=min(b[i-1] + abs(a[i].r - a[i-1].l),
                  c[i-1] + abs(a[i].r - a[i-1].r)) + abs(a[i].l - a[i].r) + 1;
        c[i]:=min(b[i-1] + abs(a[i].l - a[i-1].l),
                  c[i-1] + abs(a[i].l - a[i-1].r)) + abs(a[i].l - a[i].r) + 1;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,min(b[n] + n - a[n].l, c[n] + n - a[n].r));
    close(f);
end;

begin
    input;
    main;
    output;
end.
