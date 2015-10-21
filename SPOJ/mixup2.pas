const fi = 'mixup2.inp';
      fo = 'mixup2.out';
      maxn = 16;
      maxSize = 1 shl maxn - 1;

var n, u, size:longint;
    res: int64;
    a:array[0..maxn] of longint;
    b:array[0..maxSize,0..maxn] of int64;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,u);
    for i:=1 to n do read(f,a[i]);
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

procedure getMax(state:longint);
var i, j, count, preState:longint;
    loc:array[1..maxn] of longint;
begin
    count:=0;
    for i:=1 to n do if getBit(state,i-1) = 1 then
    begin
        inc(count);
        loc[count]:=i;
    end;

    for i:=1 to count do
    begin
        preState:= bitOff(state,loc[i]-1);
        for j:=1 to count do if (abs(a[loc[i]] - a[loc[j]]) > u) then
            b[state,loc[i]]:=b[state,loc[i]] + b[preState,loc[j]];
    end;
end;
        
procedure main;
var i, state:longint;
begin
    for i:=0 to n-1 do b[1 shl i,i+1]:=1; 

    for state:=0 to size do getMax(state);

    for i:=1 to n do res:=res+b[size,i];
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
