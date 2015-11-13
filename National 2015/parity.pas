const fi = 'parity.inp';
      fo = 'parity.out';
      maxn = 100001;

var n,s,res:int64;
    a,b:array[0..maxn] of int64;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure main;
var i:longint;
begin
    b[0]:=1;
    for i:=1 to n do
    begin
        if a[i] mod 2 = 0 then inc(s)
        else dec(s);
//        writeln(s);

        res:=res + b[s];

        inc(b[s]);
    end;
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
