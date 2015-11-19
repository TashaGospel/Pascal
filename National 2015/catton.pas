uses math;
const fi = 'catton.inp';
      fo = 'catton.out';
      maxn = 31;
      maxsize = 51;

var n,m,k:longint;
    a:array[0..maxn,0..maxn,0..maxsize] of longint;

procedure input;
var f:text;
    i,j,u:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,k);
    close(f);
    for i:=0 to n do
        for j:=0 to m do
            for u:=0 to k do
                a[i,j,u]:=maxint;
end;

function cal(n,m,k:longint):longint;
var i,u:longint;
begin
    { Basic cases. }
    if a[n,m,k] < maxint then exit(a[n,m,k])
    else if (k = 0) or (n * m = k) then
    begin
        a[n,m,k]:=0;
        exit(0);
    end
    else if (n * n = k) or (m * m = k) then
    begin
        a[n,m,k]:=min(n*n,m*m);
        exit(a[n,m,k]);
    end
    else if (n * m < k) then exit(maxint);

//    writeln(n,' ',m,' ',k);
    { General case. }
    for i:=1 to n-1 do
        for u:=0 to k do
            a[n,m,k]:=min(a[n,m,k], cal(i,m,u) + cal(n-i,m,k-u) + m * m);

    for i:=1 to m-1 do
        for u:=0 to k do
            a[n,m,k]:=min(a[n,m,k], cal(n,i,u) + cal(n,m-i,k-u) + n * n);

    exit(a[n,m,k]);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,cal(n,m,k));
    close(f);
end;

begin
    input;
    output;
end.
