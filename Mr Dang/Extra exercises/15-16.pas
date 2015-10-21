const fi = '15-16.inp';
      fo = '15-16.out';
      maxn = 1001;

var n,res:longint;
    a:array[1..maxn] of longint;
    b:array[0..maxint] of boolean;

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
var i,j:longint;
begin
    b[0]:=true;
    for i:=1 to n do
        for j:=maxint downto a[i] do if (not b[j]) and (b[j-a[i]]) then
        begin
            b[j]:=true;
            inc(res);
        end;
end;    

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    for i:=1 to maxint do if b[i] then write(f,i,' ');
    close(f);
end;

begin
    input;
    main;
    output;
end.
