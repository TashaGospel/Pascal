const fi = 'planina.inp';
      fo = 'planina.out';
      maxn = 20;

var n,res,a:longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    close(f);
    a:=2;
end;

procedure main;
var i:longint;
begin
    for i:=1 to n do
        a:=a * 2 - 1;
    res:=a * a;
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
