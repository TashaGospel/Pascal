const fi = 'biprime.inp';
      fo = 'biprime.out';
      maxn = 500008;
      size = maxn div 8;

var n:longint;
    a:array[0..size] of byte;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    close(f);
end;

procedure bitOn(c:longint);
var posi, bit:longint;
begin
    posi:=c div 8;
    bit:=c mod 8;
    a[posi]:=a[posi] or (1 shl bit);
end;

function getBit(c:longint): byte;
var posi, bit:longint;
begin
    posi:=c div 8;
    bit:=c mod 8;
    exit((a[posi] shr bit) and 1);
end;

function reverse(num: longint):longint;
var tmp,res:longint;
begin
    res:=0;
    while (num > 0) do
    begin
        tmp:=num mod 10;
        num:=num div 10;
        res:=res * 10 + tmp;
    end;
    exit(res);
end;

procedure main; // filter out all multiples of a number
var i,j:longint;
begin
    for i:=2 to trunc(sqrt(n)) do if getBit(i) = 0 then
        for j:=i to n div i do bitOn(i*j);
end;

procedure output;
var f:text;
    i,tmp:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=11 to n do if getBit(i) = 0 then
    begin
        tmp:=reverse(i);
        if (tmp <= n) and (tmp > i) then
            if getBit(tmp) = 0 then writeln(f,i,' ',tmp);
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
