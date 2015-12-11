const fi = '16-42.inp';
      fo = '16-42.out';
      maxn = 10001;

var n:longint;
    a:array[0..maxn,0..maxn] of boolean;
    chosen:array[0..maxn] of boolean;

procedure input;
var f:text;
    d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    while not seekeof(f) do
    begin
        read(f,d1,d2);
        a[d1,d2]:=true;
    end;
    close(f);
end;

procedure output;
var f:text;
    i,j:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do if not chosen[i] then
        for j:=1 to n do if not chosen[j] then
            if a[i,j] then
            begin
                writeln(f,i,' ',j);
                chosen[i]:=true;
                chosen[j]:=true;
                break;
            end;
    close(f);
end;

begin
    input;
    output;
end.
