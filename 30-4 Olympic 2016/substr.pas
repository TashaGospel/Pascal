const fi = 'substr.inp';
      fo = 'substr.out';
      maxn = 100001;

var n,q,res:longint;
    a:array[0..maxn] of longint;
    b:array[-maxn..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,q);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure main;
var i,delta:longint;
    passedQ:boolean;
begin
    delta:=0;
    inc(b[delta]);
    passedQ:=false;
    for i:=1 to n do
    begin
        if a[i] = q then passedQ:=true;

        if a[i] > q then inc(delta)
        else if a[i] < q then dec(delta);

        if not passedQ then inc(b[delta])
        else inc(res,b[delta]);
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
