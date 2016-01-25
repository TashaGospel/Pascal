const fi = 'lista.inp';
      fo = 'lista.out';
      maxn = 500001;

type thing = record
    right,left:longint;
    end;

var n,m,res:longint;
    a:array[0..maxn] of thing;
    b,h:array[0..maxn] of longint;

procedure moveA(x,y:longint);
begin
    if x = y then exit;
    a[a[x].left].right:=a[x].right;
    a[a[x].right].left:=a[x].left;
    a[x].right:=y;
    a[x].left:=a[y].left;
    a[a[y].left].right:=x;
    a[y].left:=x;
end;

procedure moveB(x,y:longint);
begin
    moveA(x,a[y].right);
end;

procedure makeNewArr;
var cur,i:longint;
begin
    cur:=a[0].right;
    i:=0;
    while cur <> n + 1 do
    begin
        inc(i);
        b[i]:=cur;
        cur:=a[cur].right;
    end;
end;

procedure input;
var f:text;
    i,x,y:longint;
    t:char;
begin
    assign(f,fi);
    reset(f);
    readln(f,n,m);
    for i:=0 to n+1 do
    begin
        a[i].left:=i-1;
        a[i].right:=i+1;
    end;
    for i:=1 to m do
    begin
        readln(f,t,x,y);
        if t = 'A' then moveA(x,y)
        else moveB(x,y);
{
        makeNewArr;
        for x:=1 to n do write(b[x],' ');
        writeln;
}
    end;
end;

function binarySearch(x: longint):longint;
var l,r,mid:longint;
begin
    l:=1; r:=res;
    while l <> r do
    begin
        mid:=(l + r) div 2;
        if b[h[mid]] < b[x] then l:=mid + 1
        else r:=mid;
    end;
    exit(l);
end;

procedure main;
var i:longint;
begin
    makeNewArr;
//    for i:=1 to n do write(b[i],' ');
{
    1 2 3 4 5 6
    B 6 5

}
    h[1]:=1;
    res:=1;
    for i:=2 to n do
        if b[h[res]] < b[i] then
        begin
            inc(res);
            h[res]:=i;
        end
        else h[binarySearch(i)]:=i;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,n - res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
