const fi = 'catvai.inp';
      fo = 'catvai.out';
      
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
begin
    while (m <> n) do
    begin
        if m > n then m:=m-n
        else n:=n-m;
        inc(res);
    end;
    inc(res);
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
