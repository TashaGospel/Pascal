const fi = 'b3.inp';
      fo = 'b3.out';

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
var i,j:longint;
begin
{
    for i:=1 to n do
        for j:=i-1 downto n div 2 do if 
}
    inc(n);
    if (n and (n-1))= 0 then res:=0 { n = 2 ^ k }
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
