{ Dynamic Programming using Bitmask }
uses math;
const fi = 'qbselect.inp';
      fo = 'qbselect.out';
      maxn = 10001;
      width = 4;
      maxSize = 1 shl width - 1;

var n, res, maxVal:longint;
    a:array[0..maxn,0..width] of longint;
    b:array[0..maxn,0..maxSize] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    maxVal:=-maxlongint; { Check if all numbers are negative }
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to width do
        for j:=1 to n do 
        begin
            read(f,a[j,i]);
            maxVal:=max(maxVal,a[j,i]);
        end;
    close(f);
end;

function getBit(state:longint; bit:byte):byte;
begin
    exit(state shr bit and 1);
end;

function isOkay(state:longint):boolean;
var i:longint;
begin
    for i:=1 to width - 1 do 
        if (getBit(state,i) = 1) and (getBit(state,i-1) = 1) then exit(false);
    exit(true);
end;

function isOkayPair(state1, state2:longint):boolean;
var i:longint;
begin
    for i:=0 to width - 1 do 
        if (getBit(state1,i) = 1) and (getBit(state2,i) = 1) then exit(false);
    exit(true);
end;

function sum(state, row:longint):longint;
var i, res:longint;
begin
    res:=0;
    for i:=0 to width - 1 do if getBit(state, i) = 1 then res:= res + a[row,i+1];
    exit(res);
end;

procedure main;
var i, state, preState:longint;
begin
    if maxVal <= 0 then
    begin
        res:=maxVal;
        exit;
    end;

    for i:=1 to n do
        for state:=0 to maxSize - 1 do if isOkay(state) then
            for preState:=0 to maxSize - 1 do if isOkayPair(preState, state) then
                b[i,state]:=max(b[i,state], b[i-1,preState] + sum(state, i));
    res:= b[n,0];
    for i:=1 to maxSize do res:=max(res, b[n,i]);
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
