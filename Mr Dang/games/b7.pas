const fi = 'b7.inp';
      fo = 'b7.out';
      maxn = 1000;

var n,res:longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    close(f);
end;

procedure main;
var i:longint;
begin
    if xorSum = 0 then res:=0
    else res:=1;
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
