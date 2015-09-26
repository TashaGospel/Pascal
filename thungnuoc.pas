{ A different kind of union }
const fi = 'thungnuoc.inp';
      fo = 'thungnuoc.out';
      maxn = 10001;

var p:array[1..maxn] of longint;

function getRoot(c:longint):longint;
begin
    if p[c] <> c then exit(getRoot(p[c]))
    else exit(c);
end;

procedure union(c,d:longint); // change the root of one tree to another 
var u,v:longint;
begin
    u:=getRoot(c);
    v:=getRoot(d);
    if u > v then p[u]:=v else p[v]:=u;
end;

procedure parseFile;
var f,g:text;
    num,i,d1,d2,d3:longint;
begin
    for i:=1 to maxn do p[i]:=i;
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,num);
    for i:=1 to num do
    begin
        read(f,d1,d2,d3);
        if d3 = 2 then
            if getRoot(d1) = getRoot(d2) then writeln(g,1)
            else writeln(g,0)
        else union(d1,d2);
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
