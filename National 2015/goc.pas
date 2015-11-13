const fi = 'goc.inp';
      fo = 'goc.out';
      maxn = 11;

var n,m:longint;
    a,q:array[1..maxn] of longint;
    b:array[0..360] of boolean;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to m do read(f,q[i]);
    close(f);
end;

procedure main;
var i,j,d1,d2:longint;
    stop:boolean;
begin
    b[0]:=true;
    stop:=false;
    while not stop do
    begin
        stop:=true;
        for i:=1 to n do
            for j:=0 to 359 do
            begin
                d1:=j+a[i];
                if d1 > 359 then dec(d1,360);
                d2:=j-a[i];
                if d2 < 0 then inc(d2,360);
                if (b[d1] or b[d2]) and (not b[j]) then
                begin
                    b[j]:=true;
                    stop:=false;
                end;
            end;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to m do if b[q[i]] then writeln(f,'YES') else writeln(f,'NO');
    close(f);
end;

begin
    input;
    main;
    output;
end.
