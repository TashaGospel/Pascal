uses math;
const fi = '15-6.inp';
      fo = '15-6.out';
      maxn = 1000;

var n,m,respos:longint;
    a,b:array[0..maxn,0..maxn] of longint;

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
    respos:=1;
end;

procedure main;
var i,j,s1,s2,s3:longint;
begin
    for i:=2 to n do
    begin
        b[i-1,0]:=maxlongint div 2;
        b[i-1,m+1]:=maxlongint div 2;
        for j:=1 to m do
        begin
            s1:=b[i-1,j-1] + abs(a[i,j] - a[i-1,j-1]);
            s2:=b[i-1,j] + abs(a[i,j] - a[i-1,j]);
            s3:=b[i-1,j+1] + abs(a[i,j] - a[i-1,j+1]);
            b[i,j]:=min(min(s1,s2),s3);
            if (i = n) and (b[i,respos] > b[i,j]) then respos:=j;
        end;
    end;
end;

function path(i,j:longint):string;
var tmp,tmp2:string;
begin
    str(i,tmp); str(j,tmp2);
    tmp:=tmp+tmp2;
    if i = 1 then exit(tmp + ' ')
    else if b[i,j] = b[i-1,j-1] + abs(a[i,j] - a[i-1,j-1]) then exit(path(i-1,j-1) + tmp + ' ')
    else if b[i,j] = b[i-1,j] + abs(a[i,j] - a[i-1,j]) then exit(path(i-1,j) + tmp + ' ')
    else exit(path(i-1,j+1) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[n,respos]);
    write(f,path(n,respos));
    close(f);
end;

begin
    input;
    main;
    output;
end.    
