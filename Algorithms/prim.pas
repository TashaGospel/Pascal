const fi = 'prim.inp';
      fo = 'prim.out';
      maxn = 301;

var n,m,res:longint;
    a:array[0..maxn,0..maxn] of longint;
    b:array[0..maxn] of boolean;
    d:array[0..maxn] of longint;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do
    begin
        read(f,d1,d2,a[d1,d2]);
        a[d2,d1]:=a[d1,d2];
    end;

    d[1]:=0;
    for i:=2 to n do d[i]:=maxlongint;
    close(f);
end;

function getVertex:longint;
var i,minPos,minVal:longint;
begin
    minVal:=maxlongint;
    for i:=0 to n do if (not b[i]) and (d[i] < minVal) then
    begin 
        minVal:=d[i];
        minPos:=i;
    end;
    exit(minPos);
end;

procedure main;
var i,count,u:longint;
begin
    count:=0;
    while count < n do
    begin
        u:=getVertex;
        writeln(u);
        b[u]:=true;
        for i:=0 to n do if (a[u,i] > 0) and (a[u,i] < d[i]) and (not b[i]) then
            d[i]:=a[u,i];
        inc(count);
    end;
    for i:=1 to n do inc(res,d[i]);
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
