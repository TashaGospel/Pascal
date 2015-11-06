const fi = 'b5.inp';
      fo = 'b5.out';

var n,m,res:longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    close(f);
end;

procedure main;
var i,j:longint;
begin
{
    for i:=1 to n do
        for j:=1 to n do write(max(i,j) - min(i,j))
}
    if (n = m) then res:=0
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
