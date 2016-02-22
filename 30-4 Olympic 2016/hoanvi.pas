uses math;
const fi = 'hoanvi.inp';
      fo = 'hoanvi.out';
      maxn = 10001;

type thing = record
    u,v,w:longint;
    end;

var n, resCount:longint;
    a:array[0..maxn] of longint;
    b:array[0..maxn] of thing;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
    begin
        read(f,j);
        a[j]:=i;
    end;
    close(f);
end;

procedure main;
var i, left,right:longint;
begin
    left:=a[1]; right:=a[1];
    for i:=1 to n do
    begin
        if a[i] > a[1] then right:=max(right, a[i])
        else left:=min(left, a[i]);
        if right - left + 1 = i then with b[resCount+1] do
        begin
            u:=left;
            v:=right;
            w:=i;
            inc(resCount);
        end;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f, resCount);
    for i:=1 to resCount do with b[i] do writeln(f,u,' ',v,' ',w);
    close(f);
end;

begin
    input;
    main;
    output;
end.
