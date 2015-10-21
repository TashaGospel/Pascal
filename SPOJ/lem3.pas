uses math;
const fi = 'lem3.inp';
      fo = 'lem3.out';
      maxn = 17;
      maxSize = 1 shl maxn - 1;

var n, size, res:longint;
    a:array[0..maxn,0..maxn] of longint;
    b:array[0..maxn,0..maxSize] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
        for j:=1 to n do read(f,a[i,j]);
    close(f);
    size:= 1 shl n - 1;
end;

function getBit(state:longint; bit:byte):byte;
begin
    exit(state shr bit and 1);
end;

function bitOff(state:longint; bit:byte):longint;
begin
    exit(state and not (1 shl bit));
end;

procedure getMin(state:longint);
var i, j, count, preState:longint;
    loc:array[1..maxn] of longint;
begin
    count:=0;
    for i:=1 to n do if getBit(state, i-1) = 1 then
    begin
        inc(count);
        loc[count]:=i;
    end;

    for i:=1 to count do
    begin
        preState:= bitOff(state,loc[i] - 1);
        for j:=1 to count do if i <> j then
            b[loc[i], state]:= min(b[loc[i], state], b[loc[j], preState] + a[loc[j],loc[i]]);
    end;
end;

procedure main;
var i,state:longint;
begin
    for i:=1 to n do
        for state:=0 to size do b[i,state]:=maxlongint div 2;
    for i:=1 to n do b[i, 1 shl (i-1)]:=0;

    for state:=0 to size do getMin(state);
    
    res:=maxlongint;
    for i:=1 to n do res:=min(res, b[i, size]);
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
