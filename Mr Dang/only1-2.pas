const fi = 'only1.inp';
      fo = 'only1.out';

var n,res:longint;

procedure input;
var f:text;
    i,cur:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
    begin
        read(f,cur);
        res:=res xor cur; // Why does this work?!?!??!o
                          // Cancels outs?
    end;
    close(f);
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
