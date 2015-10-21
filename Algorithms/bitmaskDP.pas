{ Select
  Given a nxn board, choose numbers so that their sum is maximum.
  Only 1 number can be chosen on each row and column.
  1 <= n <= 20 }

{ State represents the chosen columns, from right to left.
  Ex: 10110 means column 2, 3, 5 is chosen.
  We use right to left because bits are right to left. }

uses math;
const fi = 'bitmaskDP.inp';
      fo = 'bitmaskDP.out';
      maxn = 21;
      maxSize = 1 shl maxn - 1;

var n, size, res:longint;
    a:array[1..maxn,1..maxn] of longint;
    b,tr:array[1..maxSize] of longint;

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

function bitOff(state:longint; bit:byte):longint;
begin
    exit(state and not (1 shl bit));
end;

function getBit(state:longint; bit:byte):byte;
begin
    exit(state shr bit and 1);
end;

{ Get the maximum sum for each state }
function getMax(state:longint):longint;
var i, count, res, preState:longint;
    loc:array[1..maxn] of longint;
begin
    { Save location of 1s in an array.
      We can turn each 1 into 0 and find the preState.
      A preState is identical to state, but with a 1 bit turned into 0. }
    count:= 0;
    for i:=1 to maxn do if getBit(state,i - 1) = 1 then
    begin
        inc(count);
        loc[count]:=i;
    end;

    res:= -maxlongint;

    { Individually turn 1 into 0 and get the maximum sum for this state. 
      In the preState, we have chosen count - 1 numbers, which means count - 1 rows,
      so the next number is a[count, loc[i]] }
    for i:=1 to count do 
    begin
        preState:= bitOff(state, loc[i] - 1);
        if res < b[preState] + a[count, loc[i]] then
        begin
            res:= b[preState] + a[count, loc[i]];
            tr[state]:= loc[i];
        end;
    end;

    exit(res);
end;

procedure main;
var i:longint;
begin
    for i:=1 to size do b[i]:=getMax(i);
    res:=b[size];
end;

function path(state:longint):ansistring;
var tmp:ansistring;
begin
    if tr[state] = 0 then exit('')
    else
    begin
        str(tr[state], tmp);
        exit(path(bitOff(state,tr[state] - 1)) + tmp + ' ');
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    write(f,path(size));
    close(f);
end;

begin
    input;
    main;
    output;
end.
