const fi = 'suaduong.inp';
      fo = 'suaduong.out';

var n,m,k,res:longint;
    
procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,k);
    close(f);

    res:=(m+k-1) div k;
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
    output;
end.
