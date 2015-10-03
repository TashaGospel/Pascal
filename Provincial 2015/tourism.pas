const fi = 'tourism.inp';
      fo = 'tourism.out';
      maxn = 10002;
      inf = 99999999999999999;

var n, p, count:longint;
    a,tr:array[0..maxn] of longint;
    b:array[0..maxn] of int64;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,p);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

function square(c:int64):int64;
begin
    exit(c * c);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
    begin
        b[i]:= inf;
        for j:=i-1 downto 0 do 
        begin
            if square(a[i] - a[j] -p) > b[i] then break; 
            if (b[j] + square(a[i] - a[j] - p) < b[i]) then
            begin
                b[i]:=b[j] + square(a[i] - a[j] - p);
                tr[i]:=j;
            end;
        end;
    end;
end;

function path(c:longint):ansistring;
var tmp:string;
begin
    inc(count);
    str(c, tmp);
    if tr[c] = 0 then exit(tmp + ' ')
    else exit(path(tr[c]) + tmp + ' ');
end;

procedure output;
var f:text;
    chosen:ansistring;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[n]);
    chosen:=path(n);
    writeln(f,count);
    write(f,chosen);
    close(f);
end;

begin
    input;
    main;
    output;
end.
