const fi = 'b1.inp';
      fo = 'b1.out';

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
var i:longint;
begin
{
    for i:=0 to n do write(i mod (m+1),' ');
    writeln;
}
    if (i mod (m+1) = 0) then res:=0
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
