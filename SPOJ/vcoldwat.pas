const fi = 'vcoldwat.inp';
      fo = 'vcoldwat.out';
      maxn = 100000;

type node = record
    left, right, depth:longint;
    end;

var n, m:longint;
    a:array[1..maxn] of node;

procedure input;
var f:text;
    i,d:longint;
begin
    assign(f,fi);
    reset(f);
    read(f, n, m);
    for i:=1 to m do read(f, d, a[d].left, a[d].right);
    close(f);
end;

procedure main(c, num:longint);
begin
    a[c].depth:=num;
    if a[c].left <> 0 then main(a[c].left, num+1);
    if a[c].right <> 0 then main(a[c].right, num+1);
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do writeln(f,a[i].depth);
    close(f);
end;

begin
    input;
    main(1,1);
    output;
end.
