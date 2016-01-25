const fi = 'lucky.inp';
      fo = 'lucky.out';

var n:longint;
    res:ansistring;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    close(f);
end;

procedure main;
var i,len,cur:longint;
begin
    len:=1; cur:=2;
    while n > cur do
    begin
        dec(n,cur);
        cur:=cur*2;
        inc(len);
    end;
    dec(n);
    for i:=1 to len do
    begin
        if n and 1 = 0 then res:='4' + res
        else res:='7' + res;
        n:=n shr 1;
    end;
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
