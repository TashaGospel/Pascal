const fi = 'tamgiac.inp';
      fo = 'tamgiac.out';
      maxn = 1001;
      eps = 0.00001;

type point = record
    x,y:real;
    end;

    triangle = record
    p1,p2,p3:point;
    index:longint;
    end;

var n,res,resPos:longint;
    a:array[1..maxn] of triangle;
    b,tr:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do 
    begin
        read(f,p1.x,p1.y,p2.x,p2.y,p3.x,p3.y);
        index:=i;
    end;
    close(f);
end;

function getAreaPts(p1,p2,p3:point):real;
begin
    exit(abs(( p1.x * (p2.y - p3.y)
             + p2.x * (p3.y - p1.y)
             + p3.x * (p1.y - p2.y) ) / 2));
end;

function getAreaTri(p:triangle):real;
begin
    exit(getAreaPts(p.p1,p.p2,p.p3));
end;

function isInsidePts(p:point; tri:triangle):boolean;
begin
    with tri do 
        exit( abs(getAreaPts(p,p1,p2) + getAreaPts(p,p2,p3) + 
                  getAreaPts(p,p1,p3) - getAreaTri(tri)) < eps );
end;

function isInsideTri(tri1, tri2:triangle):boolean;
begin
    with tri1 do
        exit( isInsidePts(p1,tri2) and isInsidePts(p2,tri2) and isInsidePts(p3,tri2) );
end;

procedure quicksort(c,d:longint);
var i,j:longint;
    tmp:triangle;
    mid:real;
begin
    i:=c; j:=d; mid:=getAreaTri(a[(c+d) div 2]);
    repeat
        while getAreaTri(a[i]) < mid do inc(i);
        while getAreaTri(a[j]) > mid do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(c,i);
    if i < d then quicksort(i,d);
end;

procedure main;
var i,j:longint;
begin
    quicksort(1,n);

    for i:=1 to n do
    begin
        b[i]:=1;
        for j:=i-1 downto 1 do if (b[j] + 1 > b[i]) and (isInsideTri(a[j],a[i])) then
        begin
            b[i]:=b[j]+1;
            tr[i]:=j;
        end;
        if res < b[i] then 
        begin
            res:=b[i];
            resPos:=i;
        end;
    end;
end;

function path(c:longint):string;
var tmp:string;
begin
    str(a[c].index,tmp);
    if tr[c] = 0 then exit(tmp + ' ')
    else exit(path(tr[c]) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    write(f,path(resPos));
    close(f);
end;

begin
    input;
    main;
    output;
end.
