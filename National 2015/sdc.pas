const fi = 'sdc.inp';
      fo = 'sdc.out';
      maxn = 10001;

// Bellman-Ford

type edge = record
    u,v,w:longint;
    end;

var n,m,x,y,offset:longint;
    a:array[0..maxn] of edge;
    d:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,x,y);
    for i:=1 to m do with a[i] do read(f,u,v,w);
    close(f);
end;

function relax(e:edge):boolean;
begin
    with e do
        if d[u] + w < d[v] then
        begin
            d[v]:=d[u] + w;
            exit(true);
        end
        else exit(false);
end;

function main:boolean;
var i,j,minVal,maxVal:longint;
    ok:boolean;
begin
    for i:=1 to n+1 do
    begin
        if i = n+1 then exit(false);
        ok:=false;
        for j:=1 to m do if relax(a[j]) then ok:=true;
        if not ok then break;
    end;

    maxVal:=d[1];
    for i:=2 to n do if d[i] > maxVal then maxVal:=d[i];
    minVal:=d[1];
    for i:=2 to n do if d[i] < minVal then minVal:=d[i];

    offset:=x - minVal;
    if maxVal + offset > y then exit(false);
    exit(true);
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    if main then
    begin
        writeln(f,'YES');
        for i:=1 to n do write(f,d[i]+offset,' ');
    end
    else write(f,'NO');
    close(f);
end;

begin
    input;
    output;
end.
