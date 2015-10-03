uses math;
const fi = 'daychung3.inp';
      fo = 'daychung3.out';
      maxn = 100;

var a:array[1..3,1..maxn] of longint;
    b:array[0..maxn,0..maxn,0..maxn] of longint;
    num:array[1..3] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    for i:=1 to 3 do
    begin
        j:=0;
        while not eoln(f) do 
        begin
            inc(j);
            read(f,a[i,j]);
        end;
        num[i]:=j;
        readln(f);
    end;
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    for i:=1 to num[1] do
        for j:=1 to num[2] do
            for k:=1 to num[3] do
            begin
                if (a[1,i] = a[2,j]) and (a[1,i] = a[3,k]) then
                    b[i,j,k]:=b[i-1,j-1,k-1] + 1
                else
                    b[i,j,k]:=max(max(b[i,j,k-1],b[i,j-1,k]),b[i-1,j,k]);
            end;
end;

function path(i,j,k:longint):string;
var tmp:string;
begin
    if (i<=0) or (j<=0) or (k<=0) then exit('');
    if (a[1,i] = a[2,j]) and (a[1,i] = a[3,k]) then
    begin
        str(a[1,i],tmp);
        exit(path(i-1,j-1,k-1) + tmp + ' ');
    end
    else if b[i,j,k] = b[i,j,k-1] then exit(path(i,j,k-1))
    else if b[i,j,k] = b[i,j-1,k] then exit(path(i,j-1,k))
    else exit(path(i-1,j,k));
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[num[1],num[2],num[3]]);
    write(f,path(num[1],num[2],num[3]));
    close(f);
end;

begin
    input;
    main;
    output;
end.
