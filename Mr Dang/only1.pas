const fi = 'only1.inp';
      fo = 'only1.out';
      maxSize = 2000000008 div 8;

var n:longint;
    a:array[1..maxSize] of byte;

function getBit(c:longint):byte;
var posi, bit:longint;
begin
    posi:=c shr 3;
    bit:= c and 7;
    exit((a[posi] shr bit) and 1);
end;
    
procedure toggleBit(c:longint);
var posi, bit:longint;
begin
    posi:= c shr 3;
    bit:= c and 7;
    if getBit(c) = 1 then a[posi]:=a[posi] - (1 shl bit)
    else a[posi]:=a[posi] + (1 shl bit);
end;

procedure input;
var f:text;
    i,cur:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
    begin
        read(f,cur);
        toggleBit(cur);
    end;
    close(f);
end;

procedure output;
var f:text;
    i,j:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to maxSize do if a[i] <> 0 then
    begin
        for j:=0 to 7 do if getBit(8 * i + j) =1 then 
        begin
            write(f,8 * i + j);
            break;
        end;
        break;
    end;
    close(f);
end;

begin
    input;
    output;
end.
