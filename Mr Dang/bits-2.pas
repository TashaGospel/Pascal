const fi = 'bits-2.inp';
      fo = 'bits-2.out';
      maxn = 65535;

var a:array[0..maxn div 8] of byte;

procedure bitOn(var number:byte; posi:longint);
begin
    number:=1 shl posi or number;
end;

procedure bitOff(var number:byte; posi:longint);
begin
    number:=not (1 shl posi) and number;
end;

function getBit(number:byte; posi:longint):longint;
begin
    exit((number shr posi) and 1);
end;

procedure parseFile;
var f,g:text;
    curNum:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    while not seekeoln(f) do
    begin
        read(f,curNum);
        bitOn(a[curNum shr 3], curNum and 7);
    end;
    readln(f);
    while not seekeoln(f) do
    begin
        read(f,curNum);
        if getBit(a[curNum shr 3], curNum and 7) = 1 then 
        begin
            writeln(g,curNum);
            bitOff(a[curNum shr 3], curNum and 7);
        end;
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
