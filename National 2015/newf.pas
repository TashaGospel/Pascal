uses math;
const fi = 'newf.inp';
      fo = 'newf.out';
      maxn = 200001;

type thing = record
    parent,group,index,h:longint;
    end;

var n,m,log:longint;
    a:array[0..maxn] of thing;
    hx,groupCount,res:array[0..maxn] of longint;
    b:array[0..maxn,0..trunc(ln(maxn) / ln(2)) + 1] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do with a[i] do
    begin
        read(f,group,parent);
        index:=i;
        if parent = 0 then
        begin
            h:=1;
            hx[i]:=1;
        end;
    end;
    close(f);
    log:=trunc(ln(n) / ln(2)) + 1;
end;

procedure height(c:longint);
begin
    if a[c].h = 0 then
    begin
        height(a[c].parent);
        a[c].h:=a[a[c].parent].h + 1;
        hx[c]:=a[c].h;
    end;
end;

procedure quicksort(c,d:longint);
var i,j:longint;
    mid,tmp:thing;
begin
    i:=c; j:=d; mid:=a[c + random(d - c + 1)];
    repeat
        while (a[i].group < mid.group)
           or ((a[i].group = mid.group) and (a[i].h > mid.h)) do inc(i);
        while (a[j].group > mid.group)
           or ((a[j].group = mid.group) and (a[j].h < mid.h)) do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

function getBit(x,posi:longint):longint;
begin
    exit((x shr posi) and 1);
end;

function getParent(node,num:longint):longint;
var i:longint;
begin
    for i:=log downto 0 do
        if getBit(num,i) = 1 then
            node:=b[node,i];
    exit(node);
end;

function getLCA(c,d:longint):longint;
var i:longint;
begin
    if hx[c] > hx[d] then c:=getParent(c,hx[c] - hx[d]);
    if hx[d] > hx[c] then c:=getParent(d,hx[d] - hx[c]);
    if c = d then exit(c);
    for i:=log downto 0 do
        if b[c,i] <> b[d,i] then
        begin
            c:=b[c,i];
            d:=b[d,i];
        end
        else getLCA:=b[c,i];
end;

procedure buildParents;
var i,j:longint;
begin
    b[0,0]:=0;
    for i:=1 to n do b[i,0]:=a[i].parent;
    for j:=1 to log do
        for i:=1 to n do b[i,j]:=b[b[i,j-1],j-1];
end;

function distance(c,d:longint):longint;
begin
    exit(hx[c] + hx[d] - 2 * hx[getLCA(c,d)]);
end;

procedure main;
var i,j,u,cur:longint;
begin
    for i:=1 to n do height(i);
    buildParents;
    quicksort(1,n);

    for i:=1 to n do inc(groupCount[a[i].group]);
    for i:=2 to m do inc(groupCount[i],groupCount[i-1]);

    for j:=1 to m do
    begin
        cur:=0;
        u:=a[groupCount[j-1] + 1].index;
        for i:=groupCount[j-1] + 2 to groupCount[j] do
            cur:=max(cur, distance(u,a[i].index));
        res[j]:=cur;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to m do writeln(f,res[i]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
