uses math;
const fi = 'square.inp';
      fo = 'square.out';
      maxn = 1001;

var n,m,res:longint;
    a:array[0..maxn,0..maxn] of boolean;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
    tmp:char;
begin
    assign(f,fi);
    reset(f);
    readln(f,n,m);
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin
            read(f,tmp);
            if tmp = '*' then a[i,j]:=true;
        end;
        readln(f);
    end;
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            if a[i,j] and a[i-1,j] and a[i,j-1] and a[i-1,j-1] then
            //if (b[i-1,j-1] > b[i,j-1]) and (b[i-1,j-1] > b[i-1,j]) then
            begin
                b[i,j]:=min(min(b[i,j-1],b[i-1,j]),b[i-1,j-1]) + 1;
                res:=max(res,b[i,j]);
            end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res + 1);
    close(f);
end;

begin
    input;
    main;
    output;
end.
