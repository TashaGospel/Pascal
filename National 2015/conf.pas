const fi = 'conf.inp';
      fo = 'conf.out';
      maxn = 101;

type edge = record
    u,v,w:longint;
    end;

var n, m, res, resCount:longint;
    s:array[1..3] of longint;
    e:array[0..maxn * maxn] of edge;
    a,tr:array[0..maxn,0..maxn] of longint;
    curChosen,resChosen:array[0..maxn,0..maxn] of boolean;
    chosenEdge:array[0..maxn * maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
        for j:=1 to n do if i <> j then a[i,j]:=maxlongint div 2;
    for i:=1 to m do with e[i] do
    begin
        read(f,u,v,w);
        a[u,v]:=w;
        a[v,u]:=w;
    end;
    for i:=1 to 3 do read(f,s[i]);
    close(f);
    res:=maxlongint div 2;
end;

function path(c,d:longint):longint;
begin
    if curChosen[c,d] then exit(0);
    if tr[c,d] = 0 then
    begin
        curChosen[c,d]:=true;
        curChosen[d,c]:=true;
        exit(a[c,d]);
    end
    else exit(path(c,tr[c,d]) + path(tr[c,d],d));
end;

procedure check(c:longint);
var i,cost:longint;
begin
    cost:=0;
    fillchar(curChosen,sizeof(curChosen),false);
    for i:=1 to 3 do inc(cost,path(c,s[i]));
    if cost < res then
    begin
        res:=cost;
        resChosen:=curChosen;
    end;
end;

procedure main;
var i,j,k:longint;
begin
    for k:=1 to n do
        for i:=1 to n do
            for j:=1 to n do
                if a[i,k] + a[k,j] < a[i,j] then
                begin
                    a[i,j]:=a[i,k] + a[k,j];
                    tr[i,j]:=k;
                end;

    for i:=1 to n do check(i);

    for i:=1 to m do with e[i] do if resChosen[u,v] then
    begin
        inc(resCount);
        chosenEdge[resCount]:=i;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res,' ',resCount);
    for i:=1 to resCount do with e[chosenEdge[i]] do
        writeln(f,u,' ',v);
    close(f);
end;

begin
    input;
    main;
    output;
end.
