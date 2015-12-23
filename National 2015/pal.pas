const fi = 'pal.inp';
      fo = 'pal.out';
      maxn = 121;

var s:ansistring;
    n:longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,s);
    close(f);
    n:=length(s);
end;

procedure main;
var i,j,gap:longint;
begin
    for i:=2 to n do a[i,i-1]:=1;
    for i:=1 to n do a[i,i]:=1;
    for gap:=1 to n-1 do
        for i:=1 to n - gap do
        begin
            j:=i + gap;
            inc(a[i,j],a[i+1,j] + a[i,j-1] + a[i+1,j-1]);
        end;

    for i:=1 to n do
    begin
        for j:=1 to n do write(a[i,j],' ');
        writeln;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[1,n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
