const fi = 'cirarc.inp';
      fo = 'cirarc.out';
      maxn = 1001;

type edge = record
    x,y:longint;
    end;

var n, m, count, resCount, cyclesCount:longint;
    a:array[0..maxn, 0..maxn] of boolean;
    d:array[0..maxn, 0..maxn] of longint;
    b:array[0..maxn] of longint;
    res:array[0..maxn] of edge;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do
    begin
        read(f,d1,d2);
        a[d1,d2]:=true;
    end;
    close(f);
end;

procedure increase;
var i:longint;
begin
    for i:=1 to count-1 do inc(d[b[i],b[i+1]]);
    inc(d[b[count],b[1]]);
    inc(cyclesCount);
end;

procedure visit(p,c:longint);
var i:longint;
begin
    inc(count);
    b[count]:=c;
    for i:=1 to n do if a[c,i] then
    begin
        if i = p then increase
        else visit(p,i);
    end;
    dec(count);
end;

procedure main;
var i:longint;
begin
    for i:=1 to n do visit(i,i);
end;

procedure output;
var f:text;
    i,j:longint;
begin
    assign(f,fo);
    rewrite(f);
    if cyclesCount <> 0 then
        for i:=1 to n do
            for j:=1 to n do if d[i,j] = cyclesCount then
            begin
                inc(resCount);
                with res[resCount] do
                begin
                    x:=i;
                    y:=j;
                end;
            end;
    writeln(f,resCount);
    for i:=1 to resCount do writeln(f,res[i].x,' ',res[i].y);
    close(f);
end;

begin
    input;
    main;
    output;
end.
