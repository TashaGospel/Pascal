uses math;
const fi = 'qbgame.inp';
      fo = 'qbgame.out';
      maxn = 10001;
      width = 8;
      size = 1 shl width - 1;

var n, count:longint;
    res:int64;
    a:array[0..maxn,0..width] of longint;
    b:array[0..maxn,0..size] of int64;
    t:array[0..size] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to width do
        for j:=1 to n do read(f,a[j,i]);
    close(f);
end;

function getBit(state:longint; bit:byte):byte;
begin
    exit(state shr bit and 1);
end;

function isOkay(state:longint):boolean;
var i:longint;
begin
    for i:=0 to width - 2 do if (getBit(state,i) = 1) and (getBit(state,i+1) = 1) then
        exit(false);
    exit(true);
end;

function getSum(state, row:longint):longint;
var res, i:longint;
begin
    res:=0;
    for i:=0 to width - 1 do if getBit(state, i) = 1 then
        res:=res + a[row,i+1];
    exit(res);
end;

procedure buildOkayStates;
var state:longint;
begin
    for state:=0 to size do if isOkay(state) then
    begin
        inc(count);
        t[count]:=state;
    end;
end;

procedure main;
var i, j, k:longint; // j is current state; k is preState
begin
    buildOkayStates;

    for i:=1 to n do
        for j:=1 to count do
            for k:= 1 to count do if t[j] and t[k] = 0 then
                b[i, j]:=max(b[i, j], b[i-1, k] + getSum(t[j], i));

    for i:=1 to count do res:=max(res, b[n,i]);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f)
end;

begin
    input;
    main;
    output;
end.
