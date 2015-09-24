{ Distribution counting
  Uses bits to store 1 and 0 instead of bytes to store TRUE and FALSE
  Uses 1/8th as much space but slower }

const fi = 'bits-1.inp';
      fo = 'bits-1.out';
      maxn = 65535;

var a:array[0..maxn div 8] of byte;

procedure bitOn(var num:byte; posi:longint);
begin
    num:=((1 shl posi) or num);
end;

procedure input;
var f:text;
    curNum:longint;
begin
    assign(f,fi);
    reset(f);
    while not seekeof(f) do 
    begin
        read(f,curNum);
        bitOn(a[curNum shr 3], curNum and 7);
    end;
    close(f);
end;

procedure output;
var f:text;
    i,j:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=0 to maxn div 8 do
    begin
        j:=0;
        while a[i] <> 0 do
        begin
            if (a[i] and 1) = 1 then writeln(f,i shl 3 + j);
            a[i]:=a[i] shr 1;
            inc(j);
        end;
    end;
    close(f);
end;

begin
    input;
    output;
end.
