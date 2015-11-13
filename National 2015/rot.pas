uses math;
const fi = 'rot.inp';
      fo = 'rot.out';
      maxn = 11;

var n,m,angle:longint;
    a,b:array[1..maxn,1..maxn] of char;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n,m);
    for i:=1 to n do
    begin
        for j:=1 to m do read(f,a[i,j]);
        readln(f);
    end;
    read(f,angle);
    close(f);
end;

procedure rotate90;
var i,j,tmp:longint;
begin
    for j:=1 to m do
        for i:=1 to n do
            b[j,n - i + 1]:=a[i,j];
    a:=b;
    tmp:=n; n:=m; m:=tmp;
end;

procedure main;
var i:longint;
begin
    for i:=1 to angle div 90 do rotate90;
end;

procedure output;
var f:text;
    i,j,offset,sum:longint;
begin
    assign(f,fo);
    rewrite(f);
    if angle mod 90 = 0 then
        for i:=1 to n do
        begin
            for j:=1 to m do write(f,a[i,j]);
            writeln(f);
        end
    else
    begin
        offset:= -(n - 1);
        for sum:=2 to m + n do
        begin
            for i:=1 to abs(offset) do write(f,' ');
            for i:=min(sum-1,n) downto max(1,sum - m) do
            begin
                write(f,a[i,sum - i]);
                if i > max(1,sum - m) then write(f,' ');
            end;
            writeln(f);
            inc(offset);
        end;
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
