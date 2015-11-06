uses math;
const fi = 'maxframe.inp';
      fo = 'maxframe.out';
      maxn = 401;

var n,m,res:longint;
    a,s:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
        for j:=1 to m do read(f,a[i,j]);
    close(f);
end;

function sumRect(i,j,x,y:longint):longint;
begin
    if (i > x) or (j > y) then exit(0);
    exit(s[x,y] - s[x,j-1] - s[i-1,y] + s[i-1,j-1]);
end;

procedure main;
var i,j,x,y:longint;
begin
    for i:=1 to n do
        for j:=1 to m do s[i,j]:=s[i-1,j] + s[i,j-1] - s[i-1,j-1] + a[i,j];

    for i:=1 to n do
        for j:=1 to m do
            for x:=i+1 to n do
                for y:=j+1 to m do
                    res:=max(res,sumRect(i,j,x,y) - sumRect(i+1,j+1,x-1,y-1));

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
