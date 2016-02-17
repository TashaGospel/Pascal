uses math;
const fi = 'dinner.inp';
      fo = 'dinner.out';
      maxn = 401;

var a: array[0..maxn, 0..maxn] of boolean;
    b, c: array[0..maxn, 0..maxn] of longint;
    n, m, res: longint;

function readf(var f:text):char;
var res: char;
begin
    read(f, res);
    exit(res);
end;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n,m);
    for i:=1 to n do
    begin
        for j:=1 to m do
            if readf(f) = '.' then a[i,j]:=true;
        readln(f);
    end;
    close(f);
end;

procedure main;
var i,j,k,cur:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            if a[i,j] then b[i,j]:=b[i,j-1]+1 else b[i,j]:=b[i,j-1];

    for j:=1 to m do
        for k:=j to m do
        begin
            cur:=0;
            for i:=1 to n do
            begin
                if b[i,k] - b[i,j-1] = k - j + 1 then inc(cur)
                else cur:=0;
                if cur > 0 then res:=max(res, cur + k - j + 1);
            end;
        end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res*2-1);
    close(f);
end;

begin
    input;
    main;
    output;
end.
