const fi = 'dagiac.inp';
      fo = 'dagiac.out';
      
var n:longint;
    res:int64;

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
    res:=1;
    for i:=n-3 to n do res:=res * i;
    for i:=2 to 4 do res:=res div i;
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
