const fi = 'cutsq.inp';
      fo = 'cutsq.out';

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
begin
    res:=n div 2;
    res:=(res + 1) * (n - res + 1);
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
