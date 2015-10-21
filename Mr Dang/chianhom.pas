uses math;
const fi = 'chianhom.inp';
      fo = 'chianhom.out';
      maxn = 26;

var n, k:longint;
    a:array[1..maxn,1..maxn] of longint;

function main:longint;
var i, j, x:longint;
begin
    fillchar(a,sizeof(a),0);
    {for i:=1 to n do a[i,1]:=1;
        for i:=1 to n do
            for j:=2 to k do
                if i < j then a[i,j]:=0 
                else if i = j then a[i,j]:=1 
                else a[i,j]:=a[i-1,j] + j;}
    for i:=1 to n do a[i,1]:=1;
    for i:=1 to n do
        for j:=2 to k do if i < j then a[i,j]:=0 else
        begin
            a[i,j]:=a[i-1,j]*j + a[i-1,j-1];
        end;

    for i:=1 to n do
    begin
        for j:=1 to k do write(a[i,j],' ');
        writeln;
    end;

    exit(a[n,k]);
end;
    

procedure parseFile;
var f,g:text;
    i, t:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,t);
    for i:=1 to t do
    begin
        read(f,n,k);
        writeln(g,main);
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
